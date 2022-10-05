import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_girl_detail_state.dart';
part 'rental_girl_detail_cubit.freezed.dart';

class RentalGirlDetailCubit extends Cubit<RentalGirlDetailState> {
  RentalGirlDetailCubit() : super(const RentalGirlDetailState.initial());
}
