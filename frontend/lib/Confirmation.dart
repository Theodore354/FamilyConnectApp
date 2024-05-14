import 'package:flutter/material.dart';
import 'package:frontend/Homepage.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';

class otp extends StatelessWidget {
  const otp({Key? key}) : super(key: key);

  Future<bool> sendOTP(String phoneNumber) async {
    String clientId = 'oddyxlyp';
    String clientSecret = 'hyvzuzjx';
    String from = 'TheoTheo';
    String url = 'https://smsc.hubtel.com/v1/messages/send'
        '?clientsecret=$clientSecret'
        '&clientid=$clientId'
        '&from=$from'
        '&to=$phoneNumber'
        '&content=This+Is+A+Test+Message';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // OTP request successful
      print('OTP request successful');
      // Simulate successful verification (replace this with actual verification logic)
      return true;
    } else {
      // OTP request failed
      print('Failed to send OTP: ${response.body}');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('OTP SCREEN'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                "Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: const Text(
                  "Enter the code sent to your number",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: const Text(
                  "+233 572633553",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Pinput(
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.green),
                  ),
                ),
                onCompleted: (pin) async {
                  bool verified = await sendOTP(pin);
                  if (verified) {
                    // OTP verification successful, navigate to next screen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  } else {
                    // OTP verification failed, show error message
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text('OTP verification failed. Please try again.'),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
