import 'package:flutter/material.dart';

class NavBody extends StatelessWidget {
  final String? header;
  final Widget? widget;

  const NavBody({
    Key? key,
    required this.header,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              header!,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        widget ?? const Text('', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  // static builder(Map map) {}
}
