import '../models/book.dart';
import '../models/chapter.dart';
import '../models/content.dart';
import '../models/exercise.dart';
import '../models/option.dart';
import '../models/question.dart';

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
              texts: [
                'Flutter is an open-source UI software development kit created by Google.',
                'It is used to develop cross-platform applications from a single codebase for any platform, including iOS, Android, Linux, macOS, Windows, and the web.',
                'Flutter offers a reactive and declarative programming style. It is known for its fast development capabilities, expressive UI, and native performance.',
                'With Flutter, developers can create high-performance applications that feel natural on different platforms, all from a single codebase. This helps decrease development costs and time-to-market for mobile apps.',
              ],
            ),
            Content(
              id: '1-1-2',
              title: 'Flutter Architecture',
              texts: [
                "Flutter's architecture is built on three main layers:",
                "1. Framework Layer: This is the highest level layer that most developers interact with. It contains high-level features like widgets, animation, painting, and gestures.",
                "2. Engine Layer: Written in C++, this layer provides low-level implementations of Flutter's core APIs, including graphics, text layout, file and network I/O, and plugin architecture.",
                "3. Embedder Layer: Platform-specific code that provides entry points for platform channels, lifecycle events, and surface rendering.",
                "Flutter's architecture is designed for fast rendering and flexibility across platforms. The rendering pipeline is optimized for 60 or 120fps performance, ensuring smooth animations and transitions.",
              ],
            ),
            Content(
              id: '1-1-3',
              title: 'Getting Started with Flutter',
              texts: [
                'To get started with Flutter, you need to set up your development environment:',
                '1. Install Flutter SDK: Download and install the Flutter SDK from flutter.dev',
                '2. Set up an editor: Flutter supports various IDEs like Android Studio, IntelliJ IDEA, and VS Code with Flutter and Dart plugins.',
                '3. Create a new Flutter project: Use the command `flutter create my_app` to create a new project.',
                '4. Run your app: Connect a device or start an emulator, then run `flutter run` in your project directory.',
                "Flutter's hot reload feature makes development fast and interactive. When you make changes to your code, you can see them reflected in your running app in milliseconds, without losing the current state.",
              ],
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
              texts: [
                'To build your first Flutter app, start by creating a new project using the command `flutter create my_first_app`. This will generate a basic Flutter project structure with boilerplate code.',
              ],
            ),
            Content(
              id: '1-2-2',
              title: 'Understanding the Widget Tree',
              texts: [
                'Flutter apps are built using widgets. The widget tree represents the hierarchy of widgets in your app.',
                'Every widget has a parent and can have multiple children. Understanding how widgets interact is key to mastering Flutter development.',
              ],
            ),
            Content(
              id: '1-2-3',
              title: 'Running the App',
              texts: [
                'Once your project is set up, you can run it on an emulator or physical device using the command `flutter run`.',
                'Use hot reload (`r`) to quickly see changes without restarting the app.',
              ],
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
              texts: [
                'State in Flutter refers to any data that can change over time...',
              ],
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
              texts: [
                'Flutter is an open-source UI software development kit created by Google...',
              ],
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
              texts: [
                'Flutter is an open-source UI software development kit created by Google.',
                'It is used to develop cross-platform applications from a single codebase for any platform, including iOS, Android, Linux, macOS, Windows, and the web.',
                'Flutter offers a reactive and declarative programming style. It is known for its fast development capabilities, expressive UI, and native performance.',
                'With Flutter, developers can create high-performance applications that feel natural on different platforms, all from a single codebase. This helps decrease development costs and time-to-market for mobile apps.',
              ],
            ),
            Content(
              id: '1-1-2',
              title: 'Flutter Architecture',
              texts: [
                "Flutter's architecture is built on three main layers:",
                "1. Framework Layer: This is the highest level layer that most developers interact with. It contains high-level features like widgets, animation, painting, and gestures.",
                "2. Engine Layer: Written in C++, this layer provides low-level implementations of Flutter's core APIs, including graphics, text layout, file and network I/O, and plugin architecture.",
                "3. Embedder Layer: Platform-specific code that provides entry points for platform channels, lifecycle events, and surface rendering.",
                "Flutter's architecture is designed for fast rendering and flexibility across platforms. The rendering pipeline is optimized for 60 or 120fps performance, ensuring smooth animations and transitions.",
              ],
            ),
            Content(
              id: '1-1-3',
              title: 'Getting Started with Flutter',
              texts: [
                'To get started with Flutter, you need to set up your development environment:',
                '1. Install Flutter SDK: Download and install the Flutter SDK from flutter.dev',
                '2. Set up an editor: Flutter supports various IDEs like Android Studio, IntelliJ IDEA, and VS Code with Flutter and Dart plugins.',
                '3. Create a new Flutter project: Use the command `flutter create my_app` to create a new project.',
                '4. Run your app: Connect a device or start an emulator, then run `flutter run` in your project directory.',
                "Flutter's hot reload feature makes development fast and interactive. When you make changes to your code, you can see them reflected in your running app in milliseconds, without losing the current state.",
              ],
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
              texts: [
                'To build your first Flutter app, start by creating a new project using the command `flutter create my_first_app`. This will generate a basic Flutter project structure with boilerplate code.',
              ],
            ),
            Content(
              id: '1-2-2',
              title: 'Understanding the Widget Tree',
              texts: [
                'Flutter apps are built using widgets. The widget tree represents the hierarchy of widgets in your app.',
                'Every widget has a parent and can have multiple children. Understanding how widgets interact is key to mastering Flutter development.',
              ],
            ),
            Content(
              id: '1-2-3',
              title: 'Running the App',
              texts: [
                'Once your project is set up, you can run it on an emulator or physical device using the command `flutter run`.',
                'Use hot reload (`r`) to quickly see changes without restarting the app.',
              ],
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
  ];
}