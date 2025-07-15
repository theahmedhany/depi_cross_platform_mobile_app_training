# 📘 Week 2: Dart Tasks - Fundamentals & Type System.

This comprehensive guide covers 14 essential Dart programming tasks designed to build a solid foundation in conditionals, loops, functions, and core programming concepts. Perfect for beginners starting their Dart journey!

---

## 🎯 Task 1: Positive Number Checker

### 📋 Description:

Write a Dart program that has a number (e.g. 7) and checks if it is positive. If it is, print "Positive Number".

### ✅ Objective:

Master basic conditional statements and understand how to validate numerical conditions.

### 📥 Input:

A **hardcoded integer** for demonstration purposes.

### 🧠 Implementation Logic:

Use simple `if` statement to check if a number is greater than zero.

### 🔍 Validation Logic:

- **number > 0**: Print "Positive Number"
- **number ≤ 0**: No output (silent handling)

### 💡 Key Concepts:

- Basic conditional statements (`if`)
- Comparison operators (`>`)
- Print statements for output

> 🚀 _This task introduces you to fundamental conditional logic in Dart._

---

## 🎯 Task 2: Student Grade Pass/Fail System

### 📋 Description:

Write a Dart program that checks if a student has passed. A student passes if the grade is greater than or equal to 50. Print "Passed" or "Failed" accordingly.

### ✅ Objective:

Build a binary decision system using if-else statements for grade evaluation.

### 📥 Input:

A **hardcoded grade value** for testing purposes.

### 🧠 Implementation Logic:

Implement complete conditional logic with both positive and negative outcomes.

### 🔍 Classification Logic:

- **Grade ≥ 50**: Print "Passed"
- **Grade < 50**: Print "Failed"

### 💡 Key Concepts:

- If-else statements
- Comparison operators (`>=`)
- Binary decision making
- Educational grading systems

> 🎓 _Perfect for understanding complete conditional structures with alternative paths._

---

## 🎯 Task 3: Multi-Level Grade Classification

### 📋 Description:

Write a Dart program that has a number between 0 and 100, and prints:

- "Excellent" if the number is 90 or above
- "Good" if it is 75–89
- "Average" if it is 50–74
- "Fail" if below 50

### ✅ Objective:

Master multi-level conditional logic using if-else if chains for complex decision making.

### 📥 Input:

A **score value** between 0 and 100.

### 🧠 Implementation Logic:

Implement cascading conditional statements that evaluate conditions in priority order.

### 🏆 Grade Classification:

- **90-100**: "Excellent" - Outstanding performance
- **75-89**: "Good" - Above average achievement
- **50-74**: "Average" - Satisfactory performance
- **0-49**: "Fail" - Below passing threshold

### 💡 Key Concepts:

- If-else if chains
- Range-based conditions
- Logical flow control
- Multi-tier classification systems

> 🌟 _Essential for building complex decision trees and classification systems._

---

## 🎯 Task 4: Day of Week Switch Statement

### 📋 Description:

Define a variable day = 3. Use a switch statement to print the name of the day:

- 1: Monday, 2: Tuesday, 3: Wednesday, 4: Thursday, 5: Friday, 6: Saturday, 7: Sunday
- Any other number: "Invalid day"

### ✅ Objective:

Learn switch-case statements for handling multiple discrete values efficiently.

### 📥 Input:

An **integer representing day number** (1-7).

### 🧠 Implementation Logic:

Use switch statement with individual cases for each day of the week.

### 📅 Day Mapping:

- **1**: Monday
- **2**: Tuesday
- **3**: Wednesday
- **4**: Thursday
- **5**: Friday
- **6**: Saturday
- **7**: Sunday
- **default**: "Invalid day"

### 💡 Key Concepts:

- Switch-case statements
- Break statements
- Default case handling
- Discrete value mapping

> 🗓️ _Perfect for understanding structured conditional logic with multiple options._

---

## 🎯 Task 5: Sequential Number Generator

### 📋 Description:

