import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../app/widget/navigation_floating_action_button.dart';
import '../../app/widget/shared/empty_list_label.dart';
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
    final height = MediaQuery.sizeOf(context).height;
    final text = S.of(context);

    return FitAppScaffold(
      floatingActionButton: const NavigationFloatingActionButton(
        route: ProductCreatingRoute(),
      ),
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.regularPage(title: text.productsList),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (_, state) {
          if (state.status == UserStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

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
            itemCount: products.length,
            itemBuilder: (_, index) => ProductListItem.editable(
              product: products[index],
              index: index + 1,
              onDeletePressed: () =>
                  userBloc.add(ProductDeleted(productId: products[index].id)),
              onEditPressed: () async => router.navigate(
                ProductEditingRoute(product: products[index]),
              ),
              itemDimension: height / 4,
            ),
          );
        },
      ),
    );
  }
}
