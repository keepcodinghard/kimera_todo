import 'package:flutter/material.dart';
import 'package:kimera_todo/theme/custom_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(
      {required this.title,
      required this.isDone,
      this.categoryColor: CustomColors.secundary_background});

  final String title;
  final bool isDone;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
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
