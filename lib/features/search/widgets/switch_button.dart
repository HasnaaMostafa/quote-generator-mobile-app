import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task2/features/favourite/views_models/cubit/favourite_quotes_state.dart';

import '../../../core/models/QuoteModel.dart';
import '../../favourite/views_models/cubit/favourite_quotes_cubit.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton(
      {super.key, required this.quoteModel, required this.favouriteQuotes});

  final QuoteModel quoteModel;
  final List<QuoteModel> favouriteQuotes;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isFavorite = false;
  List<QuoteModel> savedQuotes =
      Hive.box<QuoteModel>("quote_box").values.toList();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        isFavorite = !isFavorite;

        if (isFavorite) {
          BlocProvider.of<FavoriteQuotesCubit>(context)
              .addQuote(widget.quoteModel, widget.favouriteQuotes);
          savedQuotes.add(widget.quoteModel);
        } else {
          BlocProvider.of<FavoriteQuotesCubit>(context)
              .removeQuote(widget.favouriteQuotes, widget.quoteModel);
          widget.quoteModel.delete();
        }
      },
      child: BlocBuilder<FavoriteQuotesCubit, FavoriteQuotesState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? const Color(0xff8249B5) : null,
              ),
              isFavorite
                  ? Text(
                      "Remove to Favourite ",
                      style: TextStyle(
                          color: Color(0xff8249B5),
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    )
                  : Text(
                      "Add to Favourite ",
                      style: TextStyle(
                          color: Color(0xff8249B5),
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
            ],
          );
        },
      ),
    );
  }
}
