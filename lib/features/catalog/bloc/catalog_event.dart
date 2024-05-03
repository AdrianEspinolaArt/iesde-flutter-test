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

class AddItemToCart extends CatalogEvent{
  final CatalogDataModel addedItem;

  AddItemToCart({
    required this.addedItem});
  
}

class RemoveItemToCart extends CatalogEvent{
  final CatalogDataModel removeItem;

  RemoveItemToCart({
    required this.removeItem});

}

