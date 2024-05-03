part of 'cart_bloc.dart';


abstract class CartState {
  get cartItens => null;
}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  @override
  final List<CatalogDataModel> cartItens;
  CartSuccessState({
    required this.cartItens,
    });
}    