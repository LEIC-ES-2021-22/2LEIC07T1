import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/controller/parsers/parser_reservation.dart';
import 'package:uni/model/entities/reservation.dart';
import 'package:uni/view/Pages/room_reservations_page_view.dart';

class MockClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  group('Reservations input parser', () {
    final page = RoomReservationsPageViewState();
    test('Date', () async {
      final DateTime date = DateTime.utc(1999, 12, 5);
      final String result = page.formatDate(date);
      expect(result, '1999-12-05');
    });
    test('When given round hours', () async {
      final TimeOfDay t = TimeOfDay(hour: 15, minute: 0);
      final String result = page.formatHour(t);
      expect(result, '15');
    });
    test('When minutes are less than 30', () async {
      final TimeOfDay t = TimeOfDay(hour: 15, minute: 23);
      final String result = page.formatHour(t);
      expect(result, '15,5');
    });
    test('When minutes are 30', () async {
      final TimeOfDay t = TimeOfDay(hour: 15, minute: 23);
      final String result = page.formatHour(t);
      expect(result, '15,5');
    });
    test('When minutes are past 30', () async {
      final TimeOfDay t = TimeOfDay(hour: 15, minute: 43);
      final String result = page.formatHour(t);
      expect(result, '16');
    });
    test('When duration is less than 30', () async {
      final Duration d = Duration(hours: 14, minutes: 23);
      final String result = page.formatDuration(d);
      expect(result, '14,5');
    });
    test('When duration is 30', () async {
      final Duration d = Duration(hours: 14, minutes: 30);
      final String result = page.formatDuration(d);
      expect(result, '14,5');
    });
    test('When minutes are past 30', () async {
      final Duration d = Duration(hours: 14, minutes: 33);
      final String result = page.formatDuration(d);
      expect(result, '15');
    });
  });
}