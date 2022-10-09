import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_friend_state.dart';
part 'invite_friend_cubit.freezed.dart';

class InviteFriendCubit extends Cubit<InviteFriendState> {
  InviteFriendCubit() : super(const InviteFriendState.initial());
}
