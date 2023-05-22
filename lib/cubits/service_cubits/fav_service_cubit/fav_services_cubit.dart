import 'package:assignment1/cubits/service_cubits/fav_service_cubit/fav_services_states.dart';
import 'package:assignment1/models/service_model.dart';
import 'package:assignment1/modules/service/Functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavServicesCubit extends Cubit<FavServiceStates>{
  FavServicesCubit():super(FavServiceInitialState());
  static FavServicesCubit get(context)=>BlocProvider.of(context);
  List<ServiceModel> ?favServices;
  getFav () async{
    emit(GetFavServicesLoadingState());
    favServices = [];
    final res = await getFavServices();
    if (res.isNotEmpty){
      favServices = res;
    }
    emit(GetFavServicesSuccessState());
  }

  change(){
    emit(ChangeState());
  }
  bool find(id){
    bool result = false ;
    for (ServiceModel element in favServices!) {
      if (element.id==id){
        result = true;
      }
    }
    return result ;
  }
}