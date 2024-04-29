import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:processo_selecao_iesde/data/cart_itens.dart';
import 'package:processo_selecao_iesde/data/products_data.dart';
import 'package:processo_selecao_iesde/data/wishlist_itens.dart';
import 'package:processo_selecao_iesde/features/catalog/model/catalog_model.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<CatalogInitialEvent>(catalogInitialEvent);
    on<CatalogWishlistNavEvent>(catalogWishlistNavEvent);
    on<CatalogCartNavEvent>(catalogCartNavEvent);
    on<CatalogWishlistButtonClickedEvent>(catalogWishlistButtonClickedEvent);
    on<CatalogCartButtonClickedEvent>(catalogCartButtonClickedEvent);
  }

  FutureOr<void> catalogInitialEvent(
      CatalogInitialEvent event, Emitter<CatalogState> emit) async {
    emit(CatalogLoadState());
    await Future.delayed(const Duration(seconds: 1));
    emit(CatalogLoadedSuccessState(
        products: ProductsData.products
            .map((e) => CatalogDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                image: e['image']))
            .toList()));
  }

  FutureOr<void> catalogWishlistNavEvent(
      CatalogWishlistNavEvent event, Emitter<CatalogState> emit) {
    emit(CatalogNavToWishlistAction());
  }

  FutureOr<void> catalogCartNavEvent(
      CatalogCartNavEvent event, Emitter<CatalogState> emit) {
    emit(CatalogNavToCartAction());
  }

  FutureOr<void> catalogWishlistButtonClickedEvent(
      CatalogWishlistButtonClickedEvent event, Emitter<CatalogState> emit) {
    wishlistItens.add(event.clickedProduct);
    emit(CatalogProductItemWishlistActionState());
  }

  FutureOr<void> catalogCartButtonClickedEvent(
      CatalogCartButtonClickedEvent event, Emitter<CatalogState> emit) {
    cartItens.add(event.clickedProduct);
    emit(CatalogProductItemCartActionState());
  }
}
