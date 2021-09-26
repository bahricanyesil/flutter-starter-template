import 'package:flutter/material.dart';

import '../../../constants/border/shape_borders.dart';
import '../../../decoration/texts/text_form_styles.dart';
import '../../../extensions/context/context_extensions_shelf.dart';
import '../../texts/base_text.dart';

class MultipleChooseDialog extends StatefulWidget {
  final List<String> elements;
  final String title;
  final bool enableSearch;
  final List<String> initialSelecteds;
  const MultipleChooseDialog({
    required this.elements,
    required this.title,
    this.enableSearch = false,
    this.initialSelecteds = const <String>[],
    Key? key,
  }) : super(key: key);

  @override
  _MultipleChooseDialogState createState() => _MultipleChooseDialogState();
}

class _MultipleChooseDialogState extends State<MultipleChooseDialog> {
  String searchText = '';
  List<String> selectedTexts = <String>[];
  List<String> localList = const <String>[];

  @override
  void initState() {
    super.initState();
    localList = widget.elements;
    selectedTexts = <String>[...widget.initialSelecteds];
  }

  @override
  Widget build(BuildContext context) {
    getSearchResults();
    return Padding(
      padding: context.verticalMed,
      child: AlertDialog(
        title: BaseText(
          widget.title,
          style: context.headline4.copyWith(color: context.primaryColor),
        ),
        shape: ShapedBorders.roundedMedium,
        backgroundColor: context.canvasColor,
        contentPadding: context.lowMedEdgeInsets,
        actionsPadding: EdgeInsets.only(
            right: context.width * .3, bottom: context.height * 1),
        content: getContent(),
        actions: <Widget>[_getActionButton()],
      ),
    );
  }

  void getSearchResults() {
    localList = widget.elements
        .where(
            (String e) => e.toLowerCase().startsWith(searchText.toLowerCase()))
        .toList();
  }

  Widget getContent() => SizedBox(
        width: context.width * 22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (widget.enableSearch) _getSearchForm(),
            Expanded(child: _getList()),
          ],
        ),
      );

  Widget _getActionButton() => TextButton(
        onPressed: () => Navigator.of(context).pop(selectedTexts),
        child: BaseText(
          'OK',
          style: context.headline5.copyWith(color: context.primaryColor),
        ),
      );

  Widget _getList() => ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: localList.length > 30 ? 30 : localList.length,
        itemBuilder: _getSheetElement,
      );

  Widget _getSheetElement(BuildContext context, int index) => Padding(
        padding: EdgeInsets.only(top: context.height),
        child: Row(
          children: <Widget>[
            _getRadio(index),
            SizedBox(width: context.width * .5),
            _getGestureDetector(index),
          ],
        ),
      );

  Widget _getRadio(int index) {
    final bool isSelected = selectedTexts.contains(localList[index]);
    return Checkbox(
      value: isSelected,
      activeColor: context.primaryColor,
      checkColor: Colors.yellowAccent.withOpacity(.8),
      side: BorderSide(color: context.primaryLightColor.withOpacity(.8)),
      onChanged: (bool? val) {
        isSelected
            ? selectedTexts.remove(localList[index])
            : selectedTexts.add(localList[index]);
        setState(() {});
      },
    );
  }

  Widget _getGestureDetector(int index) => GestureDetector(
        onTap: () => selectedTexts.contains(localList[index])
            ? selectedTexts.remove(localList[index])
            : selectedTexts.add(localList[index]),
        child: BaseText(localList[index], style: context.headline5),
      );

  Widget _getSearchForm() => Padding(
        padding: context.bottomLowMed,
        child: TextField(
          onChanged: (String val) => setState(() => searchText = val),
          decoration: TextFormDeco(context).dialogText(hintText: 'Search'),
          style: context.headline5,
        ),
      );
}
