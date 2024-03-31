// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Hello,\n${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "capCategories": MessageLookupByLibrary.simpleMessage("Cap categories"),
        "ceo": MessageLookupByLibrary.simpleMessage("CEO"),
        "currentRatio": MessageLookupByLibrary.simpleMessage("Current Ratio"),
        "currentRatioFormula": MessageLookupByLibrary.simpleMessage(
            "Current_Ratio = Total_Current_Assets / Total_Current_Liabilities"),
        "currentRatioHint": MessageLookupByLibrary.simpleMessage(
            "A ratio above 1 suggest that the company has more assets than liabilities"),
        "cusip": MessageLookupByLibrary.simpleMessage("CUSIP"),
        "debtToEquityRatio":
            MessageLookupByLibrary.simpleMessage("Debt to Equity Ratio"),
        "debtToEquityRatioFormula": MessageLookupByLibrary.simpleMessage(
            "Debt_to_Equity_Ratio = Total_Current_Liabilities / Total_Stockholders_Equity"),
        "debtToEquityRatioHint": MessageLookupByLibrary.simpleMessage(
            "A lower ratio means the company is less dependent on borrowed money"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "exchange": MessageLookupByLibrary.simpleMessage("Exchange"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "financialHealth":
            MessageLookupByLibrary.simpleMessage("Financial Health"),
        "findCompanyYouAreInterested": MessageLookupByLibrary.simpleMessage(
            "Find the company you are interested in"),
        "formula": MessageLookupByLibrary.simpleMessage("Formula"),
        "helloUser": m0,
        "industry": MessageLookupByLibrary.simpleMessage("Industry"),
        "largeCap": MessageLookupByLibrary.simpleMessage("Large-Cap"),
        "largeCapExplanation": MessageLookupByLibrary.simpleMessage(
            "Market value between \$10 billion and \$200 billion"),
        "marketCapitalization":
            MessageLookupByLibrary.simpleMessage("Market Capitalization"),
        "marketSizeIndicator":
            MessageLookupByLibrary.simpleMessage("Market size indicator"),
        "megaCap": MessageLookupByLibrary.simpleMessage("Mega-Cap"),
        "megaCapExplanation": MessageLookupByLibrary.simpleMessage(
            "Market value of \$200 billion or more"),
        "microCap": MessageLookupByLibrary.simpleMessage("Micro-Cap"),
        "microCapExplanation": MessageLookupByLibrary.simpleMessage(
            "Market value of less than \$250 million"),
        "midCap": MessageLookupByLibrary.simpleMessage("Mid-Cap"),
        "midCapExplanation": MessageLookupByLibrary.simpleMessage(
            "Market value between \$2 billion and \$10 billion"),
        "netIncomeFormula": MessageLookupByLibrary.simpleMessage(
            "Net_Income_Margin = Net_Income - Revenue"),
        "netIncomeHint": MessageLookupByLibrary.simpleMessage(
            "A positive value indicates profitability and a negative indicates a loss."),
        "netIncomeMargin":
            MessageLookupByLibrary.simpleMessage("Net Income Margin"),
        "nothingFound": MessageLookupByLibrary.simpleMessage("Nothing found"),
        "removeFromFavorites":
            MessageLookupByLibrary.simpleMessage("Removed from Favorites"),
        "savedToFavorites":
            MessageLookupByLibrary.simpleMessage("Saved to Favorites"),
        "smallCap": MessageLookupByLibrary.simpleMessage("Small-Cap"),
        "smallCapExplanation": MessageLookupByLibrary.simpleMessage(
            "Market value between \$250 million and \$2 billion"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "tapOnBookmarkHint": MessageLookupByLibrary.simpleMessage(
            "Tap on bookmark icon to check your saved companies"),
        "tapOnSaveHint": MessageLookupByLibrary.simpleMessage(
            "Tap on this icon to save company to favorites"),
        "tapOnSearchHint": MessageLookupByLibrary.simpleMessage(
            "Tap on search icon to find companies you are interested in"),
        "tryAgain":
            MessageLookupByLibrary.simpleMessage("Try again in a few moments"),
        "trySomethingElse":
            MessageLookupByLibrary.simpleMessage("Try something else"),
        "typeHint": MessageLookupByLibrary.simpleMessage(
            "Type name or symbol of the company you are looking for")
      };
}
