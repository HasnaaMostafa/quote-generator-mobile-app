import 'package:flutter/material.dart';
import 'package:task2/features/search/widgets/search_view_body.dart';

import '../../core/models/QuoteModel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.favoriteQuotes});

  final List<QuoteModel> favoriteQuotes;
  @override
  Widget build(BuildContext context) {
    return SearchViewBody(
      favoriteQuotes: favoriteQuotes,
    );
  }
}
