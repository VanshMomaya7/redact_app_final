import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_te.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('mr'),
    Locale('te'),
    Locale('ur')
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @login_heading.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get login_heading;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get signin;

  /// No description provided for @signup_txt.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get signup_txt;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get signup;

  /// No description provided for @signup_heading.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get signup_heading;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact No.'**
  String get contact;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm;

  /// No description provided for @signin_txt.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get signin_txt;

  /// No description provided for @slide1.
  ///
  /// In en, this message translates to:
  /// **'Click a picture or upload an image of your crop to get detailed insights'**
  String get slide1;

  /// No description provided for @slide2.
  ///
  /// In en, this message translates to:
  /// **'Disease identification and its cause'**
  String get slide2;

  /// No description provided for @slide3.
  ///
  /// In en, this message translates to:
  /// **'Preventive measures and suggested medicines'**
  String get slide3;

  /// No description provided for @slide4.
  ///
  /// In en, this message translates to:
  /// **'AI chatbot and voice assistant for describing crop symptoms and predicting diseases accurately'**
  String get slide4;

  /// No description provided for @slide5.
  ///
  /// In en, this message translates to:
  /// **'Crop Recommendations'**
  String get slide5;

  /// No description provided for @slide6.
  ///
  /// In en, this message translates to:
  /// **'Allow us to use your device location'**
  String get slide6;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @welcome_head.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcome_head;

  /// No description provided for @shetkari.
  ///
  /// In en, this message translates to:
  /// **'Agriguard'**
  String get shetkari;

  /// No description provided for @descrp.
  ///
  /// In en, this message translates to:
  /// **'Your trusted companion in detecting and managing crop diseases, with real-time predictions, actionable insights, and expert advice to safeguard your fields and maximize yields.'**
  String get descrp;

  /// No description provided for @picture.
  ///
  /// In en, this message translates to:
  /// **'Click or Upload a Picture'**
  String get picture;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @edit_pfp.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_pfp;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @signout.
  ///
  /// In en, this message translates to:
  /// **'SIGN OUT'**
  String get signout;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @icon_desp.
  ///
  /// In en, this message translates to:
  /// **'Icon Description'**
  String get icon_desp;

  /// No description provided for @page1.
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get page1;

  /// No description provided for @page2.
  ///
  /// In en, this message translates to:
  /// **'Disease Detection'**
  String get page2;

  /// No description provided for @page3.
  ///
  /// In en, this message translates to:
  /// **'Preventive Measures'**
  String get page3;

  /// No description provided for @page4.
  ///
  /// In en, this message translates to:
  /// **'ChatBot'**
  String get page4;

  /// No description provided for @page5.
  ///
  /// In en, this message translates to:
  /// **'Voice Assistance'**
  String get page5;

  /// No description provided for @page6.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get page6;

  /// No description provided for @page1_s1.
  ///
  /// In en, this message translates to:
  /// **'About Disease'**
  String get page1_s1;

  /// No description provided for @page1_s2.
  ///
  /// In en, this message translates to:
  /// **'Causes'**
  String get page1_s2;

  /// No description provided for @page6_s1.
  ///
  /// In en, this message translates to:
  /// **'Suggestive Crops'**
  String get page6_s1;

  /// No description provided for @apple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get apple;

  /// No description provided for @cotton.
  ///
  /// In en, this message translates to:
  /// **'Cotton'**
  String get cotton;

  /// No description provided for @cauliflower.
  ///
  /// In en, this message translates to:
  /// **'Cauliflower'**
  String get cauliflower;

  /// No description provided for @maize.
  ///
  /// In en, this message translates to:
  /// **'Maize'**
  String get maize;

  /// No description provided for @pomegranate.
  ///
  /// In en, this message translates to:
  /// **'Pomegranate'**
  String get pomegranate;

  /// No description provided for @rice.
  ///
  /// In en, this message translates to:
  /// **'Rice'**
  String get rice;

  /// No description provided for @sugarcane.
  ///
  /// In en, this message translates to:
  /// **'Sugarcane'**
  String get sugarcane;

  /// No description provided for @soyabean.
  ///
  /// In en, this message translates to:
  /// **'Soyabean'**
  String get soyabean;

  /// No description provided for @spinach.
  ///
  /// In en, this message translates to:
  /// **'Spinach'**
  String get spinach;

  /// No description provided for @tomato.
  ///
  /// In en, this message translates to:
  /// **'Tomato'**
  String get tomato;

  /// No description provided for @apple_scab.
  ///
  /// In en, this message translates to:
  /// **'Apple Scab'**
  String get apple_scab;

  /// No description provided for @apple_scab_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper spacing between plants for good air circulation\nApply fungicides like Mancozeb or Copper-based products.\nPrune affected areas and remove fallen leaves.\nPractice crop rotation to reduce disease spread.\nMaintain optimal watering practices to avoid excess moisture.'**
  String get apple_scab_preventive;

  /// No description provided for @apple_black_rot.
  ///
  /// In en, this message translates to:
  /// **'Apple Black Rot'**
  String get apple_black_rot;

  /// No description provided for @apple_black_rot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper spacing between plants for good air circulation\nApply fungicides like Mancozeb or Copper-based products.\nPrune affected areas and remove fallen leaves.\nPractice crop rotation to reduce disease spread.\nMaintain optimal watering practices to avoid excess moisture.'**
  String get apple_black_rot_preventive;

  /// No description provided for @apple_cedar_apple_rust.
  ///
  /// In en, this message translates to:
  /// **'Apple Cedar Apple Rust'**
  String get apple_cedar_apple_rust;

  /// No description provided for @apple_cedar_apple_rust_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper spacing between plants for good air circulation\nApply fungicides like Mancozeb or Copper-based products.\nPrune affected areas and remove fallen leaves.\nPractice crop rotation to reduce disease spread.\nMaintain optimal watering practices to avoid excess moisture.'**
  String get apple_cedar_apple_rust_preventive;

  /// No description provided for @apple_healthy.
  ///
  /// In en, this message translates to:
  /// **'Apple Healthy'**
  String get apple_healthy;

  /// No description provided for @apple_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper plant care, proper watering, and nutrient management.\nRegularly inspect for pests or diseases.\nPractice crop rotation.'**
  String get apple_healthy_preventive;

  /// No description provided for @rice_tungro.
  ///
  /// In en, this message translates to:
  /// **'Tungro'**
  String get rice_tungro;

  /// No description provided for @rice_tungro_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use resistant rice varieties\nControl vector insects with pesticides.\nPractice field sanitation.\nAvoid excessive nitrogen fertilizers.'**
  String get rice_tungro_preventive;

  /// No description provided for @rice_blast.
  ///
  /// In en, this message translates to:
  /// **'Rice blast is a fungal disease that can be controlled by applying fungicides like Pyricularia or Tricyclazole. These fungicides help manage the disease and prevent its spread to healthy plants. It is important to use resistant rice varieties to minimize the impact of rice blast. Maintaining proper irrigation and field drainage practices is essential, as stagnant water promotes fungal growth. Ensure proper plant spacing to enhance airflow and reduce humidity. Remove and destroy infected plants promptly to prevent further spread. Crop rotation with non-susceptible crops can help reduce the recurrence of rice blast in future seasons.'**
  String get rice_blast;

  /// No description provided for @rice_blast_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Pyricularia or Tricyclazole.\nRotate crops with non-host plants.\nUse resistant rice varieties.'**
  String get rice_blast_preventive;

  /// No description provided for @rice_brownspot.
  ///
  /// In en, this message translates to:
  /// **'Brownspot'**
  String get rice_brownspot;

  /// No description provided for @rice_brownspot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Remove infected rice plants.\nApply fungicides like Carbendazim.\nMaintain proper irrigation practices.'**
  String get rice_brownspot_preventive;

  /// No description provided for @rice_bacterial_blight.
  ///
  /// In en, this message translates to:
  /// **'Bacterial Blight'**
  String get rice_bacterial_blight;

  /// No description provided for @rice_bacterial_blight_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use resistant varieties.\nAvoid overhead irrigation.\nUse clean seeds.'**
  String get rice_bacterial_blight_preventive;

  /// No description provided for @sugarcane_yellow_rust.
  ///
  /// In en, this message translates to:
  /// **'Yellow Rust'**
  String get sugarcane_yellow_rust;

  /// No description provided for @sugarcane_yellow_rust_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Propiconazole.\nPractice crop rotation.\nRemove and destroy infected plant material.'**
  String get sugarcane_yellow_rust_preventive;

  /// No description provided for @sugarcane_red_rot.
  ///
  /// In en, this message translates to:
  /// **'Red Rot'**
  String get sugarcane_red_rot;

  /// No description provided for @sugarcane_red_rot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use disease-free planting material.\nControl pest infestation.\nApply fungicides like Thiophanate-methyl.'**
  String get sugarcane_red_rot_preventive;

  /// No description provided for @sugarcane_red_rust.
  ///
  /// In en, this message translates to:
  /// **'Red Rust'**
  String get sugarcane_red_rust;

  /// No description provided for @sugarcane_red_rust_preventive.
  ///
  /// In en, this message translates to:
  /// **'Control weed growth.\nUse resistant varieties.\nApply fungicides like Copper-based products.'**
  String get sugarcane_red_rust_preventive;

  /// No description provided for @sugarcane_mosaic.
  ///
  /// In en, this message translates to:
  /// **'Mosaic'**
  String get sugarcane_mosaic;

  /// No description provided for @sugarcane_mosaic_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use resistant varieties.\nControl aphids and other vector pests.\nPractice crop rotation.'**
  String get sugarcane_mosaic_preventive;

  /// No description provided for @sugarcane_healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy Sugarcane'**
  String get sugarcane_healthy;

  /// No description provided for @sugarcane_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure optimal water and nutrient management.\nRegular pest monitoring and management.\nMaintain field sanitation.'**
  String get sugarcane_healthy_preventive;

  /// No description provided for @tomato_bacterial_spot.
  ///
  /// In en, this message translates to:
  /// **'Bacterial Spot'**
  String get tomato_bacterial_spot;

  /// No description provided for @tomato_bacterial_spot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply copper-based fungicides.\nAvoid overhead irrigation.\nPractice crop rotation.'**
  String get tomato_bacterial_spot_preventive;

  /// No description provided for @tomato_early_blight.
  ///
  /// In en, this message translates to:
  /// **'Early Blight'**
  String get tomato_early_blight;

  /// No description provided for @tomato_early_blight_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Chlorothalonil.\nRemove and destroy infected plant material.\nPractice crop rotation.'**
  String get tomato_early_blight_preventive;

  /// No description provided for @tomato_late_blight.
  ///
  /// In en, this message translates to:
  /// **'Late Blight'**
  String get tomato_late_blight;

  /// No description provided for @tomato_late_blight_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Metalaxyl.\nPractice crop rotation.\nRemove infected plant material.'**
  String get tomato_late_blight_preventive;

  /// No description provided for @tomato_leaf_mold.
  ///
  /// In en, this message translates to:
  /// **'Leaf Mold'**
  String get tomato_leaf_mold;

  /// No description provided for @tomato_leaf_mold_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper spacing between plants.\nControl humidity levels in greenhouses.\nUse fungicides like Chlorothalonil.'**
  String get tomato_leaf_mold_preventive;

  /// No description provided for @tomato_septoria_leaf_spot.
  ///
  /// In en, this message translates to:
  /// **'Septoria Leaf Spot'**
  String get tomato_septoria_leaf_spot;

  /// No description provided for @tomato_septoria_leaf_spot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use fungicides like Mancozeb.\nRemove infected plant material.\nPractice crop rotation.'**
  String get tomato_septoria_leaf_spot_preventive;

  /// No description provided for @tomato_spider_mites.
  ///
  /// In en, this message translates to:
  /// **'Spider Mites (Two-Spotted Spider Mite)'**
  String get tomato_spider_mites;

  /// No description provided for @tomato_spider_mites_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use miticides.\nIncrease humidity to deter mites.\nRegularly monitor and remove infested plants.'**
  String get tomato_spider_mites_preventive;

  /// No description provided for @tomato_target_spot.
  ///
  /// In en, this message translates to:
  /// **'Target Spot'**
  String get tomato_target_spot;

  /// No description provided for @tomato_target_spot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Pyraclostrobin.\nPractice proper irrigation techniques.\nRemove infected plant material.'**
  String get tomato_target_spot_preventive;

  /// No description provided for @tomato_ytlcv.
  ///
  /// In en, this message translates to:
  /// **'Tomato Yellow Leaf Curl Virus (TYLCV)'**
  String get tomato_ytlcv;

  /// No description provided for @tomato_ytlcv_preventive.
  ///
  /// In en, this message translates to:
  /// **'Control whitefly populations.\nUse resistant tomato varieties.\nRemove infected plants.'**
  String get tomato_ytlcv_preventive;

  /// No description provided for @tomato_healthy.
  ///
  /// In en, this message translates to:
  /// **'Tomato Healthy'**
  String get tomato_healthy;

  /// No description provided for @tomato_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper watering and fertilization.\nRegular pest and disease monitoring.\nPractice crop rotation.'**
  String get tomato_healthy_preventive;

  /// No description provided for @cotton_bacterial_blight.
  ///
  /// In en, this message translates to:
  /// **'Bacterial Blight'**
  String get cotton_bacterial_blight;

  /// No description provided for @cotton_bacterial_blight_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use resistant cotton varieties.\nRemove infected plant material.\nPractice crop rotation.'**
  String get cotton_bacterial_blight_preventive;

  /// No description provided for @cotton_aphid.
  ///
  /// In en, this message translates to:
  /// **'Cotton Aphid'**
  String get cotton_aphid;

  /// No description provided for @cotton_aphid_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use insecticides like Imidacloprid.\nControl aphid populations with natural predators.'**
  String get cotton_aphid_preventive;

  /// No description provided for @cotton_whitefly.
  ///
  /// In en, this message translates to:
  /// **'Cotton Whitefly'**
  String get cotton_whitefly;

  /// No description provided for @cotton_whitefly_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use insecticides like Thiamethoxam.\nIntroduce natural predators like ladybugs.'**
  String get cotton_whitefly_preventive;

  /// No description provided for @cotton_anthracnose.
  ///
  /// In en, this message translates to:
  /// **'Antracnose'**
  String get cotton_anthracnose;

  /// No description provided for @cotton_anthracnose_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Chlorothalonil.\nPractice field sanitation.\nRemove and destroy infected plants.'**
  String get cotton_anthracnose_preventive;

  /// No description provided for @cotton_healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy Cotton'**
  String get cotton_healthy;

  /// No description provided for @cotton_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper water and nutrient management.\nRegular pest monitoring.\nUse disease-resistant varieties.'**
  String get cotton_healthy_preventive;

  /// No description provided for @cotton_red_cotton_bug.
  ///
  /// In en, this message translates to:
  /// **'Red Cotton Bug'**
  String get cotton_red_cotton_bug;

  /// No description provided for @cotton_red_cotton_bug_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use insecticides like Malathion.\nEncourage natural predators.'**
  String get cotton_red_cotton_bug_preventive;

  /// No description provided for @cauliflower_downy_mildew.
  ///
  /// In en, this message translates to:
  /// **'Downy Mildew'**
  String get cauliflower_downy_mildew;

  /// No description provided for @cauliflower_downy_mildew_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Metalaxyl.\nEnsure proper spacing between plants.\nRemove and destroy infected plant material.'**
  String get cauliflower_downy_mildew_preventive;

  /// No description provided for @cauliflower_bacterial_spot_rot.
  ///
  /// In en, this message translates to:
  /// **'Bacterial spot rot'**
  String get cauliflower_bacterial_spot_rot;

  /// No description provided for @cauliflower_bacterial_spot_rot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use bactericides like Copper sulfate.\nPractice crop rotation.\nEnsure proper irrigation practices.'**
  String get cauliflower_bacterial_spot_rot_preventive;

  /// No description provided for @cauliflower_black_rot.
  ///
  /// In en, this message translates to:
  /// **'Black rot'**
  String get cauliflower_black_rot;

  /// No description provided for @cauliflower_black_rot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Chlorothalonil.\nRemove and destroy infected plant material.\nPractice field sanitation.'**
  String get cauliflower_black_rot_preventive;

  /// No description provided for @cauliflower_healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy Cauliflower'**
  String get cauliflower_healthy;

  /// No description provided for @cauliflower_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure optimal water and nutrient management.\nRegular pest monitoring.\nPractice crop rotation.'**
  String get cauliflower_healthy_preventive;

  /// No description provided for @soybean_healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy Soybean'**
  String get soybean_healthy;

  /// No description provided for @soybean_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper soil nutrition.\nRegular pest monitoring.\nPractice crop rotation.'**
  String get soybean_healthy_preventive;

  /// No description provided for @soybean_caterpillar.
  ///
  /// In en, this message translates to:
  /// **'Caterpillar'**
  String get soybean_caterpillar;

  /// No description provided for @soybean_caterpillar_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use insecticides like Spinosad.\nControl caterpillar infestations with natural predators.'**
  String get soybean_caterpillar_preventive;

  /// No description provided for @soybean_diabrotica_speciosa.
  ///
  /// In en, this message translates to:
  /// **'Diabrotica Speciosa (Soybean)'**
  String get soybean_diabrotica_speciosa;

  /// No description provided for @soybean_diabrotica_speciosa_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use insecticides like Thiamethoxam.\nPractice crop rotation.'**
  String get soybean_diabrotica_speciosa_preventive;

  /// No description provided for @spinach_healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy Spinach'**
  String get spinach_healthy;

  /// No description provided for @spinach_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure optimal water and nutrient management.\nRegular pest monitoring.\nPractice crop rotation.'**
  String get spinach_healthy_preventive;

  /// No description provided for @spinach_anthracnose_leaf_spot.
  ///
  /// In en, this message translates to:
  /// **'Anthracnose leaf spot'**
  String get spinach_anthracnose_leaf_spot;

  /// No description provided for @spinach_anthracnose_leaf_spot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Chlorothalonil.\nPractice crop rotation.\nRemove infected plant material.'**
  String get spinach_anthracnose_leaf_spot_preventive;

  /// No description provided for @spinach_straw_mite.
  ///
  /// In en, this message translates to:
  /// **'Straw Mite'**
  String get spinach_straw_mite;

  /// No description provided for @spinach_straw_mite_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use miticides.\nIncrease humidity to deter mites.\nRemove infected plants.'**
  String get spinach_straw_mite_preventive;

  /// No description provided for @pomegranate_alternaria.
  ///
  /// In en, this message translates to:
  /// **'Alternaria'**
  String get pomegranate_alternaria;

  /// No description provided for @pomegranate_alternaria_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure proper spacing between plants for good air circulation\nApply fungicides like Mancozeb or Copper-based products.\nPrune affected areas and remove fallen leaves.\nPractice crop rotation to reduce disease spread.\nMaintain optimal watering practices to avoid excess moisture.'**
  String get pomegranate_alternaria_preventive;

  /// No description provided for @pomegranate_anthracnose.
  ///
  /// In en, this message translates to:
  /// **'Anthracnose'**
  String get pomegranate_anthracnose;

  /// No description provided for @pomegranate_anthracnose_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use fungicides like Copper-based products.\nPrune affected areas and remove fallen leaves.\nPractice crop rotation.'**
  String get pomegranate_anthracnose_preventive;

  /// No description provided for @pomegranate_cercospora.
  ///
  /// In en, this message translates to:
  /// **'Cercospora'**
  String get pomegranate_cercospora;

  /// No description provided for @pomegranate_cercospora_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Mancozeb.\nPractice crop rotation.\nRemove and destroy infected plant material.'**
  String get pomegranate_cercospora_preventive;

  /// No description provided for @pomegranate_bacterial_blight.
  ///
  /// In en, this message translates to:
  /// **'Bacterial blight'**
  String get pomegranate_bacterial_blight;

  /// No description provided for @pomegranate_bacterial_blight_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use resistant varieties.\nPractice proper irrigation.\nRemove infected plants.'**
  String get pomegranate_bacterial_blight_preventive;

  /// No description provided for @pomegranate_healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get pomegranate_healthy;

  /// No description provided for @pomegranate_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure optimal water and nutrient management.\nRegular pest monitoring.\nPractice crop rotation.'**
  String get pomegranate_healthy_preventive;

  /// No description provided for @maize_cercospora_leaf_spot.
  ///
  /// In en, this message translates to:
  /// **'Cercospora Leaf Spot gray leaf'**
  String get maize_cercospora_leaf_spot;

  /// No description provided for @maize_cercospora_leaf_spot_preventive.
  ///
  /// In en, this message translates to:
  /// **'Use fungicides like Mancozeb.\nPractice crop rotation.\nRemove and destroy infected plant material.'**
  String get maize_cercospora_leaf_spot_preventive;

  /// No description provided for @maize_common_rust.
  ///
  /// In en, this message translates to:
  /// **'Common Rust'**
  String get maize_common_rust;

  /// No description provided for @maize_common_rust_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Chlorothalonil.\nPractice crop rotation.\nRemove and destroy infected plant material.'**
  String get maize_common_rust_preventive;

  /// No description provided for @maize_healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get maize_healthy;

  /// No description provided for @maize_healthy_preventive.
  ///
  /// In en, this message translates to:
  /// **'Ensure optimal water and nutrient management.\nRegular pest monitoring.\nPractice crop rotation.'**
  String get maize_healthy_preventive;

  /// No description provided for @maize_northern_leaf_blight.
  ///
  /// In en, this message translates to:
  /// **'Northern Leaf Blight'**
  String get maize_northern_leaf_blight;

  /// No description provided for @maize_northern_leaf_blight_preventive.
  ///
  /// In en, this message translates to:
  /// **'Apply fungicides like Propiconazole.\nPractice field sanitation.\nRemove infected plant material.'**
  String get maize_northern_leaf_blight_preventive;

  /// No description provided for @yojna_no_1_name.
  ///
  /// In en, this message translates to:
  /// **'Pradhan Mantri Kisan Samman Nidhi (PM-KISAN)'**
  String get yojna_no_1_name;

  /// No description provided for @yojna_no_1_desc.
  ///
  /// In en, this message translates to:
  /// **'Provides income support to small and marginal farmers by transferring Rs. 6,000 annually directly into their bank accounts in three installments of Rs. 2,000 each. This scheme helps farmers manage agricultural inputs, household expenses, and unforeseen needs. The direct benefit transfer mechanism ensures transparency and efficiency, eliminating middlemen and delays. It provides much-needed financial relief to farmers, enabling them to sustain their livelihoods and invest in better agricultural practices.'**
  String get yojna_no_1_desc;

  /// No description provided for @yojna_no_2_name.
  ///
  /// In en, this message translates to:
  /// **'Pradhan Mantri Fasal Bima Yojana (PMFBY)'**
  String get yojna_no_2_name;

  /// No description provided for @yojna_no_2_desc.
  ///
  /// In en, this message translates to:
  /// **'Offers comprehensive insurance coverage to protect crops against natural calamities such as floods, droughts, pests, and diseases. Farmers pay a nominal premium, and the government subsidizes the rest, reducing the financial burden. This scheme ensures stability for farmers in the face of unpredictable weather and crop failures. Timely claim settlements allow farmers to recover losses and reinvest in their fields. It promotes risk management and encourages adoption of advanced farming techniques.'**
  String get yojna_no_2_desc;

  /// No description provided for @yojna_no_3_name.
  ///
  /// In en, this message translates to:
  /// **'Soil Health Card Scheme'**
  String get yojna_no_3_name;

  /// No description provided for @yojna_no_3_desc.
  ///
  /// In en, this message translates to:
  /// **'Provides farmers with a soil health card that details the nutrient status and fertility of their land. The scheme aims to educate farmers about the appropriate use of fertilizers and nutrients to improve productivity. It promotes balanced nutrient management, reducing the overuse of chemicals and maintaining soil health. By understanding their soil’s specific needs, farmers can lower input costs and achieve better yields. This initiative ensures sustainable farming and long-term agricultural benefits.'**
  String get yojna_no_3_desc;

  /// No description provided for @yojna_no_4_name.
  ///
  /// In en, this message translates to:
  /// **'Kisan Credit Card (KCC)'**
  String get yojna_no_4_name;

  /// No description provided for @yojna_no_4_desc.
  ///
  /// In en, this message translates to:
  /// **'The Kisan Credit Card provides farmers with easy and affordable access to credit for agricultural needs such as seeds, fertilizers, equipment, and irrigation. With low-interest rates and flexible repayment terms, it minimizes financial stress for farmers. The scheme also covers allied agricultural activities and post-harvest expenses. It empowers farmers to focus on increasing productivity rather than worrying about funding their operations, ensuring financial inclusion and security for millions of farming families.'**
  String get yojna_no_4_desc;

  /// No description provided for @yojna_no_5_name.
  ///
  /// In en, this message translates to:
  /// **'Pradhan Mantri Krishi Sinchai Yojana (PMKSY)'**
  String get yojna_no_5_name;

  /// No description provided for @yojna_no_5_desc.
  ///
  /// In en, this message translates to:
  /// **'This scheme aims to improve irrigation and water use efficiency. It promotes initiatives like micro-irrigation, rainwater harvesting, and watershed management to ensure water availability for every farm. By reducing dependency on rainfall, it enables farmers to cultivate more land and increase crop yields. The scheme encourages sustainable water practices and conservation, helping farmers manage resources effectively. PMKSY ensures that irrigation reaches even the most remote areas, improving productivity and livelihoods.'**
  String get yojna_no_5_desc;

  /// No description provided for @yojna_no_6_name.
  ///
  /// In en, this message translates to:
  /// **'Rashtriya Krishi Vikas Yojana (RKVY)'**
  String get yojna_no_6_name;

  /// No description provided for @yojna_no_6_desc.
  ///
  /// In en, this message translates to:
  /// **'Supports state-specific agricultural projects to improve productivity and address local challenges. The scheme funds infrastructure development, modern technology adoption, and training programs to empower farmers. It encourages diversification into high-value crops, horticulture, and allied activities like fisheries and dairying. By focusing on state priorities, the scheme ensures efficient utilization of resources and boosts farmers\' incomes. It promotes innovation and infrastructure development, helping farmers achieve higher returns and sustainable growth.'**
  String get yojna_no_6_desc;

  /// No description provided for @yojna_no_7_name.
  ///
  /// In en, this message translates to:
  /// **'National Agriculture Market (eNAM)'**
  String get yojna_no_7_name;

  /// No description provided for @yojna_no_7_desc.
  ///
  /// In en, this message translates to:
  /// **'A digital trading platform that connects farmers to buyers across the country, enabling better price discovery and reducing reliance on middlemen. Farmers can sell their produce in distant markets without additional costs. eNAM integrates local mandis, creating a unified national market for agricultural produce. The platform offers transparency, fair pricing, and convenience, helping farmers maximize profits. It also supports quality grading and storage facilities, ensuring a seamless and efficient trade process.'**
  String get yojna_no_7_desc;

  /// No description provided for @yojna_no_8_name.
  ///
  /// In en, this message translates to:
  /// **'Paramparagat Krishi Vikas Yojana (PKVY)'**
  String get yojna_no_8_name;

  /// No description provided for @yojna_no_8_desc.
  ///
  /// In en, this message translates to:
  /// **'Promotes organic farming by providing financial support and training to farmers. The scheme encourages the use of bio-fertilizers, compost, and eco-friendly farming practices. It helps farmers obtain organic certification, allowing them to access premium markets and earn higher profits. By reducing dependency on chemical inputs, it ensures healthier produce, lowers production costs, and improves soil health. PKVY supports sustainable agricultural practices, benefiting both farmers and the environment.'**
  String get yojna_no_8_desc;

  /// No description provided for @yojna_no_9_name.
  ///
  /// In en, this message translates to:
  /// **'Interest Subvention Scheme for Farmers'**
  String get yojna_no_9_name;

  /// No description provided for @yojna_no_9_desc.
  ///
  /// In en, this message translates to:
  /// **'Provides short-term agricultural loans at subsidized interest rates, making credit more affordable for farmers. Those who repay their loans on time receive additional rebates, further reducing borrowing costs. The scheme ensures that farmers have timely access to funds for seeds, fertilizers, equipment, and other needs. By minimizing financial stress, it supports farmers in managing their expenses and increasing productivity. The scheme plays a crucial role in stabilizing farmers’ income and promoting growth.'**
  String get yojna_no_9_desc;

  /// No description provided for @yojna_no_10_name.
  ///
  /// In en, this message translates to:
  /// **'Fertilizer Subsidy Scheme'**
  String get yojna_no_10_name;

  /// No description provided for @yojna_no_10_desc.
  ///
  /// In en, this message translates to:
  /// **'Ensures that fertilizers are available to farmers at subsidized rates, reducing input costs and promoting balanced nutrient use. The scheme encourages the timely application of fertilizers to improve soil health and crop yields. By lowering expenses, it helps farmers achieve higher profitability while maintaining sustainability. The subsidy system prevents overuse of chemical inputs and ensures the availability of essential nutrients for healthy crop growth, supporting long-term agricultural success.'**
  String get yojna_no_10_desc;

  /// No description provided for @yojna_no_11_name.
  ///
  /// In en, this message translates to:
  /// **'National Food Security Mission (NFSM)'**
  String get yojna_no_11_name;

  /// No description provided for @yojna_no_11_desc.
  ///
  /// In en, this message translates to:
  /// **'Focuses on increasing the production of rice, wheat, pulses, and coarse cereals by providing quality inputs, financial support, and training. The scheme promotes efficient farming techniques, mechanization, and water management. By improving productivity and reducing production costs, it ensures food security for the nation. Farmers benefit from better yields and steady income. The mission also encourages crop diversification and resilience, addressing the challenges of climate change and market demands.'**
  String get yojna_no_11_desc;

  /// No description provided for @yojna_no_12_name.
  ///
  /// In en, this message translates to:
  /// **'Gramin Bhandaran Yojana'**
  String get yojna_no_12_name;

  /// No description provided for @yojna_no_12_desc.
  ///
  /// In en, this message translates to:
  /// **'Supports farmers in constructing rural godowns to store their produce safely. Proper storage facilities reduce post-harvest losses and enable farmers to sell their crops when market prices are favorable. The scheme provides financial assistance and technical support for infrastructure development. By improving storage capacity, it enhances the agricultural value chain, increases farmers’ profitability, and ensures the availability of quality produce in the market throughout the year.'**
  String get yojna_no_12_desc;

  /// No description provided for @yojna_no_13_name.
  ///
  /// In en, this message translates to:
  /// **'Pradhan Mantri Kisan MaanDhan Yojana (PM-KMY)'**
  String get yojna_no_13_name;

  /// No description provided for @yojna_no_13_desc.
  ///
  /// In en, this message translates to:
  /// **'Provides a monthly pension of Rs. 3,000 to small and marginal farmers after the age of 60. Farmers contribute a nominal amount during their working years, matched by the government. The scheme ensures financial security in old age, allowing farmers to live a dignified life without financial worries. By addressing post-retirement needs, it brings peace of mind to farmers who have dedicated their lives to feeding the nation.'**
  String get yojna_no_13_desc;

  /// No description provided for @yojna_no_14_name.
  ///
  /// In en, this message translates to:
  /// **'Digital Agriculture Mission'**
  String get yojna_no_14_name;

  /// No description provided for @yojna_no_14_desc.
  ///
  /// In en, this message translates to:
  /// **'Uses technology to improve farming practices. Tools like weather updates, geospatial analytics, and crop recommendations help farmers make better decisions. It streamlines farming processes, increases efficiency, and reduces risks. The mission empowers farmers with modern technology, ensuring better productivity and profitability.'**
  String get yojna_no_14_desc;

  /// No description provided for @yojna_no_15_name.
  ///
  /// In en, this message translates to:
  /// **'Crop Science for Food and Nutritional Security'**
  String get yojna_no_15_name;

  /// No description provided for @yojna_no_15_desc.
  ///
  /// In en, this message translates to:
  /// **'Focuses on developing resilient crops that can withstand adverse conditions like droughts and floods. The scheme promotes research, advanced agricultural techniques, and access to improved seeds. By ensuring stable yields, it enhances food security and supports farmers in managing environmental challenges.'**
  String get yojna_no_15_desc;

  /// No description provided for @yojna_no_16_name.
  ///
  /// In en, this message translates to:
  /// **'Sustainable Development of Horticulture'**
  String get yojna_no_16_name;

  /// No description provided for @yojna_no_16_desc.
  ///
  /// In en, this message translates to:
  /// **'Encourages farmers to grow high-value crops like fruits, vegetables, and flowers. The scheme provides financial and technical support to adopt modern cultivation methods, improving yields and profitability. It diversifies income sources for farmers, ensuring better economic stability.'**
  String get yojna_no_16_desc;

  /// No description provided for @yojna_no_17_name.
  ///
  /// In en, this message translates to:
  /// **'Formation and Promotion of 10,000 Farmer Producer Organizations (FPOs)'**
  String get yojna_no_17_name;

  /// No description provided for @yojna_no_17_desc.
  ///
  /// In en, this message translates to:
  /// **'Encourages farmers to form groups for collective marketing, bargaining, and resource sharing. FPOs provide training, financial assistance, and market access, improving farmers’ incomes. The scheme strengthens farmers\' negotiating power in agricultural markets, ensuring better profitability.'**
  String get yojna_no_17_desc;

  /// No description provided for @yojna_no_18_name.
  ///
  /// In en, this message translates to:
  /// **'Agriculture Infrastructure Fund (AIF)'**
  String get yojna_no_18_name;

  /// No description provided for @yojna_no_18_desc.
  ///
  /// In en, this message translates to:
  /// **'Provides loans to farmers for building post-harvest infrastructure like cold storage and warehouses. These facilities reduce wastage and allow farmers to store their produce until market prices improve. The scheme ensures better profitability and strengthens the agricultural value chain.'**
  String get yojna_no_18_desc;

  /// No description provided for @yojna_no_19_name.
  ///
  /// In en, this message translates to:
  /// **'Market Intervention Scheme and Price Support Scheme (MIS-PSS)'**
  String get yojna_no_19_name;

  /// No description provided for @yojna_no_19_desc.
  ///
  /// In en, this message translates to:
  /// **'Protects farmers from losses during periods of oversupply by ensuring fair prices for their crops. The scheme stabilizes market rates and prevents distress sales, providing a safety net for farmers and ensuring steady income.'**
  String get yojna_no_19_desc;

  /// No description provided for @page_3.
  ///
  /// In en, this message translates to:
  /// **'Recommender'**
  String get page_3;

  /// No description provided for @enter_farm_details.
  ///
  /// In en, this message translates to:
  /// **'Enter your farm details for us to help recommend some crops for the next season:'**
  String get enter_farm_details;

  /// No description provided for @n_content.
  ///
  /// In en, this message translates to:
  /// **'Nitrogen (N) Content'**
  String get n_content;

  /// No description provided for @p_content.
  ///
  /// In en, this message translates to:
  /// **'Phosphorus (P) Content'**
  String get p_content;

  /// No description provided for @k_content.
  ///
  /// In en, this message translates to:
  /// **'Potassium (K) Conetnt'**
  String get k_content;

  /// No description provided for @temp.
  ///
  /// In en, this message translates to:
  /// **'Temperature (°C)'**
  String get temp;

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity (%)'**
  String get humidity;

  /// No description provided for @soil_ph.
  ///
  /// In en, this message translates to:
  /// **'Soil pH'**
  String get soil_ph;

  /// No description provided for @rain.
  ///
  /// In en, this message translates to:
  /// **'Rainfall (mm)'**
  String get rain;

  /// No description provided for @get_recommend.
  ///
  /// In en, this message translates to:
  /// **'Get Recommendations'**
  String get get_recommend;

  /// No description provided for @page_4.
  ///
  /// In en, this message translates to:
  /// **'Voice Assistant'**
  String get page_4;

  /// No description provided for @enter_a_text.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get enter_a_text;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended Crop'**
  String get recommended;

  /// No description provided for @page_5.
  ///
  /// In en, this message translates to:
  /// **'Preventive Measures'**
  String get page_5;

  /// No description provided for @selection.
  ///
  /// In en, this message translates to:
  /// **'Select a crop'**
  String get selection;

  /// No description provided for @deafult_page_5.
  ///
  /// In en, this message translates to:
  /// **'Please select a crop to view diseases.'**
  String get deafult_page_5;

  /// No description provided for @page_6.
  ///
  /// In en, this message translates to:
  /// **'Government Schemas'**
  String get page_6;

  /// No description provided for @alternaria_pomegranate.
  ///
  /// In en, this message translates to:
  /// **'Alternaria in pomegranate can be controlled by applying fungicides like Mancozeb or Chlorothalonil, which help in preventing fungal growth. Prune infected branches and remove fallen leaves to reduce the spread of the disease. Ensure good air circulation around the plant to avoid excessive moisture buildup. It is also essential to maintain proper irrigation practices and avoid overhead watering to minimize the spread of spores. Crop rotation with non-susceptible crops and using disease-free planting materials can also help in preventing future outbreaks.'**
  String get alternaria_pomegranate;

  /// No description provided for @anthracnose_pomegranate.
  ///
  /// In en, this message translates to:
  /// **'Anthracnose in pomegranate is controlled by applying systemic fungicides such as Propiconazole or copper-based fungicides. Remove and dispose of infected fruits, leaves, and branches to reduce disease spread. Pruning of affected areas is recommended. Ensure proper drainage to prevent waterlogging and minimize humidity, as this disease thrives in moist environments. In severe cases, a second application of fungicide may be needed, particularly during the flowering stage. Also, avoid plant stress from excessive irrigation or nutrient imbalances. Using disease-resistant varieties can help reduce the occurrence of anthracnose.'**
  String get anthracnose_pomegranate;

  /// No description provided for @bacterial_blight_in_cotton.
  ///
  /// In en, this message translates to:
  /// **'Bacterial blight in cotton can be managed by using resistant cotton varieties and maintaining field sanitation. Apply copper-based bactericides to prevent bacterial infection. Avoid overhead irrigation to prevent moisture buildup, which promotes bacterial growth. Ensure proper spacing between plants to improve airflow and reduce humidity around the cotton plants. Regularly remove and dispose of infected plant material. Proper weed management also reduces the chances of bacterial spread. Crop rotation with non-host crops is advisable to minimize re-infection. It is also essential to monitor and manage insect vectors that may spread the bacteria.'**
  String get bacterial_blight_in_cotton;

  /// No description provided for @bacterial_blight_pomegranate.
  ///
  /// In en, this message translates to:
  /// **'Bacterial blight in pomegranate can be controlled by pruning and removing infected branches and leaves. Apply copper-based bactericides to reduce bacterial growth, and ensure proper field sanitation. Maintain proper water management practices to avoid excess moisture around the plant, as bacteria thrive in humid conditions. Drip irrigation is recommended to reduce water splashing and bacterial spread. It is crucial to keep the area around the tree clean by removing fallen leaves and fruit. Infected plants should be destroyed to prevent the spread to healthy ones. Using resistant varieties can further help control the disease.'**
  String get bacterial_blight_pomegranate;

  /// No description provided for @bacterial_blight_in_rice.
  ///
  /// In en, this message translates to:
  /// **'Bacterial blight in rice can be managed by using resistant rice varieties. Apply copper-based bactericides early in the growing season for effective control. Avoid overhead irrigation, as it can spread the bacteria through water droplets. Maintain proper field drainage to prevent water stagnation, which encourages bacterial growth. Destroy infected plants promptly and practice crop rotation to reduce the risk of reinfection. Proper spacing of rice plants helps with airflow and minimizes the spread of the disease. Avoid planting in fields that had bacterial blight previously, as the bacteria can persist in soil for years.'**
  String get bacterial_blight_in_rice;

  /// No description provided for @brownspot_rice.
  ///
  /// In en, this message translates to:
  /// **'Brownspot in rice can be controlled by applying fungicides such as Tricyclazole or Carbendazim during the early stages of infection. These fungicides help to manage fungal growth and reduce the spread of the disease. Ensure proper irrigation management, as waterlogging promotes the growth of the fungus. Remove and destroy infected leaves and debris. Crop rotation with non-susceptible crops helps reduce the disease\'s recurrence. Avoid over-fertilizing rice plants, as this can create favorable conditions for fungal infections. Selecting resistant rice varieties and maintaining good plant nutrition also aid in reducing the incidence of brownspot.'**
  String get brownspot_rice;

  /// No description provided for @cercospora_pomegranate.
  ///
  /// In en, this message translates to:
  /// **'Cercospora in pomegranate can be managed by applying fungicides like Propiconazole or copper-based fungicides. These fungicides are effective in controlling fungal infections and reducing the spread of the disease. Prune and remove infected leaves and branches to limit the spread of the fungus. Maintain proper irrigation practices and ensure good drainage around the plant to prevent excess moisture, which fosters fungal growth. Crop rotation with resistant varieties or non-susceptible crops can reduce the likelihood of re-infection. Proper spacing between trees helps improve airflow, reducing the conditions that favor fungal infections.'**
  String get cercospora_pomegranate;

  /// No description provided for @lemoncroton.
  ///
  /// In en, this message translates to:
  /// **'Lemon croton, a fungal disease affecting various crops, can be managed with fungicides like Thiophanate-methyl or Chlorothalonil. These fungicides help control fungal growth and prevent further spread. Ensure proper plant spacing and airflow around the plants to minimize moisture buildup. Maintain proper soil drainage to prevent waterlogging, which favors fungal growth. Regularly inspect the plants and remove infected leaves or branches. Proper sanitation practices, such as cleaning tools and equipment after use, can prevent the spread of the fungus. Avoid planting crops in areas where lemon croton has previously been an issue to reduce recurrence.'**
  String get lemoncroton;

  /// No description provided for @tungro_rice.
  ///
  /// In en, this message translates to:
  /// **'Tungro in rice is caused by a virus transmitted by insect vectors, mainly the green leafhopper. Control of tungro involves using resistant rice varieties and destroying infected plants. Apply insecticides to control the vector and reduce virus transmission. Ensure proper field management practices, such as controlling weeds that may serve as alternate hosts for the leafhopper. Infected plants should be removed and destroyed immediately to limit the spread of the disease. Crop rotation with non-host crops is advisable to reduce the recurrence of the disease. Avoid planting rice in areas with a history of tungro infestation.'**
  String get tungro_rice;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'gu',
        'hi',
        'mr',
        'te',
        'ur'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
    case 'te':
      return AppLocalizationsTe();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
