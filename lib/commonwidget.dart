library commonwidget;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'constant.dart';

// chuyển thời gian từ millisecond sang định dạng format
String convertTime(String format, int time, bool isUTC, String languageCode) {
  return DateFormat(format, languageCode).format(DateTime.fromMillisecondsSinceEpoch(time, isUtc: isUTC));
}

int convertNewDayStyleToMillisecond(int time) {
  final String timeString = time.toString();
  final int year = int.parse(timeString.substring(0, 4));
  final int month = int.parse(timeString.substring(4, 6));
  final int day = int.parse(timeString.substring(6, 8));
  return DateTime(year, month, day).millisecondsSinceEpoch;
}

String currencyFormat(int param, String unit) {
  final NumberFormat formatCurrency = NumberFormat();
  final String result = formatCurrency.format(param);
  return result + ' ' + unit;
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: currencyFormat(int.parse(newValue.text.toString().trim()), 'VNĐ'));
  }
}

List<String> source = <String>[
  'À',
  'Á',
  'Â',
  'Ã',
  'È',
  'É',
  'Ê',
  'Ì',
  'Í',
  'Ò',
  'Ó',
  'Ô',
  'Õ',
  'Ù',
  'Ú',
  'Ý',
  'à',
  'á',
  'â',
  'ã',
  'è',
  'é',
  'ê',
  'ì',
  'í',
  'ò',
  'ó',
  'ô',
  'õ',
  'ù',
  'ú',
  'ý',
  'Ă',
  'ă',
  'Đ',
  'đ',
  'Ĩ',
  'ĩ',
  'Ũ',
  'ũ',
  'Ơ',
  'ơ',
  'Ư',
  'ư',
  'Ạ',
  'ạ',
  'Ả',
  'ả',
  'Ấ',
  'ấ',
  'Ầ',
  'ầ',
  'Ẩ',
  'ẩ',
  'Ẫ',
  'ẫ',
  'Ậ',
  'ậ',
  'Ắ',
  'ắ',
  'Ằ',
  'ằ',
  'Ẳ',
  'ẳ',
  'Ẵ',
  'ẵ',
  'Ặ',
  'ặ',
  'Ẹ',
  'ẹ',
  'Ẻ',
  'ẻ',
  'Ẽ',
  'ẽ',
  'Ế',
  'ế',
  'Ề',
  'ề',
  'Ể',
  'ể',
  'Ễ',
  'ễ',
  'Ệ',
  'ệ',
  'Ỉ',
  'ỉ',
  'Ị',
  'ị',
  'Ọ',
  'ọ',
  'Ỏ',
  'ỏ',
  'Ố',
  'ố',
  'Ồ',
  'ồ',
  'Ổ',
  'ổ',
  'Ỗ',
  'ỗ',
  'Ộ',
  'ộ',
  'Ớ',
  'ớ',
  'Ờ',
  'ờ',
  'Ở',
  'ở',
  'Ỡ',
  'ỡ',
  'Ợ',
  'ợ',
  'Ụ',
  'ụ',
  'Ủ',
  'ủ',
  'Ứ',
  'ứ',
  'Ừ',
  'ừ',
  'Ử',
  'ử',
  'Ữ',
  'ữ',
  'Ự',
  'ự'
];
List<String> destination = <String>[
  'A',
  'A',
  'A',
  'A',
  'E',
  'E',
  'E',
  'I',
  'I',
  'O',
  'O',
  'O',
  'O',
  'U',
  'U',
  'Y',
  'a',
  'a',
  'a',
  'a',
  'e',
  'e',
  'e',
  'i',
  'i',
  'o',
  'o',
  'o',
  'o',
  'u',
  'u',
  'y',
  'A',
  'a',
  'D',
  'd',
  'I',
  'i',
  'U',
  'u',
  'O',
  'o',
  'U',
  'u',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'A',
  'a',
  'E',
  'e',
  'E',
  'e',
  'E',
  'e',
  'E',
  'e',
  'E',
  'e',
  'E',
  'e',
  'E',
  'e',
  'E',
  'e',
  'I',
  'i',
  'I',
  'i',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'O',
  'o',
  'U',
  'u',
  'U',
  'u',
  'U',
  'u',
  'U',
  'u',
  'U',
  'u',
  'U',
  'u',
  'U',
  'u'
];

String convertAccent(String text) {
  String result = '';
  for (int i = 0; i < text.length; i++) {
    final int index = source.indexOf(text[i]);
    if (index != -1) {
      result += destination[index];
    } else {
      result += text[i];
    }
  }
  return result;
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key, this.valueColor}) : super(key: key);
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(valueColor ?? Colors.white));
  }
}

class AVButtonFill extends StatelessWidget {
  const AVButtonFill({
    Key key,
    this.title,
    this.textColor,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: RaisedButton(
        color: backgroundColor ?? AppColor.primaryColor,
        child: Text(
          title ?? '',
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: textColor ?? AppColor.white),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}

class AVUnderLineTextFormField extends StatelessWidget {
  const AVUnderLineTextFormField({
    Key key,
    this.hint,
    this.hintTextColor,
    this.textColor,
    this.errorTextColor,
    this.textInputAction,
    this.keyboardType,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    @required this.style,
  }) : super(key: key);

  final String hint;
  final Color hintTextColor;
  final Color textColor;
  final Color errorTextColor;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController controller;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final UnderlineInputBorder myBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
    return TextFormField(
      style: style,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        border: myBorder,
        focusedBorder: myBorder,
        enabledBorder: myBorder,
        errorBorder: myBorder,
        focusedErrorBorder: myBorder,
        errorStyle: TextStyle(
          color: errorTextColor,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
    );
  }
}

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    Key key,
    @required this.message,
    this.retry,
    this.image,
    this.messageColor,
    this.titleButtonColor,
    this.backgroundButtonColor,
  }) : super(key: key);

  final String message;
  final VoidCallback retry;
  final String image;
  final Color messageColor;
  final Color titleButtonColor;
  final Color backgroundButtonColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (image != null) Image.asset(image),
          Text(
            message,
            style: TextStyle(
              color: messageColor ?? AppColor.black,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
          Container(height: 16.0),
          if (retry != null)
            AVButtonFill(
              onPressed: retry,
              title: 'Thử lại',
              textColor: titleButtonColor ?? Colors.white,
              backgroundColor: backgroundButtonColor ?? AppColor.primaryColor,
            ),
        ],
      ),
    );
  }
}

class AVButtonIcon extends StatelessWidget {
  const AVButtonIcon({
    Key key,
    @required this.icon,
    @required this.onPressed,
    @required this.text,
    this.height,
    this.backgroundColor,
    @required this.titleStyle,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;
  final String text;
  final double height;
  final Color backgroundColor;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 32,
      child: RaisedButton(
        color: backgroundColor,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon,
            Text(text, style: titleStyle),
          ],
        ),
      ),
    );
  }
}
