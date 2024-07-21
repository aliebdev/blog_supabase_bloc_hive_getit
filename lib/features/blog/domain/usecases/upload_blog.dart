import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/blog.dart';
import '../repositories/blog_repository.dart';

class UploadBlog implements Usecase<Blog, UploadBlogParams> {
  final BlogRepository repository;

  const UploadBlog(this.repository);

  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async =>
      await repository.uploadBlog(
        image: params.image,
        title: params.title,
        content: params.content,
        posterId: params.posterId,
        topics: params.topics,
      );
}

class UploadBlogParams {
  final String posterId, title, content;
  final File image;
  final List<String> topics;

  UploadBlogParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
