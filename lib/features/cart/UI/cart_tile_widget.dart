import 'package:flutter/material.dart';
import 'package:processo_selecao_iesde/features/cart/bloc/bloc/cart_bloc.dart';
import 'package:processo_selecao_iesde/features/catalog/model/catalog_model.dart';

class CartTileWidget extends StatelessWidget {
  final CatalogDataModel catalogDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.catalogDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Row(
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
              width: 20), // Espaço entre a imagem e os detalhes descritivos
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
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Reduzir a quantidade
                                // Implemente sua lógica aqui
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            const Text(
                              '1', // Aqui você pode colocar a quantidade inicial ou vinculá-la a um contador
                              style: TextStyle(fontSize: 16),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
