// TODO add subtypes for classical states and probabilistic states.
import 'dart:collection';

class State extends Object {}

/// A [Set] containing [State]s.
class StateSet extends SetBase<State> {
  StateSet({required Set<State> states}) : _states = states;

  @override
  bool add(State state) => states.add(state);

  @override
  bool contains(Object? element) =>
      (element is! State) ? false : _states.contains(element);

  @override
  // TODO: implement iterator
  Iterator<State> get iterator => throw UnimplementedError();

  @override
  int get length => states.length;

  @override
  State? lookup(Object? element) {
    // TODO: implement lookup
    throw UnimplementedError();
  }

  @override
  bool remove(Object? value) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  /// Internal, private view of the states.
  final Set<State> _states;

  /// Gets an unmodifiable version of [_states].
  UnmodifiableSetView<State> get states => UnmodifiableSetView<State>(_states);

  @override
  Set<State> toSet() => UnmodifiableSetView<State>(states);
}
