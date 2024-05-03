import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:processo_selecao_iesde/data/cart_itens.dart';
import 'package:processo_selecao_iesde/features/catalog/model/catalog_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveItemEvent>(cartRemoveItemEvent);
    on<PlusItemInCart>(plusItemInCart);
    on<OffItemInCart>(offItemInCart);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItens: cartItens));
  }

  FutureOr<void> cartRemoveItemEvent(
      CartRemoveItemEvent event, Emitter<CartState> emit) {
    cartItens.remove(event.itemToRemove);
    emit(CartSuccessState(cartItens: cartItens));
  }

  double calcularTotal(List<CatalogDataModel> cartItens) {
  double total = 0.0;
  for (var item in cartItens) {
    total += item.price * item.quantity;
  }
  return total;
}

FutureOr<void> plusItemInCart(
  PlusItemInCart event, Emitter<CartState> emit) {
  final updatedProduct = event.plusItem.copyWith(
    quantity: event.plusItem.quantity + 1,
  );

  // Encontrar o índice do item na lista
  final index = state.cartItens.indexWhere((item) => item.id == updatedProduct.id);

  if (index != -1) {
    // Atualizar a quantidade do item na lista
    state.cartItens[index] = updatedProduct;
  }

  emit(CartSuccessState(
    cartItens: state.cartItens,
  ));
}

FutureOr<void> offItemInCart(
  OffItemInCart event, Emitter<CartState> emit) {
  if (event.offItem.quantity > 1) {
    final updatedProduct = event.offItem.copyWith(
      quantity: event.offItem.quantity - 1,
    );

    // Encontrar o índice do item na lista
    final index = state.cartItens.indexWhere((item) => item.id == updatedProduct.id);

    if (index != -1) {
      // Atualizar a quantidade do item na lista
      state.cartItens[index] = updatedProduct;
    }
  }

  emit(CartSuccessState(
    cartItens: state.cartItens,
  ));
}

}
 