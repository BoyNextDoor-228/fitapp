// import 'package:flutter/material.dart';
//
// class ListSelectorField<T> extends StatefulWidget {
//   const ListSelectorField({
//     required this.sourceList,
//     required this.emptyListText,
//     required this.itemBuilder,
//     required this.onChanged,
//     this.selectableList,
//     super.key,
//   });
//
//   final List<T> sourceList;
//   final Map<T, bool>? selectableList;
//   final String emptyListText;
//   final Widget Function(T subject) itemBuilder;
//   final void Function(List<T> items) onChanged;
//
//   @override
//   State<ListSelectorField> createState() => _ListSelectorFieldState<T>();
// }
//
// class _ListSelectorFieldState<T> extends State<ListSelectorField<T>> {
//   late Map<T, bool> _selectableList;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Making initial Map<T, bool> from List<T>
//     _selectableList = widget.selectableList ??
//         {
//           for (final listItem in widget.sourceList) listItem: false,
//         };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_selectableList.isEmpty) {
//       return Center(
//         child: Text(widget.emptyListText),
//       );
//     }
//
//     return ColoredBox(
//       color: Colors.lightBlue,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2),
//         child: ListView.builder(
//           itemCount: _selectableList.length,
//           itemBuilder: (context, index) {
//             final selectableItem = _selectableList.entries.toList()[index];
//
//             return Row(
//               children: [
//                 Expanded(
//                   child: Checkbox(
//                     value: selectableItem.value,
//                     onChanged: (newValue) async {
//                       _updateSelectionList(newValue!, selectableItem.key);
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   flex: 9,
//                   child: widget.itemBuilder(selectableItem.key),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   void _updateSelectionList(bool newValue, T item) {
//     setState(() {
//       _selectableList = _selectableList.map(
//         (T key, bool value) =>
//             key == item ? MapEntry(key, newValue) : MapEntry(key, value),
//       );
//
//       widget.onChanged(_getSelectedItems());
//     });
//   }
//
//   List<T> _getSelectedItems() {
//     // Filtering only selected items from [_selectableList]
//     final selectedItems = Map<T, bool>.from(_selectableList)
//       ..removeWhere(
//         (_, value) => !value,
//       );
//
//     return selectedItems.keys.toList();
//   }
// }
