part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {}

class CatalogInitialEvent extends CatalogEvent {}

class CatalogWishlistButtonClickedEvent extends CatalogEvent {
  final CatalogDataModel clickedProduct;

  CatalogWishlistButtonClickedEvent({
    required this.clickedProduct});
}

class CatalogCartButtonClickedEvent extends CatalogEvent {
    final CatalogDataModel clickedProduct;

  CatalogCartButtonClickedEvent({
    required this.clickedProduct});
}

class CatalogWishlistNavEvent extends CatalogEvent {}

class CatalogCartNavEvent extends CatalogEvent {}
