import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:processo_selecao_iesde/models/catalog_model.dart';

// Definindo os eventos relacionados ao catálogo
abstract class CatalogEvent {}

class AddToCart extends CatalogEvent {
  final Item item;
  final int quantity;

  AddToCart(this.item, this.quantity);
}

// Definindo os estados relacionados ao catálogo
abstract class CatalogState {}

class CatalogLoaded extends CatalogState {
  final CatalogModel catalog;

  CatalogLoaded(this.catalog);
}

class CatalogError extends CatalogState {
  final String message;

  CatalogError(this.message);
}

// Implementando o catálogo BLoC
class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogModel catalogModel;

  CatalogBloc(this.catalogModel) : super(CatalogLoaded(catalogModel));

  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is AddToCart) {
      // Lógica para adicionar o item ao carrinho com a quantidade selecionada
      // Você pode implementar a lógica de adição ao carrinho aqui
    }
  }
}
