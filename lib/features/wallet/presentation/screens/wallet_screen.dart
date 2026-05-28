
import 'package:blinkit_money/core/theme/app_color.dart';
import 'package:blinkit_money/core/theme/app_spacing.dart';
import 'package:blinkit_money/core/utils/context_ext.dart';
import 'package:blinkit_money/features/wallet/presentation/widgets/claim_gift_card.dart';
import 'package:blinkit_money/features/wallet/presentation/widgets/wallet_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/animation/fading_animation.dart';
import '../../../../core/common/animation/wallet_feature_animation.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with TickerProviderStateMixin{

  late final AnimationController _controller;
  late final Animation<Offset> _walletInAnimation;
  late final Animation<Offset> _leftCelebrationInAnimation;
  late final Animation<double> _leftCelebrationRotationAnimation;
  late final Animation<Offset> _rightCelebrationInAnimation;
  late final Animation<Offset> _textAnimation1;
  late final Animation<Offset> _textAnimation2;
  late final List<WalletFeatureAnimation> _featureAnimations;
  late final Animation<double> _gradientStopAnimation;
  late final AnimationController _lottieCelebrationController;

  late final FadeAnimation _textFade1;
  late final FadeAnimation _textFade2;
  late final FadeAnimation _bottomFade;

  bool _hasPlayedLottie = false;

  final _walletAnimationInterval= const Interval(0.0, 0.5);
  final _celebrationInterval= const Interval(0.07, 0.4,
      curve: Curves.easeOutQuint
  );

  final _lightBackgroundColors=[
    AppColor.yellow,
    AppColor.white2,
  ];

  final _darkBackgroundColors=[
    AppColor.golden1,
    AppColor.blue1,
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    _controller = AnimationController(
      duration: const Duration(milliseconds: 7000),
      vsync: this,
    );

    _walletInAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, -0.2),
          end: const Offset(0.0, 2.5),
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 20.0,
      ),

      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0.0, 2.5)),
        weight: 5.0,
      ),

      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, 2.5),
          end: const Offset(0.0, 1),
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 40.0,
      ),

      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0.0, 1)),
        weight: 5.0,
      ),

      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, 1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 20.0,
      ),

    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: _walletAnimationInterval,
    ));

    _textAnimation1=  TweenSequence<Offset>([

      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0.0, 3.6)),
        weight: 65.0,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, 3.6),
          end: const Offset(0.0, 3.5),
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 10.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0.0, 3.5)),
        weight: 5.0,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, 3.5),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 20.0,
      ),

    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: _walletAnimationInterval,
    ));


    _textAnimation2=  TweenSequence<Offset>([
      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0.0, 2.2)),
        weight: 65.0,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, 2.3),
          end: const Offset(0.0, 2.1),
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 10.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0.0, 2.1)),
        weight: 5.0,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, 2.1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 20.0,
      ),

    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: _walletAnimationInterval,
    ));


    _textFade1 = FadeAnimation(
      controller: _controller,
      startTime: 0.325,
      endTime: 0.40,
    );

    _textFade2 = FadeAnimation(
      controller: _controller,
      startTime: 0.365,
      endTime: 0.4,
    );

    _bottomFade = FadeAnimation(
      controller: _controller,
      startTime: 0.6,
      endTime: 1.0,
    );
    _featureAnimations = [
      WalletFeatureAnimation(controller: _controller, startTime: 0.4, endTime: 0.45),
      WalletFeatureAnimation(controller: _controller, startTime: 0.45, endTime: 0.5),
      WalletFeatureAnimation(controller: _controller, startTime: 0.5, endTime: 0.55),
    ];

    _gradientStopAnimation = Tween<double>(
      begin: 0.7,
      end: 0.35,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.72, 1, curve: Curves.easeOut),
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

    _lottieCelebrationController= AnimationController(vsync: this);

    _rightCelebrationInAnimation.addListener((){
      if (_controller.value >= 0.20 && !_hasPlayedLottie) {
        _hasPlayedLottie = true;

        _lottieCelebrationController.reset();
        _lottieCelebrationController.forward();
      }

      if (_controller.value < 0.2) {
        _hasPlayedLottie = false;
      }
    });

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
      body: AnimatedBuilder(
        animation: _gradientStopAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: context.isLight()? _lightBackgroundColors : _darkBackgroundColors,
                stops: [0.0,_gradientStopAnimation.value],
              ),
            ),
            child: child,
          );
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:  Stack(
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
                    child:  FadeTransition(
                      opacity: _textFade1.opacity,
                      child: SlideTransition(
                        position: _textAnimation1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('blinkit',
                            style: context.textTheme().displaySmall?.copyWith(
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 220.h,
                    child:  FadeTransition(
                      opacity: _textFade2.opacity,
                      child: SlideTransition(
                        position: _textAnimation2,
                        child: Align(
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 300.h, left: AppSpacing.wM, right: AppSpacing.wM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeTransition(
                          opacity: _featureAnimations[0].opacity,
                          child: SlideTransition(
                            position: _featureAnimations[0].slide,
                            child: ScaleTransition(
                              scale: _featureAnimations[0].scale,
                              child: WalletFeature(
                                icon: 'assets/icons/ic_single_tap.webp',
                                title: 'Single tap payments',
                                description: "Enjoy seamless payments without the wait for OTPs",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSpacing.hSm,),
                        FadeTransition(
                          opacity: _featureAnimations[1].opacity,
                          child: SlideTransition(
                            position: _featureAnimations[1].slide,
                            child: ScaleTransition(
                              scale: _featureAnimations[1].scale,
                              child: WalletFeature(
                                icon: 'assets/icons/ic_no_failure.webp',
                                title: 'Zero failures',
                                description: "Zero payment failures ensure you never miss an order",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSpacing.hSm,),
                        FadeTransition(
                          opacity: _featureAnimations[2].opacity,
                          child: SlideTransition(
                            position: _featureAnimations[2].slide,
                            child: ScaleTransition(
                              scale: _featureAnimations[2].scale,
                              child: WalletFeature(
                                icon: 'assets/icons/ic_refunds.webp',
                                title: 'Real-time refunds',
                                description: "No need to wait for refunds. Blinkit Money refunds are instant!",
                              ),
                            ),
                          ),
                        ),

                      ],
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
                          _lottieCelebrationController.duration = const Duration(seconds: 4);;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.hMl,horizontal: AppSpacing.wM),
                child: FadeTransition(
                  opacity: _bottomFade.opacity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
            )
          ],
        ),
      ),
    );
  }
}
