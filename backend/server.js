const express = require("express");
const bodyParser = require("body-parser");
const dotenv = require("dotenv");
const otpRoutes = require("./routes/otp");

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use("/api/otp", otpRoutes);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
