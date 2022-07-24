import 'package:gsheets/gsheets.dart';
import '../core/utils/app_strings.dart';

class GoogleSheetsApi {
  //init GSheet
  static final gSheets = GSheets(AppStrings.credential);
  static Worksheet? sheet;
  static int numberOfNotes = 0;
  //static List<String> notes = [];
  static List<List<dynamic>> todoList = [
    //[to do, 0 or 1]
  ];
  static bool loading = true;

  Future init() async {
    //fetch spreadsheet by id
    final mySpreadSheet = await gSheets.spreadsheet(AppStrings.spreadSheetID);

    //get sheet by title
    sheet = mySpreadSheet.worksheetByTitle('NoteAppSheet');
    countRows();
  }

  // count the number of notes
  static Future countRows() async {
    while ((await sheet!.values.value(
          column: 1,
          row: numberOfNotes + 1,
        )) !=
        '') {
      numberOfNotes++;
    }

    //now we know how many notes we have
    loadNotes();
  }

  static Future loadNotes() async {
    if (sheet == null) return;

    for (var i = 0; i < numberOfNotes; i++) {
      final String newNote = await sheet!.values.value(column: 1, row: i + 1);
      if (todoList.length < numberOfNotes) {
        todoList.add([
          newNote,
          int.parse(await sheet!.values.value(column: 2, row: i + 1))
        ]);
      }
    }

    //finish loading
    loading = false;
  }

  //inset new notes
  static Future inser(String note) async {
    if (sheet == null) return;
    numberOfNotes++;
    todoList.add([note, 0]);
    await sheet!.values.appendRow([note]);
  }

  static Future update(int index, int isTaskCompleted) async {
    sheet!.values.insertValue(isTaskCompleted, column: 2, row: index + 1);
  }
}
