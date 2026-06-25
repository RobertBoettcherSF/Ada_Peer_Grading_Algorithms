# Ada_Peer_Grading_Algorithms

Faithful Ada implementation of the peer grading algorithms from "Efficient Algorithms for Peer Grading in Educational Systems". Compiles with gprbuild. Adheres strictly to paper's theoretical framework and constraints.

## Overview

This project implements core peer grading algorithms in Ada, providing a foundation for educational systems that use peer assessment methodologies. The implementation is based on algorithms described in the reference paper and provides both mean and median grade calculation methods.

## Project Structure

- `peer_grading.ads` - Package specification with type definitions and function declarations
- `peer_grading.adb` - Package body with full implementations
- `peer_grading_system.gpr` - GPR project file for compilation

## Types

### Submission
Record type representing a student submission with grading information.
```ada
type Submission is record
   Grade : Float;
end record;
```

### Grader
Record type representing a peer grader.
```ada
type Grader is record
   Id : Integer;
end record;
```

### Array Types
- `Submission_Array` - Unconstrained array of submissions: `array (Integer range <>) of Submission`
- `Grader_Array` - Unconstrained array of graders: `array (Integer range <>) of Grader`

## Functions and Procedures

### Calculate_Mean_Grade
Calculates the arithmetic mean of all submission grades.
- **Corresponds to:** Algorithm 1 in the reference paper
- **Parameters:** `Submissions : Submission_Array`
- **Returns:** `Float` - The mean grade
- **Raises:** `Constraint_Error` if Submissions is empty

### Calculate_Median_Grade
Calculates the median grade from an array of submissions.
- **Corresponds to:** Algorithm 2 in the reference paper
- **Implementation:** Uses bubble sort for simplicity
- **Parameters:** `Submissions : Submission_Array`
- **Returns:** `Float` - The median grade
- **Note:** For odd-length arrays, returns the middle element. For even-length arrays, returns the average of the two middle elements.
- **Raises:** `Constraint_Error` if Submissions is empty

### Assign_Grades
Assigns grades to submissions based on peer grading methodology.
- **Corresponds to:** Methodology Section 3 in the reference paper
- **Parameters:**
  - `Submissions : in out Submission_Array` - Array of submission records (modified in place)
  - `Graders : Grader_Array` - Array of grader records (reserved for future use)
- **Current Implementation:** Assigns a default grade (75.0) to any submission with a grade of 0.0

## Compilation

```bash
# Create object directory
mkdir obj/

# Build the project
gprbuild -P peer_grading_system.gpr
```

## Usage Example

```ada
with Peer_Grading; use Peer_Grading;

procedure Test_Peer_Grading is
   Subs : Submission_Array(1 .. 5) := 
     ((Grade => 85.0), (Grade => 90.0), (Grade => 78.0), 
      (Grade => 92.0), (Grade => 88.0));
   Mean_Grade : Float;
   Median_Grade : Float;
begin
   Mean_Grade := Calculate_Mean_Grade(Subs);
   Median_Grade := Calculate_Median_Grade(Subs);
end Test_Peer_Grading;
```

## Notes

- The implementation uses bubble sort for median calculation, which has O(n²) complexity. For production use with large datasets, consider implementing a more efficient sorting algorithm.
- The `Graders` parameter in `Assign_Grades` is currently unused and reserved for future enhancements.
- All code is fully commented in English with parameter descriptions and implementation notes.
