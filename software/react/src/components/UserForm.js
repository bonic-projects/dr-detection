import {
  Box,
  InputAdornment,
  Button,
  TextField,
  MenuItem,
} from "@mui/material";
import { useState } from "react";

const genders = [
  { id: "m", title: "Male" },
  { id: "f", title: "Female" },
  { id: "n", title: "Not specified" },
];

export default function UserForm({ back, onSubmit, buttonText, user }) {
  const [name, setName] = useState(user ? user.name : "");
  const [nameError, setNameError] = useState(false);
  const [phone, setPhone] = useState(user ? user.phone : null);
  const [phoneError, setPhoneError] = useState(false);
  const [age, setage] = useState(user ? user.age : 0);
  const [ageError, setageError] = useState(false);
  const [gender, setGender] = useState(
    user ? genders.find((gender) => gender.id === user.gender) : genders[0]
  );

  const handleSubmit = (e) => {
    e.preventDefault();
    setNameError(false);
    setPhoneError(false);
    setageError(false);
    if (name.length < 3) {
      setNameError(true);
      return;
    }
    if (phone.length < 10) {
      setPhoneError(true);
      return;
    }
    if (age.length < 1 && Number(age) < 2 && Number(age)>100) {
      setageError(true);
      return;
    }

    onSubmit({ name, phone, age, gender: gender.id });
  };

  return (
    <Box
      component="form"
      sx={{
        maxWidth: "100vw",
        // onSubmit: handleSubmit,
        "& .MuiTextField-root": {
          display: "flex",
          margin: "0 auto",
          paddingBottom: 1,
          paddingRight: 1,
          //   p: 1,
        },
      }}
      noValidate
      autoComplete="off"
    >
      <TextField
        required
        id="name"
        label="Name"
        type="text"
        helperText={"Your official name as registered in the university"}
        value={name}
        error={nameError}
        onChange={(e) => setName(e.target.value)}
      />

      <TextField
        required
        // fullWidth
        id="phone"
        label="Phone"
        type="tel"
        InputProps={{
          startAdornment: <InputAdornment position="start">+91</InputAdornment>,
        }}
        value={phone}
        error={phoneError}
        onChange={(e) => setPhone(e.target.value)}
      />

      <Box
        sx={{
          display: "flex",
        }}
      >
        <TextField
          required
          fullWidth
          id="age"
          label="Age"
          type="number"
          // helperText="eg: ECE"
          value={age}
          error={ageError}
          onChange={(e) => setage(e.target.value)}
        />
        <TextField
          id="gender"
          fullWidth
          select
          label="Gender"
          value={gender}
          onChange={(e) => setGender(e.target.value)}
          // helperText="Please select your currency"
          sx={{ minWidth: "100px" }}
        >
          {genders.map((option) => (
            <MenuItem key={option.id} value={option}>
              {option.title}
            </MenuItem>
          ))}
        </TextField>
      </Box>

      <Box
        display="flex"
        sx={{
          paddingTop: "2rem",
        }}
      >
        {back && (
          <Button
            variant="contained"
            sx={{
              // backgroundColor: "black",
              color: "white",
              "&:hover": {
                opacity: 0.8,
                backgroundColor: "black",
                color: "white",
              },
              display: "block",
              margin: "0 auto",
              //   marginTop: "20px",
              marginBottom: "20px",
            }}
            onClick={back}
          >
            Back
          </Button>
        )}
        <Button
          variant="contained"
          sx={{
            type: "submit",
            display: "block",
            margin: "0 auto",
            //   marginTop: "20px",
            marginBottom: "20px",
          }}
          onClick={handleSubmit}
        >
          {buttonText ?? "Update"}
        </Button>
      </Box>
    </Box>
  );
}
