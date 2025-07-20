import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _otpSent = false;

  void _sendOtp() {
    setState(() => _otpSent = true);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP sent to email and phone.')));
  }

  void _verifyOtp() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 100),
            Text('Welcome to StudyApp', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 30),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone Number')),
            if (_otpSent) TextField(controller: _otpController, decoration: InputDecoration(labelText: 'Enter OTP')),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(_otpSent ? 'Verify OTP' : 'Send OTP'),
              onPressed: _otpSent ? _verifyOtp : _sendOtp,
            )
          ],
        ),
      ),
    );
  }
}
