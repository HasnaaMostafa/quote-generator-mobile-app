import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/core/models/QuoteModel.dart';
import 'package:task2/features/favourite/views_models/cubit/favourite_quotes_cubit.dart';
import 'package:task2/features/favourite/views_models/cubit/favourite_quotes_state.dart';
import 'package:task2/features/home/views_models/cubit/quote_cubit.dart';

class CustomFavouriteButton extends StatefulWidget {
  const CustomFavouriteButton({
    super.key,
    required this.quote,
    required this.favoriteQuotes,
  });

  final QuoteModel quote;
  final List<QuoteModel> favoriteQuotes;

  @override
  State<CustomFavouriteButton> createState() => _CustomFavouriteButtonState();
}

class _CustomFavouriteButtonState extends State<CustomFavouriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<QuoteCubit>(context).fetchRandomQuotes();
              // CacheHelper.saveData(value: widget.quote.id!, key: "id");
            },
            child: Container(
              height: 48,
              width: 203,
              decoration: const BoxDecoration(
                  color: Color(0xff8249B5),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(6))),
              child: const Center(
                child: Text(
                  "Generate Another Quote",
                  style: TextStyle(
                      color: Color(0xffFBFBFB),
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
              height: 48,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xffFBFBFB),
                border: Border.all(
                  color: const Color(0xff8249B5),
                ),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(6)),
              ),
              child: Center(
                  child: IconButton(
                onPressed: () {
                  // try {
                  //   QuoteStorage.saveQuote(
                  //     quoteModel: QuoteModel(
                  //       id: widget.quote.id,
                  //       content: widget.quote.content,
                  //       author: widget.quote.author,
                  //     ),
                  //   );
                  // } catch (error) {
                  //   print("Error saving quote: $error");
                  // }
                  isFavorite = !isFavorite;

                  if (isFavorite) {
                    BlocProvider.of<FavoriteQuotesCubit>(context)
                        .addQuote(widget.quote, widget.favoriteQuotes);
                  } else {
                    BlocProvider.of<FavoriteQuotesCubit>(context)
                        .removeQuote(widget.favoriteQuotes, widget.quote);
                    widget.quote.delete();
                  }

                  // CacheHelper.saveQuote(
                  //   quoteModel: QuoteModel(
                  //     content: widget.quote.content,
                  //     author: widget.quote.author,
                  //     id: widget.quote.id,
                  //   ),
                  //   key: "favoriteQuotes",
                  // );
                },
                icon: BlocBuilder<FavoriteQuotesCubit, FavoriteQuotesState>(
                  builder: (context, state) {
                    return Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? const Color(0xff8249B5) : null,
                    );
                  },
                ),
              ))),
        ],
      ),
    );
  }
}
