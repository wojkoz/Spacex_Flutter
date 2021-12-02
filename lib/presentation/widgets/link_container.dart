import 'package:flutter/material.dart';
import 'package:spacex_flutter/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkContainer extends StatelessWidget {
  final List<String> links;
  final double width;
  const LinkContainer({
    Key? key,
    required this.links,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: Styles.firstBackgroundColor,
      child: Column(
        children: _createButtons(),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  List<Widget> _createButtons() {
    List<Widget> widgets = [];

    for (var link in links) {
      widgets.add(ElevatedButton(
        child: Text(
          link,
        ),
        onPressed: () => _launchURL(link),
      ));
    }
    return widgets;
  }
}
