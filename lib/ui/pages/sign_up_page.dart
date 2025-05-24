import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get \nyour next journey',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomFormField(title: 'Full Name', hint: 'Your Full Name');
      }

      Widget emailAddressInput() {
        return CustomFormField(
          title: 'Email Address',
          hint: 'Your Email Address',
        );
      }

      Widget passwordInput() {
        return CustomFormField(
          title: 'Password',
          hint: 'Your Password',
          isObsecureText: true,
        );
      }

      Widget hobyInput() {
        return CustomFormField(title: 'Hoby', hint: 'Your Hobby');
      }

      Widget submitButton() {
        return CustomButton(
          title: 'Get Started',
          margin: EdgeInsets.only(top: 10),
          onPressed: () {
            Navigator.pushNamed(context, '/bonus');
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: keyWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            nameInput(),
            emailAddressInput(),
            passwordInput(),
            hobyInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 50, bottom: 73),
        child: Text(
          'Term and Condition',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: keyBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [title(), inputSection(), tacButton()],
        ),
      ),
    );
  }
}
