// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CIconButton extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final double size;
  final Color color;
  final Color selectedColor;
  final bool selected;
  const CIconButton({
    Key? key,
    required this.icon,
    this.selectedIcon = Icons.api,
    this.size = 16,
    this.selected = false,
    this.color = Colors.black,
    this.selectedColor = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
      icon: Icon(
        selected ? selectedIcon : icon
      ),
      color: selected ? selectedColor : color,
      iconSize: size,
      constraints: BoxConstraints(),
    );
  }
}
