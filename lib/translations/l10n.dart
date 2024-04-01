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

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Hello,\n{name}!`
  String helloUser(Object name) {
    return Intl.message(
      'Hello,\n$name!',
      name: 'helloUser',
      desc: '',
      args: [name],
    );
  }

  /// `Find the company you are interested in`
  String get findCompanyYouAreInterested {
    return Intl.message(
      'Find the company you are interested in',
      name: 'findCompanyYouAreInterested',
      desc: '',
      args: [],
    );
  }

  /// `Type name or symbol of the company you are looking for`
  String get typeHint {
    return Intl.message(
      'Type name or symbol of the company you are looking for',
      name: 'typeHint',
      desc: '',
      args: [],
    );
  }

  /// `Nothing found`
  String get nothingFound {
    return Intl.message(
      'Nothing found',
      name: 'nothingFound',
      desc: '',
      args: [],
    );
  }

  /// `Try something else`
  String get trySomethingElse {
    return Intl.message(
      'Try something else',
      name: 'trySomethingElse',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Tap on search icon to find companies you are interested in`
  String get tapOnSearchHint {
    return Intl.message(
      'Tap on search icon to find companies you are interested in',
      name: 'tapOnSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Tap on bookmark icon to check your saved companies`
  String get tapOnBookmarkHint {
    return Intl.message(
      'Tap on bookmark icon to check your saved companies',
      name: 'tapOnBookmarkHint',
      desc: '',
      args: [],
    );
  }

  /// `Tap on this icon to save/remove company to/from favorites, you can find your favourites companies taping at purple button located in previous screen`
  String get tapOnSaveHint {
    return Intl.message(
      'Tap on this icon to save/remove company to/from favorites, you can find your favourites companies taping at purple button located in previous screen',
      name: 'tapOnSaveHint',
      desc: '',
      args: [],
    );
  }

  /// `Mega-Cap`
  String get megaCap {
    return Intl.message(
      'Mega-Cap',
      name: 'megaCap',
      desc: '',
      args: [],
    );
  }

  /// `Market value of $200 billion or more`
  String get megaCapExplanation {
    return Intl.message(
      'Market value of \$200 billion or more',
      name: 'megaCapExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Large-Cap`
  String get largeCap {
    return Intl.message(
      'Large-Cap',
      name: 'largeCap',
      desc: '',
      args: [],
    );
  }

  /// `Market value between $10 billion and $200 billion`
  String get largeCapExplanation {
    return Intl.message(
      'Market value between \$10 billion and \$200 billion',
      name: 'largeCapExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Mid-Cap`
  String get midCap {
    return Intl.message(
      'Mid-Cap',
      name: 'midCap',
      desc: '',
      args: [],
    );
  }

  /// `Market value between $2 billion and $10 billion`
  String get midCapExplanation {
    return Intl.message(
      'Market value between \$2 billion and \$10 billion',
      name: 'midCapExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Small-Cap`
  String get smallCap {
    return Intl.message(
      'Small-Cap',
      name: 'smallCap',
      desc: '',
      args: [],
    );
  }

  /// `Market value between $250 million and $2 billion`
  String get smallCapExplanation {
    return Intl.message(
      'Market value between \$250 million and \$2 billion',
      name: 'smallCapExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Micro-Cap`
  String get microCap {
    return Intl.message(
      'Micro-Cap',
      name: 'microCap',
      desc: '',
      args: [],
    );
  }

  /// `Market value of less than $250 million`
  String get microCapExplanation {
    return Intl.message(
      'Market value of less than \$250 million',
      name: 'microCapExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Cap categories`
  String get capCategories {
    return Intl.message(
      'Cap categories',
      name: 'capCategories',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get health {
    return Intl.message(
      'Health',
      name: 'health',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Saved to Favorites`
  String get savedToFavorites {
    return Intl.message(
      'Saved to Favorites',
      name: 'savedToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Removed from Favorites`
  String get removeFromFavorites {
    return Intl.message(
      'Removed from Favorites',
      name: 'removeFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Net Income Margin`
  String get netIncomeMargin {
    return Intl.message(
      'Net Income Margin',
      name: 'netIncomeMargin',
      desc: '',
      args: [],
    );
  }

  /// `Formula`
  String get formula {
    return Intl.message(
      'Formula',
      name: 'formula',
      desc: '',
      args: [],
    );
  }

  /// `A positive value indicates profitability and a negative indicates a loss.`
  String get netIncomeHint {
    return Intl.message(
      'A positive value indicates profitability and a negative indicates a loss.',
      name: 'netIncomeHint',
      desc: '',
      args: [],
    );
  }

  /// `Net_Income_Margin = Net_Income - Revenue`
  String get netIncomeFormula {
    return Intl.message(
      'Net_Income_Margin = Net_Income - Revenue',
      name: 'netIncomeFormula',
      desc: '',
      args: [],
    );
  }

  /// `Current Ratio`
  String get currentRatio {
    return Intl.message(
      'Current Ratio',
      name: 'currentRatio',
      desc: '',
      args: [],
    );
  }

  /// `A ratio above 1 suggest that the company has more assets than liabilities`
  String get currentRatioHint {
    return Intl.message(
      'A ratio above 1 suggest that the company has more assets than liabilities',
      name: 'currentRatioHint',
      desc: '',
      args: [],
    );
  }

  /// `Current_Ratio = Total_Current_Assets / Total_Current_Liabilities`
  String get currentRatioFormula {
    return Intl.message(
      'Current_Ratio = Total_Current_Assets / Total_Current_Liabilities',
      name: 'currentRatioFormula',
      desc: '',
      args: [],
    );
  }

  /// `Debt to Equity Ratio`
  String get debtToEquityRatio {
    return Intl.message(
      'Debt to Equity Ratio',
      name: 'debtToEquityRatio',
      desc: '',
      args: [],
    );
  }

  /// `A lower ratio means the company is less dependent on borrowed money`
  String get debtToEquityRatioHint {
    return Intl.message(
      'A lower ratio means the company is less dependent on borrowed money',
      name: 'debtToEquityRatioHint',
      desc: '',
      args: [],
    );
  }

  /// `Debt_to_Equity_Ratio = Total_Current_Liabilities / Total_Stockholders_Equity`
  String get debtToEquityRatioFormula {
    return Intl.message(
      'Debt_to_Equity_Ratio = Total_Current_Liabilities / Total_Stockholders_Equity',
      name: 'debtToEquityRatioFormula',
      desc: '',
      args: [],
    );
  }

  /// `CEO`
  String get ceo {
    return Intl.message(
      'CEO',
      name: 'ceo',
      desc: '',
      args: [],
    );
  }

  /// `Industry`
  String get industry {
    return Intl.message(
      'Industry',
      name: 'industry',
      desc: '',
      args: [],
    );
  }

  /// `Exchange`
  String get exchange {
    return Intl.message(
      'Exchange',
      name: 'exchange',
      desc: '',
      args: [],
    );
  }

  /// `CUSIP`
  String get cusip {
    return Intl.message(
      'CUSIP',
      name: 'cusip',
      desc: '',
      args: [],
    );
  }

  /// `Market Capitalization`
  String get marketCapitalization {
    return Intl.message(
      'Market Capitalization',
      name: 'marketCapitalization',
      desc: '',
      args: [],
    );
  }

  /// `Market size indicator`
  String get marketSizeIndicator {
    return Intl.message(
      'Market size indicator',
      name: 'marketSizeIndicator',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Try again in a few moments`
  String get tryAgain {
    return Intl.message(
      'Try again in a few moments',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Your list is empty`
  String get yourListIsEmpty {
    return Intl.message(
      'Your list is empty',
      name: 'yourListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `You can find and add companies to your list in home screen using search`
  String get youCanFindCompaniesInHomeScreen {
    return Intl.message(
      'You can find and add companies to your list in home screen using search',
      name: 'youCanFindCompaniesInHomeScreen',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get notAvailable {
    return Intl.message(
      'N/A',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `There`
  String get there {
    return Intl.message(
      'There',
      name: 'there',
      desc: '',
      args: [],
    );
  }

  /// `First time in the app?`
  String get firstTimeInTheApp {
    return Intl.message(
      'First time in the app?',
      name: 'firstTimeInTheApp',
      desc: '',
      args: [],
    );
  }

  /// `This application`
  String get theApp {
    return Intl.message(
      'This application',
      name: 'theApp',
      desc: '',
      args: [],
    );
  }

  /// `is designed to help you find information about companies you are interested in.`
  String get designedToHelp {
    return Intl.message(
      'is designed to help you find information about companies you are interested in.',
      name: 'designedToHelp',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to find out how?`
  String get wouldYouLikeToFindOutHow {
    return Intl.message(
      'Would you like to find out how?',
      name: 'wouldYouLikeToFindOutHow',
      desc: '',
      args: [],
    );
  }

  /// `Let me show you a short tutorial that appears on various screens`
  String get letMeIntroduceForYouBriefPrompts {
    return Intl.message(
      'Let me show you a short tutorial that appears on various screens',
      name: 'letMeIntroduceForYouBriefPrompts',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Start Tutorial`
  String get startTutorial {
    return Intl.message(
      'Start Tutorial',
      name: 'startTutorial',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
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
