import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/sura_model.dart';
import 'package:new_islamy/screens/quran_screens/quran_details_screen.dart';
import 'package:new_islamy/widgets/quran_screens_widgets/most_recently_widget.dart';
import 'package:new_islamy/widgets/quran_screens_widgets/quran_list_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with AutomaticKeepAliveClientMixin {
  final List<SuraModel> suras = const [
    SuraModel(
        arabSuraName: "الفاتحة",
        englishSuraName: "Al-Fatiha",
        suraVerses: 7,
        surahNumber: 1),
    SuraModel(
        arabSuraName: "البقرة",
        englishSuraName: "Al-Baqarah",
        suraVerses: 286,
        surahNumber: 2),
    SuraModel(
        arabSuraName: "آل عمران",
        englishSuraName: "Aal-E-Imran",
        suraVerses: 200,
        surahNumber: 3),
    SuraModel(
        arabSuraName: "النساء",
        englishSuraName: "An-Nisa",
        suraVerses: 176,
        surahNumber: 4),
    SuraModel(
        arabSuraName: "المائدة",
        englishSuraName: "Al-Ma'idah",
        suraVerses: 120,
        surahNumber: 5),
    SuraModel(
        arabSuraName: "الأنعام",
        englishSuraName: "Al-An'am",
        suraVerses: 165,
        surahNumber: 6),
    SuraModel(
        arabSuraName: "الأعراف",
        englishSuraName: "Al-A'raf",
        suraVerses: 206,
        surahNumber: 7),
    SuraModel(
        arabSuraName: "الأنفال",
        englishSuraName: "Al-Anfal",
        suraVerses: 75,
        surahNumber: 8),
    SuraModel(
        arabSuraName: "التوبة",
        englishSuraName: "At-Tawbah",
        suraVerses: 129,
        surahNumber: 9),
    SuraModel(
        arabSuraName: "يونس",
        englishSuraName: "Yunus",
        suraVerses: 109,
        surahNumber: 10),
    SuraModel(
        arabSuraName: "هود",
        englishSuraName: "Hud",
        suraVerses: 123,
        surahNumber: 11),
    SuraModel(
        arabSuraName: "يوسف",
        englishSuraName: "Yusuf",
        suraVerses: 111,
        surahNumber: 12),
    SuraModel(
        arabSuraName: "الرعد",
        englishSuraName: "Ar-Ra'd",
        suraVerses: 43,
        surahNumber: 13),
    SuraModel(
        arabSuraName: "إبراهيم",
        englishSuraName: "Ibrahim",
        suraVerses: 52,
        surahNumber: 14),
    SuraModel(
        arabSuraName: "الحجر",
        englishSuraName: "Al-Hijr",
        suraVerses: 99,
        surahNumber: 15),
    SuraModel(
        arabSuraName: "النحل",
        englishSuraName: "An-Nahl",
        suraVerses: 128,
        surahNumber: 16),
    SuraModel(
        arabSuraName: "الإسراء",
        englishSuraName: "Al-Isra",
        suraVerses: 111,
        surahNumber: 17),
    SuraModel(
        arabSuraName: "الكهف",
        englishSuraName: "Al-Kahf",
        suraVerses: 110,
        surahNumber: 18),
    SuraModel(
        arabSuraName: "مريم",
        englishSuraName: "Maryam",
        suraVerses: 98,
        surahNumber: 19),
    SuraModel(
        arabSuraName: "طه",
        englishSuraName: "Ta-Ha",
        suraVerses: 135,
        surahNumber: 20),
    SuraModel(
        arabSuraName: "الأنبياء",
        englishSuraName: "Al-Anbiya",
        suraVerses: 112,
        surahNumber: 21),
    SuraModel(
        arabSuraName: "الحج",
        englishSuraName: "Al-Hajj",
        suraVerses: 78,
        surahNumber: 22),
    SuraModel(
        arabSuraName: "المؤمنون",
        englishSuraName: "Al-Mu'minun",
        suraVerses: 118,
        surahNumber: 23),
    SuraModel(
        arabSuraName: "النور",
        englishSuraName: "An-Nur",
        suraVerses: 64,
        surahNumber: 24),
    SuraModel(
        arabSuraName: "الفرقان",
        englishSuraName: "Al-Furqan",
        suraVerses: 77,
        surahNumber: 25),
    SuraModel(
        arabSuraName: "الشعراء",
        englishSuraName: "Ash-Shu'ara",
        suraVerses: 227,
        surahNumber: 26),
    SuraModel(
        arabSuraName: "النمل",
        englishSuraName: "An-Naml",
        suraVerses: 93,
        surahNumber: 27),
    SuraModel(
        arabSuraName: "القصص",
        englishSuraName: "Al-Qasas",
        suraVerses: 88,
        surahNumber: 28),
    SuraModel(
        arabSuraName: "العنكبوت",
        englishSuraName: "Al-Ankabut",
        suraVerses: 69,
        surahNumber: 29),
    SuraModel(
        arabSuraName: "الروم",
        englishSuraName: "Ar-Rum",
        suraVerses: 60,
        surahNumber: 30),
    SuraModel(
        arabSuraName: "لقمان",
        englishSuraName: "Luqman",
        suraVerses: 34,
        surahNumber: 31),
    SuraModel(
        arabSuraName: "السجدة",
        englishSuraName: "As-Sajda",
        suraVerses: 30,
        surahNumber: 32),
    SuraModel(
        arabSuraName: "الأحزاب",
        englishSuraName: "Al-Ahzab",
        suraVerses: 73,
        surahNumber: 33),
    SuraModel(
        arabSuraName: "سبأ",
        englishSuraName: "Saba",
        suraVerses: 54,
        surahNumber: 34),
    SuraModel(
        arabSuraName: "فاطر",
        englishSuraName: "Fatir",
        suraVerses: 45,
        surahNumber: 35),
    SuraModel(
        arabSuraName: "يس",
        englishSuraName: "Ya-Sin",
        suraVerses: 83,
        surahNumber: 36),
    SuraModel(
        arabSuraName: "الصافات",
        englishSuraName: "As-Saffat",
        suraVerses: 182,
        surahNumber: 37),
    SuraModel(
        arabSuraName: "ص",
        englishSuraName: "Sad",
        suraVerses: 88,
        surahNumber: 38),
    SuraModel(
        arabSuraName: "الزمر",
        englishSuraName: "Az-Zumar",
        suraVerses: 75,
        surahNumber: 39),
    SuraModel(
        arabSuraName: "غافر",
        englishSuraName: "Ghafir",
        suraVerses: 85,
        surahNumber: 40),
    SuraModel(
        arabSuraName: "فصلت",
        englishSuraName: "Fussilat",
        suraVerses: 54,
        surahNumber: 41),
    SuraModel(
        arabSuraName: "الشورى",
        englishSuraName: "Ash-Shura",
        suraVerses: 53,
        surahNumber: 42),
    SuraModel(
        arabSuraName: "الزخرف",
        englishSuraName: "Az-Zukhruf",
        suraVerses: 89,
        surahNumber: 43),
    SuraModel(
        arabSuraName: "الدخان",
        englishSuraName: "Ad-Dukhan",
        suraVerses: 59,
        surahNumber: 44),
    SuraModel(
        arabSuraName: "الجاثية",
        englishSuraName: "Al-Jathiya",
        suraVerses: 37,
        surahNumber: 45),
    SuraModel(
        arabSuraName: "الأحقاف",
        englishSuraName: "Al-Ahqaf",
        suraVerses: 35,
        surahNumber: 46),
    SuraModel(
        arabSuraName: "محمد",
        englishSuraName: "Muhammad",
        suraVerses: 38,
        surahNumber: 47),
    SuraModel(
        arabSuraName: "الفتح",
        englishSuraName: "Al-Fath",
        suraVerses: 29,
        surahNumber: 48),
    SuraModel(
        arabSuraName: "الحجرات",
        englishSuraName: "Al-Hujurat",
        suraVerses: 18,
        surahNumber: 49),
    SuraModel(
        arabSuraName: "ق",
        englishSuraName: "Qaf",
        suraVerses: 45,
        surahNumber: 50),
    SuraModel(
        arabSuraName: "الذاريات",
        englishSuraName: "Adh-Dhariyat",
        suraVerses: 60,
        surahNumber: 51),
    SuraModel(
        arabSuraName: "الطور",
        englishSuraName: "At-Tur",
        suraVerses: 49,
        surahNumber: 52),
    SuraModel(
        arabSuraName: "النجم",
        englishSuraName: "An-Najm",
        suraVerses: 62,
        surahNumber: 53),
    SuraModel(
        arabSuraName: "القمر",
        englishSuraName: "Al-Qamar",
        suraVerses: 55,
        surahNumber: 54),
    SuraModel(
        arabSuraName: "الرحمن",
        englishSuraName: "Ar-Rahman",
        suraVerses: 78,
        surahNumber: 55),
    SuraModel(
        arabSuraName: "الواقع",
        englishSuraName: "Al-Waqi'a",
        suraVerses: 96,
        surahNumber: 56),
    SuraModel(
        arabSuraName: "الحديد",
        englishSuraName: "Al-Hadid",
        suraVerses: 29,
        surahNumber: 57),
    SuraModel(
        arabSuraName: "المجادلة",
        englishSuraName: "Al-Mujadila",
        suraVerses: 22,
        surahNumber: 58),
    SuraModel(
        arabSuraName: "الحشر",
        englishSuraName: "Al-Hashr",
        suraVerses: 24,
        surahNumber: 59),
    SuraModel(
        arabSuraName: "الممتحنة",
        englishSuraName: "Al-Mumtahana",
        suraVerses: 13,
        surahNumber: 60),
    SuraModel(
        arabSuraName: "الصف",
        englishSuraName: "As-Saff",
        suraVerses: 14,
        surahNumber: 61),
    SuraModel(
        arabSuraName: "الجمعة",
        englishSuraName: "Al-Jumu'a",
        suraVerses: 11,
        surahNumber: 62),
    SuraModel(
        arabSuraName: "المنافقون",
        englishSuraName: "Al-Munafiqun",
        suraVerses: 11,
        surahNumber: 63),
    SuraModel(
        arabSuraName: "التغابن",
        englishSuraName: "At-Taghabun",
        suraVerses: 18,
        surahNumber: 64),
    SuraModel(
        arabSuraName: " الطلاق",
        englishSuraName: "At-Talaq",
        suraVerses: 12,
        surahNumber: 65),
    SuraModel(
        arabSuraName: "التحريم",
        englishSuraName: "At-Tahrim",
        suraVerses: 12,
        surahNumber: 66),
    SuraModel(
        arabSuraName: "الملك",
        englishSuraName: "Al-Mulk",
        suraVerses: 30,
        surahNumber: 67),
    SuraModel(
        arabSuraName: "القلم",
        englishSuraName: "Al-Qalam",
        suraVerses: 52,
        surahNumber: 68),
    SuraModel(
        arabSuraName: "الحاقة",
        englishSuraName: "Al-Haaqqa",
        suraVerses: 52,
        surahNumber: 69),
    SuraModel(
        arabSuraName: "المعارج",
        englishSuraName: "Al-Ma'arij",
        suraVerses: 44,
        surahNumber: 70),
    SuraModel(
        arabSuraName: "نوح",
        englishSuraName: "Nuh",
        suraVerses: 28,
        surahNumber: 71),
    SuraModel(
        arabSuraName: "الجن",
        englishSuraName: "Al-Jinn",
        suraVerses: 28,
        surahNumber: 72),
    SuraModel(
        arabSuraName: "المُزمل",
        englishSuraName: "Al-Muzzammil",
        suraVerses: 20,
        surahNumber: 73),
    SuraModel(
        arabSuraName: "المدثر",
        englishSuraName: "Al-Muddaththir",
        suraVerses: 56,
        surahNumber: 74),
    SuraModel(
        arabSuraName: "القيامة",
        englishSuraName: "Al-Qiyama",
        suraVerses: 40,
        surahNumber: 75),
    SuraModel(
        arabSuraName: "الإنسان",
        englishSuraName: "Al-Insan",
        suraVerses: 31,
        surahNumber: 76),
    SuraModel(
        arabSuraName: "المرسلات",
        englishSuraName: "Al-Mursalat",
        suraVerses: 50,
        surahNumber: 77),
    SuraModel(
        arabSuraName: "النبأ",
        englishSuraName: "An-Naba",
        suraVerses: 40,
        surahNumber: 78),
    SuraModel(
        arabSuraName: "النازعات",
        englishSuraName: "An-Nazi'at",
        suraVerses: 46,
        surahNumber: 79),
    SuraModel(
        arabSuraName: "عبس",
        englishSuraName: "Abasa",
        suraVerses: 42,
        surahNumber: 80),
    SuraModel(
        arabSuraName: "التكوير",
        englishSuraName: "At-Takwir",
        suraVerses: 29,
        surahNumber: 81),
    SuraModel(
        arabSuraName: "الإنفطار",
        englishSuraName: "Al-Infitar",
        suraVerses: 19,
        surahNumber: 82),
    SuraModel(
        arabSuraName: "المطففين",
        englishSuraName: "Al-Mutaffifin",
        suraVerses: 36,
        surahNumber: 83),
    SuraModel(
        arabSuraName: "الانشقاق",
        englishSuraName: "Al-Inshiqaq",
        suraVerses: 25,
        surahNumber: 84),
    SuraModel(
        arabSuraName: "البروج",
        englishSuraName: "Al-Burooj",
        suraVerses: 22,
        surahNumber: 85),
    SuraModel(
        arabSuraName: "الطارق",
        englishSuraName: "At-Takrik",
        suraVerses: 17,
        surahNumber: 86),
    SuraModel(
        arabSuraName: "الأعلى",
        englishSuraName: "Al-A'la",
        suraVerses: 19,
        surahNumber: 87),
    SuraModel(
        arabSuraName: "الغاشية",
        englishSuraName: "Al-Ghashiya",
        suraVerses: 26,
        surahNumber: 88),
    SuraModel(
        arabSuraName: "الفجر",
        englishSuraName: "Al-Fajr",
        suraVerses: 30,
        surahNumber: 89),
    SuraModel(
        arabSuraName: "البلد",
        englishSuraName: "Al-Balad",
        suraVerses: 20,
        surahNumber: 90),
    SuraModel(
        arabSuraName: "الشمس",
        englishSuraName: "Ash-Shams",
        suraVerses: 15,
        surahNumber: 91),
    SuraModel(
        arabSuraName: "الليل",
        englishSuraName: "Al-Lail",
        suraVerses: 21,
        surahNumber: 92),
    SuraModel(
        arabSuraName: "الضحى",
        englishSuraName: "Ad-Duha",
        suraVerses: 11,
        surahNumber: 93),
    SuraModel(
        arabSuraName: "الشرح",
        englishSuraName: "Al-Inshirah",
        suraVerses: 8,
        surahNumber: 94),
    SuraModel(
        arabSuraName: "التين",
        englishSuraName: "At-Tin",
        suraVerses: 8,
        surahNumber: 95),
    SuraModel(
        arabSuraName: "العلق",
        englishSuraName: "Al-Alaq",
        suraVerses: 19,
        surahNumber: 96),
    SuraModel(
        arabSuraName: "القدر",
        englishSuraName: "Al-Qadr",
        suraVerses: 5,
        surahNumber: 97),
    SuraModel(
        arabSuraName: "البينة",
        englishSuraName: "Al-Bayyina",
        suraVerses: 8,
        surahNumber: 98),
    SuraModel(
        arabSuraName: "الزلزلة",
        englishSuraName: "Az-Zalzala",
        suraVerses: 8,
        surahNumber: 99),
    SuraModel(
        arabSuraName: "العاديات",
        englishSuraName: "Al-Adiyat",
        suraVerses: 11,
        surahNumber: 100),
    SuraModel(
        arabSuraName: "القارعة",
        englishSuraName: "Al-Qari'a",
        suraVerses: 11,
        surahNumber: 101),
    SuraModel(
        arabSuraName: "التكاثر",
        englishSuraName: "At-Takathur",
        suraVerses: 8,
        surahNumber: 102),
    SuraModel(
        arabSuraName: "العصر",
        englishSuraName: "Al-Asr",
        suraVerses: 3,
        surahNumber: 103),
    SuraModel(
        arabSuraName: "الهمزة",
        englishSuraName: "Al-Humazah",
        suraVerses: 9,
        surahNumber: 104),
    SuraModel(
        arabSuraName: "الفيل",
        englishSuraName: "Al-Fil",
        suraVerses: 5,
        surahNumber: 105),
    SuraModel(
        arabSuraName: "قريش",
        englishSuraName: "Quraish",
        suraVerses: 4,
        surahNumber: 106),
    SuraModel(
        arabSuraName: "الماعون",
        englishSuraName: "Al-Ma'un",
        suraVerses: 7,
        surahNumber: 107),
    SuraModel(
        arabSuraName: "الكوثر",
        englishSuraName: "Al-Kawthar",
        suraVerses: 3,
        surahNumber: 108),
    SuraModel(
        arabSuraName: "الكافرون",
        englishSuraName: "Al-Kafirun",
        suraVerses: 6,
        surahNumber: 109),
    SuraModel(
        arabSuraName: "النصر",
        englishSuraName: "An-Nasr",
        suraVerses: 3,
        surahNumber: 110),
    SuraModel(
        arabSuraName: "المسد",
        englishSuraName: "Al-Masad",
        suraVerses: 5,
        surahNumber: 111),
    SuraModel(
        arabSuraName: "الإخلاص",
        englishSuraName: "Al-Ikhlas",
        suraVerses: 4,
        surahNumber: 112),
    SuraModel(
        arabSuraName: "الفلق",
        englishSuraName: "Al-Falaq",
        suraVerses: 5,
        surahNumber: 113),
    SuraModel(
        arabSuraName: "الناس",
        englishSuraName: "An-Nas",
        suraVerses: 6,
        surahNumber: 114),
  ];

  List<SuraModel> foundSura = [];

  filterSura(String enteredKeys) {
    List<SuraModel> reslts = [];
    final RegExp arabicRegex = RegExp(r'[\u0600-\u06FF]');

    if (enteredKeys.isEmpty) {
      reslts = suras;
    } else if (arabicRegex.hasMatch(enteredKeys)) {
      reslts = suras
          .where((sura) => sura.arabSuraName.contains(enteredKeys))
          .toList();
    } else {
      reslts = suras
          .where((sura) => sura.englishSuraName
              .toLowerCase()
              .contains(enteredKeys.toLowerCase()))
          .toList();
    }
    setState(() {
      foundSura = reslts;
    });
  }

  @override
  bool get wantKeepAlive => true;
  bool isVisible = false;
  List<MostRecentlyWidget> mostRecentSuras = [];
  List<int> surasIndex = [];

  loadMostRecentSura() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? arabSuraNames =
        sharedPreferences.getStringList('arabSuraName');
    List<String>? englishSuraNames =
        sharedPreferences.getStringList('englishSuraName');
    List<String>? suraVerses = sharedPreferences.getStringList('suraVerses');
    if (arabSuraNames != null &&
        englishSuraNames != null &&
        suraVerses != null) {
      if (arabSuraNames.isNotEmpty) {
        isVisible = true;
        if (sharedPreferences.getStringList('suraIndex') != null) {
          for (var i = 0;
              i < sharedPreferences.getStringList('suraIndex')!.length;
              i++) {
            surasIndex.add(
                int.parse(sharedPreferences.getStringList('suraIndex')![i]));
          }
        }
        for (var i = 0; i < arabSuraNames.length; i++) {
          mostRecentSuras.add(
            MostRecentlyWidget(
                arabSuraName: arabSuraNames[i],
                englishSuraName: englishSuraNames[i],
                suraVerses: suraVerses[i]),
          );
        }
      } else {
        mostRecentSuras = [];
        surasIndex = [];
      }
    } else {
      mostRecentSuras = [];
      surasIndex = [];
    }
    setState(() {});
  }

  @override
  void initState() {
    loadMostRecentSura();
    super.initState();
    foundSura = suras;
  }

  void addMostRecentSura(SuraModel suraModel, int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (surasIndex.contains(index)) {
      return;
    }

    if (mostRecentSuras.length == 3) {
      mostRecentSuras.removeAt(0);
    }
    if (surasIndex.length == 3) {
      surasIndex.removeAt(0);
    }
    mostRecentSuras.add(
      MostRecentlyWidget(
        englishSuraName: suraModel.englishSuraName,
        arabSuraName: suraModel.arabSuraName,
        suraVerses: suraModel.suraVerses.toString(),
      ),
    );
    surasIndex.add(index);
    List<String> indexsurah =
        surasIndex.map((index) => index.toString()).toList();
    List<String> arabSuraNames =
        mostRecentSuras.map((data) => data.arabSuraName).toList();
    List<String> englishSuraNames =
        mostRecentSuras.map((data) => data.englishSuraName).toList();
    List<String> suraVerses =
        mostRecentSuras.map((data) => data.suraVerses).toList();
    sharedPreferences.setStringList('suraIndex', indexsurah);
    sharedPreferences.setStringList('arabSuraName', arabSuraNames);
    sharedPreferences.setStringList('englishSuraName', englishSuraNames);
    sharedPreferences.setStringList('suraVerses', suraVerses);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: TextField(
            onChanged: (value) {
              filterSura(value);
            },
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.sura_name_text_field,
              prefixIcon: const ImageIcon(
                AssetImage('assets/images/quran_tab.png'),
              ),
            ),
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.most_recent_sura,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();

                          setState(() {
                            sharedPreferences.setStringList('suraIndex', []);
                            sharedPreferences.setStringList('arabSuraName', []);
                            sharedPreferences
                                .setStringList('englishSuraName', []);
                            sharedPreferences.setStringList('suraVerses', []);
                            isVisible = false;
                            mostRecentSuras.clear();
                            surasIndex.clear();
                          });
                        },
                        child: Visibility(
                          visible: isVisible,
                          child: Text(
                            AppLocalizations.of(context)!.clear_recent_sura,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                sliver: SliverToBoxAdapter(
                  child: Visibility(
                    visible: isVisible,
                    child: SizedBox(
                      height: 150.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: mostRecentSuras.length,
                        itemBuilder: (context, index) => mostRecentSuras[index],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    AppLocalizations.of(context)!.sura_list,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                sliver: SliverList.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: foundSura.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        addMostRecentSura(foundSura[index], index);
                        isVisible = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuranDetailsScreen(
                            suraModel: foundSura[index],
                          ),
                        ),
                      );
                    },
                    child: QuranListWidget(
                      suraModel: foundSura[index],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
