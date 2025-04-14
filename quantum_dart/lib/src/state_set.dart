import 'dart:collection';

import 'package:matrix/vector.dart';

// TODO add subtypes for classical states and probabilistic states.
class State extends Object {
  const State({required this.name, required this.symbol});

  final String name;

  final String symbol;
}

/// A [Set] containing [State]s.
///
/// The order of the elements of the set will always be the order they were given in when the [StateSet] was first constructed.
class StateSet extends SetBase<State> {
  StateSet({required Set<State> states}) : _states = Set.unmodifiable(states);

  @override
  bool add(State state) {
    if (!contains(state)) {
      states.add(state);
      return true;
    } else {
      return false;
    }
  }

  /// Returns the column vector with a 1 in the entry corresponding to [state], with 0 for all other entries.
  ColumnVector bra(State state) {
    int stateIndex = _states.toList().indexOf(state);
    // indexOf did not find the state in _states.
    if (stateIndex == -1) {
      throw ArgumentError('The State $state is not in the StateSet.');
    }

    ColumnVector vector = ColumnVector.filled(
      length: _states.length,
      filler: 0,
    );
    vector[stateIndex] = state;

    // FIXME ColumnVector class not yet sufficiently implemented
    // return vector;

    // TODO remove UnimplementedError.
    throw UnimplementedError('StateSet.bra() is not yet implemented.');
  }

  @override
  bool contains(Object? element) =>
      (element is! State) ? false : _states.contains(element);

  @override
  Iterator<State> get iterator => _states.iterator;

  /// Returns the row vector with a 1 in the entry corresponding to [state], with 0 for all other entries.
  RowVector ket(State state) =>
      throw UnimplementedError('StateSet.ket() is not yet implemented.');

  @override
  int get length => states.length;

  @override
  State? lookup(Object? element) =>
      (element is! State)
          ? null
          : (_states.contains(element))
          ? element
          : null;

  @override
  bool remove(Object? value) {
    if (value is! State) {
      return false;
    } else {
      if (contains(value)) {
        _states.remove(value);
        return true;
      } else {
        return false;
      }
    }
  }

  /// Internal, private view of the states.
  final Set<State> _states;

  /// Gets an unmodifiable version of [_states].
  UnmodifiableSetView<State> get states => UnmodifiableSetView<State>(_states);

  @override
  Set<State> toSet() => UnmodifiableSetView<State>(states);
}
