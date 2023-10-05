part of 'update_cubit_cubit.dart';

class UpdateCubitState {}

class UpdateCubitInitial extends UpdateCubitState {}

class UpdateCubitloading extends UpdateCubitState {}

class UpdateCubitIsuccess extends UpdateCubitState {}

class UpdateCubitfailuer extends UpdateCubitState {
  final String message;

  UpdateCubitfailuer({required this.message});
}
