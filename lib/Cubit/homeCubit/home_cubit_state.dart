part of 'home_cubit_cubit.dart';

class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class HomeCubitloading extends HomeCubitState {}

class HomeCubitsuccess extends HomeCubitState {
  HomeCubitsuccess(this.productlist);
  List<ProductModel> productlist = [];
}

class HomeCubitfailuer extends HomeCubitState {
  final String message;

  HomeCubitfailuer({required this.message});
}
