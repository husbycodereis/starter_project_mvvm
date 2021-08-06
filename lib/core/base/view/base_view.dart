import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final T viewModel;
  final Function(T model) onModelReady;
  final Function(BuildContext context, T value) onPageBuilder;
  final VoidCallback? onDispose;
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onModelReady,
    required this.onPageBuilder,
    this.onDispose,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    widget.onDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model) as Widget;
  }
}
