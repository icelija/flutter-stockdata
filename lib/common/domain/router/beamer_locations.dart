import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:stockdata/features/home/presentation/home_page.dart';

class BeamerLocations extends BeamLocation<BeamState> {
  BeamerLocations(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<Pattern> get pathPatterns => [HomePage.routeName];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey(HomePage.routeName),
        title: 'Home',
        child: HomePage(
            initialIndex: state.queryParameters['tab'] == 'news' ? 1 : 0),
      ),
    ];
  }
}
