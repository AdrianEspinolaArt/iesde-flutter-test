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
        products: ProductsData.products, cartItems: const []));
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
  final index = cartItens.indexWhere((item) => item.id == event.addedItem.id);
  
  if (index != -1) {
    final updatedItem = cartItens[index].copyWith(quantity: cartItens[index].quantity + 1);
    cartItens[index] = updatedItem;
  } else {
    final newItem = event.addedItem.copyWith(quantity: 1);
    cartItens.add(newItem);
  }
  
  emit(CatalogLoadedSuccessState(products: ProductsData.products, cartItems: cartItens)); // Emitir um novo estado com a lista atualizada de produtos e itens no carrinho
}

FutureOr<void> catalogOffQuantityItemToCart(
  CatalogOffQuantityItemToCart event, Emitter<CatalogState> emit) {
  final index = cartItens.indexWhere((item) => item.id == event.removeItem.id);
  
  if (index != -1) {
    final updatedItem = cartItens[index].copyWith(quantity: cartItens[index].quantity - 1);
    cartItens[index] = updatedItem;
    
    if (updatedItem.quantity == 0) {
      cartItens.removeAt(index);
    }
  }
  
  emit(CatalogLoadedSuccessState(products: ProductsData.products, cartItems: cartItens)); // Emitir um novo estado com a lista atualizada de produtos e itens no carrinho
}
}
