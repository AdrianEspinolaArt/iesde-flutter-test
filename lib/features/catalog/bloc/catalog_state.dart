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

class CatalogErrorState extends CatalogState{}

class CatalogNavToWishlistAction extends CatalogActionState{}

class CatalogNavToCartAction extends CatalogActionState{}

class CatalogProductItemWishlistActionState extends CatalogActionState{}

class CatalogProductItemCartActionState extends CatalogActionState{}