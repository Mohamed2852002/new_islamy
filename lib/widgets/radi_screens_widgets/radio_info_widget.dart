import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:new_islamy/models/radio_model.dart';

class RadioInfoWidget extends StatefulWidget {
  const RadioInfoWidget({super.key, required this.radioModel});
  final RadioModel radioModel;
  @override
  State<RadioInfoWidget> createState() => _RadioInfoWidgetState();
}

class _RadioInfoWidgetState extends State<RadioInfoWidget> {
  bool isPlaying = false;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.setUrl(widget.radioModel.radioUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_rounded),
                  ),
                  isPlaying
                      ? IconButton(
                          onPressed: () {
                            player.pause();
                            isPlaying = false;
                            setState(() {});
                          },
                          icon: const Icon(Icons.pause))
                      : IconButton(
                          onPressed: () {
                            player.play();
                            isPlaying = true;
                            setState(() {});
                          },
                          icon: const Icon(Icons.play_arrow_rounded),
                        ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_up_rounded),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
