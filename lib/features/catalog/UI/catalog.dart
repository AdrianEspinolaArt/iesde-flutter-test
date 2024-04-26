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
        } else if (state is CatalogNavToWishlistAction) {
          GoRouter.of(context).go('/Wishlist');
        } 
        else if (state is CatalogProductItemCartActionState){
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text('Item Carted'))));
        }
        else if (state is CatalogProductItemWishlistActionState){
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text('Item wishlisted'))));
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
                backgroundColor: Color.fromARGB(255, 143, 90, 187),
                title: const Text('Catálogo de Produtos'),
                actions: [
                  IconButton(
                      onPressed: () {
                        catalogBloc.add(CatalogWishlistNavEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        catalogBloc.add(CatalogCartNavEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
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
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}


//   Widget _buildProductList(CatalogModel catalog) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, // Dois produtos por linha
//         crossAxisSpacing: 8.0, // Espaçamento horizontal entre os produtos
//         mainAxisSpacing: 8.0, // Espaçamento vertical entre os produtos
//         childAspectRatio: 0.7, // Proporção entre largura e altura dos produtos
//       ),
//       itemCount: catalog.length,
//       itemBuilder: (context, index) {
//         final item = catalog.getByPosition(index);
//         return Card(
//           margin: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   // Adicionando imagem do produto
//                   'assets/images/product_${item.id % 5}.png',
//                   width: 100,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 ),
//                 const SizedBox(height: 8.0),
//                 Text(
//                   item.name,
//                   style: const TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4.0),
//                 Text(
//                   '\$${item.price}',
//                   style: const TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green, // Exemplo de cor para o preço
//                   ),
//                 ),
//                 const SizedBox(height: 4.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Aqui vai a rota do cart
//                   },
//                   child: const Text('Adicionar ao Carrinho'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
