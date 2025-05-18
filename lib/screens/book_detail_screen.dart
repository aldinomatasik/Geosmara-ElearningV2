import 'package:flutter/material.dart';
import '../models/book.dart';
import 'content_screen.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

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
                  book.imageUrl,
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
                      book.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'by ${book.author}',
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
                          '${book.rating}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$${book.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent,
                      ),
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
                    if (book.chapters.isNotEmpty && book.chapters[0].contents.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentScreen(
                            chapter: book.chapters[0],
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
      itemCount: book.chapters.length,
      itemBuilder: (context, index) {
        final chapter = book.chapters[index];
        return ListTile(
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
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Navigate to chapter content screen
            if (chapter.contents.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContentScreen(
                    chapter: chapter,
                    contentIndex: 0,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}