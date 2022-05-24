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
    if (capacity == 0) return 0;
    return (occupation * 100 / capacity).round();
  }

  int getOccupation() {
    return this.occupation;
  }

  int getCapacity() {
    return this.capacity;
  }

  List<FloorOccupation> getFloors() {
    return this.floors;
  }

  FloorOccupation getFloor(int number) {
    if (floors.length < number || number < 0) return FloorOccupation(0, 0, 0);
    return floors[number - 1];
  }
}

/// Occupation values of a single floor
class FloorOccupation {
  int number;
  int occupation;
  int capacity;

  FloorOccupation(this.number, this.occupation, this.capacity);

  int getNumber() {return this.number;}
  int getOccupation() {return this.occupation;}
  int getCapacity() {return this.capacity;}
  void setCapacity(int occupation) {this.occupation = occupation;}

  int getPercentage() {
    if (capacity == 0) return 0;
    return (occupation * 100 / capacity).round();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'number' : number,
      'occupation' : occupation,
      'capacity' : capacity, 
    };
    return map;
  }
}