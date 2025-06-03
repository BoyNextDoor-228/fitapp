import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';

class FitAppDrawer extends StatelessWidget {
  const FitAppDrawer({super.key});

  List<DrawerNavigationItemInfo> _drawerNavigationItems(BuildContext context) {
    final text = S.of(context);

    return [
      DrawerNavigationItemInfo(
        itemName: text.home,
        itemImage: const Icon(Icons.home),
        itemRoute: const HomeRoute(),
      ),
      DrawerNavigationItemInfo(
        itemName: text.trainings,
        itemImage: const Icon(Icons.abc),
        itemRoute: const TrainingRootRoute(),
      ),
      DrawerNavigationItemInfo(
        itemName: text.meals,
        itemImage: const Icon(Icons.abc),
        itemRoute: const MealRootRoute(),
      ),
      DrawerNavigationItemInfo(
        itemName: text.products,
        itemImage: const Icon(Icons.fastfood_sharp),
        itemRoute: const ProductRootRoute(),
      ),
      DrawerNavigationItemInfo(
        itemName: text.settings,
        itemImage: const Icon(Icons.settings),
        itemRoute: const SettingsRoute(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final userWeight = context.read<UserBloc>().state.user!.weight;
    final text = S.of(context);

    return Stack(
      children: [
        Drawer(
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: const SizedBox.expand(),
              ),
              Column(
                children: [
                  DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 25,
                          top: 25,
                          child: Icon(Icons.ac_unit_sharp),
                        ),
                        Positioned.directional(
                          bottom: 25,
                          end: 25,
                          textDirection: TextDirection.ltr,
                          child: Text(text.yourCurrentWeightN(userWeight)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _drawerNavigationItems(context).length,
                      itemBuilder: (context, index) => DrawerNavigationItem(
                        info: _drawerNavigationItems(context)[index],
                        isSelected: context.router.current.parent?.name ==
                            _drawerNavigationItems(context)[index]
                                .itemRoute
                                .routeName,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(text.exit),
                    leading: const Icon(Icons.close),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DrawerNavigationItemInfo {
  const DrawerNavigationItemInfo({
    required this.itemName,
    required this.itemImage,
    required this.itemRoute,
  });

  /// Text which will be displayed in drawer item.
  final String itemName;

  /// Image which will be displayed in drawer item.
  ///
  /// If [Null], default image will be applied.
  final Widget? itemImage;

  /// Navigation route, which user will be directed to, when this drawer image
  /// selected.
  final PageRouteInfo itemRoute;
}

class DrawerNavigationItem extends StatelessWidget {
  const DrawerNavigationItem({
    required this.info,
    required this.isSelected,
    super.key,
  });

  /// Full information about current drawer item.
  final DrawerNavigationItemInfo info;

  /// Determines, if current drawer item is the selected one among other items.
  final bool isSelected;

  @override
  Widget build(BuildContext context) => ListTile(
        selected: isSelected,
        title: Text(info.itemName),
        leading: info.itemImage,
        onTap: () async {
          context.router.pop();
          await context.router.push(info.itemRoute);
        },
      );
}
