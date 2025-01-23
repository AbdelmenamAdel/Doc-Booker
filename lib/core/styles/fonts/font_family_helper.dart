import 'package:markaz_elamal/core/services/shared_pref/pref_keys.dart';
import 'package:markaz_elamal/core/services/shared_pref/shared_pref.dart';

class FontFamilyHelper {
  // const FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';

  static const String poppinsEnglish = 'Poppins';
  static const String peraltaEnglish = 'Peralta';

  static String geLocalozedFontFamily() {
    final currentLanguage = SharedPref().getString(PrefKeys.language);
    if (currentLanguage == 'ar') {
      return peraltaEnglish;
    } else {
      return peraltaEnglish;
    }
  }
}
