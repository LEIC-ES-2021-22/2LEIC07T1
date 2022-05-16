
import 'package:http/http.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/controller/parsers/parser_reservation.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/reservation.dart';
import 'package:uni/model/entities/session.dart';
import 'package:redux/redux.dart';

class ReservationsFetcherHtml {
  Future<List<Reservation>> getReservations(Store<AppState> store) async {

    final String baseUrl = NetworkRouter.getBaseUrlFromSession(
        store.state.content['session']) +
        'res_recursos_geral.pedidos_list?pct_tipo_grupo_id=3';
    final Session session = store.state.content['session'];
    final Future<Response> response = NetworkRouter.getWithCookies(baseUrl,
        {}, session);
    final List<Reservation> reservations =
          await response.then((response) => getReservationsFromHtml(response));

    return reservations;
  }
}