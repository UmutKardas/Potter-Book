import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potter_book/features/home/view/home_view.dart';
import 'package:potter_book/features/search/view/search_view.dart';

final pageViewProvider = ChangeNotifierProvider((ref) => PageViewModel());

class PageViewModel extends ChangeNotifier {
  final PageController controller = PageController();
  final List<Widget> pages = [const HomeView(), const SearchView()];
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onTabChange(int index) {
    _currentIndex = index;
    controller.jumpToPage(index);
    notifyListeners();
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
