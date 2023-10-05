import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Services/Upadate_product.dart';

part 'update_cubit_state.dart';

class UpdateCubit extends Cubit<UpdateCubitState> {
  UpdateCubit() : super(UpdateCubitInitial());
  updateproudct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) {
    try {
      UpdateproudctServices().update(
          id: id,
          title: title,
          price: price,
          description: description,
          image: image,
          category: category);
      emit(UpdateCubitIsuccess());
    } on Exception catch (e) {
      emit(UpdateCubitfailuer(message: e.toString()));
    }
  }
}
