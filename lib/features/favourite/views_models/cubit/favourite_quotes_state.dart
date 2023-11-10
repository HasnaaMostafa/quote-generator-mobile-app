import '../../../../core/models/QuoteModel.dart';

abstract class FavoriteQuotesState {}

class FavouriteQuotesInitial extends FavoriteQuotesState {}

class SuccessfullyRemoved extends FavoriteQuotesState {
  List<QuoteModel>? favoriteQuotes;
  SuccessfullyRemoved(this.favoriteQuotes);
}

class QuoteAdded extends FavoriteQuotesState {
  QuoteModel quoteModel;
  QuoteAdded(this.quoteModel);
}

class QuoteError extends FavoriteQuotesState {
  final String error;
  QuoteError(this.error);
}

class QuoteSaved extends FavoriteQuotesState {}

class QuoteRemoved extends FavoriteQuotesState {
  List<QuoteModel>? favoriteQuotes;
  QuoteRemoved(this.favoriteQuotes);
}

class FavoriteQuotesLoaded extends FavoriteQuotesState {
  List<QuoteModel> favoriteQuotes;
  FavoriteQuotesLoaded(this.favoriteQuotes);
}
