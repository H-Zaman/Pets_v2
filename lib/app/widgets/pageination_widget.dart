import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final int length;
  final int selectedIndex;
  const PaginationWidget({Key? key, required this.length, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i = 0; i< length ;i++)
          selectedIndex == i ? Container(
            height: 4,
            width: 10,
            color: Colors.white,
            margin: EdgeInsets.only(
              right: 4
            ),
          ) : Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey
            ),
            margin: EdgeInsets.only(
              right: 4
            ),
          )
      ],
    );
  }
}

