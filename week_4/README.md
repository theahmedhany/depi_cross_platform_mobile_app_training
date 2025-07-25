# 📘 Week 4: Dart Tasks - Enums & Exception Handling.

This comprehensive guide covers essential Dart programming tasks focused on enums and exception handling. Master the art of creating type-safe constants and building robust error-handling mechanisms. Perfect for developers ready to write more reliable and maintainable Dart code!

---

## 🎯 Task 1: Quiz Questions & Answers

Test your understanding of Dart enums and exception handling with these comprehensive questions:

### 🤔 Question 1: Enum Purpose

**What is the purpose of an enum in Dart?**

- A. To create multiple constructors
- **B. To define a fixed set of constant values ✅**
- C. To handle exceptions
- D. To create dynamic lists

### 🤔 Question 2: Enum Declaration

**What keyword is used to define an enum in Dart?**

- A. class
- B. const
- **C. enum ✅**
- D. final

### 🤔 Question 3: Try-Catch Flexibility

**Which statement about try-catch in Dart is true?**

- **A. try can be used without catch or finally ✅**
- B. catch is used to define enums
- C. try must always be followed by throw
- D. try is only used for null safety

### 🤔 Question 4: Specific Exception Handling

**What does the on keyword do in a try-catch block?**

- A. Declares a variable
- **B. Specifies the type of exception to catch ✅**
- C. Ends the program
- D. Looks through exceptions

### 🤔 Question 5: Custom Exception Usage

**What is a custom exception used for?**

- A. To override main()
- B. To create new keywords
- **C. To handle application-specific errors ✅**
- D. To define default values

---

## 🎯 Task 2: Traffic Light Control System

### 📋 Description:

Create a Dart program that defines an enum called `TrafficLight` with values: Red, Yellow, Green. Print a different message based on the current light state.

### ✅ Objective:

Master enum creation and usage while implementing a practical traffic control system that demonstrates state-based decision making.

### 📥 Input:

A **predefined enum value** representing the current traffic light state.

### 🧠 Implementation Logic:

Utilize Dart's enum system with switch statements to create clear, readable state management for traffic light operations.

### 🚦 Traffic Light States:

- **Red**: "Stop! The light is Red." - Complete halt required
- **Yellow**: "Get ready! The light is Yellow." - Prepare for transition
- **Green**: "Go! The light is Green." - Safe to proceed

### 💡 Key Concepts:

- Enum declaration with the `enum` keyword
- Switch statement pattern matching
- State-based conditional logic
- Clean code organization with meaningful naming

> 🚀 _This task introduces you to Dart's powerful enum system for creating type-safe constant values._

---

## 🎯 Task 3: Safe Division Calculator

### 📋 Description:

Create a Dart program that divides two numbers using try-catch to handle division by zero errors and print appropriate error messages.

### ✅ Objective:

Build a robust mathematical operation handler that gracefully manages runtime exceptions using Dart's try-catch mechanism.

### 📥 Input:

Two **hardcoded integers** where the divisor might be zero to demonstrate exception handling.

### 🧠 Implementation Logic:

Implement defensive programming techniques using try-catch blocks to prevent program crashes from mathematical errors.

### 🔢 Division Safety:

- **Normal Operation**: Performs integer division (`~/`) when valid
- **Exception Handling**: Catches division by zero attempts
- **User Feedback**: Provides clear error messages for failed operations

### 🛡️ Error Management:

- **Try Block**: Contains potentially dangerous division operation
- **Catch Block**: Handles any exceptions that occur during execution
- **Graceful Degradation**: Program continues running despite errors

### 💡 Key Concepts:

- Try-catch exception handling syntax
- Integer division operator (`~/`)
- Runtime error prevention
- Defensive programming practices

> 🔥 _Essential for building applications that handle mathematical operations safely._

---

## 🎯 Task 4: String Parser with Specific Exception Handling

### 📋 Description:

Create a program that parses a string to an integer using `int.parse()`. Use try-on-catch to catch `FormatException` and display a specific error message.

### ✅ Objective:

Master targeted exception handling using Dart's `on` keyword to catch specific exception types and provide contextual error messages.

### 📥 Input:

A **predefined string** that cannot be parsed as an integer to demonstrate format exception handling.

### 🧠 Implementation Logic:

Implement precise exception handling that distinguishes between different types of errors using the `on` keyword for type-specific catching.

### 🎯 Parsing Strategy:

- **Successful Parse**: Converts valid numeric strings to integers
- **Format Exception**: Catches invalid string format attempts
- **Detailed Feedback**: Provides specific error information from the exception

### 🔍 Exception Specificity:

- **`on FormatException`**: Targets only string format conversion errors
- **Exception Details**: Accesses the exception's message property
- **Type Safety**: Ensures only relevant exceptions are handled

### 💡 Key Concepts:

- Specific exception catching with `on` keyword
- Exception object property access
- Type-safe error handling
- String-to-integer conversion safety

> 🎯 _Perfect for understanding how to handle specific types of exceptions with precision._

---

## 🎯 Task 5: Custom Exception System

### 📋 Description:

Create a custom exception called `InvalidAgeException`. Write a program that accepts an age, throws the custom exception if the age is below 18, and prints a success message otherwise.

### ✅ Objective:

Build a complete custom exception system that demonstrates application-specific error handling and business logic validation.

### 📥 Input:

A **predefined age value** that triggers custom exception logic for demonstration purposes.

### 🧠 Implementation Logic:

Design and implement a custom exception class that encapsulates specific business rules and provides meaningful error messages.

### 🏗️ Exception Architecture:

- **Custom Class**: Implements the `Exception` interface
- **Error Method**: Provides descriptive error messages
- **Business Logic**: Validates age requirements (18+ years)
- **Type Checking**: Uses `is` operator for exception identification

### 🔒 Age Validation Rules:

- **Age < 18**: Throws `InvalidAgeException` with descriptive message
- **Age ≥ 18**: Grants access with success confirmation
- **Exception Handling**: Catches and processes custom exceptions appropriately

### 💡 Key Concepts:

- Custom exception class creation
- Implementing the `Exception` interface
- Business logic validation
- Exception type identification with `is` operator
- Method-based error message generation

> ⚡ _Essential for creating application-specific error handling systems and business rule validation._

---

## 🎯 Task 6: Advanced Enum with Weekday Classification

### 📋 Description:

Create an enum called `Day` with values Monday through Sunday. Use a switch statement to classify days as either weekday or weekend.

### ✅ Objective:

Master advanced enum usage with multiple case handling and logical grouping using switch statements for practical day classification.

### 📥 Input:

A **predefined Day enum value** for weekend/weekday classification demonstration.

### 🧠 Implementation Logic:

Implement sophisticated switch statement patterns that group multiple enum values together for efficient classification logic.

### 📅 Day Classification:

- **Weekend Days**: Saturday and Sunday grouped together
- **Weekdays**: Monday through Friday handled by default case
- **Efficient Grouping**: Multiple cases share the same execution block

### 🔄 Switch Pattern Mastery:

- **Case Grouping**: Multiple cases execute the same code block
- **Fall-through Logic**: Cases without break statements continue to next case
- **Default Handling**: Catches all remaining enum values efficiently

### 💡 Key Concepts:

- Comprehensive enum with seven values
- Advanced switch statement patterns
- Case grouping and fall-through behavior
- Default case for remaining values
- Logical classification systems

> 🎨 _Perfect for understanding how to create efficient classification systems with enums and switch statements._

---
