part of 'quote_cubit.dart';

abstract class QuoteState {}

class QuoteInitial extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteSuccess extends QuoteState {
  QuoteModel quotes;
  QuoteSuccess(this.quotes);
}

class QuoteError extends QuoteState {
  final String failure;
  QuoteError(this.failure);
}

class SearchQuoteLoading extends QuoteState {}

class SearchQuoteSuccess extends QuoteState {
  List<QuoteModel> quotes;
  SearchQuoteSuccess(this.quotes);
}

class SearchQuoteError extends QuoteState {
  final String failure;
  SearchQuoteError(this.failure);
}
