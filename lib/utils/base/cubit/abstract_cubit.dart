import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_repo/models/api_result.dart';

part 'abstract_state.dart';

abstract class AbstractCubit<S extends AbstractState> extends Cubit<S>{
  AbstractCubit(super.initialState);
}
