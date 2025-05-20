import 'package:flutter/material.dart';
import '../models/content.dart';

class ContentScreen extends StatefulWidget {
  final Content content;

  const ContentScreen({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late PageController _pageController;
  late int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = 0; // Mulai dari halaman pertama
    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.content.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress indicator
          LinearProgressIndicator(
            value: (currentPageIndex + 1) / widget.content.texts.length,
            backgroundColor: Colors.grey[800],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
            minHeight: 4,
          ),
          // Content page view
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.content.texts.length,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final text = widget.content.texts[index];
                return _buildTextPage(text);
              },
            ),
          ),
          // Navigation controls
          _buildNavigationControls(),
        ],
      ),
    );
  }

  Widget _buildTextPage(String text) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Content text
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationControls() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        border: Border(
          top: BorderSide(color: Colors.grey[800]!, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous button
          IconButton(
            onPressed: currentPageIndex > 0
                ? () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
                : null,
            icon: Icon(Icons.arrow_back_ios),
            color: currentPageIndex > 0 ? Colors.white : Colors.grey[600],
          ),
          // Page indicator
          Text(
            '${currentPageIndex + 1} / ${widget.content.texts.length}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Next button
          IconButton(
            onPressed: currentPageIndex < widget.content.texts.length - 1
                ? () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
                : null,
            icon: Icon(Icons.arrow_forward_ios),
            color:
            currentPageIndex < widget.content.texts.length - 1 ? Colors.white : Colors.grey[600],
          ),
        ],
      ),
    );
  }
}