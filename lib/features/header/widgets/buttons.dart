import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/widgets/hover_button.dart';
import 'package:mai_coding_world/cubits/cubits/language_cubit.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/services.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HoverButton(
          onPressed: () async {
            final data = await rootBundle.load(
              'assets/cv/Mai_Abdalla_flutter_dev.cv.pdf',
            );
            final bytes = data.buffer.asUint8List();

            final blob = html.Blob([bytes], 'application/pdf');
            final url = html.Url.createObjectUrlFromBlob(blob);

            final anchor =
                html.AnchorElement(href: url)
                  ..download = 'Mai Abdalla_flutter_dev.cv.pdf'
                  ..style.display = 'none';

            html.document.body?.append(anchor);
            anchor.click();
            Future.delayed(Duration(seconds: 1), () {
              anchor.remove();
              html.Url.revokeObjectUrl(url);
            });
          },
          text: "downloadCV",
          backgroundColor: Colors.blueAccent,
        ),
        const SizedBox(width: 12),
        HoverButton(
          onPressed: () {
            context.read<LanguageCubit>().toggleLanguage();
          },
          text: "language toggle",
        ),
      ],
    );
  }
}

// mai() async {
//   // final app = Firebase.app('WebApp');
//   // final firestore = FirebaseFirestore.instanceFor(app: app);
//   await FirebaseFirestore.instance.collection("projects").add(portfolio);
//   await FirebaseFirestore.instance.collection("projects").add(survey);
//   await FirebaseFirestore.instance.collection("projects").add(magic);
//   await FirebaseFirestore.instance.collection("projects").add(wasset);
// }

final portfolio = {
  "title": {"ar": "بورتفوليو مي عبد الله", "en": "Mai Abdalla Portfolio"},
  "description": {
    "ar":
        "بورتفوليو ويب تم تطويره باستخدام فلاتر لعرض مهارات وأعمال مي عبد الله. مرفوع على Firebase Hosting مع تخزين البيانات في Firebase وقواعد الصور في Firebase Storage. يحتوي على تحميل السيرة الذاتية، تنقل بين الأقسام، عرض معلومات التواصل والمهارات، وقسم الشهادات الذي يسمح للزوار بكتابة تعليقات وتقييمات.",
    "en":
        "A Flutter web portfolio showcasing Mai Abdalla's skills and projects. Hosted on Firebase Hosting with data stored in Firebase and images in Firebase Storage. Features resume download, section navigation, contact info, skills display, and a certificates section that allows visitors to leave comments and ratings.",
  },
  "features": {
    "ar": [
      "تطوير بفلتر ويب",
      "استضافة على Firebase Hosting",
      "تخزين البيانات في Firebase",
      "تخزين الصور في Firebase Storage",
      "تحميل السيرة الذاتية",
      "تنقل سلس بين الأقسام",
      "عرض معلومات التواصل والمهارات",
      "قسم الشهادات مع تعليقات وتقييمات الزوار",
    ],
    "en": [
      "Developed with Flutter Web",
      "Hosted on Firebase Hosting",
      "Data stored in Firebase",
      "Images stored in Firebase Storage",
      "Resume download feature",
      "Smooth section navigation",
      "Display contact information and skills",
      "Certificates section with visitor comments and ratings",
    ],
  },
  "technologies": {
    "ar": [
      "فلاتر ويب",
      "فايربيز (Hosting، Firestore، Storage)",
      "Bloc لإدارة الحالة",
    ],
    "en": [
      "Flutter Web",
      "Firebase (Hosting, Firestore, Storage)",
      "Bloc for state management",
    ],
  },
  "status": {"ar": "مُنشر", "en": "Published"},
  "client": {"ar": "مشروع شخصي", "en": "Personal project"},
  "projectLinks": [
    {
      "name": {"ar": "رابط البورتفوليو", "en": "Portfolio Link"},
      "url": "https://your-firebase-hosting-url.web.app",
    },
  ],
  "imageUrls": ["jhkjhkj"],
  "languages": {
    "ar": "يدعم اللغتين العربية والإنجليزية",
    "en": "Supports both Arabic and English",
  },
};

