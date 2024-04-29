import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:processo_selecao_iesde/features/catalog/UI/product_tile_widget.dart';
import 'package:processo_selecao_iesde/features/catalog/bloc/catalog_bloc.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  void initState() {
    catalogBloc.add(CatalogInitialEvent());
    super.initState();
  }

  final CatalogBloc catalogBloc = CatalogBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatalogBloc, CatalogState>(
      bloc: catalogBloc,
      listenWhen: (previous, current) => current is CatalogActionState,
      buildWhen: (previous, current) => current is! CatalogActionState,
      listener: (context, state) {
        if (state is CatalogNavToCartAction) {
          GoRouter.of(context).go('/Cart');
        } 
        else if (state is CatalogProductItemCartActionState){
          ScaffoldMessenger.of(context).showSnackBar((const SnackBar(content: Text('Item Carted'))));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CatalogloadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case CatalogLoadedSuccessState:
            final successState = state as CatalogLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 143, 90, 187),
                title: const Text('Catálogo de Produtos'),
                actions: [
                  IconButton(
                      onPressed: () {
                        catalogBloc.add(CatalogCartNavEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                return ProductTileWidget(
                    catalogBloc: catalogBloc,
                    catalogDataModel: successState.products[index]);
              }),
            );
          case CatalogErrorState:
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}