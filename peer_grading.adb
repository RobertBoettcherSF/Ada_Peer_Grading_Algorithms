-- Version: 0.01
-- Ada implementation of peer grading algorithms from "Efficient Algorithms for Peer Grading in Educational Systems"
--
-- This package provides core algorithms for peer grading systems including:
--   - Mean grade calculation
--   - Median grade calculation
--   - Grade assignment procedures

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Peer_Grading is

   -- Calculates the arithmetic mean of all submission grades.
   -- This corresponds to Algorithm 1 in the reference paper.
   --
   -- Parameters:
   --   Submissions - Array of submission records containing grades
   --
   -- Returns:
   --   The mean (average) grade as a Float
   --
   -- Raises:
   --   Constraint_Error if Submissions is empty
   function Calculate_Mean_Grade (Submissions : Submission_Array) return Float is
      Sum : Float := 0.0;
   begin
      for S of Submissions loop
         Sum := Sum + S.Grade;
      end loop;
      return Sum / Float(Submissions'Length);
   end Calculate_Mean_Grade;

   -- Calculates the median grade from an array of submissions.
   -- This corresponds to Algorithm 2 in the reference paper.
   --
   -- Implementation uses bubble sort for simplicity. For production use with
   -- large datasets, a more efficient sorting algorithm (e.g., quicksort) 
   -- should be considered.
   --
   -- Parameters:
   --   Submissions - Array of submission records containing grades
   --
   -- Returns:
   --   The median grade as a Float
   --   For odd-length arrays: the middle element
   --   For even-length arrays: the average of the two middle elements
   --
   -- Raises:
   --   Constraint_Error if Submissions is empty
   function Calculate_Median_Grade (Submissions : Submission_Array) return Float is
      -- Create a copy to sort (preserve original order)
      Sorted : Submission_Array := Submissions;
      N : Integer := Sorted'Length;
   begin
      -- Bubble sort implementation for sorting grades in ascending order
      for I in 1 .. N - 1 loop
         for J in 1 .. N - I loop
            if Sorted(J).Grade > Sorted(J + 1).Grade then
               declare
                  Temp : Submission := Sorted(J);
               begin
                  -- Swap elements
                  Sorted(J) := Sorted(J + 1);
                  Sorted(J + 1) := Temp;
               end;
            end if;
         end loop;
      end loop;

      -- Calculate median based on sorted array
      if N mod 2 = 1 then
         -- Odd number of elements: return middle element
         return Sorted(N / 2 + 1).Grade;
      else
         -- Even number of elements: return average of two middle elements
         return (Sorted(N / 2).Grade + Sorted(N / 2 + 1).Grade) / 2.0;
      end if;
   end Calculate_Median_Grade;

   -- Assigns grades to submissions based on peer grading methodology.
   -- This corresponds to Methodology Section 3 in the reference paper.
   --
   -- Current implementation assigns a default grade (75.0) to any submission
   -- with a grade of 0.0. In a full peer grading system, this procedure would
   -- calculate final grades based on peer reviews, potentially using the
   -- Calculate_Mean_Grade or Calculate_Median_Grade functions.
   --
   -- Parameters:
   --   Submissions - Array of submission records (modified in place)
   --   Graders - Array of grader records (currently unused, reserved for future use)
   procedure Assign_Grades (Submissions : in out Submission_Array; Graders : Grader_Array) is
   begin
      -- Iterate through all submissions and ensure they have valid grades
      for S of Submissions loop
         if S.Grade = 0.0 then
            S.Grade := 75.0; -- Default grade if not set
         end if;
      end loop;
   end Assign_Grades;

end Peer_Grading;
