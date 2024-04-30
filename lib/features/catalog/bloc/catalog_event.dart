part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {}

class CatalogInitialEvent extends CatalogEvent {}

class CatalogCartButtonClickedEvent extends CatalogEvent {
    final CatalogDataModel clickedProduct;

  CatalogCartButtonClickedEvent({
    required this.clickedProduct});
}

class CatalogCartNavEvent extends CatalogEvent {}


class CatalogOffQuantityItemToCart extends CatalogEvent{
  final CatalogDataModel removeItem;

  CatalogOffQuantityItemToCart({
    required this.removeItem});
}

class CatalogAddQuantityItemToCart extends CatalogEvent{
  final CatalogDataModel addedItem;

  CatalogAddQuantityItemToCart({
    required this.addedItem});
}

