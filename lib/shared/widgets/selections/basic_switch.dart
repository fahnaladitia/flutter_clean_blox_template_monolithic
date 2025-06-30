part of '../widgets.dart';

class BasicSwitch extends StatefulWidget {
  final BasicSelectionController? controller;
  final ValueChanged<bool>? onChanged;
  final BasicSwitchType type;
  final BasicSelectionState state;
  final String? label;
  final bool isBackgroundColor;
  final Icon? activeIcon;
  final Icon? inactiveIcon;
  final Color? activeColor;
  final Color? activeBackgroundColor;
  final Color? inactiveColor;
  final Color? inactiveBackgroundColor;
  final double? elevation;

  const BasicSwitch._({
    super.key,
    this.controller,
    this.onChanged,
    required this.type,
    this.label,
    this.activeIcon,
    this.inactiveIcon,
    this.isBackgroundColor = true,
    this.activeColor,
    this.activeBackgroundColor,
    this.inactiveColor,
    this.inactiveBackgroundColor,
    this.elevation,
    required this.state,
  });

  const BasicSwitch.android({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         type: BasicSwitchType.android,
         onChanged: onChanged,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         state: state,
       );

  const BasicSwitch.ios({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         type: BasicSwitchType.ios,
         onChanged: onChanged,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         state: state,
       );

  const BasicSwitch.adaptive({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         type: BasicSwitchType.adaptive,
         onChanged: onChanged,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         state: state,
       );

  const BasicSwitch.icon({
    Key? key,
    BasicSelectionController? controller,
    ValueChanged<bool>? onChanged,
    String? label,
    Icon? activeIcon,
    Icon? inactiveIcon,
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    double? elevation,
    bool isBackgroundColor = true,
    BasicSelectionState state = BasicSelectionState.active,
  }) : this._(
         key: key,
         controller: controller,
         type: BasicSwitchType.icon,
         onChanged: onChanged,
         label: label,
         activeIcon: activeIcon,
         inactiveIcon: inactiveIcon,
         activeColor: activeColor,
         inactiveColor: inactiveColor,
         activeBackgroundColor: activeBackgroundColor,
         inactiveBackgroundColor: inactiveBackgroundColor,
         elevation: elevation,
         isBackgroundColor: isBackgroundColor,
         state: state,
       );

  @override
  State<BasicSwitch> createState() => _BasicSwitchState();
}

class _BasicSwitchState extends State<BasicSwitch> {
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
        final switchWidget = _buildSwitch(context);
        return Semantics(
          label: widget.label,
          checked: _isSelected,
          enabled: _state.isActive,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _toggle,
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
                switchWidget,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSwitch(BuildContext context) {
    switch (widget.type) {
      case BasicSwitchType.android:
        return _buildAndroidSwitch(context);
      case BasicSwitchType.ios:
        return _buildCupertinoSwitch(context);
      case BasicSwitchType.adaptive:
        return _buildAdaptiveSwitch(context);
      case BasicSwitchType.icon:
        return _buildIconSwitch(context);
    }
  }

  Widget _buildCupertinoSwitch(BuildContext context) {
    return CupertinoSwitch(
      applyTheme: true,
      value: _isSelected,
      activeTrackColor: widget.activeBackgroundColor,
      inactiveTrackColor: widget.inactiveBackgroundColor,
      thumbIcon: _getIcon(context),
      onChanged: _state.isActive ? (bool value) => _toggle() : null,
    );
  }

  Switch _buildAndroidSwitch(BuildContext context) {
    return Switch(
      value: _isSelected,
      activeTrackColor: widget.activeBackgroundColor,
      inactiveTrackColor: widget.inactiveBackgroundColor,
      thumbIcon: _getIcon(context),
      onChanged: _state.isActive ? (bool value) => _toggle() : null,
    );
  }

  Widget _buildAdaptiveSwitch(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
        return _buildAndroidSwitch(context);
      case TargetPlatform.iOS:
        return _buildCupertinoSwitch(context);
      default:
        return _buildAndroidSwitch(context);
    }
  }

  Widget _buildIconSwitch(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        boxShadow: widget.elevation != null
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: widget.elevation!,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
        shape: BoxShape.circle,
        color: _getColorBackgroundIcon(context),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        splashRadius: 16,
        tooltip: widget.label,
        alignment: Alignment.center,
        iconSize: 28,
        isSelected: _isSelected,
        color: _getColorIcon(context),
        icon: _isSelected
            ? widget.activeIcon ??
                  const Icon(Icons.radio_button_checked_rounded)
            : widget.inactiveIcon ??
                  widget.activeIcon ??
                  const Icon(Icons.radio_button_unchecked),
        onPressed: _state.isActive ? () => _toggle() : null,
      ),
    );
  }

  Color _getColorBackgroundIcon(BuildContext context) {
    if (!widget.isBackgroundColor) {
      return Colors.transparent;
    }
    if (widget.activeBackgroundColor != null && _isSelected) {
      return widget.activeBackgroundColor!;
    }

    if (widget.inactiveBackgroundColor != null && !_isSelected) {
      return widget.inactiveBackgroundColor!;
    }

    if (_state.isDisabled) {
      if (_isDarkMode) {
        return Color(0xFF232429); // Disabled color
      }
      return Color(0xFFeeeff4); // Disabled color for light mode
    }

    if (_isDarkMode) {
      return _isSelected
          ? Theme.of(context).colorScheme.primary
          : Color(0xFF333439); // Inactive color
    }
    return _isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.12); // Inactive color
  }

  Color _getColorIcon(BuildContext context) {
    if (widget.activeColor != null && _isSelected) {
      return widget.activeColor!;
    }
    if (widget.inactiveColor != null && !_isSelected) {
      return widget.inactiveColor!;
    }

    if (_state.isDisabled) {
      if (_isDarkMode) {
        return Colors.white.withValues(alpha: 0.48); // Disabled color
      }
      return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38);
    }

    if (!widget.isBackgroundColor) {
      return _isSelected
          ? Theme.of(context).colorScheme.primary
          : Colors.white.withValues(alpha: 0.38); // Inactive color
    }

    return Colors.white; // Active color
  }

  WidgetStateProperty<Icon?>? _getIcon(BuildContext context) {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (_isSelected) {
        final activeIconData = widget.activeIcon?.icon;
        if (widget.activeColor != null) {
          return Icon(activeIconData, color: _getColorIcon(context));
        }
        return widget.activeIcon;
      }

      if (_isSelected == false || _state.isDisabled) {
        final inactiveIconData = widget.inactiveIcon?.icon;
        if (widget.inactiveColor != null) {
          return Icon(inactiveIconData, color: _getColorIcon(context));
        }
        return widget.inactiveIcon;
      }

      return null;
    });
  }
}
