import 'app_images.dart';
import 'package:dart_std/dart_std.dart';

mixin AppItems {
  static const recentContacts = <Triple<String, String, String>>[
    Triple(AppImages.hailey,'Hailey' , '+090078601'),
    Triple(AppImages.zayn, 'Zayn', '+090078601'),
    Triple(AppImages.thomas, 'Thomas', '+090078601')
  ];

  static const allContacts = <Triple<String, String, String>>[
    Triple(AppImages.haileyContact,'Hailey Sanders' , '+090078601'),
    Triple(AppImages.zaynContact, 'Zayn Michel', '+090078601'),
    Triple(AppImages.thomasContact, 'Thomas Denver', '+090078601')
  ];

  static const selectAccountItems = <Pair<String, String>>[
    Pair('02334457689','N1,000.00'),
    Pair('02334457689', 'N50,000.00'),
    Pair('02334457689', 'N10,000.00')
  ];
}