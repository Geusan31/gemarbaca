import 'package:get/get.dart';

import '../modules/baca/bindings/baca_binding.dart';
import '../modules/baca/views/baca_view.dart';
import '../modules/buku/bindings/buku_binding.dart';
import '../modules/buku/views/buku_view.dart';
import '../modules/create_book/bindings/create_book_binding.dart';
import '../modules/create_book/views/create_book_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_buku/bindings/detail_buku_binding.dart';
import '../modules/detail_buku/views/detail_buku_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/koleksi/bindings/koleksi_binding.dart';
import '../modules/koleksi/views/koleksi_view.dart';
import '../modules/layout/bindings/layout_binding.dart';
import '../modules/layout/views/layout_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/manage_book/bindings/manage_book_binding.dart';
import '../modules/manage_book/views/manage_book_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => const LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.BUKU,
      page: () => const BukuView(),
      binding: BukuBinding(),
    ),
    GetPage(
      name: _Paths.KOLEKSI,
      page: () => const KoleksiView(),
      binding: KoleksiBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BUKU,
      page: () => const DetailBukuView(),
      binding: DetailBukuBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.BACA,
      page: () => const BacaView(),
      binding: BacaBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_BOOK,
      page: () => const ManageBookView(),
      binding: ManageBookBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_BOOK,
      page: () => const CreateBookView(),
      binding: CreateBookBinding(),
    ),
  ];
}
