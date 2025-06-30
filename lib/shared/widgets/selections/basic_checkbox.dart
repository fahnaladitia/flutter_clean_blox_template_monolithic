part of '../widgets.dart';

class BasicCheckbox extends StatefulWidget {
  final BasicSelectionController? controller;
  final ValueChanged<bool>? onChanged;
  final BasicCheckboxType type;
  final BasicSelectionState state;
  final String? label;
  final Color? checkColor;
  final Color? backgroundColor;
  const BasicCheckbox._({
    super.key,
    required this.controller,
    this.onChanged,
    required this.type,
    this.label,
    this.checkColor,
    this.backgroundColor,
    required this.state,
  });

  const BasicCheckbox.android({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         onChanged: onChanged,
         type: BasicCheckboxType.android,
         state: state,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
       );

  const BasicCheckbox.ios({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         onChanged: onChanged,
         type: BasicCheckboxType.ios,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
         state: state,
       );

  const BasicCheckbox.adaptive({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Color? checkColor,
    Color? backgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         onChanged: onChanged,
         type: BasicCheckboxType.adaptive,
         label: label,
         checkColor: checkColor,
         backgroundColor: backgroundColor,
         state: state,
       );

  @override
  State<BasicCheckbox> createState() => _BasicCheckboxState();
}

class _BasicCheckboxState extends State<BasicCheckbox> {
  late BasicSelectionController _controller;

  bool get _isDarkMode => Theme.of(context).brightness == Brightness.dark;
  bool get _isSelected => _controller.state;
  BasicSelectionState get _state => widget.state;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? BasicSelectionController();
  }

  void _toggle() {
    if (_state.isDisabled) return;
    _controller.toggle();
    widget.onChanged?.call(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicSelectionController, bool>(
      bloc: _controller,
      builder: (context, _) {
        final labelText = widget.label;
        final checkWidget = _buildCheck(context);
        return Semantics(
          label: labelText,
          checked: _isSelected,
          enabled: _state.isActive,
          child: GestureDetector(
            onTap: _toggle,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: labelText != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: labelText != null
                  ? MainAxisSize.max
                  : MainAxisSize.min,
              children: [
                if (labelText != null)
                  Padding(
                    padding: 16.edgeRight,
                    child: Text(
                      labelText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _state.isDisabled
                            ? Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.38)
                            : null,
                      ),
                    ),
                  ),
                checkWidget,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheck(BuildContext context) {
    final checkColor =
        widget.checkColor ??
        (_isDarkMode ? Theme.of(context).colorScheme.primary : Colors.white);
    final backgroundColor =
        widget.backgroundColor ??
        (_isDarkMode
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.primary);

    double desiredSize = 24.0;

    switch (widget.type) {
      case BasicCheckboxType.android:
        return _buildAndroidCheckbox(desiredSize, checkColor, backgroundColor);
      case BasicCheckboxType.ios:
        return _buildiOSCheckbox(desiredSize, checkColor, backgroundColor);
      case BasicCheckboxType.adaptive:
        return _buildAdaptiveCheckbox(desiredSize, checkColor, backgroundColor);
    }
  }

  Transform _buildAdaptiveCheckbox(
    double desiredSize,
    Color checkColor,
    Color backgroundColor,
  ) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
        return _buildAndroidCheckbox(desiredSize, checkColor, backgroundColor);
      case TargetPlatform.iOS:
        return _buildiOSCheckbox(desiredSize, checkColor, backgroundColor);
      default:
        return _buildAndroidCheckbox(desiredSize, checkColor, backgroundColor);
    }
  }

  Transform _buildiOSCheckbox(
    double desiredSize,
    Color checkColor,
    Color backgroundColor,
  ) {
    return Transform.scale(
      scale: desiredSize / 18.0,
      child: CupertinoCheckbox(
        value: _isSelected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onChanged: _state.isDisabled ? null : (value) => _toggle(),
        checkColor: checkColor,
        activeColor: backgroundColor,
      ),
    );
  }

  Transform _buildAndroidCheckbox(
    double desiredSize,
    Color checkColor,
    Color backgroundColor,
  ) {
    return Transform.scale(
      scale: desiredSize / 24.0,
      child: Checkbox(
        value: _isSelected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onChanged: _state.isDisabled ? null : (value) => _toggle(),
        checkColor: checkColor,
        activeColor: backgroundColor,
      ),
    );
  }
}
