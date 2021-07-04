import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:kimera_todo/theme/custom_colors.dart';
import 'package:kimera_todo/widgets/custom_appbar.dart';
import 'package:kimera_todo/widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Kimera Todo')),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _mainBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: CustomColors.button,
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: [
        _buildHeader(context, name: 'Olivia'),
        _buildCategoryBlock(context),
        _buildTodayTasksBlock(context)
      ],
    );
  }

  Widget _buildHeader(BuildContext context, {String name = 'Stranger'}) {
    TextStyle textStyle = TextStyle(
        color: CustomColors.primary_text,
        fontSize: Theme.of(context).textTheme.headline4!.fontSize,
        fontFamily: Theme.of(context).textTheme.headline4!.fontFamily,
        fontWeight: FontWeight.bold);

    final String title = "What's up, " + name + "!";

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(title, style: textStyle),
    );
  }

  Widget _buildCategoryBlock(BuildContext context) {
    Expanded header = _buildHeaderSectionBlock(context, 'CATEGORIES');

    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          header,
          Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryBox(context,
                        name: 'Business',
                        tasks: 40,
                        progressBarColor: CustomColors.button),
                    _buildCategoryBox(context,
                        name: 'Personal',
                        tasks: 15,
                        progressBarColor: Colors.blue),
                    _buildCategoryBox(context, name: 'Shares', tasks: 12),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Expanded _buildHeaderSectionBlock(BuildContext context, String title) {
    TextStyle textStyle = _getTextHeaderSectionStyle(context);

    Expanded header = Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        child: Text(title, style: textStyle),
      ),
    );
    return header;
  }

  Widget _buildCategoryBox(BuildContext context,
      {String name = 'Unknown',
      int tasks = 0,
      Color progressBarColor: Colors.red}) {
    List<BoxShadow> boxsShadow = [
      BoxShadow(
        color: CustomColors.secundary_background.withOpacity(0.4),
        spreadRadius: 3,
        blurRadius: 5,
        offset: Offset(0, 5),
      ),
    ];

    BoxDecoration boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: CustomColors.secundary_background,
        boxShadow: boxsShadow);

    TextStyle tasksStyle =
        TextStyle(color: CustomColors.category_quantity_task, fontSize: 12);

    TextStyle categoryStyle = TextStyle(
        color: CustomColors.primary_text,
        fontSize: 15,
        fontWeight: FontWeight.values[5]);

    Container tasksLabel = Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        child: Text(
          tasks.toString() + ' tasks',
          style: tasksStyle,
        ));

    Container titleCategory = Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: Text(name, style: categoryStyle));

    Container lineProcess = Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 3,
      color: Colors.grey,
      child: CustomPaint(
          painter:
              DrawHorizontalLine(color: progressBarColor, percentage: 0.5)),
    );

    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        width: MediaQuery.of(context).size.width * 0.45,
        alignment: AlignmentDirectional.centerStart,
        height: 100,
        decoration: boxDecoration,
        child: Column(children: [tasksLabel, titleCategory, lineProcess]));
  }

  Widget _buildTodayTasksBlock(BuildContext context) {
    Expanded header = _buildHeaderSectionBlock(context, 'TODAY\'S TASKS');

    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          header,
          Expanded(
            flex: 9,
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildTask(context, 'Call my friend Romeo', true,
                        categoryColor: Colors.blue),
                    _buildTask(
                        context, 'Make great flutter appliactions', false,
                        categoryColor: CustomColors.button),
                    _buildTask(context, 'Go out to find my dog', true,
                        categoryColor: Colors.blue),
                    _buildTask(context, 'Show to Boyo this view', true,
                        categoryColor: CustomColors.button),
                    _buildTask(context, 'Buy beers at supermarker', false,
                        categoryColor: Colors.blue),
                    _buildTask(context, 'Does english homework', true),
                  ],
                )),
          )
        ],
      ),
    );
  }

  TextStyle _getTextHeaderSectionStyle(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: CustomColors.category_section_header,
        fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
        fontFamily: Theme.of(context).textTheme.headline6!.fontFamily,
        fontWeight: FontWeight.normal);
    return textStyle;
  }

  Widget _buildTask(BuildContext context, String title, bool isDone,
      {Color categoryColor: Colors.red}) {
    TextStyle textStyle =
        TextStyle(color: CustomColors.primary_text, fontSize: 16);

    TextStyle textStyleLineThrough = TextStyle(
        color: CustomColors.primary_text,
        fontSize: 16,
        decoration: TextDecoration.lineThrough,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 2);

    Text textTitle =
        Text(title, style: isDone ? textStyleLineThrough : textStyle);

    List<BoxShadow> boxsShadow = [
      BoxShadow(
        color: CustomColors.secundary_background.withOpacity(0.4),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 5),
      ),
    ];
    BoxDecoration boxDecoration = BoxDecoration(
        color: CustomColors.secundary_background,
        borderRadius: BorderRadius.all(Radius.circular(22)),
        boxShadow: boxsShadow);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 6),
      height: 70,
      decoration: boxDecoration,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    isDone ? Icons.check_circle_outline : Icons.circle_outlined,
                    color: categoryColor,
                    size: 29,
                  ))),
          Expanded(flex: 8, child: textTitle)
        ],
      ),
    );
  }
}

class DrawHorizontalLine extends CustomPainter {
  ///
  /// percentage is a value between 0 and 1, which represent a percentage where 1 is 100%
  DrawHorizontalLine(
      {this.percentage: 0.0, this.color: Colors.red, this.width: 3}) {
    AssertionError();

    _paint
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;
  }

  final Paint _paint = Paint();
  final double percentage;
  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0.0, 1.5), Offset(size.width * percentage, 1.5), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
