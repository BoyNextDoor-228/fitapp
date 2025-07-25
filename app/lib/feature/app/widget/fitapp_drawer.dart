import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/route_provider.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';

class FitAppDrawer extends StatelessWidget {
  /// Creates a [Drawer], designed for FitApp application.
  const FitAppDrawer({super.key});

  /// Items to be displayed in [Drawer]'s navigation list;
  List<DrawerNavigationItemInfo> _drawerNavigationItems(S text) => [
        DrawerNavigationItemInfo(
          itemName: text.home,
          itemImage: const Icon(Icons.home),
          itemRoute: const HomeRootRoute(),
        ),
        DrawerNavigationItemInfo(
          itemName: text.trainings,
          itemImage: const Icon(Icons.sports),
          itemRoute: const TrainingRootRoute(),
        ),
        DrawerNavigationItemInfo(
          itemName: text.meals,
          itemImage: const Icon(Icons.fastfood),
          itemRoute: const MealRootRoute(),
        ),
        DrawerNavigationItemInfo(
          itemName: text.products,
          itemImage: const Icon(Icons.cookie),
          itemRoute: const ProductRootRoute(),
        ),
        DrawerNavigationItemInfo(
          itemName: text.settings,
          itemImage: const Icon(Icons.settings),
          itemRoute: const SettingsRootRoute(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final userWeight = context.read<UserBloc>().state.user!.weight;
    final text = S.of(context);

    return Drawer(
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
                child: Center(child: Text(text.yourCurrentWeightN(userWeight))),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _drawerNavigationItems(text).length,
                  itemBuilder: (context, index) => DrawerNavigationItem(
                    info: _drawerNavigationItems(text)[index],
                    isSelected: context.router.current.parent?.name ==
                        _drawerNavigationItems(text)[index].itemRoute.routeName,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(text.exit),
                leading: const Icon(Icons.close),
                onTap: _closeApplication,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _closeApplication() async =>
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

class DrawerNavigationItemInfo {
  /// Information of a [Drawer] navigation item.
  ///
  /// [itemName] is a text which will be displayed in drawer item.
  /// [itemImage] is an image, which will be displayed in drawer item.
  /// If [Null], default image will be applied.
  /// [itemRoute] is a navigation route, which user will be directed to.
  const DrawerNavigationItemInfo({
    required this.itemName,
    required this.itemImage,
    required this.itemRoute,
  });

  final String itemName;
  final Widget? itemImage;
  final PageRouteInfo itemRoute;
}

class DrawerNavigationItem extends StatelessWidget {
  /// Creates an item to be displayed in [Drawer] navigation.
  ///
  /// [info] is a full information about current drawer item.
  /// [isSelected] determines, if current drawer item is the selected one among
  /// other items.
  const DrawerNavigationItem({
    required this.info,
    required this.isSelected,
    super.key,
  });

  final DrawerNavigationItemInfo info;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final router = context.router;

    return ListTile(
      selected: isSelected,
      title: Text(info.itemName),
      leading: info.itemImage,
      onTap: () async => goToRoute(router: router, route: info.itemRoute),
    );
  }
}
