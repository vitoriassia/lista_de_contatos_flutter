import 'package:interview_gigaservice_flutter/core/repositories/home_repository.dart';
import 'package:interview_gigaservice_flutter/pages/base_view_model.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/filter_for_gender/filter_for_gender_model.dart';
import 'package:interview_gigaservice_flutter/shared/enums.dart';
import 'package:interview_gigaservice_flutter/shared/models/contact_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeRepository _homeRepository = HomeRepository();

  List<ContactModel> _listContacts = [];
  List<ContactModel> get listContacts => _listContacts;
  setListContacts(List<ContactModel> newList) {
    _listContactsOriginal = newList;
    notifyListeners();
  }

  List<ContactModel> _listContactsOriginal = [];

  addMoreItemsContects(List<ContactModel> newList) {
    _listContactsOriginal.addAll(newList);
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
    _listContacts = _listContactsOriginal;
    setState(ViewState.idle);
  }

  Future<void> getMoreContacts() async {
    setLoadingMoreState(true);

    List<ContactModel> newList =
        await _homeRepository.getContacts(page: pageListRoom);
    pageListRoom++;
    addMoreItemsContects(newList);
    filterForGender();
    setLoadingMoreState(false);
  }

  void filterParticipantWithTextField(String search) {
    if (search.isEmpty) {
      _listContacts = _listContactsOriginal;
      filterForGender();
    } else {
      filterForGender();
      _listContacts = _listContacts
          .where((element) =>
              element.name.toLowerCase().contains(search) ||
              element.email.toLowerCase().contains(search))
          .toList();
    }
    notifyListeners();
  }

  FilterGenderModel _filterGenderMale = FilterGenderModel(Gender.male, true);
  FilterGenderModel get filterGenderMale => _filterGenderMale;
  setGenderSelectMale(bool newStatus) {
    _filterGenderMale.isSelected = newStatus;
    notifyListeners();
  }

  FilterGenderModel _filterGenderFemale =
      FilterGenderModel(Gender.female, true);
  FilterGenderModel get filterGenderFemale => _filterGenderFemale;
  setGenderSelectFemale(bool newStatus) {
    _filterGenderFemale.isSelected = newStatus;
    notifyListeners();
  }

  bool filterForGender() {
    if (!filterGenderMale.isSelected && !filterGenderFemale.isSelected) {
      return false;
    } else if (filterGenderMale.isSelected && filterGenderFemale.isSelected)
      _listContacts = _listContactsOriginal;
    else if (filterGenderMale.isSelected)
      _listContacts = listOnlyMale;
    else if (filterGenderFemale.isSelected) _listContacts = listOnlyFemale;
    notifyListeners();
    return true;
  }

  List<ContactModel> get listOnlyMale => _listContactsOriginal
      .where((element) => element.gender == Gender.male)
      .toList();
  List<ContactModel> get listOnlyFemale => _listContactsOriginal
      .where((element) => element.gender == Gender.female)
      .toList();
}
