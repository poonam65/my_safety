import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWgt extends StatefulWidget {
  TextFormFieldWgt({
    super.key,
    required this.hinttext,
    this.prxicon,
    this.sfxicon,
    required this.controller,
    this.obstxt = false,
    this.validator,
    this.onSficonTap,
    this.maxlen = 100,
    this.onChanged,
    this.inptype = TextInputType.text,
    this.inputFormatters,
    this.focusNode,
    this.onfieldsubmit,
    this.minline,
    this.maxline,
    this.sfxcolor,
    this.ontap,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false, // ✅ Added autofocus
  });

  final String hinttext;
  final IconData? prxicon;
  final IconData? sfxicon;
  final Color? sfxcolor;
  final TextEditingController controller;
  final bool obstxt;
  final int? maxlen;
  final void Function()? onSficonTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? inptype;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final void Function(String)? onfieldsubmit;
  final void Function()? ontap;
  final int? minline;
  final int? maxline;
  final bool readOnly;
  final bool enabled;
  final bool autofocus; // ✅

  @override
  State<TextFormFieldWgt> createState() => _TextFormFieldWgtState();
}

class _TextFormFieldWgtState extends State<TextFormFieldWgt> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      autofocus: widget.autofocus, // ✅ Apply autofocus
      focusNode: widget.focusNode,
      textCapitalization: TextCapitalization.words,
      obscureText: widget.obstxt,
      maxLength: widget.maxlen,
      keyboardType: widget.inptype,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.obstxt ? 1 : widget.maxline,
      minLines: widget.minline,
      onTap: widget.ontap,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: widget.enabled ? Colors.black : Colors.grey.shade700,
        fontSize: 15.0,
      ),
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onfieldsubmit,
      validator: widget.validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        prefixIcon: widget.prxicon == null ? null : Icon(widget.prxicon),
        suffixIcon: widget.sfxicon == null
            ? null
            : IconButton(
          icon: Icon(widget.sfxicon),
          onPressed: widget.onSficonTap,
          color: widget.sfxcolor,
        ),
        contentPadding: const EdgeInsets.all(10),
        hintText: widget.hinttext,
        label: Text(widget.hinttext),
        counterText: '',
        filled: true,
        fillColor: widget.enabled ? Colors.white : Colors.grey.shade200,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.5),
          fontSize: 15.0,
        ),
      ),
    );
  }
}
