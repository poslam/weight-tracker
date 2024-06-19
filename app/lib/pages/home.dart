import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/provider/repository.dart';
import '../features/ui/button.dart';
import '../navigation/navigator.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenRepository = ref.read(ProviderRepository.tokenRepository);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        forceMaterialTransparency: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.wait([
          // appBarBloc.refresh(),
          // qrBloc.refresh(1024),
          // visitorsBloc.refresh(),
        ]),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            CustomButton(
              text: "Выйти",
              onTap: () {
                tokenRepository.logout();
                AppNavigator.openLoginPage();
              },
            ),
          ],
        )),
        // child: ListView(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   children: const [
        //     // SizedBox(height: 24),
        //     // FFAppBar(),
        //     // SizedBox(height: 24),
        //     // OpenQrCodeButton(),
        //     // SizedBox(height: 24),
        //     // OpenQrScannerButton(),
        //     // SizedBox(height: 24),
        //     // VisitorsList(),
        //   ],
        // ),
      ),
    );
  }
}
