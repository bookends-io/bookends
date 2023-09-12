import 'package:bookends/constants/string_constants.dart';
import 'package:bookends/models/basic.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/i_backend.dart';
import 'package:bookends/widgets/bookend_button_widget.dart';
import 'package:bookends/widgets/response_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BookendPage extends StatefulWidget {
  const BookendPage({
    super.key,
  });

  @override
  State<BookendPage> createState() => _BookendPageState();
}

class _BookendPageState extends State<BookendPage> {
  final IBackend _backend = GetIt.I<IBackend>();
  final IBookendResponseService _responseService =
      GetIt.I<IBookendResponseService>();

  bool _initialized = false;
  List<Bookend> _bookends = [];
  List<Response> _responses = [];

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  Future<void> _initialize() async {
    List<Bookend> bookends = await _backend.getBookends();
    List<Response> responses = await _responseService.getResponses();

    setState(() {
      _bookends = bookends;
      _responses = responses;
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {}

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.homePageTitle),
      ),
      body: _initialized ? _buildBody() : _buildInitializing(),
    );
  }

  Widget _buildInitializing() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBody() {
    List<Widget> children = [];
    for (final Bookend b in _bookends) {
      children.add(
        BookendButtonWidget(
          bookend: b,
        ),
      );
    }
    children.add(
      const Divider(),
    );
    for (final Response r in _responses) {
      children.add(
        ResponseButtonWidget(
          response: r,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
