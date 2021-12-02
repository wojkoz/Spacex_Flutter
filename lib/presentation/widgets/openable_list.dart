import 'package:flutter/material.dart';
import 'package:spacex_flutter/constants/styles.dart';

class OpenableList extends StatefulWidget {
  final List<Widget> items;
  final Widget title;
  const OpenableList({Key? key, required this.items, required this.title})
      : super(key: key);

  @override
  _OpenableListState createState() => _OpenableListState();
}

class _OpenableListState extends State<OpenableList> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Styles.firstBackgroundColor,
      elevation: 5,
      child: _isOpen ? _buildOpen() : _buildClose(),
    );
  }

  Widget _buildClose() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.title,
      ],
    );
  }

  Widget _buildOpen() {
    return Row(
      children: [
        widget.title,
        Column(
          children: widget.items,
        ),
      ],
    );
  }
}
