const express = require("express");
const bodyParser = require("body-parser");
const dotenv = require("dotenv");
const axios = require("axios");

dotenv.config();

const app = express();
app.use(bodyParser.json());

const otpStore = {}; // Temporary store for OTPs

// Endpoint to send OTP
app.post("/send-otp", async (req, res) => {
  const { phoneNumber } = req.body;
  const otp = Math.floor(100000 + Math.random() * 900000).toString();

  // Store OTP (for simplicity, in memory)
  otpStore[phoneNumber] = otp;

  // Send OTP via Hubtel
  const url = `https://smsc.hubtel.com/v1/messages/send?clientsecret=${process.env.HUBTEL_CLIENT_SECRET}&clientid=${process.env.HUBTEL_CLIENT_ID}&from=${process.env.HUBTEL_FROM}&to=${phoneNumber}&content=Your+OTP+code+is+${otp}`;

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      res.status(200).json({ message: "OTP sent successfully" });
    } else {
      res.status(500).json({ error: "Failed to send OTP" });
    }
  } catch (error) {
    res.status(500).json({ error: "Failed to send OTP" });
  }
});

// Endpoint to verify OTP
app.post("/verify-otp", (req, res) => {
  const { phoneNumber, otp } = req.body;
  if (otpStore[phoneNumber] && otpStore[phoneNumber] === otp) {
    delete otpStore[phoneNumber]; // Remove OTP after verification
    res.status(200).json({ message: "OTP verified successfully" });
  } else {
    res.status(400).json({ error: "Invalid OTP" });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
