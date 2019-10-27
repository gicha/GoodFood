part of blocs;

abstract class InitEvent {}

class InitInitEvent extends InitEvent {}

class ForceInitEvent extends InitEvent {}

enum InitState { notInitedLoading, noUser, loading, inited }

class InitBloc extends Bloc<InitEvent, InitState> {
  static InitBloc _instance;
  static InitBloc getInstance() {
    if (_instance == null) _instance = InitBloc();
    return _instance;
  }

  @override
  InitState get initialState => InitState.notInitedLoading;

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    if (event is InitInitEvent) {
      yield InitState.notInitedLoading;
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      if (Platform.isAndroid)
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
      else
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await init();
      WishBloc.getInstance().dispatch(FetchWishEvent());
      OrderBloc.getInstance().dispatch(FetchOrderEvent());
      fcm();
      sleep(const Duration(seconds: 2));
      yield InitState.noUser;
    }
    if (event is ForceInitEvent) yield InitState.inited;
  }

  init() async {
    await DataBase().open();
    initializeDateFormatting();
    Api.init();
  }

  fcm() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        WishBloc.getInstance().dispatch(FetchWishEvent());
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        WishBloc.getInstance().dispatch(FetchWishEvent());
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        WishBloc.getInstance().dispatch(FetchWishEvent());
      },
    );
    String token = await _firebaseMessaging.getToken();
    print("fcmToken: $token");
  }
}
