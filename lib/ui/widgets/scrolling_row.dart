import 'dart:async';

import 'package:flutter/material.dart';

class AutoScrollRow extends StatefulWidget {
  const AutoScrollRow({super.key, required this.text});

  final String text;

  @override
  State<AutoScrollRow> createState() {
    return _AutoScrollRowState();
  }
}

class _AutoScrollRowState extends State<AutoScrollRow> {
  late ScrollController _scrollController;
  late Timer _timer;
  bool _scrollForward = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    const duration = Duration(seconds: 3);
    _timer = Timer.periodic(duration, (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final minScrollExtent = _scrollController.position.minScrollExtent;
        if (_scrollForward) {
          _scrollController.animateTo(
            maxScrollExtent,
            duration: duration,
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            minScrollExtent,
            duration: duration,
            curve: Curves.easeInOut,
          );
        }
        _scrollForward = !_scrollForward;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.transparent, Colors.white, Colors.white, Colors.transparent],
          stops: [0.0, 0.1, 0.9, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        children: [
          Row(
            children: [
              const SizedBox(width: 3),
              Image.asset(
                'assets/images/icons/car.png',
                scale: 2,
              ),
              const SizedBox(width: 10),
              Text(
                widget.text,
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
