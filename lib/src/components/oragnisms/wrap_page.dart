import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/core/constant/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

final List<InfoItemBar> dataBottomSheet = [
  InfoItemBar(AssetsManager.icons.icon_graph_black,
      AssetsManager.icons.icon_graph, "Review", ApplicationRouteName.home),
  InfoItemBar(
      AssetsManager.icons.icon_vocab_black,
      AssetsManager.icons.icon_vocab_tab,
      "Learn vocabulary",
      ApplicationRouteName.learn),
  InfoItemBar(
      AssetsManager.icons.icon_notebook_black,
      AssetsManager.icons.ic_notebook_tab,
      "Notebook",
      ApplicationRouteName.notebook),
];

class WrapPage extends StatefulWidget {
  final Widget child;
  const WrapPage(this.child, {super.key});

  @override
  State<StatefulWidget> createState() => _WrapPage();
}

class _WrapPage extends State<WrapPage> {
  @override
  Widget build(BuildContext context) {
    _handleOpenProfilePage() {
      context.pushNamed(
        ApplicationRouteName.profile,
      );
    }

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(0, -3),
            blurRadius: 10,
            color: Color.fromRGBO(189, 189, 189, 0.2),
          ),
        ]),
        height: 60,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...dataBottomSheet
                .map((element) => ItemBottomBar(
                    inActiveIcon: element.inActiveIcon,
                    activeIcon: element.activeIcon,
                    namePage: element.namePage,
                    pageRedirect: element.pageRedirect))
                .toList()
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsManager.backgrounds.background_mobile,
            ),
            fit: BoxFit.fitHeight,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SafeArea(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsManager.images.logo_mochi_chinese,
                    height: 35,
                  ),
                  InkWell(
                      onTap: _handleOpenProfilePage, child: const ImageUser())
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: widget.child,
              ),
            )
          ],
        )),
      ),
    );
  }
}

class ItemBottomBar extends StatefulWidget {
  final String inActiveIcon;
  final String activeIcon;
  final String namePage;
  final String pageRedirect;
  const ItemBottomBar({
    super.key,
    required this.inActiveIcon,
    required this.activeIcon,
    required this.namePage,
    required this.pageRedirect,
  });

  @override
  State<StatefulWidget> createState() => _ItemBottomBar();
}

class _ItemBottomBar extends State<ItemBottomBar> {
  @override
  void initState() {
    super.initState();
  }

  handleRedirect() {
    final String currentPage = GoRouterState.of(context).uri.toString();
    // TODO: implement build
    final bool canRedirect = currentPage != widget.pageRedirect;
    if (canRedirect) {
      context.go(widget.pageRedirect);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String currentPage = GoRouterState.of(context).uri.toString();
    // TODO: implement build
    final bool isActive = currentPage == widget.pageRedirect;
    return GestureDetector(
      onTap: handleRedirect,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            // transitionBuilder: (Widget child, Animation<double> animation) =>
            //     ScaleTransition(scale: animation),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: isActive
                ? WrapAnimationBottomBar(returnImage(widget.activeIcon))
                : returnImage(widget.inActiveIcon),
          ),
          const SizedBox(
            height: 3,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(0, isActive ? -2 : 0, 0),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                  color: const Color(0xff212529),
                  fontWeight: isActive ? FontWeight.w400 : FontWeight.w300,
                  fontSize: 15),
              child: Text(
                widget.namePage,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }

  Widget returnImage(String pathImage) => pathImage.endsWith("svg")
      ? SvgPicture.asset(
          pathImage,
          height: 30,
        )
      : Image.asset(
          pathImage,
          height: 30,
        );
}

class WrapAnimationBottomBar extends StatefulWidget {
  final Widget child;

  WrapAnimationBottomBar(this.child, {super.key});
  @override
  State<StatefulWidget> createState() => _WrapAnimationBottomBar();
}

class _WrapAnimationBottomBar extends State<WrapAnimationBottomBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, -0.3),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 1, end: 1.4).animate(_controller);

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 100), () => {_controller.forward()});
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
    );
  }
}

class ImageUser extends StatefulWidget {
  const ImageUser({super.key});

  @override
  State<StatefulWidget> createState() => _ImageUser();
}

class _ImageUser extends State<ImageUser> {
  final double size = 60;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xfffb993b), width: 3),
          borderRadius: BorderRadius.circular(size / 2)),
      child: Image.asset(
        AssetsManager.images.userAvatar,
      ),
    );
  }
}

class InfoItemBar {
  final String inActiveIcon;
  final String activeIcon;
  final String namePage;
  final String pageRedirect;
  InfoItemBar(
    this.inActiveIcon,
    this.activeIcon,
    this.namePage,
    this.pageRedirect,
  );
}
