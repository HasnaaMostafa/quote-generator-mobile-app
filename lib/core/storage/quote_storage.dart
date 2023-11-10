// import 'package:hive/hive.dart';
//
// import '../models/QuoteModel.dart';
//
// class QuoteStorage {
//   static late Box<QuoteModel> _quoteBox;
//
//   static Future<void> initHive() async {
//     await Hive.openBox<QuoteModel>('quoteBox');
//     _quoteBox = Hive.box<QuoteModel>('quoteBox');
//   }
//
//   // Save a quote to favorites
//   static void saveQuote({required QuoteModel quoteModel}) {
//     _quoteBox.add(quoteModel);
//   }
//
//   // Remove a quote from favorites
//   // Remove a quote from favorites
//   static void removeQuote(QuoteModel quoteModel) {
//     int index = _quoteBox.values
//         .toList()
//         .indexWhere((element) => element.id == quoteModel.id);
//     if (index != -1) {
//       _quoteBox.deleteAt(index);
//     }
//   }
//
//   // Load favorite quotes
//   static List<QuoteModel> loadFavoriteQuotes() {
//     return _quoteBox.values.toList();
//   }
// }
