import 'package:flutter/material.dart';
import 'package:note_app_google_sheet/api/google_sheet_api.dart';

class MyTodoList extends StatefulWidget {
  const MyTodoList({Key? key}) : super(key: key);

  @override
  State<MyTodoList> createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: GoogleSheetsApi.todoList.length,
      itemBuilder: ((context, index) {
        return CheckboxListTile(
          value: GoogleSheetsApi.todoList[index][1] == 0 ? false : true,
          onChanged: ((newValue) {
            GoogleSheetsApi.update(index, newValue == false ? 0 : 1);
            setState(() {
              GoogleSheetsApi.todoList[index][1] = (newValue == false ? 0 : 1);
            });
          }),
          title: Text(
            GoogleSheetsApi.todoList[index][0],
            //style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
        );
      }),
    );
  }
}
