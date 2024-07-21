// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BlogEditor extends StatelessWidget {
  const BlogEditor({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
