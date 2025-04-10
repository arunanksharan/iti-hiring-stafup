import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:provider/provider.dart';

import '../feature/authentication/bloc/auth_bloc.dart';
import 'custom_text.dart';
import 'fh_color_provider.dart';
import 'fh_colors.dart';
import 'fh_constant.dart';

// ignore: must_be_immutable
class ButtonGlobal extends StatelessWidget {
  final String buttontext;
  final Decoration buttonDecoration;
  final double? width;
  final VoidCallback onPressed;
  bool? enabled;

  ButtonGlobal({
    super.key,
    required this.buttontext,
    required this.buttonDecoration,
    required this.onPressed,
    this.width,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: width ?? 100, // Set the width here
        decoration: buttonDecoration,
        child: InkWell(
          onTap: (enabled ?? true) ? onPressed : null,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Center(
              child: Text(
                buttontext,
                style: fhTextStyle.copyWith(
                  fontSize: 16,
                  color: HrmColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonGlobalWithoutIcon extends StatelessWidget {
  final String buttonText;
  final Decoration buttonDecoration;

  // ignore: prefer_typing_uninitialized_variables
  final void Function()? onPressed;
  final Color buttonTextColor;

  // ignore: use_key_in_widget_constructors
  const ButtonGlobalWithoutIcon({
    required this.buttonText,
    required this.buttonDecoration,
    required this.onPressed,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        decoration: buttonDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: fhTextStyle.copyWith(color: buttonTextColor),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundScreen extends StatefulWidget {
  final String title;
  final Widget? advTitle;
  final Widget child;
  final Widget? floatingActionButton;
  final Widget? action;
  final Widget? bottomNavigationBar;
  final bool isDrawer;
  final bool isBack;
  final bool? isCenterTitle;
  final Widget? drawer;
  final bool isBackWarningRequired;
  final bool? isBottomClipperRequired;
  final void Function()? onBack;
  final bool isDarkIconShow;
  final bool isAppBarRequired;

  const BackgroundScreen({
    super.key,
    required this.child,
    this.customKey,
    this.floatingActionButton,
    this.drawer,
    this.action,
    this.bottomNavigationBar,
    this.advTitle,
    this.isDrawer = false,
    this.isBackWarningRequired = false,
    this.isBack = true,
    required this.title,
    this.isCenterTitle,
    this.onBack,
    this.isBottomClipperRequired,
    this.isDarkIconShow = false,
    this.isAppBarRequired = true,
  });

  final GlobalKey<ScaffoldState>? customKey;

  @override
  State<BackgroundScreen> createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Star> _stars;
  final int numberOfStars = 10;
  final double maxStarSpeed = 1;
  bool canPop = false;

  AuthBloc get authBloc => BlocProvider.of<AuthBloc>(context);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(); // Looping the animation

    _stars = List.generate(numberOfStars, (index) {
      return Star(
        x: Random().nextDouble() * 400,
        y: Random().nextDouble() * 800,
        speed: Random().nextDouble() * maxStarSpeed + 0.5,
        radius: Random().nextDouble() * 2 + 1,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorNotifier notifier = Provider.of<ColorNotifier>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: PopScope(
        canPop: !widget.isBackWarningRequired,
        onPopInvokedWithResult: (value, result) {
          canPop = !value;
          if (canPop) {
            openDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Warning!'),
                  content: const Text('Are you sure you want to go back?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        finish(context);
                        // canPop = false;
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: notifier.textColor),
                      ),
                    ),
                    TextButton(
                      onPressed: widget.onBack ?? SystemNavigator.pop,
                      child: Text(
                        'Ok',
                        style: TextStyle(color: notifier.textColor),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value:
              notifier.isDark
                  ? SystemUiOverlayStyle.light
                  : SystemUiOverlayStyle.dark,
          child: Scaffold(
            backgroundColor: HrmColors.white,
            resizeToAvoidBottomInset: true,
            key: widget.customKey,
            bottomNavigationBar: widget.bottomNavigationBar,
            floatingActionButton: widget.floatingActionButton ?? Container(),
            appBar:
                widget.isAppBarRequired
                    ? AppBar(
                      automaticallyImplyLeading: false,
                      titleSpacing: 0,
                      backgroundColor: HrmColors.blue,
                      iconTheme: const IconThemeData(color: Colors.white),
                      leading:
                          widget.isBack
                              ? (widget.isDrawer
                                  ? IconButton(
                                    icon: SizedBox(
                                      height: 20,
                                      child: Icon(
                                        Icons.menu,
                                        color: notifier.textColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      widget.customKey?.currentState!
                                          .openDrawer();
                                    },
                                  )
                                  : IconButton(
                                    icon: const Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      widget.isBackWarningRequired
                                          ? openDialog(
                                            context: context,
                                            builder:
                                                (context) => AlertDialog(
                                                  title: const Text('Warning!'),
                                                  content: const Text(
                                                    'Are you sure you want to go back?',
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(
                                                          context,
                                                        ).pop();
                                                      },
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          color:
                                                              notifier
                                                                  .textColor,
                                                        ),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed:
                                                          widget.onBack ??
                                                          () {
                                                            finish(context);
                                                            finish(context);
                                                          },
                                                      child: Text(
                                                        'Ok',
                                                        style: TextStyle(
                                                          color:
                                                              notifier
                                                                  .textColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          )
                                          : finish(context);
                                    },
                                  ))
                              : Container(),
                      title:
                          widget.advTitle ??
                          CustomText(
                            widget.title,
                            fontWeight: FontWeight.bold,
                            color: HrmColors.white,
                            fontSize: 16,
                          ),
                      centerTitle: widget.isCenterTitle,
                      actions: [
                        widget.action ?? Container(),
                        Visibility(
                          visible: widget.isDarkIconShow,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              // Constrains ripple and hover to a circle
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: HrmColors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child:
                                      notifier.getIsDark
                                          ? const Icon(Icons.dark_mode)
                                          : const Icon(Icons.light_mode),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    : null,
            body: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(color: notifier.cardColor),
              child: Column(
                children: [
                  10.height,
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: StarPainter(_stars),
                          child: Container(child: widget.child),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Widget? label;
  final TextStyle? textStyle;
  final TextFieldType? textFieldType;
  final bool readOnly;
  final Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? floatingLabelStyle;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final InputDecoration? decoration;
  final FocusNode? focus;
  final bool isValidationRequired;
  bool? enabled;
  String? initialValue;
  final bool? isMobile;
  final int? maxLines;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final dynamic Function(String)? onFieldSubmitted;
  final Iterable<String>? autoFillHints;
  final bool? enableSuggestions;
  final bool? isPassword;
  bool? obscureText;
  int? maxLength;
  String? Function(String?)? validator;
  Widget? Function(
    BuildContext, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  })?
  buildCounter;

  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
    this.label,
    this.textStyle,
    this.textFieldType,
    this.readOnly = false,
    this.onTap,
    this.initialValue,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.decoration,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.floatingLabelBehavior,
    this.floatingLabelStyle,
    this.isValidationRequired = true,
    this.enabled = true,
    this.maxLines,
    this.focus,
    this.isMobile = false,
    this.keyboardType,
    this.onFieldSubmitted,
    this.autoFillHints,
    this.enableSuggestions,
    this.isPassword,
    this.obscureText,
    this.maxLength,
    this.buildCounter,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final ColorNotifier notifier = Provider.of<ColorNotifier>(context);
    return AppTextField(
      isPassword: isPassword,
      obscureText: obscureText ?? textFieldType == TextFieldType.PASSWORD,
      enableSuggestions: enableSuggestions,
      initialValue: initialValue,
      autoFillHints: autoFillHints,
      isValidationRequired: isValidationRequired,
      textFieldType: textFieldType ?? TextFieldType.NAME,
      controller: controller,
      readOnly: readOnly,
      enabled: enabled,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      focus: focus,
      onFieldSubmitted: onFieldSubmitted,
      buildCounter:
          buildCounter ??
          (
            context, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
          }) {
            return null;
          },
      textStyle:
          textStyle ?? TextStyle(fontSize: 12, color: notifier.textColor),
      maxLength: maxLength ?? 255,
      inputFormatters:
          isMobile!
              ? [
                NoLeadingSpaceFormatter(),
                LengthLimitingTextInputFormatter(10),
                // Limit the input to 10 characters
                FilteringTextInputFormatter.digitsOnly,
                // Only allow digits
              ]
              : [NoLeadingSpaceFormatter()],

      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),

        floatingLabelBehavior: floatingLabelBehavior,
        label: label,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 12, color: notifier.textColor),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        floatingLabelStyle:
            floatingLabelStyle ?? TextStyle(color: notifier.borderColor),
        errorMaxLines: 1,
        border:
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: notifier.borderColor),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: notifier.borderColor),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: notifier.borderColor),
            ),
        hintStyle: TextStyle(
          fontSize: 14,
          color: notifier.textColor.withValues(alpha: 0.5),
        ),
        suffixIconConstraints:
            suffixIconConstraints ?? const BoxConstraints(minWidth: 40),
        prefixIconConstraints:
            prefixIconConstraints ?? const BoxConstraints(minWidth: 40),
      ),
    );
  }
}

class CustomTextFieldWithColor extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Widget? label;
  final TextStyle? textStyle;
  final TextFieldType textFieldType;
  final bool readOnly;
  final Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final InputDecoration? decoration;
  final FocusNode? focus;
  final bool isValidationRequired;
  final bool? enabled;
  final bool? isMobile;
  final int? maxLines;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Color? color;

  const CustomTextFieldWithColor({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
    this.label,
    this.textStyle,
    this.textFieldType = TextFieldType.NAME,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.decoration,
    this.floatingLabelBehavior,
    this.isValidationRequired = true,
    this.enabled,
    this.maxLines,
    this.focus,
    this.isMobile = false,
    this.keyboardType,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      isValidationRequired: isValidationRequired,
      textFieldType: textFieldType,
      controller: controller,
      readOnly: readOnly,
      enabled: enabled,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      focus: focus,
      textStyle: textStyle ?? TextStyle(fontSize: 12, color: color),
      inputFormatters:
          isMobile!
              ? [
                NoLeadingSpaceFormatter(),
                LengthLimitingTextInputFormatter(10),
                // Limit the input to 10 characters
                FilteringTextInputFormatter.digitsOnly,
                // Only allow digits
              ]
              : [NoLeadingSpaceFormatter()],
      maxLines: maxLines,
      // No input formatters if isMobile is false
      decoration: InputDecoration(
        // errorStyle: const TextStyle(fontSize: 0.01),
        isDense: true,
        floatingLabelBehavior: floatingLabelBehavior,
        label: label,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 12, color: color),
        hintText: hintText,
        // errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        floatingLabelStyle: fhTextStyle.copyWith(color: color),
        errorMaxLines: 1,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: color!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: color!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: color!),
        ),
        hintStyle: GoogleFonts.manrope(
          color: color!.withValues(
            alpha: 0.6,
          ), // Optional: Set hint text color if needed
        ),
        suffixIconConstraints:
            suffixIconConstraints ?? const BoxConstraints(minWidth: 40),
        prefixIconConstraints:
            prefixIconConstraints ?? const BoxConstraints(minWidth: 40),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final double height;
  final double? width;
  final String hintText;
  final String labelText;
  final Widget child;

  const CustomFormField({
    super.key,
    this.controller,
    required this.hintText,
    required this.labelText,
    this.height = 60,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ColorNotifier notifier = Provider.of<ColorNotifier>(context);
    return SizedBox(
      height: height,
      width: width,
      child: FormField(
        builder: (FormFieldState<dynamic> field) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              labelStyle: TextStyle(color: notifier.textColor),
              filled: true,
              fillColor: Colors.transparent,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle: TextStyle(color: notifier.borderColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: notifier.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: notifier.borderColor),
              ),
              hintStyle: GoogleFonts.manrope(
                color: notifier.textColor.withValues(
                  alpha: 0.6,
                ), // Optional: Set hint text color if needed
              ),
              border: const OutlineInputBorder(),
            ),
            child: DropdownButtonHideUnderline(child: child),
          );
        },
      ),
    );
  }
}

class CustomOTPField extends StatelessWidget {
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final double height;

  const CustomOTPField({
    super.key,
    this.currentFocus,
    this.nextFocus,
    this.height = 50,
  });

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorNotifier notifier = Provider.of<ColorNotifier>(context);
    return SizedBox(
      width: height,
      child: TextFormField(
        focusNode: currentFocus,
        style: const TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: notifier.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: notifier.borderColor),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          border: outlineInputBorder(),
        ),
        onChanged: (value) {
          if (nextFocus == null && (value.length == 1)) {
            currentFocus!.unfocus();
            // Then you need to check is the code is correct or not
          } else {
            nextField(value, nextFocus!);
          }
        },
      ),
    );
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }

    return newValue;
  }
}

class Star {
  double x;
  double y;
  double speed;
  double radius;

  Star({
    required this.x,
    required this.y,
    required this.speed,
    required this.radius,
  });

  void move() {
    y += speed;
    if (y > 800) {
      // Reset star to top if it goes out of the screen
      y = 0;
      x = Random().nextDouble() * 400;
    }
  }
}

class StarPainter extends CustomPainter {
  final List<Star> stars;

  StarPainter(this.stars);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeCap = StrokeCap.round;

    for (final star in stars) {
      star.move();
      paint.strokeWidth = star.radius;
      canvas.drawCircle(Offset(star.x, star.y), star.radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Always repaint for animation
  }
}

class CustomRadioMenuButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final Widget child;
  final Color activeColor;

  const CustomRadioMenuButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.child,
    this.activeColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: activeColor,
          ),
          child,
        ],
      ),
    );
  }
}

class CustomCheckboxMenuButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget? child;
  final String labelText;
  final Color activeColor;
  final Color? textColor;
  final double fontSize;

  const CustomCheckboxMenuButton({
    super.key,
    required this.value,
    required this.labelText,
    required this.onChanged,
    this.child,
    this.activeColor = Colors.blue,
    this.textColor,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
          ),
          const SizedBox(width: 8),
          Text(
            labelText,
            style: TextStyle(fontSize: fontSize, color: textColor),
          ),
          if (child != null) ...[const SizedBox(width: 8), child!],
        ],
      ),
    );
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path =
        Path()
          ..lineTo(0, 0)
          ..lineTo(0, size.height * 0.95)
          ..quadraticBezierTo(
            size.width * 0.02,
            size.height,
            size.width * 0.1,
            size.height,
          )
          ..lineTo(size.width * 0.9, size.height)
          ..quadraticBezierTo(
            size.width * 0.97,
            size.height,
            size.width,
            size.height * 0.96,
          )
          ..lineTo(size.width, 0)
          ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class PopMenuIconListTile extends StatelessWidget {
  const PopMenuIconListTile({
    super.key,
    required this.title,
    required this.image,
    this.width = 30.0,
    this.height = 30.0,
  });

  final String title;
  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Image(image: AssetImage(image)),
        ),
        const SizedBox(width: 16),
        Text(title),
      ],
    );
  }
}
