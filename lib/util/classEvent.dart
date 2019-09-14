class ClassEvent {
  bool _isClass;
  double _eventLength;
  String _className;
  String _classHour;

  ClassEvent(
      this._className, this._eventLength, this._isClass, this._classHour);

  get className => this._className;

  get eventLength => this._eventLength;

  get isClass => this._isClass;

  get classHour => this._classHour;
}
