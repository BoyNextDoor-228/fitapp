import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/route_provider.dart';
import '../../../tool/user_state_listener.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../app/widget/navigation_floating_action_button.dart';
import '../../app/widget/shared/empty_list_label.dart';
import '../../app/widget/shared/shimmer_card.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';
import '../widget/product_list_item.dart';

@RoutePage()
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();
    final router = context.router;
    final cardHeight = MediaQuery.sizeOf(context).longestSide * 0.3;
    final text = S.of(context);

    return FitAppScaffold(
      floatingActionButton: const NavigationFloatingActionButton(
        route: ProductCreatingRoute(),
      ),
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.regularPage(title: text.productsList),
      body: BlocConsumer<UserBloc, UserState>(
        listener: userStateListener,
        bloc: userBloc,
        builder: (_, state) {
          final isLoading = state.status == UserStatus.loading;
          final products = state.user!.products;

          if (products.isEmpty) {
            return Center(
              child: EmptyListLabel(
                icon: const Icon(
                  Icons.no_food,
                  size: 100,
                ),
                elementsAbsenceText:
                    text.noProductsYetnPressPlusButtonToCreateANew,
              ),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (_, index) => isLoading
                ? ShimmerCard(cardHeight: cardHeight)
                : ProductListItem.editable(
                    product: products[index],
                    index: index + 1,
                    onDeletePressed: () => userBloc
                        .add(ProductDeleted(productId: products[index].id)),
                    onEditPressed: () async => goToRoute(
                      router: router,
                      route: ProductEditingRoute(product: products[index]),
                    ),
                    itemDimension: cardHeight,
                  ),
          );
        },
      ),
    );
  }
}
