import 'package:flutter/material.dart';
import '../models/book.dart';
import 'content_screen.dart';
import 'exercise_screen.dart'; // We'll create this next

class BookDetailScreen extends StatefulWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  // Track expanded chapters
  Map<String, bool> expandedChapters = {};

  @override
  void initState() {
    super.initState();
    // Initialize all chapters as collapsed
    for (var chapter in widget.book.chapters) {
      expandedChapters[chapter.id] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBookHeader(context),
            _buildChaptersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBookHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book cover and basic info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book cover
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.book.imageUrl,
                  height: 180,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              // Book details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.book.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'by ${widget.book.author}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          '${widget.book.rating}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the first chapter content
                    if (widget.book.chapters.isNotEmpty && widget.book.chapters[0].contents.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentScreen(
                            chapter: widget.book.chapters[0],
                            contentIndex: 0,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent,
                    foregroundColor: Colors.black87,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Start Reading',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 12),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border, color: Colors.tealAccent),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.tealAccent.withOpacity(0.2),
                ),
              ),
            ],
          ),
          Divider(height: 32, thickness: 1, color: Colors.grey[800]),
          // Chapters title
          Text(
            'Chapters',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChaptersList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.book.chapters.length,
      itemBuilder: (context, index) {
        final chapter = widget.book.chapters[index];
        return Column(
          children: [
            // Chapter header
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                chapter.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '${chapter.contents.length} section${chapter.contents.length != 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Exercise button (if available)
                  if (chapter.exercise != null)
                    IconButton(
                      icon: Icon(Icons.quiz, color: Colors.tealAccent),
                      onPressed: () {
                        // Navigate to exercise screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseScreen(
                              exercise: chapter.exercise!,
                              chapterTitle: chapter.title,
                            ),
                          ),
                        );
                      },
                      tooltip: 'Take quiz',
                    ),
                  // Expand/collapse icon
                  IconButton(
                    icon: Icon(
                      expandedChapters[chapter.id]!
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        expandedChapters[chapter.id] = !expandedChapters[chapter.id]!;
                      });
                    },
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  expandedChapters[chapter.id] = !expandedChapters[chapter.id]!;
                });
              },
            ),

            // Content dropdown (expanded section)
            if (expandedChapters[chapter.id]!)
              Container(
                color: Colors.grey[900],
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: chapter.contents.length,
                  itemBuilder: (context, contentIndex) {
                    final content = chapter.contents[contentIndex];
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 32, right: 16),
                      dense: true,
                      title: Text(
                        content.title,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      leading: Icon(
                        Icons.article_outlined,
                        size: 18,
                        color: Colors.grey[400],
                      ),
                      onTap: () {
                        // Navigate to the content
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContentScreen(
                              chapter: chapter,
                              contentIndex: contentIndex,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            Divider(height: 1, thickness: 1, color: Colors.grey[800], indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}