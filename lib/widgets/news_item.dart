import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:transparent_image/transparent_image.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    Typography typography = FluentTheme.of(context).typography;
    return material.Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image:
                              "https://media.architecturaldigest.com/photos/63079fc7b4858efb76814bd2/16:9/w_1600%2Cc_limit/9.%2520DeLorean-Alpha-5%2520%255BDeLorean%255D.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: typography.bodyLarge?.apply(fontSizeFactor: 0.8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 8, left: 8),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Bloomber - 2 hours ago',
                    style: typography.caption?.apply(fontSizeFactor: 1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  DropDownButton(title: const Icon(FluentIcons.share), items: [
                    MenuFlyoutItem(
                        text: const Text('Open in Browser'),
                        leading: const Icon(FluentIcons.edge_logo),
                        onPressed: () {}),
                    const MenuFlyoutSeparator(),
                    MenuFlyoutItem(
                        text: const Text('Send'),
                        leading: const Icon(FluentIcons.send),
                        onPressed: () {}),
                    const MenuFlyoutSeparator(),
                    MenuFlyoutItem(
                        text: const Text('Copy URL'),
                        leading: const Icon(FluentIcons.copy),
                        onPressed: () {}),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
