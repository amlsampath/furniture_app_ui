import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> color;
  final Color selectedColor;
  final void Function(Color) onColorSelected;

  const ColorSelector({Key? key, required this.color, required this.selectedColor, required this.onColorSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          color.length,
          (index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(3),
                    onTap: () => onColorSelected(color[index]),
                    child: Ink(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: color[index],
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: selectedColor == color[index] ? Colors.black : Colors.white,
                            width: selectedColor == color[index] ? 4 : 0,
                          )),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '',
                          style: TextStyle(
                              //  color: selectedColor == color[index] ? Colors.white : Colors.black87,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
