import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/user_state_listener.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';
import '../widget/form/product_form.dart';

@RoutePage()
class ProductCreatingScreen extends StatelessWidget {
  const ProductCreatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void addProduct(Product product) {
      context.read<UserBloc>().add(ProductAdded(newProduct: product));
    }

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(
        title: text.newProduct,
        backRoute: const ProductListRoute(),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: userStateListener,
        child: Column(
          children: [
            Text(
              text.fillTheFormToCreateANewProduct,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ProductForm(
                  onFormApply: addProduct,
                  actionButtonText: text.createProduct,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
