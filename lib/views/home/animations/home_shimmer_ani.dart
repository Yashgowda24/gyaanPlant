import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerAnimation {
  static Widget buildShimmerLoading(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          top: 30.0, left: 16.0, right: 16.0, bottom: 20.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo and notification icon placeholder
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 120,
                      height: 60,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),

            // Learning progress card placeholder
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 16,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Container(
                        width: 80,
                        height: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 150,
                    height: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 6,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Course sections placeholders
            ...List.generate(3, (index) => buildShimmerCourseSection(context)),
          ],
        ),
      ),
    );
  }

  static Widget buildShimmerCourseSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 20,
              color: Colors.white,
            ),
            Container(
              width: 70,
              height: 16,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            buildShimmerLessonCard(context),
            const SizedBox(width: 10),
            buildShimmerLessonCard(context),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  static Widget buildShimmerLessonCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          Container(
            width: 100,
            height: 14,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
