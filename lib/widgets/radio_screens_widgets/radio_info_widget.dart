import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:new_islamy/models/radio_model.dart';
import 'package:new_islamy/providers/radio_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RadioInfoWidget extends StatefulWidget {
  const RadioInfoWidget({
    super.key,
    required this.radioModel,
    required this.index,
    required this.sharedPreferences,
  });
  final RadioModel radioModel;
  final int index;
  final SharedPreferences sharedPreferences;

  @override
  State<RadioInfoWidget> createState() => _RadioInfoWidgetState();
}

class _RadioInfoWidgetState extends State<RadioInfoWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool canPlay = false;
  bool isFavourite = false;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isMuted = false;

  late Animation<double> waveAnimation;
  late AnimationController controller;

  @override
  void initState() {
    isFavourite =
        widget.sharedPreferences.getBool('isFavourite${widget.index}') ?? false;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    waveAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RadioProvider radioProvider = Provider.of<RadioProvider>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: 390.w,
        height: 133.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            isPlaying
                ? Positioned(
                    bottom: -38.h,
                    child: SizedBox(
                      width: 390.w,
                      height: 97.h,
                      child: AnimatedBuilder(
                        animation: waveAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scaleY: waveAnimation.value,
                            child: Image.asset('assets/images/soundWave 1.png'),
                          );
                        },
                      ),
                    ),
                  )
                : Positioned(
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                      child: Image.asset(
                        width: 390.w,
                        height: 97.h,
                        'assets/images/Mosque-02.png',
                      ),
                    ),
                  ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.radioModel.radioName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 20.sp,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        isFavourite = !isFavourite;
                        widget.sharedPreferences
                            .setBool('isFavourite${widget.index}', isFavourite);
                        setState(() {});
                      },
                      icon: Icon(
                        isFavourite
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        size: 35.r,
                      ),
                    ),
                    isPlaying
                        ? IconButton(
                            onPressed: () {
                              audioPlayer.pause();
                              radioProvider.nowPlaying = false;
                              isPlaying = false;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.pause,
                              size: 35.r,
                            ))
                        : IconButton(
                            onPressed: () {
                              if (radioProvider.nowPlaying == false &&
                                  radioProvider.reciterNowPlaying == false) {
                                audioPlayer.setUrl(widget.radioModel.radioUrl);
                                audioPlayer.play();
                                controller.repeat(reverse: true);
                                radioProvider.nowPlaying = true;
                                isPlaying = true;
                                setState(() {});
                              }
                            },
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              size: 35.r,
                            ),
                          ),
                    IconButton(
                      onPressed: () {
                        isMuted
                            ? audioPlayer.setVolume(1)
                            : audioPlayer.setVolume(0);
                        isMuted = !isMuted;
                        setState(() {});
                      },
                      icon: Icon(
                        isMuted
                            ? Icons.volume_off_rounded
                            : Icons.volume_up_rounded,
                        size: 35.r,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
