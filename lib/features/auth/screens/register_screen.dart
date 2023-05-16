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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void registerUser({required String email, required String password}) {
    ref.read(authControllerProvider).registerUser(email: email, password: password);
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
              TextField(controller: _emailController, keyboardType: TextInputType.emailAddress,),
              TextField(controller: _passwordController,obscureText: true,),
              OutlinedButton(
                onPressed: () {
                  registerUser(email: _emailController.text, password: _passwordController.text);
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
}
