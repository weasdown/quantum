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

      test('Throws if any values are < 0', () {
        List<double> values = [-0.2, 0.8, 0.4];

        expect(
          () => ProbabilityVector(values: values),
          throwsA(TypeMatcher<AssertionError>()),
        );
      });
    });
  });
}
