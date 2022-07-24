import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app_google_sheet/presentaion/widgets/notes_list.dart';
import '../../api/google_sheet_api.dart';
import '../widgets/loading_circulr.dart';
import '../widgets/my_button.dart';
import '../widgets/note_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //setstate after we type each Char
    _textEditingController.addListener(() => setState(() {}));
  }

  void _addNote() {
    // print(_textEditingController.text);
    GoogleSheetsApi.inser(_textEditingController.text);
    _textEditingController.clear();
    setState(() {});
  }

//wait for the data to be fetched frome google sheet; checks evry second
  void startLoading() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      debugPrint('Timeeeer');
      if (GoogleSheetsApi.loading == false) {
        setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //loading until data arrive
    if (GoogleSheetsApi.loading == true) {
      startLoading();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'N O T E S - A P P',
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child:
                  GoogleSheetsApi.loading ? LoadingCirclualr() : MyTodoList(),
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter a note here ...',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textEditingController.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: MyButton(
                    darkMode: false,
                    threeDOn: false,
                    width: 200,
                    height: 60,
                    borderRadiusOfButton: 20,
                    function: () {
                      //debugPrint('On Tap');
                      _addNote();
                    },
                    myWidget: Text(
                      'A D D',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
