import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:symphonear_flutter_web/pages/onboarding_page.dart';

class SymphonearDrawer extends StatelessWidget {
  const SymphonearDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<bool> _isHovering =
    //     List.generate(appBarButtons.length, (index) => false);
    return Drawer(
      child: Container(
        color: Colors.grey.shade300,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {},
                  child: SymphonearClaveDeSolWidget(
                    height: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: appBarButtons.map((AppBarButton appBarButton) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => appBarButton.route,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  appBarButton.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )),
                Expanded(
                  flex: 2,
                  child: ContadorSaldoRestanteWidgetSymphonear(
                    isColumn: true,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class ContadorSaldoRestanteWidgetSymphonear extends StatelessWidget {
  final bool isColumn;
  const ContadorSaldoRestanteWidgetSymphonear({
    super.key,
    this.isColumn = false,
  });

  @override
  Widget build(BuildContext context) {
    return isColumn
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.av_timer, color: Colors.black),
              SizedBox(height: 4),
              Text('0D 0H 00:00', style: TextStyle(color: Colors.black)),
              SizedBox(height: 16),
              Icon(Icons.monetization_on, color: Colors.black),
              SizedBox(height: 4),
              Text('0 USDC', style: TextStyle(color: Colors.black)),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.av_timer, color: Colors.black),
              SizedBox(width: 2),
              Text('0D 0H 00:00', style: TextStyle(color: Colors.black)),
              SizedBox(width: 8),
              Icon(Icons.monetization_on, color: Colors.black),
              SizedBox(width: 2),
              Text('0 USDC', style: TextStyle(color: Colors.black)),
            ],
          );
  }
}

class SymphonearClaveDeSolWidget extends StatelessWidget {
  final double? height;
  const SymphonearClaveDeSolWidget({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'claveDeSol',
      child: SvgPicture.asset(
        'assets/clave_de_sol.svg',
        height: height ?? 50,
        //width: size?.width ?? 100,
      ),
    );
  }
}
