import 'package:flutter/material.dart';
import 'package:spacex_flutter/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkContainer extends StatelessWidget {
  final List<String> links;
  final double width;
  final double height;
  const LinkContainer(
      {Key? key,
      required this.links,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Styles.firstBackgroundColor,
      child: ListView.builder(
        itemCount: links.length,
        itemBuilder: (BuildContext _, int index) {
          return ElevatedButton(
            child: Text(
              links[index],
            ),
            onPressed: () => _launchURL(links[index]),
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
