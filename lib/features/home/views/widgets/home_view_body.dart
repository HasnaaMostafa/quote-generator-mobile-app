import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task2/core/models/QuoteModel.dart';
import 'package:task2/features/home/views_models/cubit/quote_cubit.dart';

import '../../../favourite/views/favourite_view.dart';
import 'custom_card.dart';
import 'custom_favourite_button.dart';
import 'custom_small_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<QuoteModel> savedQuotes =
      Hive.box<QuoteModel>("quote_box").values.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff5D13E7),
          Color(0xff8249B5),
        ])),
        child: BlocConsumer<QuoteCubit, QuoteState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is QuoteSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FavouriteView(savedQuotes: savedQuotes)));
                    },
                    child: CustomSmallCard(
                      widget: const Text(
                        "Click Here To View Favorite Quotes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      color: const Color(0xffFBFBFB).withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomCard(
                      note: "“${state.quotes.content}”",
                      author: "${state.quotes.author}",
                      height: 225,
                      widget: CustomFavouriteButton(
                        favoriteQuotes: savedQuotes,
                        quote: state.quotes,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is QuoteLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else if (state is QuoteError) {
              return Text(state.failure.toString());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FavouriteView(savedQuotes: savedQuotes)));
                    },
                    child: CustomSmallCard(
                      widget: const Text(
                        "Click Here To View Favorite Quotes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      color: const Color(0xffFBFBFB).withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomCard(
                      note: "“”",
                      author: "",
                      height: 225,
                      widget: CustomFavouriteButton(
                        favoriteQuotes: savedQuotes,
                        quote: savedQuotes[0],
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
