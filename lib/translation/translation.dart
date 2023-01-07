import 'package:get/get.dart';

import 'tr_constants.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'kz_KZ': {
          welcomeWord:
              'ҰБТ-ға бізбен бірге дайындал! Біз саған 1000-нан астам жаңа тест нұсқаларымен тапсырмаларын ұсынамыз.',
          signIn: 'Кіру',
          signUp: 'Тіркелу',
          doYouHaveAnAccount: 'Есептік жазбаңыз бар ма?',
          termsOfServices0: 'Тіркелгіні жасау арқылы сіз бізбен келісесіз ',
          termsOfServices1: 'Қызмет көрсету шарттары',
        },
        'ru_RU': {
          welcomeWord:
              'Готовься к ЕНТ вместе с нами! Мы предлагаем вам задания с более чем 1000 новых тестовых версий.',
          signIn: 'Войти',
          signUp: 'Регистрация',
          doYouHaveAnAccount: 'У тебя есть аккаунт?',
          termsOfServices0:
              'Создавая учетную запись, вы соглашаетесь с нашими ',
          termsOfServices1: 'Условия использования',
        },
      };
}
