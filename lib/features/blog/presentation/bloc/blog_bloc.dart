// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/domain/usecases/upload_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_all_blogs.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;

  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUpload>(_onBlogUpload);
    on<BlogFetchAllBlogs>(_onFetchAllBlogs);
  }

  _onBlogUpload(BlogUpload event, Emitter<BlogState> emit) async {
    final result = await _uploadBlog(UploadBlogParams(
      posterId: event.posterId,
      title: event.title,
      content: event.content,
      image: event.image,
      topics: event.topics,
    ));

    result.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogUploadSuccess()),
    );
  }

  _onFetchAllBlogs(BlogFetchAllBlogs event, Emitter<BlogState> emit) async {
    final result = await _getAllBlogs(NoParams());

    result.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogDisplaySuccess(r)),
    );
  }
}
