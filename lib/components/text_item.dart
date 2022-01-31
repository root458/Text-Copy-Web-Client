import 'package:clipboard/clipboard.dart';
import 'package:copy_client/firebase_functions/firebase_functions.dart';
import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  const TextItem({Key? key, required this.width, required this.copiedText})
      : super(key: key);

  final double width;
  final CopiedText copiedText;

  String dayOfTheWeek(int day) {
    switch (day) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      default:
        return 'Saturday';
    }
  }

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    String _day = copiedText.dateTime.weekday == today.weekday
        ? 'Today'
        : dayOfTheWeek(copiedText.dateTime.weekday);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // ignore: sized_box_for_whitespace
        Container(
            width: width * 0.2,
            child: Text(
              '$_day\n${copiedText.dateTime.day}/ ${copiedText.dateTime.month}/ ${copiedText.dateTime.year}',
              style: const TextStyle(overflow: TextOverflow.visible),
            )),
        Container(
          width: width * 0.4,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              copiedText.text,
              style: const TextStyle(
                  overflow: TextOverflow.visible, color: Colors.white),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              FlutterClipboard.copy(copiedText.text);
            },
            icon: const Icon(Icons.copy))
      ],
    );
  }
}
