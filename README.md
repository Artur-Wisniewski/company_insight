# Description 📃

The 'Company Insight App' allows users to search for companies by symbol (e.g., AAPL,
MSFT), view a list of companies they're interested in, and delve into detailes of each
company. This app aims to provide valuable information to users, including financial data and
market presence, enabling them to make informed decisions or simply satisfy their curiosity
about a company's standing and operations

## How to start

```
flutter run --dart-define API_KEY=$YourApiKeyFromsite.financialmodelingprep.com
```

You can get your API key from [here](https://financialmodelingprep.com/developer/docs/)
Personal recommendation is to run the app on the android device with `Impeller` engine turned on.
Flutter enables Impeller by default on iOS.

```
flutter run --enable-impeller --dart-define API_KEY=$YourApiKeyFromsite.financialmodelingprep.com
```
## Video 🎥

https://github.com/Artur-Wisniewski/company_insight/assets/46329000/4e0f6a73-d399-473e-a622-7328b95ed60a




## Design 🎨

[Figma Invitation](https://www.figma.com/file/KByBJJhCMzdsvbLa8cuOwI/Untitled?type=design&node-id=0%3A1&mode=design&t=g4tJmtDAfOroKqz4-1)

## Project Structure 📁

```
📁assets // icons, fonts, l10n translations
|  
|
📁lib
   |
   |__📁core
   |	|__ 📁animation // page transition
   |	|__ 📁constants // Const values, assets, status codes
   |	|__ 📁theme // define themes & and colors
   |	|__ 📁widgets // widgets that are used in multiple screens
   |	|__ 📁helpers // useful addons
   |	|__ 📁exceptions 
   |	|__ 📁services // Shared services like SharedPreferences 
   |
   |__📁translations // Generated l10n translations
   |
   |__📁features
   |	|__ 📁feature_example
   |	      |__ 📁data
   |	      |     |__ 📁data_sources // local & remote data sources (API, SQLite)
   |	      |     |__ 📁models // local & remote models
   |	      |     |__ 📁repositories // repositories implemenations
   |	      |__ 📁domain
   |	      |     |__ 📁entities
   |	      |     |__ 📁repositories // repositories contracts
   |	      |     |__ 📁usecases
   |	      |__ 📁presentation
   |	            |__ 📁manager // blocs & cubits
   |	            |__ 📁pages
   |	            |__ 📁widgets
   |
   |__📁setup
   |    |__📄dio.dart
   |    |__📄router.dart // go_router settings
   |    |__📄injectable.dart // Injectable configuration file
   |    |__📄injectable.config.dart // Generated injectable configuration file
   |    |__📄start_app.dart // Main widget attached to screen. You can find here initial setup for themening, routing, internationalization.
   |
   |__📄main.dart // Starting point. runApp is inside here.
```

## License 📄

MIT License
