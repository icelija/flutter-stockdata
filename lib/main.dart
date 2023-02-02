import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/domain/router/beamer_locations.dart';
import 'package:stockdata/theme/primary_theme.dart';
import 'package:stockdata/theme/secondary_theme.dart';

import 'common/utils/custom_provider_observer.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    observers: [CustomProviderObserver()],
    child: const MyApp(),
  ));
}

final beamerDelegate = BeamerDelegate(
  initialPath: '/',
  locationBuilder: (routeInformation, _) => BeamerLocations(routeInformation),
);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BeamerProvider(
      routerDelegate: beamerDelegate,
      child: MaterialApp.router(
        title: 'StockData',
        theme: primaryTheme,
        darkTheme: secondaryTheme,
        localizationsDelegates: const [
          S.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        routerDelegate: beamerDelegate,
        routeInformationParser: BeamerParser(),
        builder: (context, child) => child ?? const SizedBox(),
      ),
    );
  }
}
