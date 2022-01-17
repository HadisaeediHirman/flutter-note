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
          "empty_note": "No notes found...\n click \"+\" to add new one.",
          'failed_load_notes': 'Failed to load notes, please try again.',
          'failed_add_notes': 'Failed to add notes, please try again.',
          'failed_update_notes': 'Failed to update notes, please try again.',
          'failed_delete_notes': 'Failed to delete notes, please try again.',
          'settings': "Settings",
          'change_language': "Change Language",
          'change_theme': "Change Theme",
          "delete_msg": "Notes Deleted Successfully.",
          "no_match_note": "No matched note found.",
          "title_empty": 'Failed to add note, Title should not empty.',
          "title_update_empty":
              'Failed to update note, Title should not empty.',
          "note_added": "Note Added Successfully",
          "note_updated": "Note Updated Successfully",
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
          'failed_load_notes':
              'خطا در بارگذاری یادداشت ها، لطفا دوباره امتحان کنید.',
          'failed_add_notes': 'خطا در ایحاد یادداشت، لطفا دوباره امتحان کنید.',
          'failed_update_notes':
              'خطا در ویرایش یادداشت، لطفا دوباره امتحان کنید.',
          'failed_delete_notes': 'خطا در حذف یادداشت، لطفا دوباره اکتحان کنید.',
          'settings': "تنظیمات",
          'change_language': "تغییر زبان",
          'change_theme': 'تغییر نمایه',
          "delete_msg": "یادداشت حذف شد.",
          "no_match_note": "این یادداشت یافت نشد.",
          "title_empty": "خطا در ایجاد یادداشت، عنوان نباید خالی باشد.",
          "title_update_empty": "خطا در ویرایش یادداشت، عنوان نباید خالی باشد.",
          "note_added": "یادداشت با موفقیت اضافه شد",
          "note_updated": "یادداشت با موفقیت ویرایش شد",
        },
      };
}
