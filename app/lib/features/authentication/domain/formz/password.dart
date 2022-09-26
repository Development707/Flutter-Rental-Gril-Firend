import '../../../../shared/common/common.dart';

class Password extends FormzInput<String, bool> {
  const Password.inital([super.value = '']) : super.inital();
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  bool? validator(String? value) {
    if (StringUtils.isNullOrBlank(value) || (value!.length < 6)) {
      return false;
    }

    return null;
  }
}
