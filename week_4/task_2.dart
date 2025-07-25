enum TrafficLight { Red, Yellow, Green }

void main() {
  TrafficLight current = TrafficLight.Red;

  switch (current) {
    case TrafficLight.Red:
      print("Stop! The light is Red.");
      break;
    case TrafficLight.Yellow:
      print("Get ready! The light is Yellow.");
      break;
    case TrafficLight.Green:
      print("Go! The light is Green.");
      break;
  }
}
