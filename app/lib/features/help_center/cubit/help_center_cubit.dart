import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_center_state.dart';
part 'help_center_cubit.freezed.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit() : super(const HelpCenterState.initial());
}
