import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errora/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>>fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>fetchNewSetBooks();
  Future<Either<Failure,List<BookModel>>>fetchSimilarBooks({required String category});
}