Write a Dart program using a for loop to print numbers from 1 to 10.

### ✅ Objective:

Master basic for loop syntax and understand iteration control structures.

### 📥 Input:

**No input required** - generates sequential numbers.

### 🧠 Implementation Logic:

Use a standard for loop with initialization, condition, and increment.

### 🔢 Loop Structure:

- **Initialization**: `int i = 1`
- **Condition**: `i <= 10`
- **Increment**: `i++`
- **Output**: Print each number

### 💡 Key Concepts:

- For loop syntax
- Loop initialization and termination
- Increment operators
- Sequential iteration

> 🔄 _Foundation for understanding controlled repetition and iteration patterns._

---

## 🎯 Task 6: Name List Iterator

### 📋 Description:

You have a list of names: ["Ali", "Sara", "Omar", "Layla"]. Use a for-in loop to print each name on a new line.

### ✅ Objective:

Learn collection iteration using for-in loops for processing list elements.

### 📥 Input:

A **predefined list of string names**.

### 🧠 Implementation Logic:

Use enhanced for loop (for-in) to iterate through collection elements directly.

### 👥 Name Processing:

- **List**: `["Ali", "Sara", "Omar", "Layla"]`
- **Iteration**: Process each name individually
- **Output**: Print each name on separate line

### 💡 Key Concepts:

- For-in loops
- List collections
- Enhanced iteration syntax
- Element-by-element processing

> 📝 _Essential for working with collections and data structures._

---

## 🎯 Task 7: Price Squaring with forEach

### 📋 Description:

You have a list of prices: [10, 20, 30, 40]. Use forEach to print the square of each price.

### ✅ Objective:

Master functional programming concepts using forEach method for list processing.

### 📥 Input:

A **list of integer prices**.

### 🧠 Implementation Logic:

Use forEach method with lambda function to process each element.

### 💰 Price Processing:

- **Input**: `[10, 20, 30, 40]`
- **Operation**: Calculate square of each price
- **Output**: `[100, 400, 900, 1600]`

### 💡 Key Concepts:

- forEach method
- Lambda expressions
- Functional programming
- Mathematical operations on collections

> 🔢 _Perfect for understanding functional approaches to data processing._

---

## 🎯 Task 8: Even Number Generator with While Loop

### 📋 Description:

Write a program that prints even numbers from 2 to 10 using a while loop.

### ✅ Objective:

Master while loop syntax and understand conditional iteration control.

### 📥 Input:

**No input required** - generates even numbers.

### 🧠 Implementation Logic:

Use while loop with manual increment control to generate even numbers.

### 🔢 Even Number Generation:

- **Starting**: number = 2
- **Condition**: number <= 10
- **Increment**: number += 2
- **Output**: 2, 4, 6, 8, 10

### 💡 Key Concepts:

- While loops
- Manual increment control
- Conditional iteration
- Pattern generation

> ⚡ _Essential for understanding condition-based repetition structures._

---

## 🎯 Task 9: Countdown with Do-While Loop

### 📋 Description:

Write a Dart program using a do-while loop that prints the numbers from 10 down to 1. Make sure the loop runs at least once, even if the starting number is greater than 10.

### ✅ Objective:

Learn do-while loops and understand guaranteed execution patterns.

### 📥 Input:

A **starting number** (typically 10).

### 🧠 Implementation Logic:

Use do-while loop to ensure at least one execution before condition checking.

### 🔽 Countdown Logic:

- **Starting**: number = 10
- **Operation**: Print current number
- **Decrement**: number--
- **Condition**: number >= 1
- **Output**: 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

### 💡 Key Concepts:

- Do-while loops
- Guaranteed execution
- Decrement operations
- Post-condition checking

> 🎯 _Perfect for scenarios requiring at least one execution cycle._

---

## 🎯 Task 10: Rectangle Area Calculator Function

### 📋 Description:

Write a function calculateArea that calculates the area of a rectangle, given width and height.

### ✅ Objective:

Master function definition, parameters, and return values for mathematical calculations.

