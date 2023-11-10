import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/features/home/views_models/cubit/quote_cubit.dart';
import '../../../home/views/widgets/custom_small_card.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    this.enabled,
  });
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomSmallCard(
          widget: Center(
            child: TextField(
              enabled: enabled ?? true,
              onSubmitted: (String value) {
                BlocProvider.of<QuoteCubit>(context).searchQuote(search: value);
              },
              decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 18),
                  hintText: "Type Something Here To Search..",
                  border: InputBorder.none),
            ),
          ),
          color: const Color(0xffFBFBFB),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
    );
  }
}
