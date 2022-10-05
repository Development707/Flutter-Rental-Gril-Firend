import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_girl_state.dart';
part 'rental_girl_cubit.freezed.dart';

class RentalGirlCubit extends Cubit<RentalGirlState> {
  RentalGirlCubit() : super(const RentalGirlState.initial());
}
