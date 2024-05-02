import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:processo_selecao_iesde/features/cart/UI/cart_tile_widget.dart';
import 'package:processo_selecao_iesde/features/cart/bloc/cart_bloc.dart';

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
        title: const Text('Carrinho', 
        style: TextStyle(
          fontSize: 40,
        ) 
        
        ),
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
    case const (CartSuccessState):
      final successState = state as CartSuccessState;
      final total = cartBloc.calcularTotal(successState.cartItens);
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 80,
            width: double.maxFinite,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Total:', // Formatando para exibir 2 casas decimais
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${total.toStringAsFixed(2)}', // Formatando para exibir 2 casas decimais
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: successState.cartItens.length,
              itemBuilder: (context, index) {
                return CartTileWidget(
                  cartBloc: cartBloc,
                  catalogDataModel: successState.cartItens[index],
                );
              },
            ),
          ),

           SizedBox(
            width: 400,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(
                onPressed: (){}, 
                child: const Text('Finalizar Compra')
                ),
             ),
           ),
        ],
      );
    default:
      return Container();
  }
}
    ));}}