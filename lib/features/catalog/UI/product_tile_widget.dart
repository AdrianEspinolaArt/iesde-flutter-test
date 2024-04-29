import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:processo_selecao_iesde/features/catalog/bloc/catalog_bloc.dart';
import 'package:processo_selecao_iesde/features/catalog/model/catalog_model.dart';

class ProductTileWidget extends StatelessWidget {
  final CatalogDataModel catalogDataModel;
  final CatalogBloc catalogBloc; 
  const ProductTileWidget({super.key, required this.catalogDataModel, required this.catalogBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${catalogDataModel.image}'),
                ),
            ),
          ),
          const SizedBox(height: 20,),
          Text(catalogDataModel.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10,),
          Text(catalogDataModel.description),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + catalogDataModel.price.toString()),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        catalogBloc.add(CatalogWishlistButtonClickedEvent(
                          clickedProduct: catalogDataModel,
                        ));
                      },
                      icon: const Icon(Icons.favorite_border)),
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
          Text(catalogDataModel.description),
          const SizedBox(height: 10,),
        ]
        ,
        ),
    );
  }
}