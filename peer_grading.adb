-- Version: 0.01
-- Ada implementation of peer grading algorithms from "Efficient Algorithms for Peer Grading in Educational Systems"

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Peer_Grading is

   -- Implementation of mean grade calculation (maps to paper's Algorithm 1)
   function Calculate_Mean_Grade (Submissions : Submission_Array) return Float is
      Sum : Float := 0.0;
   begin
      for S of Submissions loop
         Sum := Sum + S.Grade;
      end loop;
      return Sum / Float(Submissions'Length);
   end Calculate_Mean_Grade;

   -- Implementation of median grade calculation (maps to paper's Algorithm 2)
   function Calculate_Median_Grade (Submissions : Submission_Array) return Float is
      -- Create a copy to sort
      Sorted : Submission_Array := Submissions;
      N : Integer := Sorted'Length;
   begin
      -- Simple bubble sort
      for I in 1 .. N - 1 loop
         for J in 1 .. N - I loop
            if Sorted(J).Grade > Sorted(J + 1).Grade then
               declare
                  Temp : Submission := Sorted(J);
               begin
                  Sorted(J) := Sorted(J + 1);
                  Sorted(J + 1) := Temp;
               end;
            end if;
         end loop;
      end loop;

      -- Calculate median
      if N mod 2 = 1 then
         -- Odd number of elements: return middle element
         return Sorted(N / 2 + 1).Grade;
      else
         -- Even number of elements: return average of two middle elements
         return (Sorted(N / 2).Grade + Sorted(N / 2 + 1).Grade) / 2.0;
      end if;
   end Calculate_Median_Grade;

   -- Implementation of grade assignment procedure (maps to paper's Methodology Section 3)
   procedure Assign_Grades (Submissions : in out Submission_Array; Graders : Grader_Array) is
   begin
      -- Assign grades based on median of peer grades
      for S of Submissions loop
         -- For now, just ensure each submission has a grade
         -- In a real implementation, this would calculate grades from peer reviews
         if S.Grade = 0.0 then
            S.Grade := 75.0; -- Default grade if not set
         end if;
      end loop;
   end Assign_Grades;

end Peer_Grading;
