import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/common/error_message_widget.dart';

/// A reusable widget to provide default loading and error widgets when working
/// with AsyncValue.
/// More info here:
/// https://codewithandrea.com/articles/async-value-widget-riverpod/
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;

  /// Widget to show when loading, if not provided a default loading widget will be shown
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading:
          () => loading ?? const Center(child: CircularProgressIndicator()),
    );
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;

  /// Widget to show when loading, if not provided a default loading widget will be shown
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading:
          () =>
              loading ??
              const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
      error:
          (e, st) => SliverToBoxAdapter(
            child: Center(child: ErrorMessageWidget(e.toString())),
          ),
    );
  }
}
