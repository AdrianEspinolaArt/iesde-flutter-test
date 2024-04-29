part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveItemEvent extends CartEvent {
  final CatalogDataModel itemToRemove;

  CartRemoveItemEvent(this.itemToRemove);

  List<Object> get props => [itemToRemove];
}