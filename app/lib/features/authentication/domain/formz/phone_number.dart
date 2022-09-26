import '../../../../shared/common/common.dart';

class PhoneNumber extends FormzInput<String, bool> {
  const PhoneNumber.inital() : super.inital('');
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  @override
  bool? validator(String? value) {
    if (StringUtils.isNullOrBlank(value) ||
        !StringUtils.isPhoneNumber(value!)) {
      return false;
    }

    return null;
  }
}
