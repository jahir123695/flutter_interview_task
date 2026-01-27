import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff2d4a4c),
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              controller: password,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            auth.isLoading
                ? Center(
                    child: const CircularProgressIndicator(
                      color: Color(0xff2d4a4c),
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2d4a4c),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(7),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        await auth.loginWithEmailPass(
                          email.text,
                          password.text,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          '/notifications',
                        );
                      } catch (_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login failed")),
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I don`t have an account ',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 3),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/register'),
                  child: Text(
                    'Register ',
                    style: TextStyle(
                      color: Color(0xff2d4a4c),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
