import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/controller/parsers/parser_reservation.dart';
import 'package:uni/model/entities/reservation.dart';

class MockClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  group('Reservations parser', () {
    final mockClient = MockClient();
    final mockResponse = MockResponse();

    final reservation1 = Reservation(
      'C606', DateTime.parse('2022-05-16 16:00'), Duration(hours: 1));
    final reservation2 = Reservation(
      'C612', DateTime.parse('2022-05-16 17:00'), Duration(minutes: 30));

    NetworkRouter.httpClient = mockClient;
    final mockHtml = File('test/resources/reservations.html')
        .readAsStringSync();
    when(mockResponse.body).thenReturn(mockHtml);
    when(mockResponse.statusCode).thenReturn(200);
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => mockResponse);

    test('When given two reservations', () async {
      final List<Reservation> reservations =
           await getReservationsFromHtml(mockResponse);
      
      expect(reservations.length, 2);
      expect(reservations[0], reservation1);
      expect(reservations[1], reservation2);
    });
  });
}