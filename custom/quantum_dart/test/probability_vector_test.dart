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

      test('Throws if any values are > 1', () {
        List<double> values = [1.2];

        expect(
          () => ProbabilityVector(values: values),
          throwsA(TypeMatcher<AssertionError>()),
        );
      });

      test('Throws if value sum != 1', () {
        List<double> values = [0.9, 0.2];

        expect(
          () => ProbabilityVector(values: values),
          throwsA(TypeMatcher<AssertionError>()),
        );
      });

      test('Builds successfully for valid values', () {
        List<double> values = [0.9, 0.1];

        ProbabilityVector vector = ProbabilityVector(values: values);

        expect(vector, isA<ProbabilityVector>());
        expect(vector.values, values);
      });
    });
  });
}
