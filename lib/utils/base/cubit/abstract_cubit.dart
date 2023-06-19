import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'abstract_state.dart';

abstract class AbstractCubit<State> extends Cubit<State>{
  AbstractCubit(super.initialState);
}
