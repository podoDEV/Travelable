import 'package:flutter/material.dart';

class BottomSheetHandlerWidget extends StatelessWidget {
  const BottomSheetHandlerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          color: Color.fromRGBO(216, 216, 216, 1),
        ),
      ),
    );
  }
}
