import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 12),

            const Text(
              'Maya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(user?.email ?? '-'),

            const SizedBox(height: 24),
            const Text(
              'Contact',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.email, size: 30),
                Icon(Icons.telegram, size: 30),
                Icon(Icons.business, size: 30),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              'ShopEase adalah aplikasi katalog produk Flutter '
              'menggunakan REST API dan Firebase Authentication.',
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (_) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
