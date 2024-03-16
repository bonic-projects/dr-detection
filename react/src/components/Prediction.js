import React, { useState } from 'react';
import { Button, LinearProgress, Typography } from "@mui/material";

const PredictionComponent = () => {
  const [selectedImage, setSelectedImage] = useState(null);
  const [predictionResult, setPredictionResult] = useState(null);
  const [loading, setLoading] = useState(false);

  const displayPred = (predClass) => predClass === 0 ? "No Diabetic Retinoscopy" : `Diabetic Retinoscopy Stage ${predClass}`;

  const getPrediction = async () => {
    setLoading(true);

    const formData = new FormData();
    formData.append('file', selectedImage);

    fetch('http://localhost:8000/predict', {
      method: 'POST',
      body: formData,
    })
      .then(response => response.json())
      .then(data => {
        console.log(data);
        const predictedClass = data.predicted_class;
        console.log(`Got Predction : ${predictedClass}`)
        setPredictionResult(predictedClass);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error:', error);
        setLoading(false);
      });
  };

  const handleImageUpload = (event) => {
    const file = event.target.files[0];
    setSelectedImage(file);
  };

  return (
    <div>
      {loading && (
        <LinearProgress
          sx={{
            position: "absolute",
            top: { xs: "58px", sm: "64px", md: "64px" },
            left: 0,
            right: 0,
            zIndex: 1,
          }}
        />
      )}

      <input type="file" accept="image/*" onChange={handleImageUpload} style={{
        color: "white"
      }} />
      <Button variant="contained" color="primary" onClick={getPrediction}>
        Predict
      </Button>
      {
        predictionResult !== null && (
          <Typography variant="h4">
            {displayPred(predictionResult)}
          </Typography>
        )
      }
    </div>
  );
};

export default PredictionComponent;
