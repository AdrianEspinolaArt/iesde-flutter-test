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

}
