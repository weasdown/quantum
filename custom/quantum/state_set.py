from __future__ import annotations

import math
from dataclasses import dataclass

import numpy as np


@dataclass
class State:
    name: str
    symbol: str
    value: object


@dataclass
class ClassicalState(State):
    """A state that a system can be in."""

    def __init__(self, name: str, symbol: str, value: object):
        super().__init__(name, symbol, value)


class ProbabilisticState(ClassicalState):
    """A state that has some probability of occurring."""

    def __init__(self, name: str, symbol: str, value: object, probability: float):
        assert (probability <= 1) and (probability >= 0)  # probability must be between 0 and 1 (inclusive).
        self.probability: float = probability

        super().__init__(name, symbol, value)

    @classmethod
    def from_classical_state(cls, classical_state: ClassicalState,
                             probability: float):
        assert (probability <= 1) and (probability >= 0)  # probability must be between 0 and 1 (inclusive).

        return ProbabilisticState(classical_state.name, classical_state.symbol,
                                  classical_state.value, probability)


class StateSet(set):
    """A set of classical or probabilistic states."""

    def __init__(self, states: list[State]):
        super().__init__()
        self.states: list[State] = states

        for state in states:
            self.add(state.value)


class ClassicalStateSet(StateSet):
    """A set of classical states."""

    def __init__(self, states: list[ClassicalState]):
        super().__init__(states)

    def bra(self, state: ClassicalState) -> np.ndarray:
        """Returns the row vector having a 1 in the entry corresponding to `state`, with 0 for all other entries."""
        # raise NotImplementedError('ClassicalStateSet.bra() is not yet implemented.')
        try:
            state_index = self.states.index(state)
        except ValueError:
            raise ValueError(f'The state {state} is not an element of the classical state set.')

        vector: np.ndarray = np.full((1, len(self.states)), 0)
        vector[0][state_index] = 1
        return vector

    def ket(self, state: ClassicalState) -> np.ndarray:  # TODO return ComplexVector from vectors.py
        """Returns the column vector having a 1 in the entry corresponding to `state`, with 0 for all other entries."""
        try:
            state_index = self.states.index(state)
        except ValueError:
            raise ValueError(f'The state {state} is not an element of the classical state set.')

        vector: np.ndarray = np.full((len(self.states), 1), 0)
        vector[state_index] = 1
        return vector


class ProbabilisticStateSet(StateSet):
    """A set of probabilistic states."""

    def __init__(self, states: list[ProbabilisticState]):
        super().__init__(states)


class ClassicalBitState(ClassicalState):
    """The two possible states of a classical binary bit."""

    def __init__(self, name: str, symbol: str, value: int):
        super().__init__(name, symbol, value)

    @classmethod
    def ONE(cls):
        """A binary 1 state."""
        return ClassicalBitState(name='One', symbol='1', value=1)

    @classmethod
    def ZERO(cls):
        """A binary 0 state."""
        return ClassicalBitState(name='Zero', symbol='0', value=0)

    @staticmethod
    def states() -> list[ClassicalBitState]:
        return [ClassicalBitState.ONE(), ClassicalBitState.ZERO()]


class QuantumState(np.ndarray, State):
    """A state that a quantum system can be in."""

    def __new__(cls, *args, **kwargs):
        return np.ndarray.__new__(cls, *args, **kwargs)

    def __init__(self, *args, **kwargs):
        super()

    def append(self, item):
        return np.append(self, item)

    # def __init__(self, classical_states: ClassicalStateSet, indices: list):
    #     self.classical_states: ClassicalStateSet = classical_states
    #     self.indices: list[complex] = indices
    #
    #     # self.
    #
    #     # TODO build column vector
    #     # pass
    #     # # TODO remove error
    #     raise NotImplementedError('QuantumState is not yet implemented.')

    # @classmethod
    # def vector(cls, classical_states: ClassicalStateSet, indices: list):
    #     assert (len(indices) == len(classical_states.states))  # The indices must correspond to classical states
    #
    #     return QuantumState()
    #
    #     return np.ndarray(indices)


# class QuantumState(State, np.ndarray):
#     """A state that a quantum system can be in."""
#
#     def __init__(self, classical_states: ClassicalStateSet, indices: list):
#         self.classical_states: ClassicalStateSet = classical_states
#         self.indices: list[complex] = indices
#
#         # self.
#
#         # TODO build column vector
#         # pass
#         # # TODO remove error
#         raise NotImplementedError('QuantumState is not yet implemented.')
#
#     @classmethod
#     def vector(cls, classical_states: ClassicalStateSet, indices: list):
#         assert (len(indices) == len(classical_states.states))  # The indices must correspond to classical states
#
#         return QuantumState()
#
#         return np.ndarray(indices)


@dataclass
class QubitState(QuantumState):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        raise NotImplementedError('QubitState is not yet implemented')


ROOT_TWO: float = math.sqrt(2)
ONE_OVER_ROOT_TWO: float = 1 / ROOT_TWO

# The classical state set for a classical binary bit.
BINARY_ALPHABET: ClassicalStateSet = ClassicalStateSet(ClassicalBitState.states())

one: ClassicalState = ClassicalBitState.ONE()
zero: ClassicalState = ClassicalBitState.ZERO()

# The classical state set for a qubit, the quantum equivalent of a classical binary bit.
QUBIT_STATE_SET: ClassicalStateSet = ClassicalStateSet([ClassicalBitState.ZERO(), ClassicalBitState.ONE()])

ket_zero: np.ndarray = QUBIT_STATE_SET.ket(zero)
ket_one: np.ndarray = QUBIT_STATE_SET.ket(one)
print(f'|0⟩: {ket_zero}')
print(f'|0⟩: {ket_zero}')

bra_zero: np.ndarray = QUBIT_STATE_SET.bra(zero)
bra_one: np.ndarray = QUBIT_STATE_SET.bra(one)
print(f'⟨0|: {bra_zero}')
print(f'⟨1|: {bra_one}\n')

ket_plus: np.ndarray = ONE_OVER_ROOT_TWO * ket_zero + ONE_OVER_ROOT_TWO * ket_one
ket_minus: np.ndarray = ONE_OVER_ROOT_TWO * ket_zero - ONE_OVER_ROOT_TWO * ket_one
print(f'|+⟩: {ket_plus}')
print(f'|-⟩: {ket_minus}')
