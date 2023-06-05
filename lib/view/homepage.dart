import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/credential_povider.dart';
import 'save_credential_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final credentialsProvider = Provider.of<CredentialsProvider>(context);
    final credentials = credentialsProvider.credentials;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (credentials != null)
              Text(
                  'Username: ${credentials.username}\nPassword: ${credentials.password}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SaveCredentialsPage()),
                );
              },
              child: const Text('Save Credentials'),
            ),
          ],
        ),
      ),
    );
  }
}
