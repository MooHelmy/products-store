import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Services/get_all_products.dart';

import '../../Models/Prodects_Model.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());
  getproduct() async {
    emit(HomeCubitloading());
    try {
      List<ProductModel> productlist =
          await AllProudctServices().getallproduct();
      emit(HomeCubitsuccess(productlist));
    } on Exception catch (e) {
      emit(HomeCubitfailuer(message: e.toString()));
    }
  }
}
