class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final double rating;
  final double price;
  final double progress;
  final List<Chapter> chapters;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
    required this.price,
    this.progress = 0.0,
    required this.chapters,
  });
}

class Chapter {
  final String id;
  final String title;
  final List<Content> contents;

  Chapter({
    required this.id,
    required this.title,
    required this.contents,
  });
}

class Content {
  final String id;
  final String title;
  final String text;

  Content({
    required this.id,
    required this.title,
    required this.text,
  });
}

// Sample data
List<Book> getRecommendedBooks() {
  return [
    Book(
      id: '1',
      title: 'Flutter Development',
      author: 'John Doe',
      imageUrl: 'https://picsum.photos/id/24/400/600',
      rating: 4.5,
      price: 24.99,
      progress: 0.35,
      chapters: [
        Chapter(
          id: '1-1',
          title: 'Introduction to Flutter',
          contents: [
            Content(
              id: '1-1-1',
              title: 'What is Flutter?',
              text: 'Flutter is an open-source UI software development kit created by Google...',
            ),
          ],
        ),
      ],
    ),
    Book(
      id: '2',
      title: 'Dart Programming Language',
      author: 'Jane Smith',
      imageUrl: 'https://picsum.photos/id/42/400/600',
      rating: 4.8,
      price: 19.99,
      progress: 0.65,
      chapters: [
        Chapter(
          id: '2-1',
          title: 'Dart Basics',
          contents: [
            Content(
              id: '2-1-1',
              title: 'Variables and Types',
              text: 'Dart is a strongly-typed language with type inference...',
            ),
          ],
        ),
      ],
    ),
    Book(
      id: '3',
      title: 'Mobile App Design',
      author: 'Robert Johnson',
      imageUrl: 'https://picsum.photos/id/96/400/600',
      rating: 4.2,
      price: 29.99,
      progress: 0.2,
      chapters: [
        Chapter(
          id: '3-1',
          title: 'Design Principles',
          contents: [
            Content(
              id: '3-1-1',
              title: 'Color Theory',
              text: 'Understanding color theory is essential for designing appealing mobile apps...',
            ),
          ],
        ),
      ],
    ),
  ];
}

List<Book> getNewestBooks() {
  return [
    Book(
      id: '4',
      title: 'State Management in Flutter',
      author: 'Maria Garcia',
      imageUrl: 'https://picsum.photos/id/65/400/600',
      rating: 4.7,
      price: 22.99,
      progress: 0.0,
      chapters: [
        Chapter(
          id: '4-1',
          title: 'Introduction to State',
          contents: [
            Content(
              id: '4-1-1',
              title: 'What is State?',
              text: 'State in Flutter refers to any data that can change over time...',
            ),
          ],
        ),
      ],
    ),
    Book(
      id: '5',
      title: 'Advanced Flutter Animations',
      author: 'David Wilson',
      imageUrl: 'https://picsum.photos/id/76/400/600',
      rating: 4.9,
      price: 34.99,
      progress: 0.0,
      chapters: [
        Chapter(
          id: '5-1',
          title: 'Animation Basics',
          contents: [
            Content(
              id: '5-1-1',
              title: 'Types of Animations',
              text: 'Flutter offers various animation types including implicit and explicit animations...',
            ),
          ],
        ),
      ],
    ),
    Book(
      id: '6',
      title: 'Flutter for Web',
      author: 'Sarah Brown',
      imageUrl: 'https://picsum.photos/id/89/400/600',
      rating: 4.3,
      price: 27.99,
      progress: 0.0,
      chapters: [
        Chapter(
          id: '6-1',
          title: 'Web Rendering',
          contents: [
            Content(
              id: '6-1-1',
              title: 'HTML Renderer vs CanvasKit',
              text: 'Flutter for web offers two rendering options: HTML and CanvasKit...',
            ),
          ],
        ),
      ],
    ),
  ];
}

List<Book> getMyBooks() {
  return [
    Book(
      id: '1',
      title: 'Flutter Development',
      author: 'John Doe',
      imageUrl: 'https://picsum.photos/id/24/400/600',
      rating: 4.5,
      price: 24.99,
      progress: 0.35,
      chapters: [
        Chapter(
          id: '1-1',
          title: 'Introduction to Flutter',
          contents: [
            Content(
              id: '1-1-1',
              title: 'What is Flutter?',
              text: 'Flutter is an open-source UI software development kit created by Google...',
            ),
          ],
        ),
      ],
    ),
    Book(
      id: '2',
      title: 'Dart Programming Language',
      author: 'Jane Smith',
      imageUrl: 'https://picsum.photos/id/42/400/600',
      rating: 4.8,
      price: 19.99,
      progress: 0.65,
      chapters: [
        Chapter(
          id: '2-1',
          title: 'Dart Basics',
          contents: [
            Content(
              id: '2-1-1',
              title: 'Variables and Types',
              text: 'Dart is a strongly-typed language with type inference...',
            ),
          ],
        ),
      ],
    ),
    Book(
      id: '3',
      title: 'Mobile App Design',
      author: 'Robert Johnson',
      imageUrl: 'https://picsum.photos/id/96/400/600',
      rating: 4.2,
      price: 29.99,
      progress: 0.2,
      chapters: [
        Chapter(
          id: '3-1',
          title: 'Design Principles',
          contents: [
            Content(
              id: '3-1-1',
              title: 'Color Theory',
              text: 'Understanding color theory is essential for designing appealing mobile apps...',
            ),
          ],
        ),
      ],
    ),
  ];
}