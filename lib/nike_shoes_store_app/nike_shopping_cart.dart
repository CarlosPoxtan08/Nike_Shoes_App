import 'package:flutter/material.dart';
import 'package:nike_app_1/nike_shoes_store_app/nike_shoes.dart';

const _buttonSizeWidth = 160.0;
const _buttonSizeHeight = 60.0;
const _buttonCircularSize = 60.0;

class NikeShoppingCart extends StatefulWidget {
  final NikeShoes shoes;

  const NikeShoppingCart({super.key, required this.shoes});

  @override
  State<NikeShoppingCart> createState() => _NikeShoppingCartState();
}

class _NikeShoppingCartState extends State<NikeShoppingCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animationButton1;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animationButton1 = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.2,
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPanel() {
    final size = MediaQuery.of(context).size;
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            0.0,
            value * size.height * 0.6,
          ),
          child: child,
        );
      },
      child: Container(
        height: size.height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    widget.shoes.images.first,
                    height: 120,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        widget.shoes.model,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '\$${widget.shoes.currentPrice.toInt().toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(_animationButton1.value);
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Stack(
                    children: <Widget>[
                      _buildPanel(),
                      Positioned(
                        bottom: 40,
                        left: size.width / 2 -
                            (_buttonSizeWidth * _animationButton1.value).clamp(
                                  _buttonCircularSize,
                                  _buttonSizeWidth,
                                ) /
                                2,
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                          tween: Tween(begin: 1.0, end: 0.0),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(
                                0.0,
                                value * size.height * 0.6,
                              ),
                              child: child,
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              _controller.forward();
                            },
                            child: Container(
                              width:
                                  (_buttonSizeWidth * _animationButton1.value)
                                      .clamp(
                                _buttonCircularSize,
                                _buttonSizeWidth,
                              ),
                              height:
                                  (_buttonSizeHeight * _animationButton1.value)
                                      .clamp(
                                _buttonCircularSize,
                                _buttonSizeHeight,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Expanded(
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                    if (_animationButton1.value == 1) ...[
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'ADD TO CART',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
