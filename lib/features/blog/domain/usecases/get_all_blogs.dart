import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/blog.dart';
import '../repositories/blog_repository.dart';

class GetAllBlogs implements Usecase<List<Blog>, NoParams> {
  final BlogRepository repository;

  const GetAllBlogs(this.repository);
  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) async =>
      await repository.getAllBlogs();
}
