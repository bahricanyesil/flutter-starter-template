part of '../home_screen.dart';

class _ListItem<T> extends StatefulWidget {
  const _ListItem({
    required this.data,
    this.selectedColor,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);
  final T data;
  final bool isSelected;
  final Color? selectedColor;

  @override
  State<_ListItem<T>> createState() => _ListItemState<T>();
}

class _ListItemState<T> extends State<_ListItem<T>> {
  bool isHovering = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    selected = widget.isSelected || isHovering;
    return kIsWeb
        ? MouseRegion(
            onEnter: _onHover,
            onExit: _onExitHover,
            child: _decoratedItemWrapper,
          )
        : Listener(
            onPointerDown: _onHover,
            onPointerUp: _onExitHover,
            child: _decoratedItemWrapper,
          );
  }

  Widget get _decoratedItemWrapper => DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: <Color>[
              _color ?? context.primaryColor,
              context.primaryLightColor.darken(.05)
            ],

            /// Dummy for now.
            stops: selected ? <double>[1, 0] : <double>[.2, 1],
          ),
        ),
        child: Padding(
          padding: context.allPadding(Sizes.low),
          child: Row(children: List<Widget>.generate(1, _item)),
        ),
      );

  Color? get _color => widget.selectedColor?.lighten(.08);

  Widget _item(int k) => Expanded(
      child: BaseText(widget.data.toString(),
          flatText: true, color: AppColors.white));

  void _onHover(_) => setState(() => isHovering = true);
  void _onExitHover(_) => setState(() => isHovering = false);
}
