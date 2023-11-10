import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task2/core/models/QuoteModel.dart';
import 'package:task2/core/utils/api_service.dart';
import 'package:task2/features/home/data/repo/home_repo_impl.dart';
import 'package:task2/features/home/views_models/cubit/quote_cubit.dart';

import 'features/favourite/views_models/cubit/favourite_quotes_cubit.dart';
import 'features/home/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuoteModelAdapter());
  await Hive.openBox<QuoteModel>("quote_box");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                QuoteCubit(HomeRepoImpl(ApiService(dio: Dio())))
                  ..fetchRandomQuotes()),
        BlocProvider(
          create: (context) => FavoriteQuotesCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const HomeView(),
      ),
    );
  }
}
