import 'package:flutter/material.dart';
import '../models/book.dart';

class ContentScreen extends StatefulWidget {
  final Chapter chapter;
  final int contentIndex;

  const ContentScreen({
    Key? key,
    required this.chapter,
    required this.contentIndex,
  }) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late int currentContentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentContentIndex = widget.contentIndex;
    _pageController = PageController(initialPage: currentContentIndex);
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
          widget.chapter.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress indicator
          LinearProgressIndicator(
            value: (currentContentIndex + 1) / widget.chapter.contents.length,
            backgroundColor: Colors.grey[800],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
            minHeight: 4,
          ),
          // Content page view
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.chapter.contents.length,
              onPageChanged: (index) {
                setState(() {
                  currentContentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final content = widget.chapter.contents[index];
                return _buildContentPage(content);
              },
            ),
          ),
          // Navigation controls
          _buildNavigationControls(),
        ],
      ),
    );
  }

  Widget _buildContentPage(Content content) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Content title
          Text(
            content.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          // Content text
          Text(
            content.text,
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
            onPressed: currentContentIndex > 0
                ? () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
                : null,
            icon: Icon(Icons.arrow_back_ios),
            color: currentContentIndex > 0 ? Colors.white : Colors.grey[600],
          ),
          // Page indicator
          Text(
            '${currentContentIndex + 1} / ${widget.chapter.contents.length}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Next button
          IconButton(
            onPressed: currentContentIndex < widget.chapter.contents.length - 1
                ? () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
                : null,
            icon: Icon(Icons.arrow_forward_ios),
            color: currentContentIndex < widget.chapter.contents.length - 1
                ? Colors.white
                : Colors.grey[600],
          ),
        ],
      ),
    );
  }
}