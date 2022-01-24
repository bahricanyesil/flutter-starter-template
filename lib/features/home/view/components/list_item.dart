part of '../home_screen.dart';

class _ListItem<T> extends StatefulWidget {
  const _ListItem({
    required this.data,
    required this.selectedColor,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);
  final T data;
  final bool isSelected;
  final Color selectedColor;

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
            colors: <Color>[_color, AppColors.white],

            /// Dummy for now.
            stops: selected ? <double>[1, 0] : <double>[1, 3],
          ),
        ),
        child: Padding(
          padding: context.horizontalPadding(Sizes.low),
          child: Row(children: List<Widget>.generate(3, _item)),
        ),
      );

  Color get _color => widget.selectedColor.lighten(.08);

  Widget _item(int k) => const Expanded(child: Text('Item'));

  void _onHover(_) => setState(() => isHovering = true);
  void _onExitHover(_) => setState(() => isHovering = false);
}
