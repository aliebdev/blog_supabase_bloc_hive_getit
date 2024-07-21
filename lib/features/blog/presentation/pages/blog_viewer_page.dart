// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/format_date.dart';
import '../../domain/entities/blog.dart';

class BlogViewerPage extends StatelessWidget {
  static route(Blog blog) =>
      MaterialPageRoute(builder: (_) => BlogViewerPage(blog: blog));
  const BlogViewerPage({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blog.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "By ${blog.posterName}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${fomateDateByMMMYYY(blog.updatedAt)} . ${calculateReadingTime(blog.content)} min",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppPallete.greyColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  blog.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                blog.content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
