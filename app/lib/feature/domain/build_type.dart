enum BuildType {
  devMockData('devMockData'),
  dev('dev'),
  prod('prod');

  const BuildType(this.name);

  final String name;
}
