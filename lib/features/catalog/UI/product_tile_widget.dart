import 'package:flutter/material.dart';
import 'package:processo_selecao_iesde/features/catalog/bloc/catalog_bloc.dart';
import 'package:processo_selecao_iesde/features/catalog/model/catalog_model.dart';

class ProductTileWidget extends StatelessWidget {
  final CatalogDataModel catalogDataModel;
  final CatalogBloc catalogBloc;

  const ProductTileWidget({
    Key? key,
    required this.catalogDataModel,
    required this.catalogBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/${catalogDataModel.image}'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              catalogDataModel.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(catalogDataModel.description),
            const SizedBox(
              height: 20,
            ),
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
                            catalogBloc.add(CatalogOffQuantityItemToCart(
                              removeItem: catalogDataModel,
                            ));
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          '${catalogDataModel.quantity}', // Exibir a quantidade atual do item
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            catalogBloc.add(CatalogAddQuantityItemToCart(
                              addedItem: catalogDataModel,
                            ));
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          catalogBloc.add(CatalogCartButtonClickedEvent(
                            clickedProduct: catalogDataModel,
                          ));
                        },
                        icon: const Icon(Icons.shopping_bag_outlined)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
