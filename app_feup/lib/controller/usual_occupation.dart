import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni/controller/occupation_fetcher/occupation_fetcher_sheets.dart';
import 'package:uni/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/entities/library.dart';

class usualOccupation {
  static void setAverageOccupation(String averageOccupation, String occurrences,
      String weekday, String hour) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> value = [averageOccupation, occurrences];
    prefs.setStringList(weekday + hour, value);
  }

  static Future<List<String>> getWeekdayOccupationInfo(String weekday,
      String hour) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(weekday + hour);
  }

  static void generateUsualOccupation() async {
    Store<AppState> store;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final LibraryOccupation occupation =
    await OccupationFetcherSheets().getOccupationFromSheets(store);

    final DateTime dateTime = DateTime.now();
    final String weekday = dateTime.weekday.toString();
    final String hour = dateTime.hour.toString();
    final int currentOccupation = occupation.occupation;

    if (prefs.containsKey(weekday + hour)) {
      final weekdayOccupationInfo =
      await getWeekdayOccupationInfo(weekday, hour);

      final double averageOccupation = double.parse(weekdayOccupationInfo[0]); // index 0 has weekday
      final int occurrences = int.parse(weekdayOccupationInfo[1]); // index 1 has average occupation

      final double newAverage =
          (occurrences * averageOccupation + currentOccupation) /
              (occurrences + 1);

      setAverageOccupation(
          newAverage.toString(), occurrences.toString(), weekday, hour);
    }
    else {
      setAverageOccupation(
          occupation.toString(), '1', weekday, hour);
    }
  }
}