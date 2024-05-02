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



