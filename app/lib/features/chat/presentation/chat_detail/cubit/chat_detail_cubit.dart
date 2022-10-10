import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_state.dart';
part 'chat_detail_cubit.freezed.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit() : super(const ChatDetailState.initial());
}
