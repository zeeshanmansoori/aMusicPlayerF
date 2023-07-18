import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class TextWithBlocWidget<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  const TextWithBlocWidget({
    super.key,
    this.buildWhen,
    this.style,
    required this.getText,
  });

  final BlocBuilderCondition<S>? buildWhen;
  final String Function(S state) getText;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: buildWhen,
      builder: (context, state) {
        return Text(
          getText.call(state),
          style: style,
        );
      },
    );
  }
}
