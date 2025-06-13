import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardScrollable extends StatefulWidget {
  final Widget child;

  const KeyboardScrollable({required this.child, super.key});

  @override
  State<KeyboardScrollable> createState() => _KeyboardScrollableState();
}

class _KeyboardScrollableState extends State<KeyboardScrollable> {
  late final ScrollController _controller;
  late final FocusNode _focusNode;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollTimer?.cancel();
    super.dispose();
  }

  void _startScroll(LogicalKeyboardKey key) {
    _scrollTimer?.cancel(); // تأكد من إلغاء أي Scroll سابق
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      _scroll(key);
    });
  }

  void _stopScroll() {
    _scrollTimer?.cancel();
  }

  void _scroll(LogicalKeyboardKey key) {
    double newOffset;
    if (key == LogicalKeyboardKey.arrowDown) {
      newOffset = (_controller.offset + 40).clamp(
        0.0,
        _controller.position.maxScrollExtent,
      );
    } else if (key == LogicalKeyboardKey.arrowUp) {
      newOffset = (_controller.offset - 40).clamp(
        0.0,
        _controller.position.maxScrollExtent,
      );
    } else {
      return;
    }

    _controller.jumpTo(newOffset);
  }

  void _handleKeyEvent(KeyEvent event) {
    final key = event.logicalKey;

    if (event is KeyDownEvent &&
        (key == LogicalKeyboardKey.arrowDown ||
            key == LogicalKeyboardKey.arrowUp)) {
      _startScroll(key);
    }

    if (event is KeyUpEvent &&
        (key == LogicalKeyboardKey.arrowDown ||
            key == LogicalKeyboardKey.arrowUp)) {
      _stopScroll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: SingleChildScrollView(
        controller: _controller,
        child: widget.child,
      ),
    );
  }
}
