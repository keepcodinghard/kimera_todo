import 'package:flutter/material.dart';
import 'package:kimera_todo/widgets/custom_appbar.dart';
import 'package:kimera_todo/widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: Text('Kimera Todo')),
        drawer: CustomDrawer(),
        backgroundColor: Theme.of(context).backgroundColor);
  }
}
