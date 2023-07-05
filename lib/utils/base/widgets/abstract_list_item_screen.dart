import 'package:a_music_player_flutter/utils/base/cubit/abstract_cubit.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractListItemScreen<T, C extends AbstractCubit<S>,
    S extends AbstractState<RT>, RT> extends StatelessWidget {
  const AbstractListItemScreen({super.key});

  C getCubit(BuildContext context);

  Widget getListWidget(C cubit,BuildContext context, T item);

  List<T> getItems(RT body);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getCubit(context),
      child: Scaffold(
        body: BlocBuilder<C, S>(
          builder: (context, state) {
            if (state.apiResult.isLoading) {
              return const CircularProgressIndicator().wrapCenter();
            }
            var data = state.apiResult.body;
            if (data == null) {
              return Text(state.apiResult.msg).wrapCenter();
            }
            var items = getItems(data);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) =>
                  getListWidget(getCubit(context),context, items[index]),
              itemCount: items.length,
            );
          },
        ),
      ),
    );
  }
}
