import 'package:flutter/material.dart';

class ErrorWidget1 extends StatelessWidget {
  final GestureTapCallback onTap;
  final String? msg;

  const ErrorWidget1({super.key, required this.onTap, this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.05581395348,
        (MediaQuery.of(context).size.height * 0.47639484978) * 0.05144694533,
        MediaQuery.of(context).size.width * 0.05581395348,
        (MediaQuery.of(context).size.height * 0.47639484978) * 0.05144694533,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          Image.network(
              "https://media.istockphoto.com/id/1477556388/vector/red-danger-warning-triangle-3d-icon-alert-caution-or-emergency-notification-symbol-danger.jpg?s=2048x2048&w=is&k=20&c=kKRl9hQLWaNSuEsEL8iwh9XezzU2Q-KNUzr6dmXn2AE="),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          Text(
            "something went wrong please try again",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          TextButton(
            child: Text("Try Again"),
            onPressed: onTap,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04989604989),
        ],
      ),
    );
  }
}