// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(orderNumber) => "الطلب رقم ${orderNumber}";

  static String m1(message) => "حدث خطأ: ${message}";

  static String m2(form, label) =>
      "${Intl.select(form, {'one': 'لديك منتج ${label} بانتظار التقييم', 'other': 'لديك ${label} منتجات بانتظار التقييم'})}";

  static String m3(date) => "تم الطلب في ${date}";

  static String m4(quantity) => "الكمية: ${quantity}";

  static String m5(rating) => "${rating}★ فأعلى";

  static String m6(count) =>
      "${Intl.plural(count, zero: 'لا مراجعات', one: '${count} مراجعة', two: '${count} مراجعتان', few: '${count} مراجعات', many: '${count} مراجعة', other: '${count} مراجعة')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("حول"),
    "account": MessageLookupByLibrary.simpleMessage("الحساب"),
    "account_information": MessageLookupByLibrary.simpleMessage(
      "معلومات الحساب",
    ),
    "account_status": MessageLookupByLibrary.simpleMessage("حالة الحساب"),
    "add_address": MessageLookupByLibrary.simpleMessage("أضف عنوان"),
    "add_address_to_continue_checkout": MessageLookupByLibrary.simpleMessage(
      "أضف عنوان شحن للمتابعة في طلبك.",
    ),
    "add_new_address": MessageLookupByLibrary.simpleMessage("أضف عنوان جديد"),
    "add_payment_method": MessageLookupByLibrary.simpleMessage("أضف طريقة دفع"),
    "add_review": MessageLookupByLibrary.simpleMessage("أضف رأيك"),
    "add_to_cart": MessageLookupByLibrary.simpleMessage("أضف إلى العربة"),
    "additional_notes": MessageLookupByLibrary.simpleMessage("ملاحظات إضافية"),
    "additional_notes_hint_text": MessageLookupByLibrary.simpleMessage(
      "اكتب أي تفاصيل إضافية لمساعدة مندوب التوصيل في الوصول إلى العنوان بسهولة",
    ),
    "address_details": MessageLookupByLibrary.simpleMessage("تفاصيل العنوان"),
    "address_step": MessageLookupByLibrary.simpleMessage("العنوان"),
    "address_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث العنوان بنجاح",
    ),
    "all": MessageLookupByLibrary.simpleMessage("الكل"),
    "apartment_number": MessageLookupByLibrary.simpleMessage("رقم الشقة"),
    "app_name": MessageLookupByLibrary.simpleMessage("Cartely"),
    "apply": MessageLookupByLibrary.simpleMessage("تطبيق"),
    "apt_suite_etc": MessageLookupByLibrary.simpleMessage("المنزل/الشقة/الخ"),
    "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
    "backToHome": MessageLookupByLibrary.simpleMessage("العودة للرئيسية"),
    "back_to_address": MessageLookupByLibrary.simpleMessage("العودة للعناوين"),
    "back_to_cart": MessageLookupByLibrary.simpleMessage(
      "العودة إلى سلة التسوق",
    ),
    "back_to_payment": MessageLookupByLibrary.simpleMessage("العودة للدفع"),
    "building": MessageLookupByLibrary.simpleMessage("المبنى"),
    "building_details": MessageLookupByLibrary.simpleMessage("تفاصيل المبنى"),
    "cancel": MessageLookupByLibrary.simpleMessage("الغاء"),
    "cancelOrder": MessageLookupByLibrary.simpleMessage("إلغاء الطلب"),
    "card_holder": MessageLookupByLibrary.simpleMessage("حامل البطاقة"),
    "card_holder_name": MessageLookupByLibrary.simpleMessage(
      "اسم حامل البطاقة",
    ),
    "card_number": MessageLookupByLibrary.simpleMessage("رقم البطاقة"),
    "cart": MessageLookupByLibrary.simpleMessage("العربة"),
    "change_email": MessageLookupByLibrary.simpleMessage(
      "تغيير البريد الالكتروني",
    ),
    "change_password": MessageLookupByLibrary.simpleMessage(
      "تغيير كلمه المرور",
    ),
    "checkout": MessageLookupByLibrary.simpleMessage("الدفع"),
    "city": MessageLookupByLibrary.simpleMessage("المدينة"),
    "clear": MessageLookupByLibrary.simpleMessage("مسح"),
    "clear_cart_confirmation": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد مسح جميع العناصر من سلة التسوق؟",
    ),
    "color": MessageLookupByLibrary.simpleMessage("اللون"),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمه المرور",
    ),
    "confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل تأكيد كلمه المرور",
    ),
    "contact_info": MessageLookupByLibrary.simpleMessage("معلومات الاتصال"),
    "contact_us": MessageLookupByLibrary.simpleMessage("تواصل معنا"),
    "continueShopping": MessageLookupByLibrary.simpleMessage("متابعة التسوق"),
    "continue_shopping": MessageLookupByLibrary.simpleMessage("متابعة التسوق"),
    "continue_to_payment": MessageLookupByLibrary.simpleMessage(
      "الانتقال للدفع",
    ),
    "continue_to_review": MessageLookupByLibrary.simpleMessage(
      "الانتقال للمراجعة",
    ),
    "create_account": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "cvv_cvc": MessageLookupByLibrary.simpleMessage("CVV / CVC"),
    "dark": MessageLookupByLibrary.simpleMessage("داكن"),
    "default_": MessageLookupByLibrary.simpleMessage("الافتراضي"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "delete_review": MessageLookupByLibrary.simpleMessage("حذف المراجعة"),
    "delete_review_confirmation": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد حذف المراجعة؟",
    ),
    "deliveryStatus": MessageLookupByLibrary.simpleMessage("حالة التوصيل"),
    "delivery_address": MessageLookupByLibrary.simpleMessage("عنوان التوصيل"),
    "discount": MessageLookupByLibrary.simpleMessage("الخصم"),
    "district": MessageLookupByLibrary.simpleMessage("الحي"),
    "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "edit_address": MessageLookupByLibrary.simpleMessage("تعديل العنوان"),
    "edit_profile": MessageLookupByLibrary.simpleMessage("تعديل الملف الشخصي"),
    "edit_review": MessageLookupByLibrary.simpleMessage("تعديل المراجعة"),
    "edited": MessageLookupByLibrary.simpleMessage("تم التعديل"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
    "email_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الالكتروني",
    ),
    "emptyCart": MessageLookupByLibrary.simpleMessage("سلة التسوق فارغة"),
    "emptyCartDescription": MessageLookupByLibrary.simpleMessage(
      "يبدو أنك لم تضف أي منتجات بعد. ابدأ بالتسوق وأضف منتجاتك المفضلة.",
    ),
    "english": MessageLookupByLibrary.simpleMessage("الإنجليزية"),
    "error_body_subtitle": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما. يرجى المحاولة مرة أخرى.",
    ),
    "expires": MessageLookupByLibrary.simpleMessage("تاريخ الانتهاء"),
    "expiry_date": MessageLookupByLibrary.simpleMessage("تاريخ الانتهاء"),
    "failed_to_load_profile": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل الملف الشخصي",
    ),
    "featured_products": MessageLookupByLibrary.simpleMessage(
      "المنتجات المميزة",
    ),
    "floor": MessageLookupByLibrary.simpleMessage("الدور"),
    "forgot_password": MessageLookupByLibrary.simpleMessage(
      " هل نسيت كلمه المرور؟",
    ),
    "forgot_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الالكتروني لاستعادة كلمه المرور",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "full_name_hint": MessageLookupByLibrary.simpleMessage("أدخل الاسم الكامل"),
    "general": MessageLookupByLibrary.simpleMessage("عام"),
    "goToOrders": MessageLookupByLibrary.simpleMessage("الذهاب إلى الطلبات"),
    "go_to_home": MessageLookupByLibrary.simpleMessage(
      "الانتقال إلى الصفحة الرئيسية",
    ),
    "governorate": MessageLookupByLibrary.simpleMessage("المحافظة"),
    "help_center": MessageLookupByLibrary.simpleMessage("مركز المساعدة"),
    "home": MessageLookupByLibrary.simpleMessage("المنزل"),
    "inStock": MessageLookupByLibrary.simpleMessage("متوفر في المخزون"),
    "label_as": MessageLookupByLibrary.simpleMessage("التصنيف كـ"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "light": MessageLookupByLibrary.simpleMessage("فاتح"),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "login_welcome_message": MessageLookupByLibrary.simpleMessage(
      "مرحبا بعودتك!",
    ),
    "login_welcome_subtitle": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول لمتابعة رحلتك",
    ),
    "max": MessageLookupByLibrary.simpleMessage("الحد الأقصى"),
    "member_since": MessageLookupByLibrary.simpleMessage("عضو منذ"),
    "min": MessageLookupByLibrary.simpleMessage("الحد الأدنى"),
    "minimumRating": MessageLookupByLibrary.simpleMessage(
      "الحد الأدنى للتقييم",
    ),
    "my_addresses": MessageLookupByLibrary.simpleMessage("عناويني"),
    "my_cart": MessageLookupByLibrary.simpleMessage("عربتي"),
    "my_orders": MessageLookupByLibrary.simpleMessage("طلباتي"),
    "my_reviews": MessageLookupByLibrary.simpleMessage("مراجعاتي"),
    "no": MessageLookupByLibrary.simpleMessage("لا"),
    "noOrdersFound": MessageLookupByLibrary.simpleMessage("لا توجد طلبات"),
    "no_account": MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
    "no_addresses": MessageLookupByLibrary.simpleMessage("لا توجد عناوين"),
    "no_addresses_found": MessageLookupByLibrary.simpleMessage(
      "لا توجد عناوين بعد",
    ),
    "no_addresses_found_message": MessageLookupByLibrary.simpleMessage(
      "يبدو أنه ليس لديك أي عنوان محفوظ.",
    ),
    "no_changes_done": MessageLookupByLibrary.simpleMessage("لا توجد تغييرات"),
    "no_reviews_yet": MessageLookupByLibrary.simpleMessage(
      "لا توجد مراجعات حتى الآن",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("الاشعارات"),
    "offers_promotions": MessageLookupByLibrary.simpleMessage(
      "العروض الترويجية",
    ),
    "offers_promotions_subtitle": MessageLookupByLibrary.simpleMessage(
      "ابق على اطلاع بأحدث العروض والخصومات",
    ),
    "onSale": MessageLookupByLibrary.simpleMessage("عليه خصم"),
    "orderDetailsError": MessageLookupByLibrary.simpleMessage(
      "تعذر تحميل تفاصيل الطلب",
    ),
    "orderItems": MessageLookupByLibrary.simpleMessage("المنتجات"),
    "orderNumber": m0,
    "orderOnItsWay": MessageLookupByLibrary.simpleMessage("الطلب في الطريق"),
    "orderStatusCancelled": MessageLookupByLibrary.simpleMessage("ملغي"),
    "orderStatusConfirmed": MessageLookupByLibrary.simpleMessage("تم التأكيد"),
    "orderStatusDelivered": MessageLookupByLibrary.simpleMessage("تم التوصيل"),
    "orderStatusOutForDelivery": MessageLookupByLibrary.simpleMessage(
      "خرج للتوصيل",
    ),
    "orderStatusPending": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
    "orderStatusProcessing": MessageLookupByLibrary.simpleMessage(
      "جاري التجهيز",
    ),
    "orderStatusReturned": MessageLookupByLibrary.simpleMessage("تم الإرجاع"),
    "orderStatusShipped": MessageLookupByLibrary.simpleMessage("تم الشحن"),
    "order_history": MessageLookupByLibrary.simpleMessage("تاريخ الطلبات"),
    "order_number": MessageLookupByLibrary.simpleMessage("رقم الطلب"),
    "order_placed_message": MessageLookupByLibrary.simpleMessage(
      "تم تقديم طلبك بنجاح!",
    ),
    "order_rejected_message": MessageLookupByLibrary.simpleMessage(
      "للأسف، تم رفض طلبك. يرجى المحاولة مرة أخرى أو الاتصال بالدعم للحصول على المساعدة.",
    ),
    "order_rejected_title": MessageLookupByLibrary.simpleMessage(
      "تم رفض الطلب",
    ),
    "order_summary": MessageLookupByLibrary.simpleMessage("ملخص الطلب"),
    "order_updates": MessageLookupByLibrary.simpleMessage("تحديثات الطلب"),
    "order_updates_subtitle": MessageLookupByLibrary.simpleMessage(
      "احصل على إشعارات حول حالة طلبك",
    ),
    "ordersError": m1,
    "other": MessageLookupByLibrary.simpleMessage("اخرى"),
    "password": MessageLookupByLibrary.simpleMessage("كلمه المرور"),
    "password_hint": MessageLookupByLibrary.simpleMessage("أدخل كلمه المرور"),
    "paymentConfirmationDelayedMessage": MessageLookupByLibrary.simpleMessage(
      "لم نتلقَّ تأكيدًا لعملية الدفع حتى الآن. لا تقلق — تحقق من طلباتك بعد قليل، فقد تكتمل العملية بنجاح.",
    ),
    "paymentConfirmationDelayedTitle": MessageLookupByLibrary.simpleMessage(
      "تأخر تأكيد الدفع",
    ),
    "paymentConfirmedMessage": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء طلبك بنجاح.",
    ),
    "paymentConfirmedTitle": MessageLookupByLibrary.simpleMessage(
      "تم تأكيد الدفع!",
    ),
    "paymentConfirmingMessage": MessageLookupByLibrary.simpleMessage(
      "عادةً ما يستغرق هذا بضع ثوانٍ فقط. يُرجى عدم إغلاق هذه الصفحة.",
    ),
    "paymentConfirmingTitle": MessageLookupByLibrary.simpleMessage(
      "جارٍ تأكيد الدفع...",
    ),
    "paymentFailedMessage": MessageLookupByLibrary.simpleMessage(
      "تعذر علينا تأكيد عملية الدفع. يُرجى المحاولة مرة أخرى أو استخدام طريقة دفع مختلفة.",
    ),
    "paymentFailedTitle": MessageLookupByLibrary.simpleMessage("فشل الدفع"),
    "paymentStatus": MessageLookupByLibrary.simpleMessage("حالة الدفع"),
    "payment_method": MessageLookupByLibrary.simpleMessage("طريقة الدفع"),
    "payment_methods": MessageLookupByLibrary.simpleMessage("طرق الدفع"),
    "payment_step": MessageLookupByLibrary.simpleMessage("الدفع"),
    "pendingReviewsSubtitle": MessageLookupByLibrary.simpleMessage(
      "اضغط لتقييم مشترياتك الأخيرة",
    ),
    "pendingReviewsTitle": m2,
    "personal_details": MessageLookupByLibrary.simpleMessage(
      "التفاصيل الشخصية",
    ),
    "phone_number": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "place_order": MessageLookupByLibrary.simpleMessage("تأكيد الطلب"),
    "placedOn": m3,
    "placing_order": MessageLookupByLibrary.simpleMessage("جارٍ تقديم طلبك..."),
    "please_wait_while_we_process_your_order":
        MessageLookupByLibrary.simpleMessage(
          "يرجى الانتظار أثناء تأكيد طلبك. لن يستغرق ذلك سوى لحظة.",
        ),
    "price": MessageLookupByLibrary.simpleMessage("السعر"),
    "priceRange": MessageLookupByLibrary.simpleMessage("نطاق السعر"),
    "privacy_policy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
    "proceed_to_checkout": MessageLookupByLibrary.simpleMessage(
      "الانتقال للدفع",
    ),
    "product_description": MessageLookupByLibrary.simpleMessage("وصف المنتج"),
    "product_info": MessageLookupByLibrary.simpleMessage("معلومات المنتج"),
    "product_reviews": MessageLookupByLibrary.simpleMessage("اراء العملاء"),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "profile_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الملف الشخصي بنجاح",
    ),
    "push_notifications": MessageLookupByLibrary.simpleMessage("الاشعارات"),
    "push_notifications_subtitle": MessageLookupByLibrary.simpleMessage(
      "تلقي تحديثات حول طلباتك وعروضنا الحصرية",
    ),
    "quantity": m4,
    "quick_access": MessageLookupByLibrary.simpleMessage("الوصول السريع"),
    "rate_this_product": MessageLookupByLibrary.simpleMessage("قيم هذا المنتج"),
    "rate_your_purchases": MessageLookupByLibrary.simpleMessage("قيم مشترياتك"),
    "rating": MessageLookupByLibrary.simpleMessage("التقييم"),
    "ratingAndUp": m5,
    "region": MessageLookupByLibrary.simpleMessage("المنطقة"),
    "register": MessageLookupByLibrary.simpleMessage("سجل الآن"),
    "reorder": MessageLookupByLibrary.simpleMessage("إعادة الطلب"),
    "reset_password": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمه المرور",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "review": m6,
    "review_comment_error": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال تعليق.",
    ),
    "review_hint_text": MessageLookupByLibrary.simpleMessage(
      "شارك ارائك حول هذا المنتج",
    ),
    "review_step": MessageLookupByLibrary.simpleMessage("المراجعة"),
    "save": MessageLookupByLibrary.simpleMessage("حفظ"),
    "save_address": MessageLookupByLibrary.simpleMessage("حفظ العنوان"),
    "save_card": MessageLookupByLibrary.simpleMessage("حفظ البطاقة"),
    "saved_addresses": MessageLookupByLibrary.simpleMessage(
      "العناوين المحفوظة",
    ),
    "search_hint": MessageLookupByLibrary.simpleMessage("بحث عن المنتجات..."),
    "search_order_by_number": MessageLookupByLibrary.simpleMessage(
      "ابحث برقم الطلب",
    ),
    "security": MessageLookupByLibrary.simpleMessage("الامان"),
    "see_all_reviews": MessageLookupByLibrary.simpleMessage("شاهد جميع الاراء"),
    "select_language": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
    "select_rating_error": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار تقييم.",
    ),
    "select_theme": MessageLookupByLibrary.simpleMessage("اختر المظهر"),
    "set_as_default": MessageLookupByLibrary.simpleMessage("تعيين كافتراضي"),
    "set_as_default_address": MessageLookupByLibrary.simpleMessage(
      "تعيين كافتراضي",
    ),
    "set_as_default_payment_method": MessageLookupByLibrary.simpleMessage(
      "تعيين كافتراضي",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("الاعدادات"),
    "shipping": MessageLookupByLibrary.simpleMessage("الشحن"),
    "shipping_to": MessageLookupByLibrary.simpleMessage("الشحن الى"),
    "shop_by_category": MessageLookupByLibrary.simpleMessage("تسوق حسب الفئة"),
    "showDetails": MessageLookupByLibrary.simpleMessage("عرض التفاصيل"),
    "showProductsRatedAtLeast": MessageLookupByLibrary.simpleMessage(
      "عرض المنتجات التي تقييمها على الأقل…",
    ),
    "sign_out": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "sign_out_message": MessageLookupByLibrary.simpleMessage(
      "هل انت متاكد من تسجيل الخروج",
    ),
    "size": MessageLookupByLibrary.simpleMessage("الحجم"),
    "something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما. يرجى المحاولة مرة أخرى.",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("ترتيب حسب"),
    "sortMostPopular": MessageLookupByLibrary.simpleMessage("الأكثر شيوعًا"),
    "sortNewest": MessageLookupByLibrary.simpleMessage("الأحدث"),
    "sortPriceHighLow": MessageLookupByLibrary.simpleMessage(
      "السعر: من الأعلى إلى الأقل",
    ),
    "sortPriceLowHigh": MessageLookupByLibrary.simpleMessage(
      "السعر: من الأقل إلى الأعلى",
    ),
    "sortTopRated": MessageLookupByLibrary.simpleMessage("الأعلى تقييمًا"),
    "startShopping": MessageLookupByLibrary.simpleMessage("ابدأ التسوق"),
    "street": MessageLookupByLibrary.simpleMessage("الشارع"),
    "street_address": MessageLookupByLibrary.simpleMessage("العنوان"),
    "submit_review": MessageLookupByLibrary.simpleMessage("ارسال رأيك"),
    "subtotal": MessageLookupByLibrary.simpleMessage("الإجمالي"),
    "support": MessageLookupByLibrary.simpleMessage("الدعم"),
    "system": MessageLookupByLibrary.simpleMessage("النظام"),
    "tax": MessageLookupByLibrary.simpleMessage("الضريبة"),
    "terms_of_service": MessageLookupByLibrary.simpleMessage("شروط الخدمة"),
    "theme": MessageLookupByLibrary.simpleMessage("المظهر"),
    "total": MessageLookupByLibrary.simpleMessage("الإجمالي"),
    "trackOrder": MessageLookupByLibrary.simpleMessage("تتبع الطلب"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
    "try_again": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "use_this_address_for_checkout": MessageLookupByLibrary.simpleMessage(
      "استخدم هذا العنوان لإتمام عملية الشراء",
    ),
    "use_this_payment_method_for_checkout":
        MessageLookupByLibrary.simpleMessage(
          "استخدم طريقة الدفع هذه لإتمام عملية الشراء",
        ),
    "viewOrderDetails": MessageLookupByLibrary.simpleMessage(
      "عرض تفاصيل الطلب",
    ),
    "view_orders": MessageLookupByLibrary.simpleMessage("عرض الطلبات"),
    "wishlist": MessageLookupByLibrary.simpleMessage("المفضلة"),
    "work": MessageLookupByLibrary.simpleMessage("العمل"),
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
    "your_payment_info_is_stored_securely":
        MessageLookupByLibrary.simpleMessage(
          "معلومات الدفع الخاصة بك محفوظة بأمان",
        ),
  };
}
