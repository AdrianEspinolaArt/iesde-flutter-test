part of 'cart_bloc.dart';


abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<CatalogDataModel> cartItens;
  CartSuccessState({
    required this.cartItens,
    });
}   