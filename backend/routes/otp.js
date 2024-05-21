const express = require("express");
const router = express.Router();
const { sendOtp } = require("../controllers/otpController");

router.get("/send", sendOtp);

module.exports = router;
