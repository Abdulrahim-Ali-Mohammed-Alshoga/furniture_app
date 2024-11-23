import 'package:flutter/material.dart';
import 'package:furniture_app/core/resources/app_images.dart';
import 'package:get/get.dart';
import '../../../../data/base_controllers/base_controller.dart';

class PaymentController extends BaseController {
  /// general variables
  double horizontalDrag = 0;
  String formatted = '';
  String formattedCVC = '';
  int selectImage = 0;
  List<String> imagesPayment = [
    AppImages.payment,
    AppImages.payment2,
    AppImages.paymentApple,
  ];
  List<String> typeCards = [
    'Master Card',
    'PayPal',
    'Apple Pay',
  ];
  String formattedExpDate = '';
  String selectTypeCard = '';
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cVCController = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
    selectTypeCard=typeCards[0];
  }

  setHorizontalDrag(double value) {
    horizontalDrag = value;
    update();
  }

  changeSelectImage(int index) {
    selectImage = index;
    selectTypeCard=typeCards[index];
    update();
  }

  changeTextForStars(String value) {
    formattedCVC = '';
    String cleaned = value.replaceAll(' ', '');
    for (int i = 0; i < cleaned.length; i++) {
      formattedCVC += '*';
    }

    update();
  }

  void formatText(String value) {
    formatted = '';
    String cleaned = value.replaceAll(' ', ''); // إزالة الفراغات الموجودة

    for (int i = 0; i < cleaned.length; i++) {
      // إضافة الأحرف إلى النص المُنسق
      if (formatted.length < 4 ||
          (formatted.length > 14 && cleaned[i] != ' ')) {
        formatted += cleaned[i]; // الإبقاء على أول 4 أحرف وما بعد 14
      } else if (formatted.length >= 4 && formatted.length <= 14) {
        formatted += '*'; // استبدال الأحرف بين 4 و14 بـ '*'
      }

      // إضافة مسافة بعد كل 4 أحرف (ما عدا آخر النص)
      if ((formatted.replaceAll(' ', '').length % 4 == 0) &&
          i != cleaned.length - 1) {
        formatted += ' ';
      }
    }

    update();
  }

  void formatTextExpDate(String value) {
    formattedExpDate = '';
    String cleaned = value.replaceAll(' ', ''); // إزالة الفراغات الموجودة

    for (int i = 0; i < cleaned.length; i++) {
      if ((formattedExpDate.replaceAll(' ', '').length == 2)) {
        formattedExpDate += '/';
      }

      formattedExpDate += cleaned[i];
    }

    update();
  }

  changePassword() {
    Get.focusScope?.unfocus();
    if (formKey.currentState?.validate() ?? false) {
      Get.back();
    } else {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  }
}
