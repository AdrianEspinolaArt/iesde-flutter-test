import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:processo_selecao_iesde/Bloc/catalog_bloc.dart';
import 'package:processo_selecao_iesde/models/catalog_model.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catalogBloc = BlocProvider.of<CatalogBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is CatalogLoaded) {
            final catalog = state.catalog;
            return _buildProductList(catalog);
          } else if (state is CatalogError) {
            return Center(
              child: Text('Erro ao carregar o catálogo: ${state.message}'),
            );
          } else {
            return Center(child: Text('Estado de catálogo desconhecido'));
          }
        },
      ),
    );
  }

Widget _buildProductList(CatalogModel catalog) {
  return ListView.builder(
    itemCount: catalog.length,
    itemBuilder: (context, index) {
      final item = catalog.getByPosition(index);
      return Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset( // Adicionando imagem do produto
                'assets/images/product_${item.id % 5}.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                '\$${item.price}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Exemplo de cor para o preço
                ),
              ),
              SizedBox(height: 4.0),
             
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/cart');
                },
                child: Text('Adicionar ao Carrinho'),
              ),
            ],
          ),
        ),
      );
    },
  );
}}