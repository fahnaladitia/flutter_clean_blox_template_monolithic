part of '../widgets.dart';

class BasicTextField extends StatefulWidget {
  final String field;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? hintText;
  final String? labelText;
  final TextCapitalization textCapitalization;
  final BasicTextFieldType type;
  final BasicTextFieldState state;
  final ValidationUIError? validationUIError;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const BasicTextField._({
    super.key,
    required this.field,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.hintText,
    this.labelText,
    this.textCapitalization = TextCapitalization.none,
    this.prefixIcon,
    this.suffixIcon,
    required this.type,
    this.state = BasicTextFieldState.active,
    this.validationUIError,
  });

  // Outlined text field preset
  const BasicTextField.outlined({
    Key? key,
    required String field,
    TextEditingController? controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool obscureText = false,
    bool readOnly = false,
    String? hintText,
    String? labelText,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Widget? prefixIcon,
    Widget? suffixIcon,
    BasicTextFieldState state = BasicTextFieldState.active,
    ValidationUIError? validationUIError,
  }) : this._(
         key: key,
         field: field,
         controller: controller,
         keyboardType: keyboardType,
         textInputAction: textInputAction,
         obscureText: obscureText,
         hintText: hintText,
         labelText: labelText,
         textCapitalization: textCapitalization,
         prefixIcon: prefixIcon,
         suffixIcon: suffixIcon,
         state: state,
         validationUIError: validationUIError,
         type: BasicTextFieldType.outlined,
       );

  // Underline text field preset
  const BasicTextField.underline({
    Key? key,
    required String field,
    TextEditingController? controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool obscureText = false,
    bool readOnly = false,
    String? hintText,
    String? labelText,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Widget? prefixIcon,
    Widget? suffixIcon,
    BasicTextFieldState state = BasicTextFieldState.active,
    ValidationUIError? validationUIError,
  }) : this._(
         key: key,
         field: field,
         controller: controller,
         keyboardType: keyboardType,
         textInputAction: textInputAction,
         obscureText: obscureText,
         hintText: hintText,
         labelText: labelText,
         textCapitalization: textCapitalization,
         prefixIcon: prefixIcon,
         suffixIcon: suffixIcon,
         state: state,
         validationUIError: validationUIError,
         type: BasicTextFieldType.underline,
       );

  @override
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  bool _isVisibility = false;
  ValidatorField? _validatorField;

  bool get isError =>
      _validatorField != null && _validatorField!.fieldName == widget.field;

  @override
  void initState() {
    super.initState();
    _isVisibility = widget.obscureText == false;
  }

  @override
  void didUpdateWidget(covariant BasicTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final validatorError = widget.validationUIError?.errors.firstWhereOrNull(
      (error) => error.fieldName == widget.field,
    );
    if (validatorError != null) {
      setState(() {
        _validatorField = validatorError;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case BasicTextFieldType.outlined:
        return _buildOutlinedTextField(context);
      case BasicTextFieldType.underline:
        return _buildUnderlineTextField(context);
    }
  }

  Widget _buildOutlinedTextField(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: 8.edgeBottom,
            child: Text(
              widget.labelText!,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        TextFormField(
          controller: widget.controller,
          readOnly: widget.state == BasicTextFieldState.disabled,
          obscureText: _isVisibility == false,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: isDarkMode ? Colors.black : null,
          ),
          onChanged: (value) {
            if (isError) {
              setState(() {
                _validatorField = null;
              });
            }
          },
          decoration: InputDecoration(
            hint: widget.hintText != null
                ? Text(
                    widget.hintText ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDarkMode ? Colors.black : null,
                    ),
                  )
                : null,
            fillColor: widget.state.isDisabled
                ? (isDarkMode ? Colors.grey[800] : Colors.grey[200])
                : const Color(0xFFFBFBFB),
            filled: true,
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixIcon(context),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: isError
                  ? BorderSide(color: Colors.red)
                  : widget.state.isDisabled
                  ? BorderSide.none
                  : BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: widget.state.isDisabled
                  ? BorderSide.none
                  : BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: isError
                  ? BorderSide(color: Colors.red)
                  : BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: widget.state.isDisabled
                  ? BorderSide.none
                  : BorderSide(
                      color: isError
                          ? Colors.red
                          : Theme.of(context).colorScheme.secondary,
                      width: 1.5,
                    ),
            ),
          ),
        ),
        if (isError)
          Padding(
            padding: 8.edgeTop,
            child: Text(
              _validatorField!.message,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.red),
            ),
          ),
      ],
    );
  }

  Widget _buildUnderlineTextField(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: widget.controller,
          readOnly: widget.state == BasicTextFieldState.disabled,
          obscureText: _isVisibility == false,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: isDarkMode ? Colors.black : null,
          ),
          onChanged: (value) {
            if (isError) {
              setState(() {
                _validatorField = null;
              });
            }
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            floatingLabelBehavior: widget.state == BasicTextFieldState.disabled
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.auto,
            labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: isDarkMode ? Colors.black : null,
            ),
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDarkMode ? Colors.black54 : null,
            ),
            fillColor: widget.state.isDisabled
                ? (isDarkMode ? Colors.grey[800] : Colors.grey[200])
                : const Color(0xFFFBFBFB),
            filled: true,
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixIcon(context),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: isError
                  ? const BorderSide(color: Colors.red)
                  : BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: isError
                  ? const BorderSide(color: Colors.red)
                  : BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: isError
                    ? Colors.red
                    : Theme.of(context).colorScheme.secondary,
                width: 1.5,
              ),
            ),
          ),
        ),
        if (isError)
          Padding(
            padding: 8.edgeTop,
            child: Text(
              _validatorField!.message,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.red),
            ),
          ),
      ],
    );
  }

  Widget _buildSuffixIcon(BuildContext context) {
    return widget.obscureText
        ? IconButton(
            icon: Icon(
              _isVisibility ? Icons.visibility : Icons.visibility_off,
              color: isError
                  ? Colors.red
                  : Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              setState(() {
                _isVisibility = !_isVisibility;
              });
            },
          )
        : widget.suffixIcon ?? const SizedBox.shrink();
  }
}
