import 'package:flutter/material.dart';
import 'api/google_sheet_api.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  runApp(const NotesAppGSheet());
}
