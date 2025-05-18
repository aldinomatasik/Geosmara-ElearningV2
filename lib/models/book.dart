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
              text: 'Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications from a single codebase for any platform, including iOS, Android, Linux, macOS, Windows, and the web.\n\nFlutter offers a reactive and declarative programming style. It is known for its fast development capabilities, expressive UI, and native performance. Flutter uses Dart as its programming language.\n\nWith Flutter, developers can create high-performance applications that feel natural on different platforms, all from a single codebase. This helps decrease development costs and time-to-market for mobile apps.',
            ),
            Content(
              id: '1-1-2',
              title: 'Flutter Architecture',
              text: 'Flutter\'s architecture is built on three main layers:\n\n1. Framework Layer: This is the highest level layer that most developers interact with. It contains high-level features like widgets, animation, painting, and gestures.\n\n2. Engine Layer: Written in C++, this layer provides low-level implementations of Flutter\'s core APIs, including graphics, text layout, file and network I/O, and plugin architecture.\n\n3. Embedder Layer: Platform-specific code that provides entry points for platform channels, lifecycle events, and surface rendering.\n\nFlutter\'s architecture is designed for fast rendering and flexibility across platforms. The rendering pipeline is optimized for 60 or 120fps performance, ensuring smooth animations and transitions.',
            ),
            Content(
              id: '1-1-3',
              title: 'Getting Started with Flutter',
              text: 'To get started with Flutter, you need to set up your development environment:\n\n1. Install Flutter SDK: Download and install the Flutter SDK from flutter.dev\n\n2. Set up an editor: Flutter supports various IDEs like Android Studio, IntelliJ IDEA, and VS Code with Flutter and Dart plugins.\n\n3. Create a new Flutter project: Use the command `flutter create my_app` to create a new project.\n\n4. Run your app: Connect a device or start an emulator, then run `flutter run` in your project directory.\n\nFlutter\'s hot reload feature makes development fast and interactive. When you make changes to your code, you can see them reflected in your running app in milliseconds, without losing the current state.',
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
              text: 'Dart is a strongly-typed language with type inference. Variables in Dart can be declared using either static typing or type inference with the `var` keyword.\n\nBasic types in Dart include:\n- int: Integer values\n- double: Floating-point numbers\n- String: Text values\n- bool: Boolean values (true/false)\n- List: Ordered collection of objects\n- Map: Unordered collection of key-value pairs\n\nDart also supports null safety, which helps prevent null reference exceptions. Variables must be explicitly declared as nullable by adding a question mark to the type annotation.',
            ),
            Content(
              id: '2-1-2',
              title: 'Functions in Dart',
              text: 'Functions in Dart are first-class objects, meaning they can be assigned to variables and passed as arguments to other functions.\n\nDart supports both named and positional parameters. Named parameters are prefixed with curly braces and can be made required using the `required` keyword.\n\nDart also supports arrow syntax for one-line functions: `int add(int a, int b) => a + b;`\n\nHigher-order functions that take functions as parameters or return functions are common in Dart, especially when working with collections using methods like map(), where(), reduce(), etc.',
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
              text: 'Understanding color theory is essential for designing appealing mobile apps. Colors evoke emotions and communicate meaning to users.\n\nKey concepts in color theory include:\n\n1. Color wheel: The organization of colors in a circle showing relationships between primary, secondary, and tertiary colors.\n\n2. Color harmonies: Specific combinations that work well together, such as complementary, analogous, and triadic color schemes.\n\n3. Color psychology: Different colors evoke different emotional responses. For example, blue conveys trust and security, while red creates urgency and excitement.\n\nWhen designing mobile apps, a consistent color palette enhances usability and reinforces brand identity. Most successful apps use a limited color palette with 1-2 primary colors and 2-3 accent colors.',
            ),
            Content(
              id: '3-1-2',
              title: 'Typography in Mobile Design',
              text: 'Typography plays a crucial role in mobile app design as it affects readability, usability, and overall aesthetic.\n\nKey typography considerations for mobile apps:\n\n1. Font selection: Choose fonts that are legible at small sizes and work well on digital screens. Sans-serif fonts like Roboto, SF Pro, and Open Sans are popular choices.\n\n2. Text hierarchy: Establish a clear hierarchy using different font sizes, weights, and colors to guide users through content.\n\n3. Line spacing (leading): Proper spacing between lines improves readability, especially for longer text passages.\n\n4. Font scaling: Consider how text will appear on different device sizes and ensure it scales appropriately for accessibility.\n\nConsistency in typography throughout the app creates a cohesive user experience and strengthens brand recognition.',
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