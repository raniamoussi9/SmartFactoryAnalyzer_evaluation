class DimensionInputModel {
  final List<BandModel> bands;
  final List<String> questions;

  DimensionInputModel({required this.bands, required  this.questions});
}

class BandModel {
  final int bandIndex;
  final String bandName;
  final String description;

  BandModel(
      {required this.bandIndex,
      required this.description,
      required this.bandName});
}
