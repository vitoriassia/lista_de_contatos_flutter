import 'package:interview_gigaservice_flutter/core/repositories/home_repository.dart';
import 'package:interview_gigaservice_flutter/pages/base_view_model.dart';
import 'package:interview_gigaservice_flutter/shared/enums.dart';
import 'package:interview_gigaservice_flutter/shared/models/contact_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeRepository _homeRepository = HomeRepository();

  List<ContactModel> _listContacts = [];
  List<ContactModel> get listContacts => _listContacts;
  setListContacts(List<ContactModel> newList) {
    _listContacts = newList;
    notifyListeners();
  }

  addMoreItemsContects(List<ContactModel> newList) {
    _listContacts.addAll(newList);
    notifyListeners();
  }

  bool _loadingMore = false;
  bool get loadingMore => _loadingMore;
  setLoadingMoreState(bool newState) {
    _loadingMore = newState;
    notifyListeners();
  }

  int pageListRoom = 1;

  Future<void> getContacts() async {
    setState(ViewState.busy);
    List<ContactModel> newList = await _homeRepository.getContacts();
    setListContacts(newList);
    setState(ViewState.idle);
  }

  Future<void> getMoreContacts() async {
    setLoadingMoreState(true);

    List<ContactModel> newList =
        await _homeRepository.getContacts(page: pageListRoom);
    pageListRoom++;
    addMoreItemsContects(newList);

    setLoadingMoreState(false);
  }
}
