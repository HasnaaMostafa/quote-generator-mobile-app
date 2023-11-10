import 'package:dartz/dartz.dart';
import 'package:task2/core/errors/failure.dart';
import 'package:task2/core/models/QuoteModel.dart';

abstract class HomeRepo {
  Future<Either<Failure, QuoteModel>> fetchRandomQuote();
  Future<Either<Failure, List<QuoteModel>>> searchQuote(
      {required String search});
}
