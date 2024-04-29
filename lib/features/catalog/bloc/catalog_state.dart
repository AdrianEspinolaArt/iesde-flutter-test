part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {}


abstract class CatalogActionState extends CatalogState {}


class CatalogInitial extends CatalogState {}

class CatalogloadingState extends CatalogState{}

class CatalogLoadState extends CatalogState{}

class CatalogLoadedSuccessState extends CatalogState{
  final List<CatalogDataModel> products;
  CatalogLoadedSuccessState({
    required this.products,
  });
}

class CatalogError extends CatalogState{}

class CatalogNavToCartAction extends CatalogActionState{}

class CatalogProductItemCartActionState extends CatalogActionState{}

class CartState extends CatalogState {
  final List<CatalogDataModel> cartItems;
  copyWith({required int quantity}) {}
  CartState({required this.cartItems});
}