import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON decoding
import 'package:url_launcher/url_launcher.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isLogin = true;
  bool isLoggedIn = false;

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';

  // Change this to your backend URL (use your machine IP if testing on physical device)
  final String baseUrl = 'http://localhost:5000';

  // Future<void> submit() async {
  //   if (!_formKey.currentState!.validate()) return;
  //   _formKey.currentState!.save();

  //   String finalPhone = phone.trim();
  //   if (!finalPhone.startsWith('+')) {
  //     finalPhone = '+91$finalPhone';
  //   }

  //   final url = Uri.parse('$baseUrl/api/auth/${isLogin ? 'login' : 'signup'}');

  //   Map<String, String> payload = isLogin
  //       ? {'phone': finalPhone}
  //       : {'name': name, 'email': email, 'phone': finalPhone};

  //   try {
  //     final response = await http.post(url, body: payload);
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(data['msg'] ?? 'Success')));
  //       if (isLogin) {
  //         setState(() {
  //           isLoggedIn = true;
  //         });
  //       }
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Error: ${response.statusCode}')));
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Error: $e')));
  //   }
  // }
  Future<void> submit() async {
  if (!_formKey.currentState!.validate()) return;
  _formKey.currentState!.save();

  String finalPhone = phone.trim();
  if (!finalPhone.startsWith('+')) {
    finalPhone = '+91$finalPhone';
  }

  final url = Uri.parse('$baseUrl/api/auth/${isLogin ? 'login' : 'signup'}');

  Map<String, String> payload = isLogin
      ? {'phone': finalPhone}
      : {'name': name, 'email': email, 'phone': finalPhone};

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},  // <-- Important!
      body: jsonEncode(payload),                       // <-- Important!
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['msg'] ?? 'Success')));
      if (isLogin) {
        setState(() {
          isLoggedIn = true;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}')));
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Error: $e')));
  }
}


  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return Scaffold(
        appBar: AppBar(title: const Text('Welcome')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('🎉 Welcome to Surgy Innovation Labs',
                  style: TextStyle(fontSize: 22)),
              SizedBox(height: 10),
              Text("We're excited to have you on board."),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(isLogin ? 'Login - Surgy Innovations Lab' : 'Signup - Surgy Innovations Lab')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (!isLogin) ...[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Enter your name' : null,
                  onSaved: (val) => name = val ?? '',
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (val) =>
                      val == null || !val.contains('@') ? 'Enter valid email' : null,
                  onSaved: (val) => email = val ?? '',
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      const Text(
                        '📢 Before signing up: To receive WhatsApp alerts, you must register your number.',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: () async {
                          final url = Uri.parse(
                              'https://wa.me/14155238886?text=join%20eager-forest');
                          if (!await launchUrl(url)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Could not launch WhatsApp')),
                            );
                          }
                        },
                        child: const Text('✅ Click here to register on WhatsApp'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Phone (e.g., +91XXXXXXXXXX)'),
                keyboardType: TextInputType.phone,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter phone number' : null,
                onSaved: (val) => phone = val ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submit,
                child: Text(isLogin ? 'Login' : 'Signup'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text('Switch to ${isLogin ? 'Signup' : 'Login'}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
