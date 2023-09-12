import 'package:bookends/constants/constants.dart';
import 'package:bookends/constants/string_constants.dart';
import 'package:bookends/models/page_data.dart';
import 'package:bookends/pages/history_page.dart';
import 'package:bookends/pages/home/bookend_page.dart';
import 'package:bookends/pages/settings_page.dart';
import 'package:bookends/services/backend.dart';
import 'package:bookends/services/bookend_response_service/bookend_response_service.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/bookend_service/bookend_service.dart';
import 'package:bookends/services/bookend_service/i_bookend_service.dart';
import 'package:bookends/services/i_backend.dart';
import 'package:bookends/services/local_file_service/i_local_file_service.dart';
import 'package:bookends/services/local_file_service/local_file_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final IBackend backend = Backend();
  await backend.setup(url: 'http://localhost:8000');
  GetIt.I.registerSingleton<IBackend>(backend);

  final ILocalFileService localFileService = LocalFileService();
  await localFileService.init();
  GetIt.I.registerSingleton<ILocalFileService>(localFileService);

  final IBookendService bookendService = BookendService();
  await bookendService.init();
  GetIt.I.registerSingleton<IBookendService>(bookendService);

  final IBookendResponseService bookendResponseService =
      BookendResponseService();
  await bookendResponseService.init();
  GetIt.I.registerSingleton<IBookendResponseService>(bookendResponseService);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookends',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const Root(title: 'Bookends'),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key, required this.title});

  final String title;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  List<PageData> _pageDatas = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageDatas = [
      PageData(
        page: const BookendPage(),
        title: StringConstants.homePageTitle,
        icon: Icons.home,
      ),
      PageData(
        page: const HistoryPage(),
        title: StringConstants.historyPageTitle,
        icon: Icons.settings,
      ),
      PageData(
        page: const SettingsPage(),
        title: StringConstants.settingsPageTitle,
        icon: Icons.settings,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> navRail = [];
    if (MediaQuery.of(context).size.width >= Constants.smallScreen) {
      navRail.add(_buildNavigationRail());
    }
    navRail.add(
      Expanded(
        child: _pageDatas[_selectedIndex].page,
      ),
    );

    return Scaffold(
      bottomNavigationBar:
          MediaQuery.of(context).size.width < Constants.smallScreen
              ? _buildBottomNavBar()
              : null,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: navRail,
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.indigoAccent,
      // called when one tab is selected
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      // bottom tab items
      items: _pageDatas
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.title,
            ),
          )
          .toList(),
    );
  }

  Widget _buildNavigationRail() {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.selected,
      destinations: _pageDatas
          .map(
            (e) => NavigationRailDestination(
              icon: Icon(e.icon),
              label: Text(e.title),
            ),
          )
          .toList(),
    );
  }
}
