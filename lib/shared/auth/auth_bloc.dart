import 'package:rxdart/rxdart.dart';

class AuthBloc {
  static AuthBloc? _instance;

  static AuthBloc getInstance() {
    if (_instance == null) {
      _instance = AuthBloc();
    }
    return _instance!;
  }

  AuthBloc() {
    this.statusOut = status.stream;
    this._statusIn = status.sink;
  }

  //?STREAMS
  var status = BehaviorSubject<bool>.seeded(false);
  late Stream<bool> statusOut;
  late Sink<bool> _statusIn;

  login() async {
    _statusIn.add(true);
  }

  logout() async {
    _statusIn.add(false);
  }

  void dispose() {
    status.close();
    _statusIn.close();
    _instance = null;
  }
}
