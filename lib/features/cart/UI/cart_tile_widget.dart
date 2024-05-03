import 'package:flutter/material.dart';
import 'package:processo_selecao_iesde/features/cart/bloc/cart_bloc.dart';
import 'package:processo_selecao_iesde/features/catalog/model/catalog_model.dart';

class CartTileWidget extends StatelessWidget {
  final CatalogDataModel catalogDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.catalogDataModel, required this.cartBloc});

@override
Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.black
        )
      )
      ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150, // Ajuste a largura da imagem conforme necessário
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/${catalogDataModel.image}'),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ), // Espaço entre a imagem e os detalhes descritivos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        catalogDataModel.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                        cartBloc.add(CartRemoveItemEvent(catalogDataModel));
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(catalogDataModel.description),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${catalogDataModel.price}"),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Reduzir a quantidade
                              // Implemente sua lógica aqui
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                  '${catalogDataModel.quantity}', // Exibir a quantidade atual do item
                  style: const TextStyle(fontSize: 16),
                ),
                          IconButton(
                            onPressed: () {
                              // Aumentar a quantidade
                              // Implemente sua lógica aqui
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}

}
