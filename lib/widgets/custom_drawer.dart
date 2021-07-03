import 'package:flutter/material.dart';
import 'package:kimera_todo/theme/custom_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _createMenu(context),
    );
  }

  _createMenu(BuildContext context) {
    return Container(
      color: CustomColors.secundary_background,
      padding: EdgeInsets.zero,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createMenuHeader(context),
          _createMenuBody(context)
        ],
      ),
    );
  }

  Widget _createMenuBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      child: Column(children: [
        _createMenuOption(context, Icons.task, "Todos", null),
        _createMenuOption(context, Icons.category, "Categories", null),
        _createMenuOption(context, Icons.people, "Friends", null),
        _createMenuOption(context, Icons.share, "Shares", null),
        _createMenuOption(context, Icons.settings_outlined, "Settings", null)
      ]),
    );
  }

  Widget _createMenuOption(BuildContext context, IconData icon, String text,
      CallbackAction? action) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 60),
      leading: Icon(icon, color: CustomColors.menu_option_icon),
      title: Text(
        text,
        style: TextStyle(color: CustomColors.menu_option_text),
      ),
      onTap: () => {Navigator.pop(context)},
    );
  }

  Widget _createMenuHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _createHeaderCircleAvatar(context),
          _createHeaderTitle(context, 'Olivia Mitchell')
        ],
      ),
    );
  }

  Widget _createHeaderTitle(BuildContext context, String name) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.40,
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: Theme.of(context).textTheme.headline4!.fontSize,
          fontWeight: FontWeight.bold,
        ),
        softWrap: true,
        textAlign: TextAlign.left,
        maxLines: 2,
      ),
    );
  }

  Widget _createHeaderCircleAvatar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: CustomColors.lines, width: 5)),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/avatar.png'),
        maxRadius: 70,
      ),
    );
  }
}
