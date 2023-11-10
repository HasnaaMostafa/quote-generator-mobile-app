import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/features/home/views_models/cubit/quote_cubit.dart';
import 'package:task2/features/search/widgets/switch_button.dart';

import '../../../core/models/QuoteModel.dart';
import '../../favourite/views/widgets/custom_search.dart';
import '../../home/views/widgets/custom_card.dart';
import '../../home/views/widgets/custom_small_card.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key, required this.favoriteQuotes});

  final List<QuoteModel> favoriteQuotes;

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
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
                    BlocProvider.of<QuoteCubit>(context).fetchRandomQuotes();
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
                              "Back To Favourite Screen",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        color: const Color(0xffFBFBFB).withOpacity(0.7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                  ),
                ),
                const CustomSearch(),
                Expanded(
                  child: BlocBuilder<QuoteCubit, QuoteState>(
                    builder: (context, state) {
                      if (state is SearchQuoteSuccess) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final quotes = state
                                .quotes; // Access the quotes from the state
                            final quote = quotes[index];
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
                                      child: SwitchButton(
                                        quoteModel: quote,
                                        favouriteQuotes: widget.favoriteQuotes,
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
                          itemCount: state.quotes.length,
                        );
                      } else if (state is SearchQuoteLoading) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        ));
                      } else {
                        return Container();
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
