import { initializeApp } from "firebase/app";
import { getFirestore, Timestamp } from "firebase/firestore";
import { getDatabase } from "firebase/database";
import { getAuth } from "firebase/auth";
import { getStorage } from "firebase/storage";

const firebaseConfig = {
  apiKey: "AIzaSyCL586oSdWotTavPiCS5rlgMqNPLjB20dc",
  authDomain: "diabetes-disease-detection.firebaseapp.com",
  projectId: "diabetes-disease-detection",
  storageBucket: "diabetes-disease-detection.appspot.com",
  messagingSenderId: "1026942224803",
  appId: "1:1026942224803:web:5b376257d6002b3677f216",
  measurementId: "G-EVJ31N25YH"
};

// init firebase
initializeApp(firebaseConfig);

// init services
const db = getFirestore();
const rtdb = getDatabase();
const auth = getAuth();
const storage = getStorage();

// timestamp
const timestamp = Timestamp;

export { db, rtdb, auth, storage, timestamp };
