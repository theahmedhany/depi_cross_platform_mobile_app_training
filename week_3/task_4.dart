/*


  1. What is a class in Dart?
    A) A built-in function
    B) A blueprint for creating objects ✅
    C) A special type of variable
    D) None of the above

--------------------------------------------------------------------------------

  2. Which constructor type allows assigning default values in Dart?
    A) Factory constructor
    B) Named constructor
    C) Default constructor ✅
    D) Constant constructor

--------------------------------------------------------------------------------

  3. What is the output of the following code?

  class Person {
    String name;
    int age;
    Person(this.name, this.age);
  }

  void main() {
    var p = Person("Ali", 20);
    print(p.name);
  }

    A) Error
    B) 20
    C) Ali ✅
    D) null

--------------------------------------------------------------------------------

  4. Which keyword is used to inherit from a class?
    A) with
    B) inherit
    C) extend
    D) extends ✅

--------------------------------------------------------------------------------

  5. What does the super keyword do in Dart?
    A) Creates a new class
    B) Refers to the parent class ✅
    C) Overrides a method
    D) Defines a constructor

--------------------------------------------------------------------------------

  6. What is true about mixin in Dart?
    A) It can have constructors
    B) You use extends to apply it
    C) It allows code reuse ✅
    D) It must contain abstract methods

--------------------------------------------------------------------------------

  7. Which OOP principle allows overriding methods from a superclass?
    A) Inheritance
    B) Encapsulation
    C) Abstraction
    D) Polymorphism ✅

--------------------------------------------------------------------------------

  8. What is true about getters and setters in Dart?
    A) They are used to call constructors
    B) They replace variables
    C) They control access to private variables ✅
    D) They are only available in abstract classes

--------------------------------------------------------------------------------

  9. Which is a valid way to restrict a mixin to a certain superclass?
    A) mixin Logger on Object {} ✅
    B) mixin Logger extends Class {}
    C) mixin Logger implements Class {}
    D) mixin Logger for Class {}

--------------------------------------------------------------------------------

  10. In Dart, which of the following is not a feature of mixins?
    A) You can inherit from multiple mixins
    B) Mixins can have constructors ✅
    C) Mixins allow code reuse
    D) You can use with keyword to apply them

--------------------------------------------------------------------------------

  11. What is the difference between extends and implements in Dart?
    A) extends is for abstract classes only
    B) implements copies methods only without code ✅
    C) implements inherits full behavior
    D) There is no difference

--------------------------------------------------------------------------------

  12. What happens if you don't override an abstract method in a subclass?
    A) Code compiles but throws runtime error
    B) Compiler generates a warning only
    C) Compiler error ✅
    D) It defaults to a parent implementation

--------------------------------------------------------------------------------

  13. What is the purpose of super() in a subclass constructor?
    A) To call the current class constructor
    B) To access parent class properties directly
    C) To call the parent class constructor ✅
    D) To create a static reference

--------------------------------------------------------------------------------

  14. Can Dart classes implement multiple interfaces?
    A) Yes ✅
    B) No
    C) Only with mixins
    D) Only for abstract classes

--------------------------------------------------------------------------------

  15. What will this code output?

  class A {
    void greet() => print("Hello from A");
  }

  class B extends A {
    @override
    void greet() => print("Hello from B");
  }

  void main() {
    A obj = B();
    obj.greet();
  }

  A) Hello from A
  B) Hello from B ✅
  C) Error
  D) null


*/
