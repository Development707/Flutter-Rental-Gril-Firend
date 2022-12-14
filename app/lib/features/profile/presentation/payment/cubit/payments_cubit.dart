import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payments_state.dart';
part 'payments_cubit.freezed.dart';

class PaymentsCubit extends Cubit<PaymentsState> {
  PaymentsCubit() : super(const PaymentsState.initial());
}
