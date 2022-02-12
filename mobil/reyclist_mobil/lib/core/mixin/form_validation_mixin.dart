import 'package:reyclist_mobil/core/constants/regex_constants.dart';

mixin FormValidationMixin {
  String? checkPassword(String? value) {
    if (value?.isEmpty ?? false) return null;
    if (value!.length < 8) {
      return 'Şifreniz en az 8 karakter olmalıdır';
    }
    return null;
  }

  String? checkEmail(String? value) {
    if (RegexConstants.instance.emailValidatorRegExp.hasMatch(value ?? '')) {
      return null;
    } else {
      return 'E-postanız yada doğru doldurulmalıdır.';
    }
  }
}
