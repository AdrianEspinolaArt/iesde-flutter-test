part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartAddItemEvent extends CartEvent{}

class CartRemoveItemEvent extends CartEvent {
  final CatalogDataModel itemToRemove;

  CartRemoveItemEvent(this.itemToRemove);
}

 