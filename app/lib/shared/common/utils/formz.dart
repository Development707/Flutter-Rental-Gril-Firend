library formz;

import 'package:flutter/foundation.dart';

/// Enum representing the status of a form at any given point in time.
enum FormzStatus {
  /// The form has not been touched.
  inital,

  /// The form has been completely validated.
  valid,

  /// The form contains one or more invalid inputs.
  invalid,
}

/// Useful extensions on [FormzStatus]
extension FormzStatusX on FormzStatus {
  /// Indicates whether the form is untouched.
  bool get isInital => this == FormzStatus.inital;

  /// Indicates whether the form is completely validated.
  bool get isValid => this == FormzStatus.valid;

  /// Indicates whether the form contains one or more invalid inputs.
  bool get isInvalid => this == FormzStatus.invalid;
}

/// Enum representing the status of a form input at any given point in time.
enum FormzInputStatus {
  /// The form input has not been touched.
  inital,

  /// The form input is valid.
  valid,

  /// The form input is not valid.
  invalid,
}

/// {@template form_input}
/// A [FormzInput] represents the value of a single form input field.
/// It contains information about the [FormzInputStatus], [value], as well
/// as validation status.
///
/// [FormzInput] should be extended to define custom [FormzInput] instances.
///
/// ```dart
/// enum FirstNameError { empty }
/// class FirstName extends FormzInput<String, FirstNameError> {
///   const FirstName.inital({String value = ''}) : super.inital(value);
///   const FirstName.dirty({String value = ''}) : super.dirty(value);
///
///   @override
///   FirstNameError? validator(String value) {
///     return value.isEmpty ? FirstNameError.empty : null;
///   }
/// }
/// ```
/// {@endtemplate}
@immutable
abstract class FormzInput<T, E> {
  const FormzInput._(this.value, [this.inital = true]);

  /// Constructor which create a `inital` [FormzInput] with a given value.
  const FormzInput.inital(T value) : this._(value);

  /// Constructor which create a `dirty` [FormzInput] with a given value.
  const FormzInput.dirty(T value) : this._(value, false);

  /// The value of the given [FormzInput].
  /// For example, if you have a `FormzInput` for `FirstName`,
  /// the value could be 'Joe'.
  final T value;

  /// If the [FormzInput] is inital (has been touched/modified).
  /// Typically when the `FormzInput` is initially created,
  /// it is created using the `FormzInput.inital` constructor to
  /// signify that the user has not modified it.
  ///
  /// For subsequent changes (in response to user input), the
  /// `FormzInput.dirty` constructor should be used to signify that
  /// the `FormzInput` has been manipulated.
  final bool inital;

  /// The [FormzInputStatus] which can be one of the following:
  /// * [FormzInputStatus.inital]
  ///   - if the input has not been modified.
  /// * [FormzInputStatus.invalid]
  ///   - if the input has been modified and validation failed.
  /// * [FormzInputStatus.valid]
  ///   - if the input has been modified and validation succeeded.
  FormzInputStatus get status => inital
      ? FormzInputStatus.inital
      : valid
          ? FormzInputStatus.valid
          : FormzInputStatus.invalid;

  /// Returns a validation error if the [FormzInput] is invalid.
  /// Returns `null` if the [FormzInput] is valid.
  E? get error => validator(value);

  /// Whether the [FormzInput] value is valid according to the
  /// overridden `validator`.
  ///
  /// Returns `true` if `validator` returns `null` for the
  /// current [FormzInput] value and `false` otherwise.
  bool get valid => validator(value) == null;

  /// Whether the [FormzInput] value is not valid.
  /// A value is invalid when the overridden `validator`
  /// returns an error (non-null value).
  bool get invalid => status == FormzInputStatus.invalid;

  /// A function that must return a validation error if the provided
  /// [value] is invalid and `null` otherwise.
  E? validator(T value);

  @override
  int get hashCode => value.hashCode ^ inital.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is FormzInput<T, E> &&
        other.value == value &&
        other.inital == inital;
  }

  @override
  String toString() => '$runtimeType($value, $inital)';
}

/// Class which contains methods that help manipulate and manage
/// [FormzStatus] and [FormzInputStatus] instances.
class Formz {
  const Formz._();

  /// Returns a [FormzStatus] given a list of [FormzInput].
  static FormzStatus validate<T, E>(List<FormzInput<T, E>> inputs) {
    return inputs.every((FormzInput<T, E> element) => element.inital)
        ? FormzStatus.inital
        : inputs.any((FormzInput<T, E> input) => input.valid == false)
            ? FormzStatus.invalid
            : FormzStatus.valid;
  }
}

/// Mixin that automatically handles validation of all [FormzInput]s present in
/// the [inputs].
///
/// When mixing this in, you are required to override the [inputs] getter and
/// provide all [FormzInput]s you want to automatically validate.
///
/// ```dart
/// class LoginFormState with FormzMixin {
///  LoginFormState({
///    this.username = const Username.inital(),
///    this.password = const Password.inital(),
///  });
///
///  final Username username;
///  final Password password;
///
///  @override
///  List<FormzInput> get inputs => [username, password];
/// }
/// ```
mixin FormzMixin<T, E> {
  /// [FormzStatus] getter which computes the status based on the
  /// validity of the [inputs].
  FormzStatus get status => Formz.validate(inputs);

  /// Returns all [FormzInput] instances.
  ///
  /// Override this and give it all [FormzInput]s in your class that should be
  /// validated automatically.
  List<FormzInput<T, E>> get inputs;
}
