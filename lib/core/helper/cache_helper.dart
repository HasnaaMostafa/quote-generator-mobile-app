// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:task2/core/models/QuoteModel.dart';
//
// class CacheHelper {
//   static SharedPreferences? sharedPreferences;
//
//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   static Future saveData({required String value, required String key}) async {
//     return await sharedPreferences?.setString(key, value);
//   }
//
//   static Future removeData({required String key}) async {
//     return await sharedPreferences?.remove(key);
//   }
//
//   static void saveQuote({required String key, QuoteModel? quoteModel}) {
//     sharedPreferences?.setString(key, jsonEncode(quoteModel!.toJson));
//   }
//
//   static getData({required String key}) {
//     return sharedPreferences?.get(key);
//   }
// }
