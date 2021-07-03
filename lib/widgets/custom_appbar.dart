import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.title}) : super(key: key);

  final Text title;
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0, //this remove bottom shadow
      bottomOpacity: 0, //this remove bottom shadow
      title: title,
      actions: <Widget>[
        IconButton(onPressed: _onSearch, icon: Icon(Icons.search)),
        IconButton(
            onPressed: _onNotification, icon: Icon(Icons.notifications_none))
      ],
    );
  }

  void _onNotification() {}

  void _onSearch() {}
}
