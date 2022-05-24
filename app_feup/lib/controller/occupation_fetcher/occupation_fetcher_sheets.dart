import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uni/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/entities/library.dart';
import 'package:uni/controller/parsers/parser_occupation.dart';
import 'package:gsheets/gsheets.dart';

Future<String> getJson() {
  return rootBundle.loadString('assets/auth/key.json');
}

/// Fetch the school calendar from Google Sheets
class OccupationFetcherSheets {
  Future<LibraryOccupation> getOccupationFromSheets (
      Store<AppState> store) async {
    final sheetId = '1gZRbEX4y8vNW7vrl15FCdAQ3pVNRJw_uRZtVL6ORP0g';

    try {
      final googleCredentials =  json.decode(await getJson());
      final gSheets = GSheets(googleCredentials);
      final ss = await gSheets.spreadsheet(sheetId);

      final sheet = ss.worksheetByTitle('MANUAL');

      return getOccupationFromSheet(sheet);
    } catch (FlutterError) {
      return LibraryOccupation();
    }
  }
} 