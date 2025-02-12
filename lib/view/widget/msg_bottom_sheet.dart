import 'package:flutter/material.dart';


class MsgBottomSheet extends StatelessWidget {
  final String msg;
  final String title;
  final String imagePath;

  const MsgBottomSheet({
    super.key,
    required this.msg,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        size.width * 0.05581395348,
        size.height * 0.05206073752,
        size.width * 0.05581395348,
        size.height * 0.05206073752,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(imagePath),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          Text(
            msg,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03326403326),
          IntrinsicHeight(
            child: TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}