// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `oncopower`
  String get appName {
    return Intl.message(
      'oncopower',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get genericError {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'genericError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your confirm password`
  String get enterConfirmPassword {
    return Intl.message(
      'Please enter your confirm password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email can't be empty`
  String get emptyEmailMessage {
    return Intl.message(
      'Email can\'t be empty',
      name: 'emptyEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get enterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `SUCCESS`
  String get success {
    return Intl.message(
      'SUCCESS',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `404 Forbidden`
  String get forbidden {
    return Intl.message(
      '404 Forbidden',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `500 Server Broken`
  String get serverBroken {
    return Intl.message(
      '500 Server Broken',
      name: 'serverBroken',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `405 Method Not Allowed`
  String get methodNotAllowed {
    return Intl.message(
      '405 Method Not Allowed',
      name: 'methodNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get checkYourInternetConnection {
    return Intl.message(
      'Please check your internet connection',
      name: 'checkYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `invalid Credentials`
  String get unauthenticated {
    return Intl.message(
      'invalid Credentials',
      name: 'unauthenticated',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `oncopower`
  String get oncopower {
    return Intl.message(
      'oncopower',
      name: 'oncopower',
      desc: '',
      args: [],
    );
  }

  /// `Enter email ID`
  String get hintEmailId {
    return Intl.message(
      'Enter email ID',
      name: 'hintEmailId',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get hintPassword {
    return Intl.message(
      'Enter Password',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email ID`
  String get lableEmailId {
    return Intl.message(
      'Email ID',
      name: 'lableEmailId',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get lablePassword {
    return Intl.message(
      'Password',
      name: 'lablePassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get haveNotAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'haveNotAccount',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signUpText {
    return Intl.message(
      'Signup',
      name: 'signUpText',
      desc: '',
      args: [],
    );
  }

  /// `Email Address *`
  String get emailAddresslabelText {
    return Intl.message(
      'Email Address *',
      name: 'emailAddresslabelText',
      desc: '',
      args: [],
    );
  }

  /// `Password *`
  String get passwordLabelText {
    return Intl.message(
      'Password *',
      name: 'passwordLabelText',
      desc: '',
      args: [],
    );
  }

  /// `First Name *`
  String get firstNameText {
    return Intl.message(
      'First Name *',
      name: 'firstNameText',
      desc: '',
      args: [],
    );
  }

  /// `Last Name *`
  String get lastNameText {
    return Intl.message(
      'Last Name *',
      name: 'lastNameText',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get emailAddresshintText {
    return Intl.message(
      'Enter email address',
      name: 'emailAddresshintText',
      desc: '',
      args: [],
    );
  }

  /// `Create password`
  String get passwordhintText {
    return Intl.message(
      'Create password',
      name: 'passwordhintText',
      desc: '',
      args: [],
    );
  }

  /// `Accept Terms and conditions`
  String get AcceptTermsAndCondition {
    return Intl.message(
      'Accept Terms and conditions',
      name: 'AcceptTermsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccText {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccText',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get searchText {
    return Intl.message(
      'Search...',
      name: 'searchText',
      desc: '',
      args: [],
    );
  }

  /// `Shares`
  String get sharesText {
    return Intl.message(
      'Shares',
      name: 'sharesText',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get likeText {
    return Intl.message(
      'Like',
      name: 'likeText',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get commentText {
    return Intl.message(
      'Comment',
      name: 'commentText',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get commentsText {
    return Intl.message(
      'Comments',
      name: 'commentsText',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get shareText {
    return Intl.message(
      'Share',
      name: 'shareText',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMoreText {
    return Intl.message(
      'See More',
      name: 'seeMoreText',
      desc: '',
      args: [],
    );
  }

  /// `See Less`
  String get seeLessText {
    return Intl.message(
      'See Less',
      name: 'seeLessText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
