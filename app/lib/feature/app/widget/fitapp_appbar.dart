import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'appbar_back_button.dart';
import 'appbar_burger_menu_button.dart';

class FitappAppbar extends StatelessWidget implements PreferredSizeWidget {
  FitappAppbar.innerPage({
    required String title,
    required PageRouteInfo backRoute,
    super.key,
  })  : _title = title,
        _leading = AppbarBackButton(route: backRoute);

  const FitappAppbar.regularPage({
    required String title,
    super.key,
  })  : _title = title,
        _leading = const AppbarBurgerMenuButton();

  /// Title, which will be displayed in Appbar.
  final String _title;

  /// Widget, which will be displayed as leading widget in Appbar.
  final Widget _leading;

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          _title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: _leading,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
