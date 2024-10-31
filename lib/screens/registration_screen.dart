import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:aan_app/widgets/myButton.dart';
import 'package:aan_app/widgets/colors.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedCourse;
  bool _isLoading = false;
  String? _errorMessage;

  // Map for the course names to groupId
  final Map<String, int> _courseGroupIds = {
    'T-Kurs': 1,
    'W-Kurs': 2,
    'PSP': 3,
  };

  Future<void> _register() async {
    final groupId = _courseGroupIds[_selectedCourse];
    if (groupId == null) {
      setState(() {
        _errorMessage = 'Please select a valid course';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _nameController.text,
          'password': _passwordController.text,
          'groupId': groupId,
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, 'AfterRegistrationPage');
      } else {
        final responseData = jsonDecode(response.body);
        setState(() {
          _errorMessage = responseData['message'] ?? 'Registration failed';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Network error: $e';
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
            SizedBox(
              height: 50.0,
              width: 300.0,
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '  Choose your class',
                  labelStyle: TextStyle(fontSize: 18),
                ),
                items: _courseGroupIds.keys.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCourse = value;
                  });
                },
                value: _selectedCourse,
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
                : MyButton(
                    color: color1,
                    title: 'Register',
                    textColor: Colors.white,
                    onPressed: _register,
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