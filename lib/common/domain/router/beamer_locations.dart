import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:stockdata/features/search/presentation/search_page.dart';

class BeamerLocations extends BeamLocation<BeamState> {
  BeamerLocations(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<Pattern> get pathPatterns => [];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('HomePage'),
        title: 'HomePage',
        child: SearchPage(),
      ),
      // if (state.uri.pathSegments.contains('simple-page'))
      //   const BeamPage(
      //     key: ValueKey('exampleSimplePage'),
      //     title: 'ExampleSimplePage',
      //     child: ExampleSimplePage(),
      //   ),
    ];
  }
}
