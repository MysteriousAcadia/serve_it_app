import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serveit/constants.dart';
class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.disabled,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final bool disabled;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
              Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 23,
                        color: const Color(0xffffffff),
                        letterSpacing: -0.42500000000000004,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: const Color(0x29000000),
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
