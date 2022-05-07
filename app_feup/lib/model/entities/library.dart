/// Overall occupation of the library
class LibraryOccupation {
  int occupation;
  int capacity;
  List<FloorOccupation> floors; 

  LibraryOccupation() {
    this.occupation = 0;
    this.capacity = 0;
    floors = []; 
  }

  void addFloor(FloorOccupation floor) {
    floors.add(floor);
    this.occupation += floor.getOccupation();
    this.capacity += floor.getCapacity();
  }

  int getPercentage() {
    return (occupation * 100 / capacity).round();
  }
}

/// Occupation values of a single floor
class FloorOccupation {
  final int number;
  int occupation;
  final int capacity;

  FloorOccupation(this.number, this.occupation, this.capacity);

  int getOccupation() {return this.occupation;}
  int getCapacity() {return this.capacity;}
  void setCapacity(int occupation) {this.occupation = occupation;}
}