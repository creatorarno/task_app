import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    formKey.currentState!.validate();
    super.dispose();
  }

  void signUpUser() {
    if (formKey.currentState!.validate()) {
      // store the user data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Name TextField
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                // Check if the name is empty
                // If empty, return error message
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Email TextField
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                // Check if the email is empty
                // If empty, return error message
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter an email";
                  }
                  // Regular expression for email validation
                  final emailRegExp =
                      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                  if (!emailRegExp.hasMatch(value.trim())) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Password TextField
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
                // Check if the password is empty
                // If empty, return error message
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length < 6) {
                    return "Password field is not valid";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Confirm Password TextField
              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter confirm password";
                  }
                  if (value?.trim() != passwordController.text.trim()) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Button to Sign Up
              ElevatedButton(
                onPressed: signUpUser,
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Already have an account? Sign In
              RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: " Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
