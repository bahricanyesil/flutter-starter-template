import 'package:flutter/material.dart';

import '../../extensions/context/theme_extensions.dart';

/// Callback to inform about the change in the slider value.
typedef SliderCallback = void Function(double value);

/// Customized version of the built-in [Slider] widget.
class CustomizedSlider extends StatefulWidget {
  /// Default constructor for [CustomizedSlider].
  const CustomizedSlider({
    required this.values,
    this.initialValue,
    this.sliderCallback,
    Key? key,
  }) : super(key: key);

  /// List of available values in the slider.
  final List<double> values;

  /// Initial value of the slider.
  final double? initialValue;

  /// Callback to inform about the change in the slider value.
  final SliderCallback? sliderCallback;

  @override
  State<CustomizedSlider> createState() => _CustomizedSliderState();
}

class _CustomizedSliderState extends State<CustomizedSlider> {
  int _valueIndex = 0;

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: _sliderTheme(context),
        child: Slider(
          value: _valueIndex.toDouble(),
          activeColor: context.primaryColor,
          inactiveColor: context.primaryLightColor,
          max: widget.values.length - 1,
          divisions: widget.values.length - 1,
          label: widget.values[_valueIndex].toString(),
          thumbColor: context.primaryColor,
          onChanged: _onChanged,
        ),
      );

  void _onChanged(double value) {
    setState(() => _valueIndex = value.toInt());
    if (widget.sliderCallback != null) {
      widget.sliderCallback!(value);
    }
  }

  SliderThemeData _sliderTheme(BuildContext context) =>
      SliderTheme.of(context).copyWith(
        trackShape: const RoundedRectSliderTrackShape(),
        thumbShape: const _ThumbShape(),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 22),
        valueIndicatorColor: context.primaryColor,
        showValueIndicator: ShowValueIndicator.never,
      );
}

class _ThumbShape extends RoundSliderThumbShape {
  const _ThumbShape();

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    super.paint(
      context,
      center,
      activationAnimation: activationAnimation,
      enableAnimation: enableAnimation,
      sliderTheme: sliderTheme,
      value: value,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
      isDiscrete: isDiscrete,
      labelPainter: labelPainter,
      parentBox: parentBox,
      textDirection: textDirection,
    );
    const PaddleSliderValueIndicatorShape().paint(
      context,
      center,
      activationAnimation: const AlwaysStoppedAnimation<double>(1),
      enableAnimation: enableAnimation,
      labelPainter: labelPainter,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      value: value,
      textScaleFactor: .8,
      sizeWithOverflow: sizeWithOverflow,
      isDiscrete: isDiscrete,
      textDirection: textDirection,
    );
  }
}
