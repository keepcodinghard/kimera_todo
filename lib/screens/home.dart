import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kimera_todo/components/category_box.dart';
import 'package:kimera_todo/components/horizontal_line.dart';
import 'package:kimera_todo/components/task_item.dart';

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
    return CategoryBox(
        name: name, tasks: tasks, progressBarColor: progressBarColor);
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
    return TaskItem(title: title, isDone: isDone, categoryColor: categoryColor);
  }
}
