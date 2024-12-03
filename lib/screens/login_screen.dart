import 'package:flutter/material.dart';
import 'tabs.dart'; // Import TabsScreen for navigation after login
import 'create_account_screen.dart'; // Import CreateAccountScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Email and Password cannot be empty.";
      });
    } else if (!email.contains('@')) {
      setState(() {
        _errorMessage = "Please enter a valid email address.";
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const TabsScreen()),
      );
    }
  }

  void _navigateToCreateAccount() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const CreateAccountScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // logo in a circular container
              const Center(
                child: CircleAvatar(
                  radius: 75, // Size of the circle
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 32), // spacing below the logo
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: _navigateToCreateAccount,
                  child: const Text('Create New Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}