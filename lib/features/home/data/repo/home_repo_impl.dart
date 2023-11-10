import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task2/core/errors/failure.dart';
import 'package:task2/core/models/QuoteModel.dart';
import 'package:task2/core/utils/api_service.dart';
import 'package:task2/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, QuoteModel>> fetchRandomQuote() async {
    try {
      var data = await apiService.get(endpoint: 'random');
      QuoteModel quote = QuoteModel.fromJson(data);

      return right(quote);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<QuoteModel>>> searchQuote(
      {required String search}) async {
    try {
      var data = await apiService.get(endpoint: 'search/quotes/?query=$search');

      List<QuoteModel> quotes = [];

      for (var item in data["results"]) {
        quotes.add(QuoteModel.fromJson(item));
      }

      return right(quotes);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
