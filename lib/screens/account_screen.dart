import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreen extends StatelessWidget {
  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Ganti ke halaman login, sesuaikan dengan route kamu
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _buildProfileSection(user),
                SizedBox(height: 24),
                _buildAccountOptions(),
                SizedBox(height: 24),
                _buildLogoutButton(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileSection(User? user) {
    final email = user?.email ?? 'No email available';
    final displayName = user?.displayName ?? 'Alex Johnson';

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://picsum.photos/id/64/200/200'),
          ),
          SizedBox(height: 16),
          Text(
            displayName,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.tealAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 16, color: Colors.tealAccent),
                SizedBox(width: 6),
                Text(
                  'Premium Member',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountOptions() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildAccountOption(
            icon: Icons.bookmark_outline,
            title: 'Bookmarks',
            subtitle: '12 books bookmarked',
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[850]),
          _buildAccountOption(
            icon: Icons.history,
            title: 'Reading History',
            subtitle: '23 books completed',
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[850]),
          _buildAccountOption(
            icon: Icons.payment,
            title: 'Payment Methods',
            subtitle: '2 cards connected',
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[850]),
          _buildAccountOption(
            icon: Icons.settings_outlined,
            title: 'Settings',
            subtitle: 'App preferences, notifications',
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[850]),
          _buildAccountOption(
            icon: Icons.help_outline,
            title: 'Help & Support',
            subtitle: 'FAQs, contact us',
            showDivider: false,
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      icon: Icon(Icons.logout, color: Colors.white),
      label: Text(
        'Logout',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _logout(context),
    );
  }

  Widget _buildAccountOption({
    required IconData icon,
    required String title,
    required String subtitle,
    bool showDivider = true,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.tealAccent,
                size: 22,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[600],
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
