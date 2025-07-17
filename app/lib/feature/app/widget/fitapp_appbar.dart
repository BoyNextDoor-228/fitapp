import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'appbar_back_button.dart';
import 'appbar_burger_menu_button.dart';

class FitappAppbar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a Material [AppBar], which takes place in a inner pages.
  ///
  /// 'Inner page' means it is a secondary page relating to another page.
  /// [AppBar] of an 'inner page' has a leading button, which redirects to
  /// [backRoute] on tap action.
  ///
  /// [title] is a text, which is displayed as [AppBar] title.
  /// [trailing] is a [Widget], which is displayed after [AppBar]'s title.
  FitappAppbar.innerPage({
    required String title,
    required PageRouteInfo backRoute,
    Widget? trailing,
    super.key,
  })  : _title = title,
        _leading = AppbarBackButton(route: backRoute),
        _trailing = trailing;

  /// Creates a Material [AppBar], which takes place in a regular pages.
  ///
  /// 'Regular page' means it is a primary page of a feature.
  /// [AppBar] of an 'regular page' has a leading button, which opens [Drawer]
  /// on tap action.
  ///
  /// [title] is a text, which is displayed as [AppBar] title.
  /// [trailing] is a [Widget], which is displayed after [AppBar]'s title.
  const FitappAppbar.regularPage({
    required String title,
    Widget? trailing,
    super.key,
  })  : _title = title,
        _leading = const AppbarBurgerMenuButton(),
        _trailing = trailing;

  /// Title, which will be displayed in Appbar.
  final String _title;

  /// Widget, which will be displayed as leading widget in Appbar.
  final Widget _leading;

  /// Widget, which will be displayed as trailing widget in Appbar.
  final Widget? _trailing;

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          _title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: _leading,
        actions: _trailing == null ? null : [_trailing!],
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
