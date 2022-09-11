import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/local_handler.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
 static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

   themeToggle ({isDarkCached}){
    if(isDarkCached!=null)
     {
      isDark = isDarkCached;
      emit(ThemeModeToggleState());
     } else {
     isDark =! isDark;
     CacheHelper.setBool(key: 'isDark', value: isDark);
     emit(ThemeModeToggleState());
    }
  }
}