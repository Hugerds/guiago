import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:guia_go/core/instance_manager/data/implementation/instance_manager.dart';
import 'package:guia_go/modules/go_now/data/models/motel_list_data_model.dart';
import 'package:guia_go/modules/go_now/data/models/motel_model.dart';
import 'package:guia_go/modules/go_now/domain/use_cases/get_motels_go_now_use_case.dart';

class GoNowProvider with ChangeNotifier {
  GoNowProvider() {
    initMethods();
  }

  void initMethods() {
    unawaited(getMotelList());
  }

  bool isLoading = false;
  MotelListDataModel? _motelListDataModel;

  MotelListDataModel? get motelListDataModel => _motelListDataModel;

  List<MotelModel> get motelList => _motelListDataModel?.moteis ?? [];

  List<MotelModel> get motelWithDiscountList => _motelListDataModel?.moteis?.where((e) => e.hasDiscount).toList() ?? [];

  void setMotelListDataModel(MotelListDataModel motelListDataModel) {
    _motelListDataModel = motelListDataModel;
    notifyListeners();
  }

  Future<void> getMotelList() async {
    try {
      isLoading = true;
      notifyListeners();
      final motelList = await instanceManager.resolve<IGetMotelsGoNowUseCase>().call();
      isLoading = false;
      notifyListeners();
      setMotelListDataModel(motelList);
    } on Exception catch (e) {
      isLoading = false;
      notifyListeners();
      log(e.toString());
    }
  }
}
