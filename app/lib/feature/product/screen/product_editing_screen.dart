import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/user_state_listener.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../app/widget/shared/scrollable_content_wrapper.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';
import '../widget/form/product_form.dart';

@RoutePage()
class ProductEditingScreen extends StatelessWidget {
  // Look at example: https://pub.dev/packages/auto_route#passing-arguments
  // ignore: use_key_in_widget_constructors
  const ProductEditingScreen({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void editProduct(Product product) =>
        context.read<UserBloc>().add(ProductEdited(editedProduct: product));

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(
        title: text.editProduct,
        backRoute: const ProductListRoute(),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: userStateListener,
        child: ScrollableContentWrapper(
          child: Column(
            children: [
              Text(
                text.fillTheFormToEditTheProduct,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: ProductForm(
                  initialProduct: product,
                  onFormApply: editProduct,
                  actionButtonText: text.saveChanges,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
