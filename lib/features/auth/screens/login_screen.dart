import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/auth/controller/auth_controller.dart';
import 'package:flutter_recipe/widgets/home_screen.dart';
import 'package:flutter_recipe/widgets/top_bezier_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool isUserLoggedIn = ref.read(authControllerProvider).isUserLoggedIn();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF2F3AE),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBezierContainer(),
              TextField(controller: _emailController,),
              TextField(controller: _passwordController,),
              OutlinedButton(
                onPressed: () {
                  ref.read(authControllerProvider).loginUser(email: _emailController.text.trim(), password: _passwordController.text.trim());
                  if(isUserLoggedIn) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const HomeScreen()),),);
                  } 
                } ,
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
