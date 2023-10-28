// ignore_for_file: non_constant_identifier_names

class AssetsManager {
  static BackgroundsManager get backgrounds => BackgroundsManager();
  static ImagesManager get images => ImagesManager();
  static IconsManager get icons => IconsManager();
  static AnimationsManager get animations => AnimationsManager();
  static AudiosManager get audios => AudiosManager();
  static BannersManager get banners => BannersManager();
}

class BackgroundsManager {
  static const String _prefix = 'assets/images/backgrounds/';
  String get background_mobile => '${_prefix}background_mobile.png';
  String get background => '${_prefix}background.png';
}

class ImagesManager {
  static const String _prefix = 'assets/images/';
  String get cardLessonGreen => '${_prefix}card_lesson_green.jpg';
  String get cardLessonOrange => '${_prefix}card_lesson_orange.jpg';
  String get cardLessonSilver => '${_prefix}card_lesson_silver.jpg';
  String get userAvatar => '${_prefix}user_avatar.png';
  String get logo_mochi_chinese => '${_prefix}logo_mochi_chinese.png';
}

class BannersManager {
  static const String _prefix = 'assets/images/banners/';
  String get banner_mobile => '${_prefix}banner_mobile.png';
  String get banner => '${_prefix}banner.png';
}

class IconsManager {
  static const String _prefix = 'assets/images/icons/';
  String get arrowDown => '${_prefix}arrow_down.svg';
  String get cheesy => '${_prefix}cheesy.png';
  String get flash_card_click => '${_prefix}flash_card_click.png';
  String get ic_correct_status => '${_prefix}ic_correct_status.svg';
  String get ic_incorrect_status => '${_prefix}ic_incorrect_status.svg';
  String get ic_notebook_tab => '${_prefix}ic_notebook_tab.png';
  String get ic_review_learn_vocabulary =>
      '${_prefix}ic_review_learn-vocabulary.png';
  String get ic_silver_close => '${_prefix}ic_silver_close.svg';
  String get ic_vocab_tab => '${_prefix}ic_vocab_tab.png';
  String get icon_arrow_left_circle => '${_prefix}icon_arrow_left_circle.svg';
  String get icon_arrow_right_circle => '${_prefix}icon_arrow_right_circle.svg';
  String get icon_bookcase => '${_prefix}icon_bookcase.svg';
  String get icon_fire_clock => '${_prefix}icon_fire_clock.png';
  String get icon_graduation => '${_prefix}icon_graduation.svg';
  String get icon_graph_black => '${_prefix}icon_graph_black.svg';
  String get icon_notebook_black => '${_prefix}icon_notebook_black.svg';
  String get icon_notebook => '${_prefix}icon_notebook.png';
  String get icon_target => '${_prefix}icon_target.svg';
  String get icon_vocab_black => '${_prefix}icon_vocab_black.svg';
  String get icon_vocab => '${_prefix}icon_vocab.png';
  String get michi => '${_prefix}michi.png';
  String get speaker_audio => '${_prefix}speaker_audio.png';
  String get wave1 => '${_prefix}wave1.png';
  String get wave2 => '${_prefix}wave2.png';
  String get wave3 => '${_prefix}wave3.png';
}

class AnimationsManager {
  static const String _prefix = 'assets/images/animations/';
  String get ani_book_1 => '${_prefix}ani_book_1';
  String get GetStarted => '${_prefix}GetStarted';
  String get seeyou => '${_prefix}seeyou.gif';
  String get mochi_chaomung => '${_prefix}mochi_chaomung.json';
}

class AudiosManager {
  static const String _prefix = 'assets/audios/';

  String get Click => '${_prefix}Click.mp3';
  String get ending_game_learn => '${_prefix}ending_game_learn.mp3';
  String get ending_game_review => '${_prefix}ending_game_review.mp3';
  String get Flip_flashcard => '${_prefix}Flip_flashcard.mp3';
  String get Start_game => '${_prefix}Start_game.mp3';
}
