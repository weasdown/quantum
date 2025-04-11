import 'package:quantum_dart/quantum_dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    QuantumInformation quantumInfo = QuantumInformation();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(quantumInfo, isA<Information>());
      expect(true, isTrue);
    });
  });
}
