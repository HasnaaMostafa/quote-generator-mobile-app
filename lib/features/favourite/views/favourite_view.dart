import 'package:flutter/material.dart';
import 'package:task2/features/favourite/views/widgets/favourite_view_body.dart';

import '../../../core/models/QuoteModel.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key, required this.savedQuotes});

  final List<QuoteModel> savedQuotes;

  @override
  Widget build(BuildContext context) {
    return FavouriteViewBody(savedQuotes: savedQuotes);
  }
}
