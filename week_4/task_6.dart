enum Day { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

void main() {
  Day today = Day.Saturday;

  switch (today) {
    case Day.Saturday:
    case Day.Sunday:
      print("It's the weekend!");
      break;
    default:
      print("It's a weekday.");
  }
}
