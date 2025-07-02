# 📘 Week 1: Dart Tasks - Fundamentals & Type System.

This comprehensive guide covers four essential Dart programming tasks designed to build a solid foundation in basic operations, user interaction, and Dart's powerful type system. Perfect for beginners starting their Dart journey!

---

## 🎯 Task 1: Mathematical Operations Calculator.

### 📋 Description:

Write a Dart program that has two numbers and prints their sum, difference, product, integer division, and remainder.

### ✅ Objective:

Master fundamental arithmetic operations and understand how Dart handles different types of mathematical calculations.

### 📥 Input:

Two **hardcoded integers** for demonstration purposes.

### 🧠 Implementation Logic:

Utilize Dart's arithmetic operators to perform comprehensive mathematical operations and display formatted results.

### 🔢 Mathematical Operations:

- **Addition** (`+`): Calculate the sum of both numbers
- **Subtraction** (`-`): Find the absolute difference
- **Multiplication** (`*`): Compute the product
- **Integer Division** (`~/`): Whole number division (truncates decimals)
- **Modulo** (`%`): Remainder after division

### 💡 Key Concepts:

- Variable declaration and initialization
- String interpolation with `$` syntax
- Difference between `/` (double division) and `~/` (integer division)

> 🚀 _This task introduces you to Dart's arithmetic capabilities and output formatting techniques._

---

## 🎯 Task 2: Interactive Age Classifier.

### 📋 Description:

Write a Dart program to check if a user's age is greater than 18 and print "Adult" if true, otherwise "Minor".

### ✅ Objective:

Build an interactive console application that processes user input and makes decisions based on conditional logic.

### 📥 Input:

**User-provided age** through console interaction using `stdin`.

### 🧠 Implementation Logic:

Implement robust input validation with multiple layers of error checking and user-friendly feedback.

### 🔍 Classification Logic:

- **Age > 18**: Classify as "Adult"
- **Age ≤ 18**: Classify as "Minor"

### 🛡️ Advanced Features:

- **Null Safety**: Handles cases where no input is provided
- **Type Validation**: Uses `int.tryParse()` for safe conversion
- **Error Recovery**: Provides meaningful feedback for invalid inputs
- **Edge Case Handling**: Manages negative ages and non-numeric input

### 💡 Key Concepts:

- Console I/O operations (`stdin`, `stdout`)
- Null-aware operators (`??`)
- Safe type conversion methods
- Nested conditional statements

> 🔥 _This task demonstrates real-world input handling and defensive programming techniques._

---

## 🎯 Task 3: Runtime Type Detective.

### 📋 Description:

Write a Dart program to check if a given variable is of type int.

### ✅ Objective:

Explore Dart's type system and learn how to perform runtime type checking using the `is` operator.

### 📥 Input:

A **predefined variable** of any data type for type analysis.

### 🧠 Implementation Logic:

Demonstrate positive type checking to determine if a variable matches a specific type at runtime.

### 🔎 Type Analysis:

- **`is int`**: Evaluates to `true` if the variable is an integer
- **Dynamic Checking**: Performs type verification during program execution
- **Boolean Result**: Returns clear true/false evaluation

### 💡 Key Concepts:

- Runtime type information (RTTI)
- The `is` operator for type checking
- Dynamic type validation
- Type-safe programming practices

> 🎯 _Perfect for understanding how Dart manages types dynamically during execution._

---

## 🎯 Task 4: Type Exclusion Validator.

### 📋 Description:

Write a Dart program to verify that a variable is not a String.

### ✅ Objective:

Master negative type checking using Dart's `is!` operator to exclude specific types from processing.

### 📥 Input:

A **predefined variable** for negative type validation testing.

### 🧠 Implementation Logic:

Implement type exclusion logic to verify that a variable does NOT belong to a specific type category.

### 🚫 Exclusion Logic:

- **`is! String`**: Returns `true` if the variable is NOT a String type
- **Negative Validation**: Confirms type exclusion rather than inclusion
- **Complementary Checking**: Works alongside positive type checking

### 💡 Key Concepts:

- Negative type checking with `is!`
- Type exclusion patterns
- Complementary validation techniques
- Boolean logic in type systems

> ⚡ _Essential for building robust type validation systems and conditional logic._

---

## 📊 Tasks Overview.

| Task | Focus Area              | Primary Concepts                           | Difficulty |
| ---: | ----------------------- | ------------------------------------------ | ---------- |
|    1 | Mathematical Operations | Arithmetic operators, string interpolation | ⭐         |
|    2 | User Input & Validation | I/O handling, conditionals, error safety   | ⭐⭐       |
|    3 | Positive Type Checking  | `is` operator, runtime type analysis       | ⭐⭐       |
|    4 | Negative Type Checking  | `is!` operator, type exclusion logic       | ⭐⭐       |

---

## 🎓 Learning Outcomes.

### **🔢 Arithmetic Mastery:**

- Understanding the difference between `/` and `~/` operators
- Mastering modulo operations for remainder calculations
- String interpolation for dynamic output formatting

### **🖥️ Interactive Programming:**

- Console input/output operations (`stdin.readLineSync()`, `stdout.write()`)
- Safe type conversion with `int.tryParse()`
- Null safety and defensive programming techniques

### **🔍 Type System Expertise:**

- Runtime type checking with `is` and `is!` operators
- Understanding Dart's dynamic type capabilities
- Building type-safe validation systems

### **🛠️ Best Practices:**

- Input validation and error handling
- User-friendly error messages
- Clean code organization and commenting

---
