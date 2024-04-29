import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:processo_selecao_iesde/features/cart/UI/cart_tile_widget.dart';
import 'package:processo_selecao_iesde/features/cart/bloc/bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}
  
  class _CartState extends State<Cart> {
  final cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.displayMedium),
        actions: [
          IconButton(
            onPressed: (){
              GoRouter.of(context).go('/Catalog');
            }, 
            icon: const Icon(Icons.arrow_back)),
        ],
        
      ),
      body:BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
            final successState = state as CartSuccessState;
            return ListView.builder(
                itemCount: successState.cartItens.length,
                itemBuilder: (context, index) {
                return CartTileWidget(
                    cartBloc: cartBloc,
                    catalogDataModel: successState.cartItens[index]);
              });
            default:
          }
          return Container();
        },
      )
      
    );
  }
  }

