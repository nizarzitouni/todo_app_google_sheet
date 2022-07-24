import 'package:flutter/material.dart';
import 'core/utils/app_strings.dart';
import 'presentaion/screens/home_page.dart';

class NotesAppGSheet extends StatelessWidget {
  const NotesAppGSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
