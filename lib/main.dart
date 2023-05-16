import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_recipe/core/providers/firebase_providers.dart';
import 'package:flutter_recipe/features/auth/screens/login_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_recipe/widgets/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authStatusProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authStatus.when(
        data: (user) {
          if(user != null) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
          
        }, 
        error: ((error, stackTrace) => const LoginScreen()), 
        loading: () => const CircularProgressIndicator()),
      
    );
  }
}
