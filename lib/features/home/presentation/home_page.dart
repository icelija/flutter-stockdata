import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:stockdata/features/news/presentation/news_page.dart';
import 'package:stockdata/features/search/presentation/search_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  final int initialIndex;

  const HomePage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            SearchPage(),
            NewsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: 'News', icon: Icon(Icons.newspaper)),
          ],
          onTap: (index) {
            Beamer.of(context).update(
              configuration: RouteInformation(
                location: index == 0 ? '/?tab=search' : '/?tab=news',
              ),
              rebuild: false,
            );
            setState(() => _currentIndex = index);
          },
        ));
  }
}
