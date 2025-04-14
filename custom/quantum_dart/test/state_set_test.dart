import 'package:matrix/vector.dart';
import 'package:quantum_dart/quantum_dart.dart';
import 'package:test/test.dart';

void main() {
  // Standard States and StateSet for a stars cell.
  State blank = State(name: 'blank', symbol: 'b');
  State dot = State(name: 'dot', symbol: '•');
  State star = State(name: 'star', symbol: '∗');

  StateSet cellStates = StateSet(states: {blank, dot, star});

  group('StateSet', () {
    group('constructor', () {});

    group('methods', () {
      group('bra', () {
        test('bra(blank)', () {
          expect(cellStates.bra(blank), ColumnVector(values: [1, 0, 0]));
        });
      });
    });
  });
}
