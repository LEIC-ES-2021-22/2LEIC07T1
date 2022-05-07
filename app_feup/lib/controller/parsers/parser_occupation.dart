import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/entities/library.dart';

Future<List<Tuple2>> getOccupationFloors(Response response) async {
  final document = parse(response.body);

  final List<Element> numbersHtml = 
    document.querySelectorAll('.CDt4Ke.zfr3Q.OmQG5e > span > strong');
  final List<Element> maxHtml = 
    document.querySelectorAll('.jXK9ad-SmKAyb > div > p > span');
  final List<Element> framesHtml = 
    document.querySelectorAll('iframe');

  final List<Tuple2> floors = [];
  for (int i = 0; i < 6; i++) {
    final number = int.parse(numbersHtml[i].innerHtml.split(' ')[1]);
    final capacity = int.parse(maxHtml[i].innerHtml.split(' ')[0]);
    final src = framesHtml[i].attributes['src'];
    floors.add(Tuple2(FloorOccupation(number, 0, capacity), src));
  }
  return floors;
}

/*Future<Tuple2> getOccupationFromHtml(Response response) async {
  final document = parse(response.body);

  final List<Element> occupationHtml = 
    document.querySelectorAll('.docs-charts-tooltip');
  final Element div =
    document.querySelector('div');
  //return int.parse(occupationHtml.innerHtml);
}*/
