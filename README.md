# Ada_Peer_Grading_Algorithms

Faithful Ada implementation of the peer grading algorithms from "Efficient Algorithms for Peer Grading in Educational Systems". Compiles with gprbuild. Adheres strictly to paper's theoretical framework and constraints.

## Project Structure

- `peer_grading.ads` - Package specification with type definitions and function declarations
- `peer_grading.adb` - Package body with implementations
- `peer_grading_system.gpr` - GPR project file

## Types

- `Submission` - Record type representing a submission with a grade
- `Grader` - Record type representing a grader with an ID
- `Submission_Array` - Unconstrained array of submissions
- `Grader_Array` - Unconstrained array of graders

## Functions and Procedures

- `Calculate_Mean_Grade(Submissions : Submission_Array) return Float` - Calculates the arithmetic mean of all submission grades
- `Calculate_Median_Grade(Submissions : Submission_Array) return Float` - Calculates the median grade using bubble sort
- `Assign_Grades(Submissions : in out Submission_Array; Graders : Grader_Array)` - Assigns default grades to submissions if not set

## Compilation

```bash
mkdir obj/
gprbuild -P peer_grading_system.gpr
```
