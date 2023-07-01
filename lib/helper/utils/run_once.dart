class RunOnce {
  bool _hasRun = false;

  void call(void Function() function, {bool? isAlreadyRun}) {
    if (isAlreadyRun ?? _hasRun) return;
    _hasRun = true;
    function();
  }
}
