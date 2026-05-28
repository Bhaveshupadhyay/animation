import 'dart:math' as math;

import 'package:blinkit_money/core/theme/app_color.dart';
import 'package:blinkit_money/core/theme/app_spacing.dart';
import 'package:blinkit_money/core/utils/context_ext.dart';
import 'package:blinkit_money/core/utils/num_extensions.dart';
import 'package:blinkit_money/features/wallet/presentation/widgets/claim_gift_card.dart';
import 'package:blinkit_money/features/wallet/presentation/widgets/wallet_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with TickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _walletInAnimation;
  late Animation<Offset> _leftCelebrationInAnimation;
  late Animation<double> _leftCelebrationRotationAnimation;
  late Animation<Offset> _rightCelebrationInAnimation;
  late Animation<Offset> _topCelebrationInAnimation;
  late Animation<double> _topCelebrationOpacityAnimation;
  late Animation<double> _topCelebrationRotationAnimation;
  late final AnimationController _lottieCelebrationController;
  bool _hasPlayedLottie = false;

  final _celebrationInterval= const Interval(0.07, 0.4,
      curve: Curves.easeOutQuint
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    _controller = AnimationController(
      duration: const Duration(milliseconds: 10000),
      vsync: this,
    );

    _walletInAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.08,
      curve: Curves.easeInOut
      ),
    ));

    _leftCelebrationInAnimation = Tween<Offset>(
      begin: const Offset(-2.0, 2.0),
      end:  Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: _celebrationInterval
    ));
    _leftCelebrationRotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: _celebrationInterval
    ));

    _rightCelebrationInAnimation = Tween<Offset>(
      begin: const Offset(2.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve:_celebrationInterval
    ));
    _topCelebrationInAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: const Offset(0, 2),
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8,
            curve: Curves.easeIn
        )
    ));
    _topCelebrationOpacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.50, curve: Curves.easeIn),
    ));
    _topCelebrationRotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.2,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.70, curve: Curves.easeInOutSine),
    ));
    _lottieCelebrationController= AnimationController(vsync: this);
    _rightCelebrationInAnimation.addListener((){
      if (_controller.value >= 0.20 && !_hasPlayedLottie) {
        _hasPlayedLottie = true; // Lock it so it doesn't fire 60 times a second

        _lottieCelebrationController.reset();
        _lottieCelebrationController.forward();
      }

      // Reset the lock if the animation starts over
      if (_controller.value < 0.2) {
        _hasPlayedLottie = false;
      }
    });
    //
    // _walletInAnimation = Tween<Offset>(
    //   begin: const Offset(0.0, -0.15),
    //   end: Offset.zero,
    // ).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Interval(0, 0.08,
    //   curve: Curves.easeInOut
    //   ),
    // ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _lottieCelebrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              AppColor.golden1,
              AppColor.blue1,
            ],
            stops: [0.5,1]
          ),
        ),
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                _controller.reset();
                _controller.forward();
              },
              child: SizedBox(
                width: double.infinity,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.golden1,
                        AppColor.transparent,
                      ],
                      stops: [0.2, 1.0],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/images/wallet_dots_background.webp',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 120.h,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 60.h,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: SlideTransition(
                  position: _walletInAnimation,
                  child: Image.asset(
                    'assets/icons/ic_wallet.webp',
                    fit: BoxFit.cover,
                    width: 100.w,
                    height: 130.h,
                  )
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 185.h,
              child:  Align(
                alignment: Alignment.center,
                child: Text('blinkit',
                  style: context.textTheme().displaySmall,
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 220.h,
              child:  Align(
                alignment: Alignment.center,
                child: Text('MONEY',
                  style: context.textTheme().displayLarge?.copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 8.w
                  ),
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.wM,
              right: AppSpacing.wM,
              top: 300.h,
              child:  Align(
                alignment: Alignment.center,
                child: WalletFeature(
                  icon: 'assets/icons/ic_single_tap.webp',
                  title: 'Single tap payments',
                  description: "Enjoy seamless payments without the wait for OTPs",
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.wM,
              right: AppSpacing.wM,
              top: 410.h,
              child:  Align(
                alignment: Alignment.center,
                child: WalletFeature(
                  icon: 'assets/icons/ic_single_tap.webp',
                  title: 'Single tap payments',
                  description: "Enjoy seamless payments without the wait for OTPs",
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.wM,
              right: AppSpacing.wM,
              top: 520.h,
              child:  Align(
                alignment: Alignment.center,
                child: WalletFeature(
                  icon: 'assets/icons/ic_single_tap.webp',
                  title: 'Single tap payments',
                  description: "Enjoy seamless payments without the wait for OTPs",
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.wM,
              right: AppSpacing.wM,
              top: 600.h,
              bottom: 0,
              child:  Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.green,
                            foregroundColor: AppColor.white,
                            padding: EdgeInsets.symmetric(vertical: AppSpacing.hM),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Add Money',
                            style: context.textTheme().headlineSmall,
                          )),
                    ),
                    SizedBox(height: AppSpacing.hMl,),
                    ClaimGiftCard(
                      icon: 'assets/icons/ic_gift.png',
                      title: 'Claim Gift Card',
                      description: "Enter gift card details to claim your gift card",
                    ),

                    SizedBox(height: AppSpacing.hMl,),
                    Opacity(
                      opacity: 0.25,
                      child: Text(
                        'Enjoy seamless\none tap payments',
                        style: context.textTheme().displayMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: -350.h,
              right: 40.w,
              child: SlideTransition(
                position: _leftCelebrationInAnimation,
                child: RotationTransition(
                  turns: _leftCelebrationRotationAnimation,
                  child: Image.asset(
                    'assets/images/celebration.webp',

                    width: 250.w,
                    height: 400.h,
                  ),
                ),
              ),
            ),

            Positioned(
              top: -350.h,
              left: 40.w,
              child: SlideTransition(
                position: _rightCelebrationInAnimation,
                child: RotationTransition(
                  turns: _leftCelebrationRotationAnimation,
                  child: Image.asset(
                    'assets/images/celebration.webp',

                    width: 250.w,
                    height: 400.h,
                  ),
                ),
              ),
            ),

            ClipRect(
              clipBehavior: Clip.hardEdge,
              child: AnimatedBuilder(
                animation: _lottieCelebrationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _lottieCelebrationController.value  > 0.0 && _lottieCelebrationController.value < 1.0? 1.0 : 0.0,
                    child: child,
                  );
                },
                child: Lottie.asset('assets/lottie/celebration.json',
                  controller: _lottieCelebrationController,
                  repeat: false,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    _lottieCelebrationController.duration = const Duration(seconds: 4);;
                  },
                ),
              ),
            ),
              // ClipRect(
            //   clipBehavior: Clip.hardEdge,
            //   child: SlideTransition(
            //     position: _topCelebrationInAnimation,
            //     child: RotationTransition(
            //       turns: _topCelebrationRotationAnimation,
            //       child: Image.asset(
            //         'assets/images/celebration.webp',
            //         width: double.infinity,
            //         height: 0.55.sh,
            //       ),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 0.5.sh,
            //   bottom: 0,
            //   child: ClipRect(
            //     child: ShaderMask(
            //       blendMode: BlendMode.dstIn,
            //       shaderCallback: (bounds) {
            //         return const LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.center,
            //           colors: [Colors.red, AppColor.transparent],
            //           stops: [0.7, 1.0], // 👈 The bottom 30% of this box acts as a fading gateway
            //         ).createShader(bounds);
            //       },
            //       child: SlideTransition(
            //         position: _topCelebrationInAnimation,
            //         child: Image.asset(
            //           'assets/images/celebration.webp',
            //           height: 0.5.sh,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 0,
            //   bottom: 0.5.sh,
            //   child: SizedBox(
            //     height: 0.8.sh,
            //     child: ShaderMask(
            //       blendMode: BlendMode.dstIn,
            //       shaderCallback: (bounds) {
            //         return const LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [Colors.red, Colors.transparent],
            //           stops: [0.5, 1.0], // 👈 The bottom 30% of this box acts as a fading gateway
            //         ).createShader(bounds);
            //       },
            //       child: SlideTransition(
            //         position: _topCelebrationInAnimation,
            //         child: Image.asset(
            //           'assets/images/celebration.webp',
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // TOP RIGHT FALLING PAPERS (Spatial Disappearing Box)
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   bottom: 0.5.sh, // 👈 Container ends exactly at center
            //   child: ShaderMask(
            //     blendMode: BlendMode.dstIn,
            //     shaderCallback: (bounds) {
            //       return const LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [Colors.white, Colors.transparent],
            //         stops: [0.5, 1.0], // 👈 FIX: Stays solid white until the very bottom edge!
            //       ).createShader(bounds);
            //     },
            //     child: SlideTransition(
            //       position: _topCelebrationInAnimation,
            //       child: Image.asset(
            //         'assets/images/celebration.webp',
            //       ),
            //     ),
            //   ),
            // ),
            // SlideTransition(
            //     position: _rightCelebrationInAnimation,
            //     child: Image.asset(
            //       'assets/images/celebration.webp',
            //       fit: BoxFit.cover,
            //       width: 120.w,
            //       height: 120.w,
            //     )
            // ),




          ],
        ),
      ),
    );
  }
}
