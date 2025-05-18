import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileSection(),
            SizedBox(height: 24),
            _buildAccountOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Profile image
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://picsum.photos/id/64/200/200'),
          ),
          SizedBox(height: 16),
          // Profile name
          Text(
            'Alex Johnson',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          // Email
          Text(
            'alex.johnson@example.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 16),
          // Membership info
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.tealAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.tealAccent,
                ),
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