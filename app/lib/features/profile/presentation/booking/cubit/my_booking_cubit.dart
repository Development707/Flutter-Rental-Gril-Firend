import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_booking_state.dart';
part 'my_booking_cubit.freezed.dart';

class MyBookingCubit extends Cubit<MyBookingState> {
  MyBookingCubit() : super(const MyBookingState.initial());
}
