import 'package:flutter/material.dart';
import 'package:spacex_flutter/constants/styles.dart';

class ShortItemDescription extends StatelessWidget {
  final String title;
  final String description;
  final int maxChars;
  final Widget? inFrontOfTitle;

  const ShortItemDescription({
    Key? key,
    required this.title,
    required this.description,
    this.maxChars = 80,
    this.inFrontOfTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.secondBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Row(
                children: [
                  inFrontOfTitle != null
                      ? Expanded(
                          flex: 1,
                          child: inFrontOfTitle!,
                        )
                      : Container(),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Styles.secondTextColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 350,
                  child: Text(
                    _getShortDescription(),
                    style: const TextStyle(
                      color: Styles.secondTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getShortDescription() {
    if (description.length <= maxChars) {
      return description;
    }
    var desc = description.substring(0, maxChars);

    return "$desc...";
  }
}
