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
}
