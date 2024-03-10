import 'package:fluent_ui/fluent_ui.dart';
import 'package:news_app/models/article_category.dart';
import 'package:news_app/models/news_page.dart';
import 'package:news_app/widgets/nav_body.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((__) async {
    await windowManager.setTitle("Mtalii News");
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setSize(const Size(755, 545));
    await windowManager.setMinimumSize(const Size(755, 545));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Mtalii News',
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
          brightness: Brightness.light, accentColor: Colors.orange),
      darkTheme: FluentThemeData(
          brightness: Brightness.dark, accentColor: Colors.orange),
      home: const MyHomePage(title: 'Mtalii News'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {
  final viewKey =
      GlobalKey(); //A GlobalKey is a key that uniquely identifies a widget globally within the widget tree. It allows you to reference and interact with a specific widget from anywhere in your application, not just within the subtree where the widget is created.
  // final navigatorKey = GlobalKey<NavigatorState>(); //key with type NavigatorState

  int index = 0;
  int length = 0;

  // /news org api key/ ed72ccfcfaaf472186e655425d99c652

  final List<NewsPage> pages = const [
    NewsPage(
        title: 'Top Headlines',
        iconData: FluentIcons.news,
        category: ArticleCategory.general,
        body: NavBody(header: 'Top Headlines', length: 10)),
    NewsPage(
        title: 'Business',
        iconData: FluentIcons.business_center_logo,
        category: ArticleCategory.business,
        body: NavBody(header: 'Business', length: 10)),
    NewsPage(
        title: 'Technology',
        iconData: FluentIcons.laptop_secure,
        category: ArticleCategory.technology,
        body: NavBody(header: 'Technology', length: 10)),
    NewsPage(
        title: 'Entertainment',
        iconData: FluentIcons.my_movies_t_v,
        category: ArticleCategory.entertainment,
        body: NavBody(header: 'Entertainment', length: 10)),
    NewsPage(
        title: 'Sports',
        iconData: FluentIcons.more_sports,
        category: ArticleCategory.sports,
        body: NavBody(header: 'Sports', length: 10)),
    NewsPage(
        title: 'Science',
        iconData: FluentIcons.communications,
        category: ArticleCategory.science,
        body: NavBody(header: 'Science', length: 10)),
    NewsPage(
        title: 'Health',
        iconData: FluentIcons.health,
        category: ArticleCategory.health,
        body: NavBody(header: 'Health', length: 10))
  ];

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  // List<NavigationPaneItem> items = [
  //   PaneItem(
  //     icon: const Icon(FluentIcons.news),
  //     title: const Text('Top Headlines'),
  //     body: const NavBody(header: 'Top News', widget: Text('Headlines')),
  //     onTap: () => {},
  //   ),
  //   PaneItemSeparator(),
  //   PaneItem(
  //       icon: const Icon(FluentIcons.business_center_logo),
  //       title: const Text('Business'),
  //       body: const NavBody(
  //         header: 'Business',
  //         widget: Text('Business'),
  //       )),
  //   PaneItemSeparator(),
  //   PaneItem(
  //     icon: const Icon(FluentIcons.laptop_secure),
  //     title: const Text('Technology'),
  //     body: const NavBody(header: 'Technology', widget: Text('Technology')),
  //     onTap: () => {},
  //   ),
  //   PaneItemSeparator(),
  //   PaneItem(
  //     icon: const Icon(FluentIcons.my_movies_t_v),
  //     title: const Text('Entertainment'),
  //     body:
  //         const NavBody(header: 'Entertainment', widget: Text('Entertainment')),
  //     onTap: () => {},
  //   ),
  //   PaneItemSeparator(),
  //   PaneItem(
  //     icon: const Icon(FluentIcons.more_sports),
  //     title: const Text('Sports'),
  //     body: const NavBody(header: 'Sports', widget: Text('Sports')),
  //     onTap: () => {},
  //   ),
  //   PaneItemSeparator(),
  //   PaneItem(
  //     icon: const Icon(FluentIcons.communications),
  //     title: const Text('Science'),
  //     body: const NavBody(header: 'Science', widget: Text('Science')),
  //     onTap: () => {},
  //   ),
  //   PaneItemSeparator(),
  //   PaneItem(
  //     icon: const Icon(FluentIcons.health),
  //     title: const Text('Health'),
  //     body: const NavBody(header: 'Health', widget: Text('Health')),
  //     onTap: () => {},
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      key: viewKey,
      pane: NavigationPane(
          selected: index,
          onChanged: (newIndex) => setState(() => index = newIndex),
          displayMode: PaneDisplayMode.compact,
          items: pages
              .expand<NavigationPaneItem>((e) => [
                    PaneItem(
                        icon: Icon(e.iconData),
                        title: Text(e.title),
                        body: e.body),
                    PaneItemSeparator(),
                  ])
              .toList() // expand helps include the separator

          // pages.map<NavigationPaneItem>((e) =>
          //   PaneItem(icon: Icon(e.iconData), title: Text(e.title), body: e.body )).toList(),
          // footerItems: [
          //   PaneItem(
          //     icon: const Icon(FluentIcons.settings),
          //     title: const Text('Settings'),
          //     body: const NavBody(widget: null),
          //   ),
          // ],
          ),
    );
  }

  @override
  void onWindowClose() async {
    // ignore: no_leading_underscores_for_local_identifiers
    bool _isPreventClose = await windowManager.isPreventClose();

    if (_isPreventClose) {
      // if (viewKey.currentContext != null) {

      // }
      showDialog(
          context: viewKey.currentContext as BuildContext,
          builder: (__) {
            return ContentDialog(
              title: const Text("Confirm Close"),
              content: const Text("Are you sure you want to close the app?"),
              actions: [
                FilledButton(
                    onPressed: () {
                      Navigator.pop(viewKey.currentContext as BuildContext);
                      windowManager.destroy();
                    },
                    child: const Text("Yes")),
                FilledButton(
                    onPressed: () {
                      Navigator.pop(viewKey.currentContext as BuildContext);
                    },
                    child: const Text("No"))
              ],
            );
          });
    }
  }
}
