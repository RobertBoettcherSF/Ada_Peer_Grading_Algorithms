-- Version: 0.01
-- Ada implementation of peer grading algorithms from "Efficient Algorithms for Peer Grading in Educational Systems"

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package Peer_Grading is

   -- Type definitions
   type Submission is record
      Grade : Float;
   end record;

   type Grader is record
      Id : Integer;
   end record;

   type Submission_Array is array (Integer range <>) of Submission;
   type Grader_Array is array (Integer range <>) of Grader;

   -- Implementation of mean grade calculation (maps to paper's Algorithm 1)
   function Calculate_Mean_Grade (Submissions : Submission_Array) return Float;

   -- Implementation of median grade calculation (maps to paper's Algorithm 2)
   function Calculate_Median_Grade (Submissions : Submission_Array) return Float;

   -- Implementation of grade assignment procedure (maps to paper's Methodology Section 3)
   procedure Assign_Grades (Submissions : in out Submission_Array; Graders : Grader_Array);

end Peer_Grading;
