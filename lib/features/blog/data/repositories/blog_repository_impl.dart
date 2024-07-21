import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/blog.dart';
import '../../domain/repositories/blog_repository.dart';
import '../datasources/blog_remote_data_source.dart';
import '../models/blog_model.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource remoteDataSource;

  BlogRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    try {
      BlogModel blogModel = BlogModel(
        id: const Uuid().v1(),
        posterId: posterId,
        title: title,
        content: content,
        imageUrl: "",
        topics: topics,
        updatedAt: DateTime.now(),
      );

      final imageUrl = await remoteDataSource.uploadBlogImage(
        image: image,
        blog: blogModel,
      );

      blogModel = blogModel.copyWith(
        imageUrl: imageUrl,
      );

      final uploadedBlog = await remoteDataSource.uploadBlog(blogModel);

      return right(uploadedBlog);
    } on ServerException catch (e) {
      throw left(Failure(e.message));
    }
  }
}
