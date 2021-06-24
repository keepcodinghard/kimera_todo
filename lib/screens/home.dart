import 'package:flutter/material.dart';
import 'package:kimera_todo/widgets/appbar_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarWidget());
  }
}
