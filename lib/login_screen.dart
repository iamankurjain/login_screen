library login_screen;

import 'package:flutter/material.dart';
import 'package:login_screen/custom_toggle_button.dart';
import 'package:login_screen/gradient_button.dart';
import 'package:login_screen/gradient_text.dart';

class SignInOptions {
  final Icon icon;
  final VoidCallback didTapOnIcon;

  const SignInOptions({required this.icon, required this.didTapOnIcon});
}

class LoginScreen extends StatefulWidget {
  final String headerTitle;
  final String? userNameTFHint;
  final String? passwordHintText;
  final String? signInButtonTitle;
  final ({String signInButtonTabTitle, String signUpButtonTabTitle}) tabTitles;
  final List<SignInOptions>? signInOptions;
  final List<Color>? gradientColors;
  final Color primaryColor;
  final TextStyle? headerTitleStyle;
  final String? forgotPasswordTitle;
  final Color? textFieldIconColor;
  final TextStyle? textFieldHintStyle;
  final TextStyle? forgotPasswordTextStyle;
  final Gradient? signInButtonGradient;
  final TextStyle? signInButtonTextStyle;
  final TextStyle? toggleButtonTextStyle;
  final TextStyle? toggleButtonSelectedTextStyle;
  final Color? toggleButtonSelectedColor;
  final Color? toggleButtonUnselectedColor;
  final Color? toggleButtonBorderColor;
  final double? toggleButtonHeight;
  final double? toggleButtonWidth;
  final double? toggleButtonBorderRadius;

  const LoginScreen({
    super.key,
    required this.headerTitle,
    this.userNameTFHint = "Username",
    this.passwordHintText = 'Enter password',
    this.signInButtonTitle = "Login",
    required this.tabTitles,
    this.signInOptions,
    this.gradientColors,
    required this.primaryColor,
    this.headerTitleStyle,
    this.forgotPasswordTitle,
    this.textFieldIconColor,
    this.textFieldHintStyle,
    this.forgotPasswordTextStyle,
    this.signInButtonGradient,
    this.signInButtonTextStyle,
    this.toggleButtonTextStyle,
    this.toggleButtonSelectedTextStyle,
    this.toggleButtonSelectedColor,
    this.toggleButtonUnselectedColor,
    this.toggleButtonBorderColor,
    this.toggleButtonHeight,
    this.toggleButtonWidth,
    this.toggleButtonBorderRadius,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle get _defaultHeaderTextStyle => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: widget.primaryColor,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.gradientColors != null
                  ? GradientText(
                      text: widget.headerTitle,
                      gradient: LinearGradient(colors: widget.gradientColors!),
                      style: widget.headerTitleStyle ?? _defaultHeaderTextStyle)
                  : Text(widget.headerTitle,
                      style:
                          widget.headerTitleStyle ?? _defaultHeaderTextStyle),
              const SizedBox(height: 24),
              CustomToggleButton(
                labels: [
                  widget.tabTitles.signInButtonTabTitle,
                  widget.tabTitles.signUpButtonTabTitle
                ],
                selectedIndex: 0,
                onToggle: (index) {},
                selectedColor:
                    widget.toggleButtonSelectedColor ?? widget.primaryColor,
                unselectedColor: widget.toggleButtonUnselectedColor ??
                    widget.primaryColor.withOpacity(0.2),
                borderColor:
                    widget.toggleButtonBorderColor ?? widget.primaryColor,
                selectedTextColor:
                    widget.toggleButtonSelectedTextStyle?.color ??
                        widget.primaryColor,
                unselectedTextColor:
                    widget.toggleButtonTextStyle?.color ?? widget.primaryColor,
                minHeight: widget.toggleButtonHeight ?? 40,
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  hintText: widget.userNameTFHint,
                  hintStyle: widget.textFieldHintStyle,
                  prefixIcon: Icon(Icons.person,
                      color: widget.textFieldIconColor ?? widget.primaryColor),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: widget.passwordHintText,
                  hintStyle: widget.textFieldHintStyle,
                  prefixIcon: Icon(Icons.lock,
                      color: widget.textFieldIconColor ?? widget.primaryColor),
                  suffixIcon: Icon(Icons.visibility,
                      color: widget.textFieldIconColor ?? widget.primaryColor),
                ),
              ),
              const SizedBox(height: 24),
              GradientButton(
                onPressed: () {},
                title: widget.signInButtonTitle ?? 'Sign in',
                gradient: widget.signInButtonGradient ??
                    LinearGradient(
                      colors: widget.gradientColors ?? const [
                        Color(0xFFFE5152),
                        Color(0xFFF470B1),
                        Color(0xFFFF04B3),
                      ],
                    ),
                textStyle: widget.signInButtonTextStyle,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  widget.forgotPasswordTitle ?? 'Forgot password?',
                  style: widget.forgotPasswordTextStyle,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.signInOptions?.map((option) {
                      return IconButton(
                        icon: option.icon,
                        onPressed: option.didTapOnIcon,
                      );
                    }).toList() ??
                    [],
              ),
            ],
          ),
        ),
      )
    );
  }
}
