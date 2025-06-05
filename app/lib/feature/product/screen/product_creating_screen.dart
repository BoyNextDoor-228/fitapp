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
class ProductCreatingScreen extends StatelessWidget {
  const ProductCreatingScreen({super.key});

  bool _haveProductsUpdated(
    UserState previousState,
    UserState currentState,
  ) =>
      previousState.user!.products.length < currentState.user!.products.length;

  void _listenerCallback(BuildContext context, UserState state) {
    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar;
    final text = S.of(context);

    if (state.status == UserStatus.error) {
      showSnackBar(
        SnackBar(content: Text(state.errorMessage!)),
      );
    }

    if (state.status == UserStatus.success) {
      showSnackBar(
        SnackBar(content: Text(text.productAdded)),
      );
      context.router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void addProduct(Product product) {
      context.read<UserBloc>().add(ProductAdded(newProduct: product));
    }

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(title: text.newProduct),
      body: BlocListener<UserBloc, UserState>(
        listenWhen: _haveProductsUpdated,
        listener: _listenerCallback,
        child: ScrollableContentWrapper(
          child: Column(
            children: [
              Text(
                text.fillTheFormToCreateANewProduct,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: ProductForm(
                  onFormApply: addProduct,
                  actionButtonText: text.createProduct,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
