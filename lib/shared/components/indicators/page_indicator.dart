import 'package:flutter/material.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({super.key, required this.totalPages, required this.currentPage});

  final int totalPages;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(right: 5),
          height: 6,
          width: currentPage == index ? 20 : 6,
          decoration: BoxDecoration(
            color: currentPage == index ? Theme.of(context).primaryColor : const Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
