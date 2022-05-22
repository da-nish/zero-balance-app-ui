import 'package:expense_tracker/widgets/text_field/app_text_field_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final AppTextFieldStyle? style;
  final String? error;
  final String? startText;
  final Function(String)? onChanged;
  final Widget? child;
  final bool obscure;
  final int maxLines;
  final int? maxLetters;
  final bool isRightAlign;
  final TextInputType inputType;
  final FocusNode? focusNode;

  AppTextField(
      {this.style,
      this.hintText,
      this.labelText = "",
      this.maxLines = 1,
      this.startText = "",
      this.isRightAlign = false,
      this.inputType = TextInputType.text,
      this.error,
      this.maxLetters,
      this.onChanged,
      this.obscure = false,
      this.focusNode,
      this.child});

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final _key = GlobalKey();

  TextEditingController? _controller;
  FocusNode? _focusNode;

  @override
  void initState() {
    _controller = TextEditingController()..text = (widget.startText ?? "");
    _controller!.addListener(() {
      setState(() {});
      widget.onChanged?.call(_controller?.value.text ?? "");
    });
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode!.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    if (oldWidget.error != widget.error) setState(() {});
    if (oldWidget.obscure != widget.obscure) setState(() {});
    if (_controller!.text != widget.startText) {
      setState(() {
        _controller!.text = widget.startText!;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: widget.style!.animationsDuration,
        // decoration: BoxDecoration(
        //   color: Colors.yellow,
        // ),
        // height: widget.style!.height * widget.maxLines,
        // height: 32,
        child: TextField(
          key: _key,
          controller: _controller,
          maxLength: widget.maxLetters,
          focusNode: _focusNode,
          keyboardType: widget.inputType,
          maxLines: widget.maxLines,
          cursorColor: widget.style!.cursorColor,
          style: widget.style!.style,
          obscureText: widget.obscure,
          textAlign: widget.isRightAlign ? TextAlign.right : TextAlign.left,
          decoration: InputDecoration(
            prefixIcon: widget.child,
            counterText: "",
            hintStyle: widget.style!.hintStyle,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 0, vertical: widget.style!.contentVerticalPadding),
            hintText:
                widget.labelText.isEmpty ? widget.hintText : widget.labelText,
          ),
        ));
  }
}
