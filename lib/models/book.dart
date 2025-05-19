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
  final Exercise? exercise; // Adding exercise to each chapter

  Chapter({
    required this.id,
    required this.title,
    required this.contents,
    this.exercise,
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

class Exercise {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });
}

class Question {
  final String id;
  final String question;
  final List<Option> options;
  final String correctOptionId;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionId,
  });
}

class Option {
  final String id;
  final String text;

  Option({
    required this.id,
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

          exercise: Exercise(
            id: 'ex-1-1',
            title: 'Introduction to Flutter Quiz',
            description: 'Test your knowledge of Flutter basics with this quick quiz.',
            questions: [
              Question(
                id: 'q-1-1-1',
                question: 'Which company created Flutter?',
                options: [
                  Option(id: 'opt-1-1-1-a', text: 'Apple'),
                  Option(id: 'opt-1-1-1-b', text: 'Google'),
                  Option(id: 'opt-1-1-1-c', text: 'Microsoft'),
                  Option(id: 'opt-1-1-1-d', text: 'Facebook'),
                ],
                correctOptionId: 'opt-1-1-1-b',
              ),
              Question(
                id: 'q-1-1-2',
                question: 'What programming language does Flutter use?',
                options: [
                  Option(id: 'opt-1-1-2-a', text: 'JavaScript'),
                  Option(id: 'opt-1-1-2-b', text: 'Kotlin'),
                  Option(id: 'opt-1-1-2-c', text: 'Swift'),
                  Option(id: 'opt-1-1-2-d', text: 'Dart'),
                ],
                correctOptionId: 'opt-1-1-2-d',
              ),
              Question(
                id: 'q-1-1-3',
                question: 'Which of the following is NOT a layer in Flutter\'s architecture?',
                options: [
                  Option(id: 'opt-1-1-3-a', text: 'Framework Layer'),
                  Option(id: 'opt-1-1-3-b', text: 'Engine Layer'),
                  Option(id: 'opt-1-1-3-c', text: 'Database Layer'),
                  Option(id: 'opt-1-1-3-d', text: 'Embedder Layer'),
                ],
                correctOptionId: 'opt-1-1-3-c',
              ),
            ],
          ),
        ),
        Chapter(
          id: '1-2',
          title: 'Building Your First Flutter App',
          contents: [
            Content(
              id: '1-2-1',
              title: 'Setting Up the Project',
              text: 'To build your first Flutter app, start by creating a new project using the command `flutter create my_first_app`. This will generate a basic Flutter project structure with boilerplate code.',
            ),
            Content(
              id: '1-2-2',
              title: 'Understanding the Widget Tree',
              text: 'Flutter apps are built using widgets. The widget tree represents the hierarchy of widgets in your app. Every widget has a parent and can have multiple children. Understanding how widgets interact is key to mastering Flutter development.',
            ),
            Content(
              id: '1-2-3',
              title: 'Running the App',
              text: 'Once your project is set up, you can run it on an emulator or physical device using the command `flutter run`. Use hot reload (`r`) to quickly see changes without restarting the app.',
            ),
          ],
          exercise: Exercise(
            id: 'ex-1-2',
            title: 'Building Your First Flutter App Quiz',
            description: 'Test your understanding of building a basic Flutter app.',
            questions: [
              Question(
                id: 'q-1-2-1',
                question: 'What command is used to create a new Flutter project?',
                options: [
                  Option(id: 'opt-1-2-1-a', text: 'flutter init'),
                  Option(id: 'opt-1-2-1-b', text: 'flutter new'),
                  Option(id: 'opt-1-2-1-c', text: 'flutter create'),
                  Option(id: 'opt-1-2-1-d', text: 'flutter start'),
                ],
                correctOptionId: 'opt-1-2-1-c',
              ),
              Question(
                id: 'q-1-2-2',
                question: 'What is the purpose of the widget tree in Flutter?',
                options: [
                  Option(id: 'opt-1-2-2-a', text: 'To manage app state'),
                  Option(id: 'opt-1-2-2-b', text: 'To define the app\'s UI hierarchy'),
                  Option(id: 'opt-1-2-2-c', text: 'To handle network requests'),
                  Option(id: 'opt-1-2-2-d', text: 'To store user preferences'),
                ],
                correctOptionId: 'opt-1-2-2-b',
              ),
              Question(
                id: 'q-1-2-3',
                question: 'Which command allows you to quickly see changes in your running app?',
                options: [
                  Option(id: 'opt-1-2-3-a', text: 'flutter restart'),
                  Option(id: 'opt-1-2-3-b', text: 'flutter run'),
                  Option(id: 'opt-1-2-3-c', text: 'hot reload'),
                  Option(id: 'opt-1-2-3-d', text: 'cold reload'),
                ],
                correctOptionId: 'opt-1-2-3-c',
              ),
            ],
          ),
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
          exercise: Exercise(
            id: 'ex-2-1',
            title: 'Dart Basics Quiz',
            description: 'Test your understanding of Dart fundamentals.',
            questions: [
              Question(
                id: 'q-2-1-1',
                question: 'Which symbol is used to mark a variable as nullable in Dart?',
                options: [
                  Option(id: 'opt-2-1-1-a', text: '?'),
                  Option(id: 'opt-2-1-1-b', text: '!'),
                  Option(id: 'opt-2-1-1-c', text: '*'),
                  Option(id: 'opt-2-1-1-d', text: '#'),
                ],
                correctOptionId: 'opt-2-1-1-a',
              ),
              Question(
                id: 'q-2-1-2',
                question: 'What is the correct way to define a function with arrow syntax in Dart?',
                options: [
                  Option(id: 'opt-2-1-2-a', text: 'int add(a, b) -> a + b;'),
                  Option(id: 'opt-2-1-2-b', text: 'int add(int a, int b) => a + b;'),
                  Option(id: 'opt-2-1-2-c', text: 'function add(a, b) => a + b;'),
                  Option(id: 'opt-2-1-2-d', text: 'add = (a, b) -> a + b;'),
                ],
                correctOptionId: 'opt-2-1-2-b',
              ),
            ],
          ),
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
          exercise: Exercise(
            id: 'ex-3-1',
            title: 'Design Principles Quiz',
            description: 'Test your understanding of mobile app design principles.',
            questions: [
              Question(
                id: 'q-3-1-1',
                question: 'Which color is commonly associated with trust and security?',
                options: [
                  Option(id: 'opt-3-1-1-a', text: 'Red'),
                  Option(id: 'opt-3-1-1-b', text: 'Yellow'),
                  Option(id: 'opt-3-1-1-c', text: 'Blue'),
                  Option(id: 'opt-3-1-1-d', text: 'Green'),
                ],
                correctOptionId: 'opt-3-1-1-c',
              ),
              Question(
                id: 'q-3-1-2',
                question: 'Which font type is generally more readable on screens?',
                options: [
                  Option(id: 'opt-3-1-2-a', text: 'Script fonts'),
                  Option(id: 'opt-3-1-2-b', text: 'Serif fonts'),
                  Option(id: 'opt-3-1-2-c', text: 'Sans-serif fonts'),
                  Option(id: 'opt-3-1-2-d', text: 'Decorative fonts'),
                ],
                correctOptionId: 'opt-3-1-2-c',
              ),
            ],
          ),
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
          exercise: Exercise(
            id: 'ex-4-1',
            title: 'State Management Quiz',
            description: 'Test your knowledge of state management in Flutter.',
            questions: [
              Question(
                id: 'q-4-1-1',
                question: 'What does "state" refer to in Flutter?',
                options: [
                  Option(id: 'opt-4-1-1-a', text: 'The physical state of the device'),
                  Option(id: 'opt-4-1-1-b', text: 'Data that can change over time'),
                  Option(id: 'opt-4-1-1-c', text: 'The country where the app is being used'),
                  Option(id: 'opt-4-1-1-d', text: 'The current battery level'),
                ],
                correctOptionId: 'opt-4-1-1-b',
              ),
            ],
          ),
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
          exercise: Exercise(
            id: 'ex-5-1',
            title: 'Animation Basics Quiz',
            description: 'Test your understanding of Flutter animations.',
            questions: [
              Question(
                id: 'q-5-1-1',
                question: 'Which of these is NOT a type of animation in Flutter?',
                options: [
                  Option(id: 'opt-5-1-1-a', text: 'Tween Animation'),
                  Option(id: 'opt-5-1-1-b', text: 'Implicit Animation'),
                  Option(id: 'opt-5-1-1-c', text: 'Recursive Animation'),
                  Option(id: 'opt-5-1-1-d', text: 'Hero Animation'),
                ],
                correctOptionId: 'opt-5-1-1-c',
              ),
            ],
          ),
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
          exercise: Exercise(
            id: 'ex-6-1',
            title: 'Flutter Web Quiz',
            description: 'Test your knowledge of Flutter web development.',
            questions: [
              Question(
                id: 'q-6-1-1',
                question: 'Which of these is a rendering option for Flutter web?',
                options: [
                  Option(id: 'opt-6-1-1-a', text: 'WebGL'),
                  Option(id: 'opt-6-1-1-b', text: 'CanvasKit'),
                  Option(id: 'opt-6-1-1-c', text: 'WebAssembly'),
                  Option(id: 'opt-6-1-1-d', text: 'DOM Renderer'),
                ],
                correctOptionId: 'opt-6-1-1-b',
              ),
            ],
          ),
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
          exercise: Exercise(
            id: 'ex-1-1',
            title: 'Introduction to Flutter Quiz',
            description: 'Test your knowledge of Flutter basics with this quick quiz.',
            questions: [
              Question(
                id: 'q-1-1-1',
                question: 'Which company created Flutter?',
                options: [
                  Option(id: 'opt-1-1-1-a', text: 'Apple'),
                  Option(id: 'opt-1-1-1-b', text: 'Google'),
                  Option(id: 'opt-1-1-1-c', text: 'Microsoft'),
                  Option(id: 'opt-1-1-1-d', text: 'Facebook'),
                ],
                correctOptionId: 'opt-1-1-1-b',
              ),
            ],
          ),
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
          exercise: Exercise(
            id: 'ex-2-1',
            title: 'Dart Basics Quiz',
            description: 'Test your understanding of Dart fundamentals.',
            questions: [
              Question(
                id: 'q-2-1-1',
                question: 'Which symbol is used to mark a variable as nullable in Dart?',
                options: [
                  Option(id: 'opt-2-1-1-a', text: '?'),
                  Option(id: 'opt-2-1-1-b', text: '!'),
                  Option(id: 'opt-2-1-1-c', text: '*'),
                  Option(id: 'opt-2-1-1-d', text: '#'),
                ],
                correctOptionId: 'opt-2-1-1-a',
              ),
            ],
          ),
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
          exercise: Exercise(
            id: 'ex-3-1',
            title: 'Design Principles Quiz',
            description: 'Test your understanding of mobile app design principles.',
            questions: [
              Question(
                id: 'q-3-1-1',
                question: 'Which color is commonly associated with trust and security?',
                options: [
                  Option(id: 'opt-3-1-1-a', text: 'Red'),
                  Option(id: 'opt-3-1-1-b', text: 'Yellow'),
                  Option(id: 'opt-3-1-1-c', text: 'Blue'),
                  Option(id: 'opt-3-1-1-d', text: 'Green'),
                ],
                correctOptionId: 'opt-3-1-1-c',
              ),
            ],
          ),
        ),
      ],
    ),
  ];
}