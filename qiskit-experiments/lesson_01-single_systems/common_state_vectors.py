from qiskit.quantum_info import Operator, Statevector
from numpy import sqrt

ONE_OVER_ROOT_TWO = 1 / sqrt(2)

# Define common state vectors.
ket_zero = Statevector([1, 0])                                               # |0⟩
ket_one = Statevector([0, 1])                                                # |1⟩
ket_plus = Statevector([ONE_OVER_ROOT_TWO, ONE_OVER_ROOT_TWO])               # |+⟩
ket_minus = Statevector([ONE_OVER_ROOT_TWO, - ONE_OVER_ROOT_TWO])            # |-⟩
ket_i = Statevector([ONE_OVER_ROOT_TWO, ONE_OVER_ROOT_TWO * 1.0j])           # |i⟩
ket_minus_i = Statevector([ONE_OVER_ROOT_TWO, - ONE_OVER_ROOT_TWO * 1.0j])   # |-i⟩
