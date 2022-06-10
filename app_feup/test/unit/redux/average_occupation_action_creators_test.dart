import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/library.dart';
import 'package:uni/controller/usual_occupation.dart';
import 'package:uni/controller/occupation_fetcher/occupation_fetcher_sheets.dart';
import 'package:redux/redux.dart';

class MockUsualOccupation extends Mock implements UsualOccupation {}

class MockOccupationFetcher extends Mock implements OccupationFetcherSheets {}

class MockStore extends Mock implements Store<AppState> {}

class MockDateTime extends Mock implements DateTime {}

class MockLibraryOccupation extends Mock implements LibraryOccupation {}


void main() {
  group('Average occupation', () {
    final weekday = '1'; // monday
    final hour = '14';
    final averageOccupation = '20';
    final occurrences = '2';

    test('Getter for weekday occupation information', () async {
      SharedPreferences.setMockInitialValues({
        '114': ['20', '1']
      });

      final weekDayInfo =
          await UsualOccupation.getWeekdayOccupationInfo(weekday, hour);

      expect('20', weekDayInfo[0]);
      expect('1', weekDayInfo[1]);
    });

    test('Setter for weekday occupation information', () async {
      SharedPreferences.setMockInitialValues({
        '114': ['30', '1']
      });

      // ignore: unused_local_variable
      final SharedPreferences pref = await SharedPreferences.getInstance();

      UsualOccupation.setAverageOccupation(
          averageOccupation, occurrences, weekday, hour);

      final weekDayInfo =
          await UsualOccupation.getWeekdayOccupationInfo(weekday, hour);

      expect('20', weekDayInfo[0]);
    });
  });
}
