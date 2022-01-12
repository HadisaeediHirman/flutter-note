import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'note': 'Note',
          'notes': "Notes",
          'title': 'Title',
          'type_something': 'Type Something ...',
          'save': 'Save',
          'delete': 'Delete',
          "saving": "Saving ...",
          "empty_note": "There is no Note\n Click on \"+\" to add one.",
          'settings': "Settings",
          'change_language': "Change Language",
          'change_theme': "Change Theme",
          "delete_msg": "Notes Deleted Successfully."
        },
        'fa_IR': {
          'note': "یادداشت",
          'notes': "یادداشت ها",
          'title': 'عنوان',
          'type_something': 'چیزی بنویس ...',
          'save': 'ذخیره',
          'delete': 'حذف',
          "saving": "در حال ذخیره ...",
          'empty_note':
              "یادداشتی وجود ندارد\n با کلیک بر روی دکمه \"+\" یکی اضافه کنید",
          'settings': "تنظیمات",
          'change_language': "تغییر زبان",
          'change_theme': 'تغییر نمایه',
          "delete_msg": "یادداشت حذف شذند."
        },
      };
}
