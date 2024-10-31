import 'package:flutter/material.dart';
import 'package:aan_app/widgets/myButton.dart';
import 'package:aan_app/widgets/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _nameController.text,
          'password': _passwordController.text,
        }),
      );

      final responseData = jsonDecode(response.body);

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200 && responseData['success'] == true) {
        Navigator.pushNamed(context, 'GetStartedPage');
      } else {
        setState(() {
          _errorMessage = responseData['message'] ?? 'Invalid credentials';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Network error, please try again later';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: SizedBox(
                  height: 200,
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              height: 50.0,
              width: 300.0,
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '  Enter your Name',
                ),
              ),
            ),
            const SizedBox(height: 19.0),
            SizedBox(
              height: 50.0,
              width: 300.0,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '  Enter your Password',
                ),
              ),
            ),
            const SizedBox(height: 19.0),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 50.0),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: _signIn,
                    child: const Text('Sign in'),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}