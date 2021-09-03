import 'package:flutter/material.dart';
import 'package:kimera_todo/theme/custom_colors.dart';

import 'horizontal_line.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {required this.name,
      required this.tasks,
      required this.progressBarColor});

  final String name;
  final int tasks;
  final Color progressBarColor;

  @override
  Widget build(BuildContext context) {
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
          tasks.toString() + (tasks == 1 ? ' task' : ' tasks'),
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
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        width: MediaQuery.of(context).size.width * 0.45,
        alignment: AlignmentDirectional.centerStart,
        height: 100,
        decoration: boxDecoration,
        child: Column(children: [tasksLabel, titleCategory, lineProcess]));
  }
}
