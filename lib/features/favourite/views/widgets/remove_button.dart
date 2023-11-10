import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/QuoteModel.dart';
import '../../views_models/cubit/favourite_quotes_cubit.dart';

class RemoveButton extends StatefulWidget {
  const RemoveButton({
    Key? key,
    required this.quoteModel,
    required this.favouriteQuotes,
  }) : super(key: key);

  final QuoteModel quoteModel;
  final List<QuoteModel> favouriteQuotes;

  @override
  State<RemoveButton> createState() => _RemoveButtonState();
}

class _RemoveButtonState extends State<RemoveButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        BlocProvider.of<FavoriteQuotesCubit>(context)
            .removeQuote(widget.favouriteQuotes, widget.quoteModel);
        widget.quoteModel.delete();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Color(0xff8249B5),
            ),
          ),
          const Text(
            "Remove From Favorite",
            style: TextStyle(
                color: Color(0xff8249B5),
                fontWeight: FontWeight.w400,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
