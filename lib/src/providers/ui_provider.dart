import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _selectedMeduOpt = 0;


  int get selectedMenuOpt{
    return this._selectedMeduOpt;
  }


  set selectedMenuOpt(int i){
    this._selectedMeduOpt = i;
    notifyListeners();
  }

}
