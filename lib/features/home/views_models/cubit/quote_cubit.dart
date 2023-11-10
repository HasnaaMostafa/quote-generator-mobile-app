import 'package:bloc/bloc.dart';

import '../../../../core/models/QuoteModel.dart';
import '../../data/repo/home_repo.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit(this.homeRepo) : super(QuoteInitial());

  final HomeRepo homeRepo;

  Future<void> fetchRandomQuotes() async {
    emit(QuoteLoading());
    var response = await homeRepo.fetchRandomQuote();
    response.fold((failure) {
      emit(QuoteError(failure.errMessage));
    }, (quotes) {
      emit(QuoteSuccess(quotes));
    });
  }

  void searchQuote({required String search}) async {
    emit(SearchQuoteLoading());
    var response = await homeRepo.searchQuote(search: search);
    response.fold((failure) {
      emit(SearchQuoteError(failure.errMessage));
    }, (quotes) {
      emit(SearchQuoteSuccess(quotes));
    });
  }
}
