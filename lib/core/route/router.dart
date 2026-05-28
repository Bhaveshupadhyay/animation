import 'package:blinkit_money/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const wallet = '/';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.wallet,
  routes: [
    GoRoute(
      path: AppRoutes.wallet,
      builder: (context, state) => const WalletScreen(),
    ),
  ],
);
