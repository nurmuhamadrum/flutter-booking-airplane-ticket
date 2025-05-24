import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final String hint;
  final bool isObsecureText;

  const CustomFormField({
    super.key,
    required this.title,
    required this.hint,
    this.isObsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 6),
          TextFormField(
            cursorColor: keyBlackColor,
            obscureText: isObsecureText,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(color: keyPrimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
