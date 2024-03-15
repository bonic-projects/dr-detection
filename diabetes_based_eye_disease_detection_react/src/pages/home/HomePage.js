import {
  Container,
  Box,
  Typography,
  Button,
  Alert,
  LinearProgress,
  TextField,
  // Paper,
  // Avatar,
  // Dialog,
  // DialogContent,
  // TextField,
  // Select,
  // DialogTitle,
  // DialogContentText,
  // DialogActions,
  // MenuItem,
  Snackbar,
  // IconButton,
  // Card,
  // CardMedia,
  CardContent,
  // CardActions,
} from "@mui/material";
// import Edit from "@mui/icons-material/Edit";

// functions
import { useEffect, useState } from "react";
import { useCollection } from "../../hooks/useCollection";
import { useDocument } from "../../hooks/useDocument";
import { useAuthContext } from "../../hooks/useAuthContext";
import { useLogout } from "../../hooks/useLogout";
import { useFirestore } from "../../hooks/useFirestore";
import { increment, doc, getDoc } from "firebase/firestore";
import { db } from "../../firebase/config";
import UserVerification from "../../components/userVerification/UserVerification";
import { useDatabase } from "../../hooks/useDatabase";
import PredictionComponent from "../../components/Prediction";
// components
import DropShadowBox from "../../components/DropShadowBox";

export default function HomePage() {
  const [user, setUser] = useState(null);
  const [authUser, setAuthUser] = useState(null);

  const setUserVerified = (authUser, user) => {
    setUser(user);
    setAuthUser(authUser);
  };

  return (
    <UserVerification onUser={setUserVerified}>
      {user && (
        <DropShadowBox marginTop="0px">
          <Typography sx={{
          }} variant="h6">Welcome {user.name}</Typography>
        </DropShadowBox>
      )}
      <Box
      height={"50px"}
      />
      {/* <Box
        component="img"
        alt="Dicease detection"
        src={require("../../assets/images/logo/logo.png")}
        maxHeight="50vh"
        maxWidth="90vw"
        sx={{
          display: "block",
          margin: "0 auto",
          paddingBottom: "100px",
        }}
      /> */}
      {/* {user && <BiometricScanners user={user} />} */}

      <Box height="30px"/>

      <PredictionComponent/>
      
    </UserVerification>
  );
}

