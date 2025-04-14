import numpy as np


class ComplexVector(np.ndarray):
    def __new__(cls, values: list[complex], *args, **kwargs):
        return cls.__array__(np.array(values, dtype=complex))


# class StateVector(np.ndarray):
#     def __new__(cls, states: list[State], *args, **kwargs):
#         return np.ndarray.__new__(cls, *args, **kwargs)


class ProbabilityVector(np.ndarray):
    def __new__(cls, probabilities: list[float], *args, **kwargs):
        # All probability values must be non-negative, real numbers less than or equal to 1.
        assert all([(value >= 0) and (value <= 1) and (isinstance(value, float) or isinstance(value, int)) for value in
                    probabilities])

        # The probability values must sum to 1.
        assert sum(probabilities) == 1

        return cls.__array__(np.array(probabilities, dtype=float))


test_array = np.ndarray([1, 2, 3])

complex_values: list[complex] = [complex(1, 2) / 3, -2 / 3]
c_vec: ComplexVector = ComplexVector(complex_values)

p_vec: ProbabilityVector = ProbabilityVector([0.2, 0.8])

pass
