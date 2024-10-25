import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_islamy/models/radio_model.dart';
import 'package:new_islamy/providers/radio_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RadioInfoWidget extends StatelessWidget {
  RadioInfoWidget({super.key, required this.radioModel});
  final RadioModel radioModel;
  bool isPlaying = false;
  bool isFavourite = false;
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
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
            Positioned(
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
                  radioModel.radioName,
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
                        radioProvider.putToFavourite();
                        isFavourite = !isFavourite;
                      },
                      icon: Icon(isFavourite
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded),
                    ),
                    isPlaying
                        ? IconButton(
                            onPressed: () {
                              radioProvider.pauseAudio();
                              isPlaying = false;
                            },
                            icon: const Icon(Icons.pause))
                        : IconButton(
                            onPressed: () {
                              radioProvider.playAudio(radioModel.radioUrl);
                              isPlaying = true;
                            },
                            icon: const Icon(Icons.play_arrow_rounded),
                          ),
                    IconButton(
                      onPressed: () {
                        isMuted
                            ? radioProvider.unMuteAudio()
                            : radioProvider.muteAudio();
                        isMuted = !isMuted;
                      },
                      icon: Icon(isMuted
                          ? Icons.volume_off_rounded
                          : Icons.volume_up_rounded),
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
}
