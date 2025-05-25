import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(
    text: '',
  );

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Sign In with \nYour Account',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      Widget emailAddressInput() {
        return CustomFormField(
          title: 'Email Address',
          hint: 'Your Email Address',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomFormField(
          title: 'Password',
          hint: 'Your Password',
          isObsecureText: true,
          controller: passwordController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/main',
                (route) => false,
              );
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: keyRedColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return CustomButton(
              title: 'Sign In',
              margin: EdgeInsets.only(top: 10),
              onPressed: () {
                context.read<AuthCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
            );
          },
        );
      }

      Widget signUpButton() {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-up',
              (route) => false,
            );
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50, bottom: 73),
            child: Text(
              'Don\'t Have an Account? Sign Up',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
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
            emailAddressInput(),
            passwordInput(),
            submitButton(),
            signUpButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: keyBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [title(), inputSection()],
        ),
      ),
    );
  }
}
