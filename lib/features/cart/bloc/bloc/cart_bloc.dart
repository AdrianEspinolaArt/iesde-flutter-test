import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:processo_selecao_iesde/data/cart_itens.dart';
import 'package:processo_selecao_iesde/features/catalog/model/catalog_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent); 
    on<CartRemoveItemEvent>(_mapRemoveItemToState); // Adicionando manipulador de evento para CartRemoveItemEvent

  }


  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItens: cartItens));
  }
  
FutureOr<void> _mapRemoveItemToState(CartRemoveItemEvent event, Emitter<CartState> emit) {
  if (state is CartSuccessState) {
    final updatedCartItems = List<CatalogDataModel>.from((state as CartSuccessState).cartItens);
    updatedCartItems.remove(event.itemToRemove);
    emit(CartSuccessState(cartItens: updatedCartItems));
  }
}
}  