import 'package:company_insight_app/core/styles/theme.dart';
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigationBarCubit()),
      ],
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: MaterialApp.router(
          theme: darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            L10n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerConfig: router,
          supportedLocales: L10n.delegate.supportedLocales,
        ),
      ),
    );
  }
}
