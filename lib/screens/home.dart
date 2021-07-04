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
    );
  }

  Widget _mainBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: [
        _buildHeader(context, name: 'Olivia'),
        _buildCategoryBlock(context),
        //_buildTodayTasksBlock(context)
      ],
    );
  }

  Widget _buildHeader(BuildContext context, {String name = 'Stranger'}) {
    TextStyle textStyle = TextStyle(
        color: Colors.white,
        fontSize: Theme.of(context).textTheme.headline4!.fontSize,
        fontFamily: Theme.of(context).textTheme.headline4!.fontFamily,
        fontWeight: FontWeight.bold);

    final String title = "What's up," + name;

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
                    _buildCategoryBox(context, name: 'Bussiness', tasks: 40),
                    _buildCategoryBox(context, name: 'Personal', tasks: 15),
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
      {String name = 'Unknown', int tasks = 0}) {
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

    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        width: MediaQuery.of(context).size.width * 0.45,
        alignment: AlignmentDirectional.centerStart,
        height: 100,
        decoration: boxDecoration,
        child: Column(children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                tasks.toString() + ' tasks',
                style: tasksStyle,
              )),
          Container(
              width: double.infinity, child: Text(name, style: categoryStyle))
        ]));
  }

  // Widget _buildTodayTasksBlock(BuildContext context) {
  //   Expanded header = _buildHeaderSectionBlock(context, 'TODAY\'S TASKS');
  //   return Container(
  //     height: MediaQuery.of(context).size.height * 0.55,
  //     color: Colors.lightBlue,
  //     margin: EdgeInsets.only(top: 10),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         header,
  //         Expanded(
  //           flex: 9,
  //           child: Container(
  //             color: Colors.green,
  //             padding: EdgeInsets.only(top: 10, bottom: 10),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  TextStyle _getTextHeaderSectionStyle(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: CustomColors.category_section_header,
        fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
        fontFamily: Theme.of(context).textTheme.headline6!.fontFamily,
        fontWeight: FontWeight.normal);
    return textStyle;
  }
}
