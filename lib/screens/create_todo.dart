import 'package:flutter/material.dart';
import 'package:kimera_todo/models/category.dart';
import 'package:kimera_todo/services/todo_service.dart';
import 'package:kimera_todo/theme/custom_colors.dart';
import 'package:kimera_todo/widgets/custom_appbar.dart';

import 'home.dart';

class CreateTodo extends StatelessWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close,
          color: CustomColors.primary_text,
        ),
        backgroundColor: CustomColors.background,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(drawEmpty: true),
      body: CustomForm(),
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _titleControler = TextEditingController();
  String? categoryValue = "Business";

  @override
  Widget build(BuildContext context) {
    TextStyle inputTextSyle = TextStyle(
        color: CustomColors.primary_text,
        fontSize: 24.0,
        decoration: TextDecoration.none);

    TextStyle hintText = TextStyle(
      color: CustomColors.category_section_header,
      fontSize: 20.0,
    );

    List<String> categories = <String>['Business', 'Personal', 'Shares'];

    List<DropdownMenuItem> dropDownCategories =
        categories.map<DropdownMenuItem>((e) {
      return DropdownMenuItem<String>(
          value: e,
          child: Text(
            e,
            style: inputTextSyle,
          ));
    }).toList();

    DropdownButtonFormField dropdownButtonFormField = DropdownButtonFormField(
        iconSize: 0.0,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.category, color: CustomColors.primary_text),
            hintText: 'Select category',
            hintStyle: hintText),
        dropdownColor: CustomColors.background,
        onChanged: (value) {
          setState(() {
            categoryValue = value;
          });
        },
        items: dropDownCategories);

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    autofocus: true,
                    autocorrect: false,
                    controller: _titleControler,
                    style: inputTextSyle,
                    validator: _emptyValidator,
                    decoration: InputDecoration(
                        hintText: "Write your todo", hintStyle: hintText),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    style: inputTextSyle,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today,
                            color: CustomColors.primary_text),
                        hintText: "Select deadline",
                        hintStyle: hintText),
                    onTap: () {
                      _selectDate(context);
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: dropdownButtonFormField),
              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    _saveNewTodo();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                        (route) => false);
                  },
                  child: Text('New Todo'),
                ),
              )
            ]));
  }

  String? _emptyValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter todo title';
    }
    return null;
  }

  void _saveNewTodo() {
    String title = _titleControler.value.text;
    TodoService.createTodo(
        title, "default", Category(name: categoryValue!, color: 0xFFFFFFFF));
  }

  void _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025));

    if (selected != null) {
      setState(() {
        _dateController.value = TextEditingValue(
            text: "${selected.year}/${selected.month}/${selected.day}");
      });
    }
  }
}
