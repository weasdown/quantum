import 'dart:collection';

// TODO add subtypes for classical states and probabilistic states.
class State extends Object {}

/// A [Set] containing [State]s.
class StateSet extends SetBase<State> {
  StateSet({required Set<State> states}) : _states = states;

  @override
  bool add(State state) {
    if (!contains(state)) {
      states.add(state);
      return true;
    } else {
      return false;
    }
  }

  @override
  bool contains(Object? element) =>
      (element is! State) ? false : _states.contains(element);

  @override
  Iterator<State> get iterator => _states.iterator;

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
