class AlertRequest {
  final String? title;
  final String? description;
  final String? confirmButtonTitle;
  final String? cancelButtonTitle;
  final double? fontSize;
  final bool? barrierDismissible;

  AlertRequest(
      {this.title,
      this.description,
      this.confirmButtonTitle,
      this.cancelButtonTitle,
      this.fontSize,
      this.barrierDismissible});
}
