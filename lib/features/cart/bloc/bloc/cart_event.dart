part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveItemEvent extends CartEvent {
  final CatalogDataModel itemToRemove;

  CartRemoveItemEvent(this.itemToRemove);

  @override
  List<Object> get props => [itemToRemove];
}