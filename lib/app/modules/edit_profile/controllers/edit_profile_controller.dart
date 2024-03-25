import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_detail_profile.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode alamatFocusNode = FocusNode();
  final FocusNode tanggalLahirFocusNode = FocusNode();
  final FocusNode bioFocusNode = FocusNode();
  final FocusNode jenisKelaminFocusNode = FocusNode();
  var isObscure = true.obs;
  var nameIsFocused = false.obs;
  var usernameIsFocused = false.obs;
  var emailIsFocused = false.obs;
  var alamatIsFocused = false.obs;
  var bioIsFocused = false.obs;
  var tanggalLahirIsFocused = false.obs;
  var jenisKelaminIsFocused = false.obs;
  final loading = false.obs;
  final count = 0.obs;
  final dataDetailProfile = Rx<DataDetailProfile?>(null);
  var status = Rx<RxStatus>(RxStatus.loading());

  @override
  void onInit() async {
    super.onInit();
    await getDetailProfile();
    nameFocusNode.addListener(() {
      nameIsFocused.value = nameFocusNode.hasFocus;
    });
    usernameFocusNode.addListener(() {
      usernameIsFocused.value = usernameFocusNode.hasFocus;
    });
    emailFocusNode.addListener(() {
      emailIsFocused.value = emailFocusNode.hasFocus;
    });
    alamatFocusNode.addListener(() {
      alamatIsFocused.value = alamatFocusNode.hasFocus;
    });
    tanggalLahirFocusNode.addListener(() {
      tanggalLahirIsFocused.value = tanggalLahirFocusNode.hasFocus;
    });
    bioFocusNode.addListener(() {
      bioIsFocused.value = bioFocusNode.hasFocus;
    });
    jenisKelaminFocusNode.addListener(() {
      jenisKelaminIsFocused.value = jenisKelaminFocusNode.hasFocus;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getDetailProfile() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    var id = Get.parameters['id'];
    try {
      var response = await ApiProvider.instance().get("${EndPoint.profile}/$id",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseDetailProfile responseDetailProfile =
          ResponseDetailProfile.fromJson(response.data!);

      if (responseDetailProfile.data == null) {
        print("Empty Profile");
        status.value = RxStatus.empty();
      } else {
        nameController.text = responseDetailProfile.data!.user!.namaLengkap!;
        usernameController.text = responseDetailProfile.data!.user!.username!;
        alamatController.text = responseDetailProfile.data!.user!.alamat!;
        tanggalLahirController.text = responseDetailProfile.data!.tanggalLahir!;
        bioController.text = responseDetailProfile.data!.bio!;
        jenisKelaminController.text = responseDetailProfile.data!.jenisKelamin!;
        print("Response Profile: ${responseDetailProfile.data!}");
        dataDetailProfile.value = responseDetailProfile.data!;
        status.value = RxStatus.success();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          status.value = RxStatus.error("${e.response?.data['message']}");
        }
      } else {
        status.value = RxStatus.error(e.message ?? "");
      }
    } catch (e) {
      print(e.toString());
      showToastError(e.toString());
    }
  }

  editProfile() async {
    print(usernameController.text.toString());
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        String email = emailController.text.toString();
        if (email.isEmpty) {
          showToastError("Email is required");
          return;
        }
        final response =
            await ApiProvider.instance().post(EndPoint.register, data: {
          "nama_lengkap": nameController.text.toString(),
          "username": usernameController.text.toString(),
          "email": emailController.text.toString(),
          "tanggal_lahir": tanggalLahirController.text.toString(),
        });
        if (response.statusCode == 200) {
          showToastSuccess(response.data['message']);
          Get.back();
        } else {
          showToastError("Register Gagal!");
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          showToastError(e.response!.data['message']);
        } else {
          showToastError(e.message ?? "");
        }
      }
    } catch (e) {
      showToastError(e.toString());
    }
    loading(false);
  }
}
