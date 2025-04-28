000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. HANDOUT.
000300 AUTHOR. Your Name.
000400 DATE-WRITTEN. 02/27/2025.
000500 ENVIRONMENT DIVISION.
000600 INPUT-OUTPUT SECTION.
000700 FILE-CONTROL.
000800*Index file containing the students and their grades
000900*Random access means we can look up any student by their
001000*name (in this case)
001100     SELECT GRADES-FILE ASSIGN TO FILENAME
001200     ORGANIZATION IS INDEXED
001300     ACCESS MODE IS RANDOM
001400     RECORD KEY IS STUDENT-RECORD-NAME.
001500 DATA DIVISION.
001600 FILE SECTION.
001700 FD GRADES-FILE.
001800*TODO: Define the records in the file
001900 WORKING-STORAGE SECTION.
002000
002100*We will load each record into STUDENT for processing
002200 01 STUDENT.
002300*TODO: fill out the fields so that it matches the same structure
002400*in as defined in the FILE SECTION
002500
002600*TODO: Add any nessecary variables in the WORKING-STORAGE SECTION
002700*This table will store the 5 possible grade values
002800*Hint: We recommend using OCCURS Clause in the file record
002900 01 POSSIBLE_GRADES PIC A OCCURS 5 TIMES.
003000*Table storing the frequency of each letter grade
003100 01 GRADE_FREQUENCIES PIC 9(4) VALUE 0 OCCURS 5 TIMES.
003200*The name of the file (which will be retrieved from the user)
003300 01 FILENAME PIC X(64).
003400
003500 PROCEDURE DIVISION.
003600*MAIN Paragraph, execution starts here
003700 MAIN.
003800     PERFORM SET-GRADES.
003900     DISPLAY "Enter the filename: " WITH NO ADVANCING.
004000     ACCEPT FILENAME.
004100     PERFORM GET-ENTRIES.
004200     PERFORM DISPLAY-FREQUENCIES.
004300     STOP RUN.
004400
004500*Repeatedly ask the user to enter the names of students
004600*and process each valid student
004700 GET-ENTRIES.
004800     OPEN INPUT GRADES-FILE.
004900*    TODO: Repeatedly ask the user for names until they enter 0
005000*    (You should PERFORM the LOOKUP-STUDENT here)
005100     CLOSE GRADES-FILE.
005200
005300*Process the record only if it is in the file
005400 LOOKUP-STUDENT.
005500*    TODO: fix the following line
005600     MOVE ??? TO STUDENT-RECORD-NAME
005700     READ GRADES-FILE INTO STUDENT
005800         KEY IS STUDENT-RECORD-NAME
005900             INVALID KEY
006000*                TODO: Your code here
006100             NOT INVALID key
006200*                TODO: Your code here
006300     END-READ.
006400
006500*Calculates the average grade for the current student and
006600*Updates the letter grade frequency
006700 PROCESS-RECORD.
006800     PERFORM AVERAGE.
006900     DISPLAY "Average: " AVERAGE-GRADE "%".
007000*    TODO: Update the appropriate letter grade frequency
007100
007200*TODO: Create the AVERAGE paragraph
007300*Calculates the average grade for the current student
007400 AVERAGE.
007500
007600*TODO: Create the DISPLAY-FREQUENCIES paragraph
007700*Displays every letter grade and its corresponding frequency
007800 DISPLAY-FREQUENCIES.
007900
008000*Initializes the array containing all possible letter grades
008100 SET-GRADES.
008200     MOVE "F" TO POSSIBLE_GRADES(1).
008300     MOVE "D" TO POSSIBLE_GRADES(2).
008400     MOVE "C" TO POSSIBLE_GRADES(3).
008500     MOVE "B" TO POSSIBLE_GRADES(4).
008600     MOVE "A" TO POSSIBLE_GRADES(5).

