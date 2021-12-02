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
    return GestureDetector(
      onTap: () => {
        setState(() {
          _isOpen = !_isOpen;
        })
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Styles.secondBackgroundColor,
          elevation: 5,
          child: _isOpen ? _buildOpen() : _buildClose(),
        ),
      ),
    );
  }

  Widget _buildClose() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.title,
        ],
      ),
    );
  }

  Widget _buildOpen() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: widget.title,
          ),
          ...widget.items,
        ],
      ),
    );
  }
}
