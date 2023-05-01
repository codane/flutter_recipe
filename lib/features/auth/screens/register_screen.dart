import 'package:flutter/material.dart';
import 'package:flutter_recipe/widgets/top_bezier_container.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              const TextField(),
              const TextField(),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
