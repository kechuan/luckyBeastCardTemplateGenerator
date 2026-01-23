import 'package:flutter/services.dart';

class ClampValueFormatter extends TextInputFormatter {

  ClampValueFormatter(
  {
    this.minValue,
    this.maxValue, 
  }
  );

  final int? minValue;
  final int? maxValue;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, TextEditingValue newValue
  ) {

    if (newValue.text.isEmpty) {
      return newValue;
    }

    // 尝试解析输入的值
    final int? enteredValue = int.tryParse(newValue.text);

    if (minValue == null && maxValue == null) {
      return newValue;
    }

    else if (minValue == null) {
      if (enteredValue == null || enteredValue > maxValue!) { 

        return TextEditingValue(
          text: maxValue.toString(),
          selection: TextSelection.collapsed(offset: maxValue.toString().length),
        );
      }
    }

    else if (maxValue == null) {
      if (enteredValue == null || enteredValue < minValue!) {
        return TextEditingValue(
          text: minValue.toString(),
          selection: TextSelection.collapsed(offset: minValue.toString().length),
        );
      }
    }

    else {
      if (enteredValue == null || enteredValue < minValue! || enteredValue > maxValue!) {

        if (enteredValue == null) {
          return TextEditingValue(
            text: minValue.toString(),
            selection: TextSelection.collapsed(offset: minValue.toString().length),
          );
        }

        if (enteredValue.compareTo(minValue!) < 0) {
          return TextEditingValue(
            text: minValue.toString(),
            selection: TextSelection.collapsed(offset: minValue.toString().length),
          );
        }

        else if (enteredValue.compareTo(maxValue!) > 0) {
          return TextEditingValue(
            text: maxValue.toString(),
            selection: TextSelection.collapsed(offset: maxValue.toString().length),
          );

        }

      }
    }

    return newValue;

    // 否则返回用户输入的值

  }
}

final defaultInputFormatter = [     
  FilteringTextInputFormatter.digitsOnly,
  ClampValueFormatter(minValue: 0, maxValue: 99),
  LengthLimitingTextInputFormatter(2)
];
