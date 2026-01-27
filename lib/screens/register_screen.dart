import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff2d4a4c),
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(height: 150),
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: phone,
              decoration: InputDecoration(labelText: "Phone"),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 40),
            auth.isLoading
                ? Center(child: const CircularProgressIndicator(color:  Color(0xff2d4a4c),))
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2d4a4c),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(7),
                      ),
                    ),
                    onPressed: () async {
                      await auth.registerUser({
                        "name": name.text,
                        "email": email.text,
                        "gender": "male",
                        "phone": phone.text,
                        "password": password.text,
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Register"),
                  ),
          ],
        ),
      ),
    );
  }
}
