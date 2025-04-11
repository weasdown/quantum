// TODO add subtypes for classical states and probabilistic states.
import 'dart:collection';

class State extends Object {}

/// A [Set] containing [State]s.
class StateSet extends SetBase<State> {
  StateSet({required this.states});

  @override
  bool add(State state) => states.add(state);

  @override
  bool contains(Object? element) =>
      (element is! State) ? false : states.contains(element);

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

  final Set<State> states;

  @override
  Set<State> toSet() => UnmodifiableSetView<State>(states);
}
