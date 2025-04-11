import 'package:quantum_dart/quantum_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ProbabilityVector', () {
    group('constructor', () {
      test('Throws if values are empty', () {
        List<double> values = [];

        expect(
          () => ProbabilityVector(values: values),
          throwsA(TypeMatcher<AssertionError>()),
        );
      });
    });
  });
}
