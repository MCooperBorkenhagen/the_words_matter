

import keras
from keras.models import Sequential
from keras.layers import Dense
import numpy as np


class Learner:

    def __init__(self, hidden = 100, name = "op_model"):
        self.name = name
        self.hidden = hidden
    
        self.model = Sequential()

        self.model.add(Dense(self.hidden, input_shape=(self.orthography.shape[1],)))
        self.model.add(Dense(self.phonology.shape[1], activation='sigmoid'))
        self.model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy', 'binary_crossentropy', 'mse'])

    def train(self, orthography = None, phonology = None, epochs=10, batch_size=32):
        return self.model.fit(orthography, phonology, epochs=epochs, batch_size=batch_size)

    def evaluate(self, orthography = None, phonology = None):
        return self.model.evaluate(orthography, phonology)