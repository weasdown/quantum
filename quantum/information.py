class Information:
    def __init__(self):
        raise RuntimeError('Information is an abstract class so cannot be directly instantiated. Use ClassicalInformation or QuantumInformation instead.')

class ClassicalInformation(Information):
    def __init__(self):
        super().__init__()

        pass

class QuantumInformation(Information):
    def __init__(self):
        super().__init__()

        pass