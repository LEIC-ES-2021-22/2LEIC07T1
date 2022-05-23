import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/tapOnCard_step.dart';

future<void> main(){

  final config = FlutterTestConfiguration()
      ..features = [Glob(r"test_driver/features/**.feature")]
      ..reporters = [
        ProgressReporter(),
        TestRunSummaryReporter(),
        JsonReporter(path: './report.json')
      ]

      ..stepDefinitions = [TapOnCardStep()]
      ..customStepParameterDefinitions = []
      ..restartAppBetweenScenarios = true
      ..targetAppPath = "test_driver/app.dart"


  return GherkinRunner().execute(config);
}