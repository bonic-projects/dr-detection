import os
import tensorflow as tf
import numpy as np
import cv2


class PredictDr:
    def __init__(self, model_path="dr_model.h5"):
        self.model = tf.keras.models.load_model(model_path)

    def _preprocess_image(self, image_path):
        image = cv2.imread(image_path)
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        image = cv2.resize(image, (400, 400))
        image = image / 255.0
        return image

    def predict_image(self, image_path):
        image = self._preprocess_image(image_path)
        image = np.expand_dims(image, axis=0)
        prediction = self.model.predict(image)
        predicted_class = np.argmax(prediction)
        return int(predicted_class)
