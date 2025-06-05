import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../app/widget/shared/scrollable_content_wrapper.dart';
import '../../user/bloc/user_bloc.dart';
import '../widget/form/product_form.dart';

@RoutePage()
class ProductEditingScreen extends StatelessWidget {
  // Look at example: https://pub.dev/packages/auto_route#passing-arguments
  // ignore: use_key_in_widget_constructors
  const ProductEditingScreen({required this.product});

  final Product product;

  bool _listenWhenCallback(_, UserState currentState) =>
      !currentState.user!.products.contains(product);

  void _listenerCallback(BuildContext context, UserState state) {
    final messenger = ScaffoldMessenger.of(context);
    final text = S.of(context);

    if (state.status == UserStatus.error) {
      messenger.showSnackBar(
        SnackBar(content: Text(state.errorMessage!)),
      );
    }

    if (state.status == UserStatus.success) {
      messenger.showSnackBar(
        SnackBar(content: Text(text.productEdited)),
      );
      context.router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void editProductCallback(Product product) =>
        context.read<UserBloc>().add(ProductEdited(editedProduct: product));

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(title: text.editProduct),
      body: BlocListener<UserBloc, UserState>(
        listenWhen: _listenWhenCallback,
        listener: _listenerCallback,
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
                  onFormApply: editProductCallback,
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
