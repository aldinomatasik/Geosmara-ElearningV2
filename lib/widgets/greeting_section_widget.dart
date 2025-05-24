// widgets/greeting_section_widget.dart
import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroImage(),
          _buildGreetingText(),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://picsum.photos/id/169/800/400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGreetingText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning,',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'What would you like to read today?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}