part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  
  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}
