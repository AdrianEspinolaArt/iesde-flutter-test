part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartAddItemEvent extends CartEvent{}

class CartRemoveItemEvent extends CartEvent {
  final CatalogDataModel itemToRemove;

  CartRemoveItemEvent(this.itemToRemove);
}

class PlusItemInCart extends CartEvent{
        final CatalogDataModel plusItem;

  PlusItemInCart({
    required this.plusItem});
}

class OffItemInCart extends CartEvent{
      final CatalogDataModel offItem;

  OffItemInCart({
    required this.offItem});
}