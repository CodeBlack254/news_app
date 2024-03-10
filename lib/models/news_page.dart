import 'package:fluent_ui/fluent_ui.dart';
import 'package:news_app/models/article_category.dart';

class NewsPage{
  final String title;
  final IconData iconData;
  final ArticleCategory category;
  final Widget body;

  const NewsPage(
    {required this.title, required this.iconData, required this.category, required this.body}
  );
}

// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:news_app/models/article_category.dart';

// class NewsPage extends StatelessWidget {
//   final String title;
//   final IconData iconData;
//   final ArticleCategory category;
//   final Widget body;

//    const NewsPage(
//     { Key? key, required this.title, required this.iconData, required this.category, required this.body}
//   );

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }