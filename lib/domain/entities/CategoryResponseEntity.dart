class CategoryResponseEntity {
  CategoryResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  int? results;
  MetadataEntity? metadata;
  List<CategoryEntity>? data;
}

class CategoryEntity {
  CategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
}
