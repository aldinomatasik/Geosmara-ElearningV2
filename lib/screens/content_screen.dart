// screens/content_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/subchapter.dart';
import '../providers/subchapter_provider.dart';
import '../widgets/content_app_bar.dart';
import '../widgets/content_progress_indicator.dart';
import '../widgets/content_page_view.dart';
import '../widgets/content_navigation_controls.dart';

class ContentScreen extends ConsumerWidget {
  final String subChapterId;
  final String subChapterTitle;

  const ContentScreen({
    Key? key,
    required this.subChapterId,
    required this.subChapterTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider with the given subChapterId
    final subChapterState = ref.watch(
      subChapterProvider((subChapterId, subChapterTitle)),
    );

    return Scaffold(
      appBar: ContentAppBar(
        title: subChapterState.when(
          loading: () => "Loading...",
          data: (subChapter) => subChapter.title,
          error: (error, _) => "Error",
        ),
      ),
      body: subChapterState.when(
        loading: () => const _LoadingWidget(),
        data: (subChapter) => _buildBody(context, subChapter),
        error: (error, _) => _ErrorWidget(message: error.toString()),
      ),
    );
  }

  Widget _buildBody(BuildContext context, SubChapter subChapter) {
    if (subChapter.contents!.isEmpty) {
      return const _EmptyContentWidget();
    }

    final pageController = PageController();

    return Column(
      children: [
        ContentProgressIndicator(
          currentPage: 0, // You can manage current page using Riverpod as well
          totalPages: subChapter.contents!.length,
        ),
        Expanded(
          child: ContentPageView(
            pageController: pageController,
            contents: subChapter.contents!,
            onPageChanged: (index) {
              // Handle page change logic here
            },
          ),
        ),
        ContentNavigationControls(
          currentPageIndex: 0, // Manage with Riverpod if needed
          totalPages: subChapter.contents!.length,
          onNavigate: (page) {
            pageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}

// Private widgets for this screen
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
      ),
    );
  }
}

class _EmptyContentWidget extends StatelessWidget {
  const _EmptyContentWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.article_outlined,
            size: 64,
            color: Colors.grey[600],
          ),
          const SizedBox(height: 16),
          Text(
            "No content available",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;

  const _ErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[600],
          ),
          const SizedBox(height: 16),
          Text(
            "Error: $message",
            style: TextStyle(
              fontSize: 18,
              color: Colors.red[600],
            ),
          ),
        ],
      ),
    );
  }
}