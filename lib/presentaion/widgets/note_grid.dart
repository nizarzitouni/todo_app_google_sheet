// import 'package:flutter/material.dart';
// import '../../api/google_sheet_api.dart';
// import 'text_box.dart';

// class NoteGrid extends StatelessWidget {
//   const NoteGrid({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: GoogleSheetsApi.notes.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemBuilder: ((context, index) {
//         return MyTextBox(text: GoogleSheetsApi.notes[index]);
//       }),
//     );
//   }
// }
