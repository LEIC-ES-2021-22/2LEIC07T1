import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric TapOnCardStep(){
  return when2<String, int , FlutterWorld>(
  (key,count,context) async{

  final locator = find.byValueKey(key);

    for(var i = 0; i < count; i++){
      await FlutterDriverUtils.tap(context.world.driver, locator);
    }
   }
  );
}