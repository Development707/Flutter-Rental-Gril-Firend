import '../../../../shared/common/common.dart';

class Username extends FormzInput<String, bool> {
  const Username.inital([super.value = '']) : super.inital();
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  bool? validator(String? value) {
    if (!StringUtils.isPhoneNumber(value ?? '') &&
        !StringUtils.isEmail(value ?? '')) {
      return false;
    }

    return null;
  }
}