### 📥 Input:

**Width and height** as double values.

### 🧠 Implementation Logic:

Create a reusable function that accepts parameters and returns calculated result.

### 📐 Area Calculation:

- **Formula**: Area = width × height
- **Parameters**: double width, double height
- **Return**: double area
- **Usage**: Call function with specific dimensions

### 💡 Key Concepts:

- Function definition
- Parameter passing
- Return values
- Mathematical calculations
- Code reusability

> 🔧 _Foundation for understanding modular programming and function design._

---

## 🎯 Task 11: Flexible Message Sender

### 📋 Description:

Create a function sendMessage that:

- Has a required parameter: String message
- Has an optional named parameter bool urgent (default: false)
- Print "Sending urgent message: ...", or "Sending message: ..." based on the flag.

### ✅ Objective:

Learn advanced function parameters including optional named parameters with default values.

### 📥 Input:

A **required message string** and **optional urgent flag**.

### 🧠 Implementation Logic:

Use named parameters with default values to create flexible function signatures.

### 📨 Message Handling:

- **Required**: String message
- **Optional**: bool urgent = false
- **Urgent**: "Sending urgent message: [message]"
- **Normal**: "Sending message: [message]"

### 💡 Key Concepts:

- Named parameters
- Default parameter values
- Optional parameters
- Flexible function design
- Conditional string formatting

> 📧 _Essential for building flexible and user-friendly function interfaces._

---

## 🎯 Task 12: Double Value Arrow Function

### 📋 Description:

Create a function doubleValue(int x) that returns double of x using single-line arrow syntax.

### ✅ Objective:

Master arrow function syntax for concise single-expression functions.

### 📥 Input:

An **integer value** to be doubled.

### 🧠 Implementation Logic:

Use arrow syntax (=>) for single-expression function definition.

### ⚡ Arrow Function:

- **Syntax**: `int doubleValue(int x) => x * 2;`
- **Input**: Integer x
- **Output**: x \* 2
- **Style**: Concise single-line expression

### 💡 Key Concepts:

- Arrow function syntax
- Single-expression functions
- Concise code writing
- Functional programming style

> 🎯 _Perfect for learning modern, concise function declaration patterns._

---

## 🎯 Task 13: Even Number Checker Arrow Function

### 📋 Description:

Write a function isEven(int n) that returns true if the number is even, using arrow syntax.

### ✅ Objective:

Apply arrow syntax to boolean logic and mathematical operations.

### 📥 Input:

An **integer** to check for evenness.

### 🧠 Implementation Logic:

Use modulo operator with arrow syntax to create a boolean validator.

### 🔍 Even Check Logic:

- **Syntax**: `bool isEven(int n) => n % 2 == 0;`
- **Operation**: n % 2 == 0
- **Return**: true if even, false if odd
- **Examples**: isEven(4) = true, isEven(7) = false

### 💡 Key Concepts:

- Arrow syntax with boolean returns
- Modulo operator (%)
- Boolean logic
- Mathematical validation

> ✅ _Essential for understanding concise boolean function patterns._

---

## 🎯 Task 14: Function Definition Syntax (Multiple Choice)

### 📋 Description:

What is the correct syntax to define a function in Dart?

- A. function myFunc() {}
- B. void myFunc() {} ✅
- C. func myFunc() {}
- D. define myFunc() {}

### ✅ Objective:

Understand proper Dart function declaration syntax and common alternatives.

### 📥 Input:

**Multiple choice question** about function syntax.

### 🧠 Implementation Logic:

Demonstrate correct Dart function syntax with practical example.

### ✔️ Correct Syntax:

- **Answer**: B. `void myFunc() {}`
- **Explanation**: Dart uses return type followed by function name
- **Example**: Function that prints a message
- **Usage**: Called from main() function

### 💡 Key Concepts:

- Function declaration syntax
- Return type specification
- Dart language conventions
- Function naming patterns

> 📚 _Important for understanding fundamental Dart syntax rules._

---
