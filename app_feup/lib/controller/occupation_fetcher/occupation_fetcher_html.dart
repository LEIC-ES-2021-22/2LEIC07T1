import 'package:http/http.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/controller/parsers/parser_occupation.dart';
import 'package:uni/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/entities/library.dart';
import 'package:uni/model/entities/session.dart';

/// Fetch the school calendar from HTML
class OccupationFetcherHtml {
  Future<LibraryOccupation> getCalendar(Store<AppState> store) async {
    final String url = 'https://sites.google.com/g.uporto.pt/ocupa-pisos-bibfeup/home/';
    final Session session= store.state.content['session'];
    final Future<Response> response = NetworkRouter.getWithCookies(
      url, {}, session);
    final List<Tuple2> floorsHtml = 
      await response.then((response) => getOccupationFloors(response));

    final LibraryOccupation occupation = LibraryOccupation();

    floorsHtml.forEach((element) async {
      /*final Future<Response> response = NetworkRouter.getWithCookies(
        element.item2, {}, session);
      final floor = 
        await response.then((response) => getOccupationFromHtml(response));
      floors.add(floor);*/
      occupation.addFloor(element.item1);
    });

    return occupation;
  }

} 