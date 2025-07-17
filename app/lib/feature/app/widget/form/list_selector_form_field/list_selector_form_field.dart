// import 'package:flutter/material.dart';
//
// import 'list_selector_field.dart';
//
// /// This widget represents a custom [FormField], which represents a list of [T],
// /// where each element can be selected.
// ///
// /// [sourceList] is a list of [T] elements, which will be displayed. By default,
// /// all items are not selected.
// ///
// /// If you want some of elements to be selected, pass [selectableList], which is
// /// [Map] of [T]:[bool]. [T] is an object, which represents element of a list,
// /// and [bool] determines if this element is selected.
// ///
// /// Example: we have a [List] of [String]-s:
// ///
// /// ```dart
// ///  final planets = ['Mercury', 'Venus', 'Earth', 'Mars'];
// /// ```
// ///
// /// ... and we want Venus and Earth to be selected, so we have to do this:
// ///
// /// ```dart
// /// final selectableList = <String, bool>{
// ///   'Mercury': false,
// ///   'Venus': true,
// ///   'Earth': true,
// ///   'Mars': false,
// /// };
// /// ```
// /// So that 'Venus' and 'Earth' will be selected in [FormField].
// /// NOTE!!! Make sure you mentioned all possible selectable elements in
// /// [selectableList]. It is better to produce a [selectableList] from
// /// [sourceList].
// ///
// /// [emptyListText] is a text, which will be displayed, if [sourceList] or
// /// [selectableList] are empty.
// /// Example:
// ///
// /// ```dart
// ///   ListSelectorFormField<String>(
// ///   ...
// ///   itemBuilder: (subject) =>
// ///     Text(subject + "and it's length is ${subject.length}"),
// ///   ...
// ///   );
// /// ```
// ///
// /// [itemBuilder] is a callback function, which receives [T] object as parameter
// /// and returns widget. Thus, you can specify, which widget will be displayed
// /// as content of a single selectable item of list.
// ///
// /// [onSaved] is a callback function, which gets called when [Form], this
// /// [FormField] is part of, is saved. Receives [List] of [T], which are
// /// elements, which were selected.
// ///
// class ListSelectorFormField<T> extends StatelessWidget {
//   const ListSelectorFormField({
//     required this.sourceList,
//     required this.emptyListText,
//     required this.itemBuilder,
//     required this.onSaved,
//     this.selectableList,
//     super.key,
//   });
//
//   final List<T> sourceList;
//   final Map<T, bool>? selectableList;
//   final String emptyListText;
//   final Widget Function(T subject) itemBuilder;
//   final void Function(List<T>?)? onSaved;
//
//   @override
//   Widget build(BuildContext context) => FormField<List<T>>(
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         onSaved: onSaved,
//         builder: (formState) => ListSelectorField<T>(
//           sourceList: sourceList,
//           selectableList: selectableList,
//           emptyListText: emptyListText,
//           itemBuilder: itemBuilder,
//           onChanged: (selectedItems) {
//             formState.didChange(selectedItems);
//           },
//         ),
//       );
// }
