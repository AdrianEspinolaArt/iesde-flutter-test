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
    required this.products, required List<CatalogDataModel> cartItems,
  });
}

class CatalogError extends CatalogState{}

class CatalogUpdatedState extends CatalogState {
  final List<CatalogDataModel> products;

  CatalogUpdatedState(this.products);

  List<Object> get props => [products];
}

class CatalogNavToCartAction extends CatalogActionState{}

class CatalogProductItemCartActionState extends CatalogActionState{}
