import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:processo_selecao_iesde/data/cart_itens.dart';
import 'package:processo_selecao_iesde/data/products_data.dart';
import 'package:processo_selecao_iesde/features/catalog/model/catalog_model.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<CatalogInitialEvent>(catalogInitialEvent);
    on<CatalogCartNavEvent>(catalogCartNavEvent);
    on<CatalogCartButtonClickedEvent>(catalogCartButtonClickedEvent);
    on<CatalogAddQuantityItemToCart>(catalogAddQuantityItemToCart);
    on<CatalogOffQuantityItemToCart>(catalogOffQuantityItemToCart);

  }

  FutureOr<void> catalogInitialEvent(
      CatalogInitialEvent event, Emitter<CatalogState> emit) async {
    emit(CatalogLoadState());
    await Future.delayed(const Duration(seconds: 1));
    emit(CatalogLoadedSuccessState(
        products: ProductsData.products));
  }


  FutureOr<void> catalogCartNavEvent(
      CatalogCartNavEvent event, Emitter<CatalogState> emit) {
    emit(CatalogNavToCartAction());
  }


FutureOr<void> catalogCartButtonClickedEvent(
    CatalogCartButtonClickedEvent event, Emitter<CatalogState> emit) {
  cartItens.add(event.clickedProduct);
}

FutureOr<void> catalogAddQuantityItemToCart(
  CatalogAddQuantityItemToCart event, Emitter<CatalogState> emit) {
  // Encontra o índice do item no carrinho
  final index = cartItens.indexWhere((item) => item.id == event.addedItem.id);
  
  // Verifica se o item está presente no carrinho
  if (index != -1) {
    // Cria uma cópia do item com a quantidade incrementada
    final updatedItem = cartItens[index].copyWith(quantity: cartItens[index].quantity + 1);
    // Atualiza a lista de itens no carrinho com o novo item
    cartItens[index] = updatedItem;
  } else {
    // Se o item não estiver no carrinho, adiciona-o com quantidade 1
    final newItem = event.addedItem.copyWith(quantity: 1);
    cartItens.add(newItem);
  }
  
  // Emite o estado de carregamento para refletir a mudança
  emit(CatalogLoadState());
  // Emite o estado carregado atualizado
  emit(CatalogLoadedSuccessState(products: ProductsData.products));
}

FutureOr<void> catalogOffQuantityItemToCart(
  CatalogOffQuantityItemToCart event, Emitter<CatalogState> emit) {
  // Encontra o índice do item no carrinho
  final index = cartItens.indexWhere((item) => item.id == event.removeItem.id);
  
  // Verifica se o item está presente no carrinho
  if (index != -1) {
    // Cria uma cópia do item com a quantidade decrementada
    final updatedItem = cartItens[index].copyWith(quantity: cartItens[index].quantity - 1);
    // Atualiza a lista de itens no carrinho com o novo item
    cartItens[index] = updatedItem;
    
    // Se a quantidade for 0, remove o item do carrinho
    if (updatedItem.quantity == 0) {
      cartItens.removeAt(index);
    }
  }
  
  // Emite o estado de carregamento para refletir a mudança
  emit(CatalogLoadState());
  // Emite o estado carregado atualizado
  emit(CatalogLoadedSuccessState(products: ProductsData.products));
}
}
