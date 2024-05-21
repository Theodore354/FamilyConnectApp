const axios = require("axios");

exports.sendOtp = async (req, res) => {
  const { phoneNumber } = req.query;

  const clientId = process.env.HUBTEL_CLIENT_ID;
  const clientSecret = process.env.HUBTEL_CLIENT_SECRET;
  const from = "FamilyConnectApp";
  const url = "https://smsc.hubtel.com/v1/messages/send";

  try {
    const response = await axios.get(url, {
      params: {
        clientsecret: clientSecret,
        clientid: clientId,
        from,
        to: phoneNumber,
        content: "This+Is+A+Test+Message",
      },
    });

    if (response.status === 201) {
      res.status(201).json({ message: "OTP request successful" });
    } else {
      res
        .status(response.status)
        .json({ message: "Failed to send OTP", error: response.data });
    }
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};
