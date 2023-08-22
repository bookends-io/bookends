import 'package:bookends/constants/string_constants.dart';
import 'package:bookends/models/basic.dart';
import 'package:bookends/services/i_backend.dart';
import 'package:bookends/widgets/bookend_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final IBackend _backend = GetIt.I<IBackend>();

  bool _initialized = false;
  List<Bookend> _bookends = [];

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  Future<void> _initialize() async {
    List<Bookend> bookends = await _backend.getBookends();

    setState(() {
      _bookends = bookends;
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            StringConstants.homePageWelcome,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: _bookends.length,
              itemBuilder: (context, index) {
                return BookendWidget(
                  bookend: _bookends[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
