// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
//
// import '../../../../core/models/QuoteModel.dart';
// import 'favourite_quotes_state.dart';
//
// class FavoriteQuotesCubit extends Cubit<FavoriteQuotesState> {
//   FavoriteQuotesCubit() : super(FavouriteQuotesInitial());
//
//   void removeQuote(List<QuoteModel>? favoriteQuotes, QuoteModel quoteModel) {
//     favoriteQuotes!.remove(quoteModel);
//     emit(SuccessfullyRemoved(favoriteQuotes));
//   }
//
//   addQuote(
//     QuoteModel quote,
//     List<QuoteModel>? favoriteQuotes,
//   ) async {
//     try {
//       var quoteBox = Hive.box<QuoteModel>("quote_box");
//       var key = await quoteBox.add(quote);
//       quote.setKey(key.toString());
//       favoriteQuotes?.add(quote);
//
//       emit(QuoteAdded(quote));
//     } catch (e) {
//       print("Error adding quote to Hive: $e");
//       emit(QuoteError("Failed to add quote: $e"));
//     }
//   }
//
// // Future<void> addQuote(
//   //     QuoteModel quote, List<QuoteModel>? favoriteQuotes) async {
//   //   try {
//   //     // Your logic to add the quote to Hive
//   //     var quoteBox = Hive.box<QuoteModel>("quote_box");
//   //     quoteBox.add(quote);
//   //     favoriteQuotes!.add(quote);
//   //
//   //     emit(QuoteAdded());
//   //   } catch (e) {
//   //     emit(QuoteError("Failed to add quote: $e"));
//   //   }
//   // }
//   //
//   // Future<void> saveQuote(
//   //     QuoteModel quote, List<QuoteModel>? favoriteQuotes) async {
//   //   try {
//   //     // Your logic to save the quote to Hive
//   //     var quoteBox = Hive.box<QuoteModel>("quote_box");
//   //     quoteBox.add(quote);
//   //
//   //     favoriteQuotes!.add(quote);
//   //
//   //     emit(QuoteSaved());
//   //   } catch (e) {
//   //     emit(QuoteError("Failed to save quote: $e"));
//   //   }
//   // }
//   //
//   // Future<void> removeQuoteH(
//   //     QuoteModel quote, List<QuoteModel>? favoriteQuotes) async {
//   //   try {
//   //     var quoteBox = Hive.box<QuoteModel>("quote_box");
//   //     int index = quoteBox.values
//   //         .toList()
//   //         .indexWhere((element) => element.id == quote.id);
//   //     if (index != -1) {
//   //       Hive.box<QuoteModel>('quote_box').deleteAt(index);
//   //     }
//   //
//   //     favoriteQuotes!.clear;
//   //
//   //     emit(QuoteRemoved(favoriteQuotes));
//   //   } catch (e) {
//   //     emit(QuoteError("Failed to remove quote: $e"));
//   //   }
//   // }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/models/QuoteModel.dart';
import 'favourite_quotes_state.dart';

class FavoriteQuotesCubit extends Cubit<FavoriteQuotesState> {
  Box<QuoteModel>? quoteBox;

  FavoriteQuotesCubit() : super(FavouriteQuotesInitial()) {
    quoteBox = Hive.box<QuoteModel>("quote_box");
    initializeFavoriteQuotes();
  }

  void initializeFavoriteQuotes() {
    final favoriteQuotes = quoteBox!.values.toList();
    emit(FavoriteQuotesLoaded(favoriteQuotes));
  }

  removeQuote(List<QuoteModel>? favoriteQuotes, QuoteModel quoteModel) async {
    try {
      await quoteBox?.delete(quoteModel);
      print("Deleteddddd");
      favoriteQuotes!.remove(quoteModel);
      emit(SuccessfullyRemoved(favoriteQuotes));
    } catch (e) {
      print("Error removing quote from Hive: $e");
      emit(QuoteError("Failed to remove quote: $e"));
    }
  }

  addQuote(QuoteModel quote, List<QuoteModel>? favoriteQuotes) async {
    try {
      var key = await quoteBox!.add(quote);
      quote.setKey(key.toString());
      print("addeddddddd to boxxx");
      favoriteQuotes?.add(quote);
      emit(QuoteAdded(quote));
      print("addeddddddd");
    } catch (e) {
      print("Error adding quote to Hive: $e");
      emit(QuoteError("Failed to add quote: $e"));
    }
  }
}
