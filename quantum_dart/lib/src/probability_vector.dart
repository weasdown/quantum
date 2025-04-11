import 'dart:collection';

import 'package:vector_math/vector_math.dart';

/// A vector representing the probabilities of a set of outcomes.
class ProbabilityVector extends Vector {
  ProbabilityVector({required List<double> values})
    : // Check values is not empty.
      assert(values.isNotEmpty),
      // Check all values are between 0 and 1.
      assert(!values.any((double value) => (value < 0) || (value > 1))),
      // Check the sum of all the values is 1.
      assert(values.reduce((a, b) => a + b) == 1.0),
      _values = values;

  /// Getter required due to this class's extension of [Vector].
  @override
  List<double> get storage => _values;

  /// Internal storage for the vector elements.
  final List<double> _values;

  /// The probabilities of each outcome represented in the vector.
  UnmodifiableListView<double> get values =>
      UnmodifiableListView<double>(_values);
}
