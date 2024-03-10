import 'package:fluent_ui/fluent_ui.dart';
import 'package:news_app/widgets/news_item.dart';

class NavBody extends StatelessWidget {
  final int length;
  final String header;

  const NavBody({
    Key? key,
    required this.length,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(title: Text(header)),
      content: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 290,
              childAspectRatio: 4 / 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20),
          padding: const EdgeInsets.all(16),
          itemCount: length,
          itemBuilder: (BuildContext ctx, index) {
            return NewsItem();
          }),
    );
  }
}
