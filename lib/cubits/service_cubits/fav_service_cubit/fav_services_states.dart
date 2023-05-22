import 'package:assignment1/models/service_model.dart';

abstract class FavServiceStates {}
class FavServiceInitialState extends FavServiceStates{}
class GetFavServicesLoadingState extends FavServiceStates{}
class GetFavServicesSuccessState extends FavServiceStates{}
class ChangeState extends FavServiceStates{}
