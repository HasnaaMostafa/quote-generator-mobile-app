import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/features/favourite/views/widgets/remove_button.dart';
import 'package:task2/features/favourite/views_models/cubit/favourite_quotes_cubit.dart';
import 'package:task2/features/favourite/views_models/cubit/favourite_quotes_state.dart';
import 'package:task2/features/search/search_view.dart';

import '../../../../core/models/QuoteModel.dart';
import '../../../home/views/widgets/custom_card.dart';
import '../../../home/views/widgets/custom_small_card.dart';
import 'custom_search.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key, required this.savedQuotes});

  final List<QuoteModel> savedQuotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff5D13E7),
              Color(0xff8249B5),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35, bottom: 10),
                    child: CustomSmallCard(
                        widget: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Back To Home Screen",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        color: const Color(0xffFBFBFB).withOpacity(0.7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SearchView(favoriteQuotes: savedQuotes)));
                    },
                    child: const CustomSearch(
                      enabled: false,
                    )),
                Expanded(
                  child: BlocConsumer<FavoriteQuotesCubit, FavoriteQuotesState>(
                    listener: (context, state) {
                      if (state is SuccessfullyRemoved) {}
                    },
                    builder: (context, state) {
                      if (state is SuccessfullyRemoved) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var quote = savedQuotes[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: CustomCard(
                                note: "“${quote.content}”",
                                author: "${quote.author}",
                                height: 225,
                                widget: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Container(
                                    height: 48,
                                    width: 313,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFBFBFB),
                                        border: Border.all(
                                          color: const Color(0xff8249B5),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(6),
                                            bottomRight: Radius.circular(6))),
                                    child: Center(
                                      child: RemoveButton(
                                        quoteModel: quote,
                                        favouriteQuotes: savedQuotes,
                                      ),
                                    ),
                                  ),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                            );
                          },
                          itemCount: savedQuotes.length,
                        );
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final quote = savedQuotes[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: CustomCard(
                                note: "“${quote.content}”",
                                author: "${quote.author}",
                                height: 225,
                                widget: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Container(
                                    height: 48,
                                    width: 313,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFBFBFB),
                                        border: Border.all(
                                          color: const Color(0xff8249B5),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(6),
                                            bottomRight: Radius.circular(6))),
                                    child: Center(
                                      child: RemoveButton(
                                        quoteModel: quote,
                                        favouriteQuotes: savedQuotes,
                                      ),
                                    ),
                                  ),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                            );
                          },
                          itemCount: savedQuotes.length,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