// final survey = {
//   "title": {"ar": "YourSurvey", "en": "YourSurvey"},
//   "description": {
//     "ar":
//         "YourSurvey هو تطبيق داخلي مخصص لشركة إماراتية صغيرة، يهدف إلى جمع بيانات ميدانية عن المحلات التجارية. يتميز بإمكانية تحديد الموقع بدقة، ومنع تكرار إدخال نفس المحل أكثر من مرة. كما يشمل نظام تسجيل دخول، واحتساب نقاط بناءً على عدد المواقع التي تم إدخالها، مع حفظ البيانات محليًا في حال عدم الاكتمال.",
//     "en":
//         "YourSurvey is an internal application built for a small UAE-based company. It is designed to collect field data about various shops and stores, with features like accurate location tracking, prevention of duplicate entries, user authentication, a point system based on completed entries, and local storage for incomplete data.",
//   },
//   "features": {
//     "ar": [
//       "تسجيل دخول",
//       "تحديد الموقع بدقة",
//       "منع تكرار إدخال نفس المحل",
//       "احتساب النقاط حسب عدد المحلات",
//       "حفظ البيانات غير المكتملة محليًا",
//     ],
//     "en": [
//       "Login system",
//       "Accurate location detection",
//       "Duplicate shop entry prevention",
//       "Points system based on entries",
//       "Local storage for incomplete data",
//     ],
//   },
//   "technologies": {
//     "ar": ["فلاتر", "فايربيز", "بلوك", "تحديد موقع", "تخزين محلي"],
//     "en": ["Flutter", "Firebase", "Bloc", "Geolocation", "Local storage"],
//   },
//   "status": {"ar": "منتهي", "en": "Completed"},
//   "client": {"ar": "شركة خاصة إماراتية", "en": "Private UAE-based company"},
//   "projectLinks": [],
//   "imageUrls": [
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749974625/WhatsApp_Image_2025-06-13_at_21.25.28_yextbv.jpg",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749900825/WhatsApp_Image_2025-06-13_at_21.25.29_1_ehwfwx.jpg",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749900825/WhatsApp_Image_2025-06-13_at_21.25.29_j4avdj.jpg",
//   ],
//   "languages": {"ar": "يدعم اللغة الإنجليزية", "en": "Supports English"},
// };
// final wasset = {
//   "title": {"ar": "الوسيط", "en": "Wasset"},
//   "description": {
//     "ar":
//         "\"الوسيط\" هو تطبيق عقاري مخصص للوسطاء والباحثين عن عقارات داخل المملكة العربية السعودية. يتيح للمستخدمين نشر إعلانات أو تقديم طلبات لعقارات بمواصفات معينة، مع دعم كامل للتقسيم الجغرافي حسب المدن السعودية، وخيارات تواصل مباشر وتعاون بين الوسطاء عبر تحالفات خاصة وعامة.",
//     "en":
//         "\"Wasset\" is a real estate application designed for brokers and property seekers across Saudi Arabia. It allows users to post property listings or submit specific property requests, with smart regional categorization by city and collaboration features between brokers via public and private alliances.",
//   },
//   "features": {
//     "ar": [
//       "نشر إعلانات عقارية بالتفاصيل",
//       "تقديم طلبات عقار مخصصة",
//       "تحالفات خاصة وعامة بين الوسطاء",
//       "شات داخلي لكل تحالف",
//       "شات مباشر بين العميل والوسيط",
//       "تقييمات للوسيط والإعلانات",
//       "خطط اشتراك مدفوعة",
//     ],
//     "en": [
//       "Post detailed property listings",
//       "Custom property requests",
//       "Public & private broker alliances",
//       "In-app chat within alliances",
//       "Chat between client & broker",
//       "Rating system for brokers and listings",
//       "Paid subscription plans",
//     ],
//   },
//   "technologies": {
//     "ar": ["فلاتر", "فايربيز", "بلوك", "باك إند مخصص"],
//     "en": ["Flutter", "Firebase", "Bloc", "Custom backend"],
//   },
//   "status": {"ar": "منتهي", "en": "Completed"},
//   "client": {
//     "ar": "عميل سعودي عن طريق شركة Morph",
//     "en": "Saudi client via Morph company",
//   },
//   "projectLinks":
//       [
//         ],
//   "imageUrls": [
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749834946/%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9_%D9%84%D9%84%D9%88%D8%B3%D9%8A%D8%B7_yh5vfv.png",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749834946/%D9%88%D8%B3%D8%B7%D8%A7%D8%A1_%D8%A7%D9%84%D9%85%D9%85%D9%84%D9%83%D8%A9_zoe3vm.png",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749834946/%D8%A7%D8%B9%D9%84%D8%A7%D9%86%D8%A7%D8%AA_%D9%85%D9%87%D8%AA%D9%85_%D9%81%D9%8A%D9%87%D8%A7_zkep4i.png",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749834946/%D8%AA%D8%AD%D8%A7%D9%84%D9%81%D8%A7%D8%AA%D9%8A_gedfbx.png",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749834946/%D9%86%D9%85%D8%B0%D9%88%D8%AC_%D8%B7%D9%84%D8%A8_%D8%AA%D9%88%D8%A7%D8%B5%D9%84_txojgp.png",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749834946/%D8%A7%D9%84%D9%85%D8%AD%D8%A7%D8%AF%D8%AB%D8%A9_g4drt5.png",
//   ],
//   "languages": {"ar": "يدعم اللغة العربية", "en": "Supports Arabic"},
// };
// final magic = {
//   "title": {"ar": "التوصيل السحري", "en": "Magic Delivery"},
//   "description": {
//     "ar":
//         "تطبيق شامل لنظام توصيل متكامل تابع لشركة توصيل عمانية، يتكون من ثلاثة تطبيقات: تطبيق العميل (في مرحلة التصميم)، تطبيق التاجر، وتطبيق المندوب. يهدف لتسهيل عمليات البيع، الطلب، والتوصيل بين التجار والعملاء، مع تتبع كامل لحالة الشحنات ونظام اشتراكات ومحافظ مالية.",
//     "en":
//         "A comprehensive delivery system developed for an Omani delivery company, consisting of three apps: a customer app (in design stage), a merchant app, and a delivery agent app. The platform facilitates product listing, delivery requests, shipment tracking, and includes subscription plans and wallet management.",
//   },
//   "features": {
//     "ar": [
//       "تسجيل التاجر بالإيميل",
//       "إدخال بيانات المتجر والوثائق الرسمية",
//       "طلب مندوب واختيار وسيلة التوصيل",
//       "تأكيد الطلبات عبر العمليات",
//       "تحويل الطلبات إلى شحنات",
//       "تتبع حالة الشحنة",
//       "إدارة محفظة التاجر",
//       "تسجيل المندوب برقم الهاتف",
//       "عرض واستلام طلبات التوصيل",
//       "التقاط صور الطلبات",
//       "مسح الباركود لمعرفة تفاصيل الشحنة",
//     ],
//     "en": [
//       "Merchant registration via email",
//       "Store data and license upload",
//       "Request delivery agent with options",
//       "Operations confirmation system",
//       "Convert requests to shipments",
//       "Shipment status tracking",
//       "Merchant wallet management",
//       "Agent registration via phone",
//       "Browse & accept delivery requests",
//       "Take package photos for operations",
//       "Barcode scanning for shipment details",
//     ],
//   },
//   "technologies": {
//     "ar": ["فلاتر", "فايربيز", "بلوك", "Mapbox", "إشعارات", "تخزين صور"],
//     "en": [
//       "Flutter",
//       "Firebase",
//       "Bloc",
//       "Mapbox",
//       "Push Notifications",
//       "Image Storage",
//     ],
//   },
//   "status": {"ar": "قيد التطوير", "en": "In Progress"},
//   "client": {"ar": "شركة توصيل عمانية", "en": "Omani Delivery Company"},
//   "projectLinks": [], // لم يُطلق بعد
//   "imageUrls": [
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749900825/WhatsApp_Image_2025-06-13_at_21.22.08_tnbgdr.jpg",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749900825/WhatsApp_Image_2025-06-13_at_21.22.09_edxb7f.jpg",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749900825/WhatsApp_Image_2025-06-13_at_21.22.10_ftx70q.jpg",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749900825/WhatsApp_Image_2025-06-13_at_21.22.08_1_a6h1kr.jpg",
//     "https://res.cloudinary.com/ddipbg15n/image/upload/v1749900825/WhatsApp_Image_2025-06-13_at_21.22.09_1_qgbqbw.jpg",
//   ],
//   "languages": {
//     "ar": "يدعم اللغتين العربية والإنجليزية",
//     "en": "Supports both Arabic and English",
//   },
// };
