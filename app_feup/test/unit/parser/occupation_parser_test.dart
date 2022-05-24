import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:gsheets/gsheets.dart';
import 'package:uni/controller/parsers/parser_occupation.dart';
import 'package:uni/model/entities/library.dart';

class MockWorksheet extends Mock implements Worksheet {}
class MockWorksheetCells extends Mock implements WorksheetAsCells {}
class MockCell extends Mock implements Cell {}

void main() {
  group('Occupation parser', () {
    final mockSheet = MockWorksheet();
    final mockCells = MockWorksheetCells();

    test('When there is no data', () async {
      final LibraryOccupation occupation = 
        await getOccupationFromSheet(mockSheet);

      expect (occupation.getPercentage(), 0);
    });

    test('When there is data', () async {
      for (int i = 1; i < 7; i++) {
        final mockCellOccupation = MockCell();
        when(mockCellOccupation.value).thenAnswer((_) => i.toString());
        when(mockCells.cell(column: 3, row: i + 1)).
          thenAnswer((_) async => mockCellOccupation);
        final mockCellCapacity = MockCell();
        when(mockCellCapacity.value).thenAnswer((_) => (i * 2).toString());
        when(mockCells.cell(column: 5, row: i + 1)).
          thenAnswer((_) async => mockCellCapacity);
      }
      when(mockSheet.cells).thenReturn(mockCells);

      final LibraryOccupation occupation = 
        await getOccupationFromSheet(mockSheet);

      expect (occupation.getPercentage(), 50);
    });

    test('When the library is full', () async {
      for (int i = 1; i < 7; i++) {
        final mockCellOccupation = MockCell();
        when(mockCellOccupation.value).thenAnswer((_) => '1');
        when(mockCells.cell(column: 3, row: i + 1)).
          thenAnswer((_) async => mockCellOccupation);
        final mockCellCapacity = MockCell();
        when(mockCellCapacity.value).thenAnswer((_) => '1');
        when(mockCells.cell(column: 5, row: i + 1)).
          thenAnswer((_) async => mockCellCapacity);
      }
      when(mockSheet.cells).thenReturn(mockCells);

      final LibraryOccupation occupation = 
        await getOccupationFromSheet(mockSheet);

      expect (occupation.getPercentage(), 100);
    });

  });
}