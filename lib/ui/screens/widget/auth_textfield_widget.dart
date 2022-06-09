import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:machinetest/ui/screens/theme/my_colors.dart';

import '../theme/text_style.dart';

class AuthTextFieldCommon extends StatefulWidget {
  const AuthTextFieldCommon(
      {Key? key,
      this.icon,
      required this.controller,
      this.password = false,
      this.onSaved,
      required this.validator,
      required this.labelText,
      required this.maxLength,
      required this.keyboardType,
      this.errorText,
      this.isBorder,
      this.textInputFormatter})
      : super(key: key);

  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String labelText;
  final bool password;
  final int maxLength;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData? icon;
  final String? errorText;
  final bool? isBorder;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  _AuthTextFieldCommonState createState() => _AuthTextFieldCommonState();
}

class _AuthTextFieldCommonState extends State<AuthTextFieldCommon> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  onSaved: widget.onSaved,
                  inputFormatters: widget.textInputFormatter ?? [],
                  decoration: InputDecoration(
                    contentPadding:
                        widget.isBorder == null || widget.isBorder == false
                            ? const EdgeInsets.symmetric(vertical: 0)
                            : const EdgeInsets.only(left: 15),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: MyColors.textField)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: MyColors.textField)),
                    labelText: widget.labelText,
                    errorText: widget.errorText,
                    labelStyle: regular12TextField,
                    suffixIcon: widget.password == false
                        ? null
                        : InkWell(
                            onTap: () => setState(
                                () => passwordVisible = !passwordVisible),
                            child: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: MyColors.textField,
                            ),
                          ),
                    prefixIcon: widget.password == false
                        ? Image.asset("assets/images/name.png",
                            color: MyColors.textField)
                        : Image.asset("assets/images/password.png",
                            color: MyColors.textField),
                    counterText: "",
                  ),
                  enableSuggestions: true,
                  obscureText:
                      widget.password == false ? false : passwordVisible,
                  maxLength: widget.maxLength,
                  validator: widget.validator,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
