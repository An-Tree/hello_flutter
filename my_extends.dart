/**
 * 继承
 * Mixins 代码复用
 * 抽象类
 * 接口
 */

import 'my_class.dart';

//继承
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

void main() {
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager2 = Orbiter('Voyager II', DateTime(1977, 9, 5), 1000);
  voyager2.describe();

  PilotedCraft('Voyager II', DateTime(1977, 9, 5)).describeCrew();
}

// Mixins 代码复用
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
