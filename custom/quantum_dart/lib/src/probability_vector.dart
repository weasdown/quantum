import 'package:matrix/vector.dart';

/// A vector representing the probabilities of a set of outcomes.
base class ProbabilityVector extends ColumnVector {
  ProbabilityVector({required List<double> values})
    : // Check values is not empty.
      assert(values.isNotEmpty),
      // Check all values are between 0 and 1.
      assert(!values.any((double value) => (value < 0) || (value > 1))),
      // Check the sum of all the values is 1.
      assert(values.reduce((a, b) => a + b) == 1.0),
      super(values: values);
}
