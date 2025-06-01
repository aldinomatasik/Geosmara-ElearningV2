import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';
import '../providers/book_detail_provider.dart';
import '../providers/expanded_chapter_provider.dart';
import 'content_screen.dart';
import 'exercise_screen.dart';

class BookDetailScreen extends ConsumerWidget {
  final String bookId;

  const BookDetailScreen({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider with the given bookId
    final bookState = ref.watch(bookProvider(bookId));

    // Watch expanded chapters state
    final expandedChapters = ref.watch(expandedChaptersProvider(bookId));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: bookState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (book) {
          if (book == null) {
            return Center(child: Text('Book not found'));
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBookHeader(context, book),
                _buildChaptersList(context, ref, book, expandedChapters),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookHeader(BuildContext context, Book book) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  book.imageUrl,
                  height: 180,
                  width: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      width: 120,
                      color: Colors.grey[800],
                      child: Icon(Icons.book, size: 50, color: Colors.grey[400]),
                    );
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'by ${book.author}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (book.chapters.isNotEmpty &&
                        book.chapters[0].subChapters.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentScreen(
                            subChapterId: book.chapters[0].subChapters[0].id,
                            subChapterTitle: book.chapters[0].subChapters[0].title,
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
            ],
          ),
          Divider(height: 32, thickness: 1, color: Colors.grey[800]),
          Text(
            'Chapters',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildChaptersList(BuildContext context, WidgetRef ref, Book book, Map<String, bool> expandedChapters) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: book.chapters.length,
      itemBuilder: (context, index) {
        final chapter = book.chapters[index];
        final isExpanded = expandedChapters[chapter.id] ?? false;

        return Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                chapter.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                '${chapter.subChapters.length} section${chapter.subChapters.length != 1 ? 's' : ''}',
                style: TextStyle(fontSize: 14, color: Colors.grey[400]),
              ),
              trailing: IconButton(
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                onPressed: () {
                  _toggleChapterExpansion(ref, chapter.id, !isExpanded);
                },
              ),
              onTap: () {
                _toggleChapterExpansion(ref, chapter.id, !isExpanded);
              },
            ),
            if (isExpanded)
              Container(
                color: Colors.grey[900],
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: chapter.subChapters.length + (chapter.exercise != null ? 1 : 0),
                  itemBuilder: (context, contentIndex) {
                    if (chapter.exercise != null &&
                        contentIndex == chapter.subChapters.length) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 32, right: 16),
                        dense: true,
                        title: Text(
                          'Exercise',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.tealAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(Icons.quiz, size: 18, color: Colors.tealAccent),
                        onTap: () {
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
                      );
                    }

                    final subChapter = chapter.subChapters[contentIndex];
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 32, right: 16),
                      dense: true,
                      title: Text(
                        subChapter.title,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      leading: Icon(Icons.article_outlined, size: 18, color: Colors.grey[400]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContentScreen(
                              subChapterId: subChapter.id,
                              subChapterTitle: subChapter.title,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[800],
              indent: 16,
              endIndent: 16,
            ),
          ],
        );
      },
    );
  }

  void _toggleChapterExpansion(WidgetRef ref, String chapterId, bool isExpanded) {
    final currentState = ref.read(expandedChaptersProvider(bookId));
    final newState = Map<String, bool>.from(currentState);
    newState[chapterId] = isExpanded;

    ref.read(expandedChaptersProvider(bookId).notifier).state = newState;
  }
}