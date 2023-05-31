import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/auth/controller/auth_controller.dart';
import 'package:flutter_recipe/widgets/home_screen.dart';
import 'package:flutter_recipe/widgets/top_bezier_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void registerUser({required String username, required String email, required String password}) {
    ref.read(authControllerProvider).registerUser(username: username, email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBezierContainer(),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  hintText: "Enter the username",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: _emailController, 
                decoration: const InputDecoration(
                  hintText: "Enter an email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "Enter the password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                ),
              OutlinedButton(
                onPressed: () {
                  registerUser(username: _usernameController.text.trim(), email: _emailController.text.trim(), password: _passwordController.text.trim());
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const HomeScreen()),),);
                } ,
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
