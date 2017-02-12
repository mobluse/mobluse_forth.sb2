when I receive "initScreen"
hide
set String to ""
set Character to ""
set ~characters_per_line to 34

when I receive "print"
set ~index to 1
repeat length of String
	set Character to letter ~index of String
	~print_one
	change ~index by 1
end

when I receive "print_one"
~print_one

define ~print_one
if not Current_column < ~characters_per_line then
	set Current_column to 0
	change Current_row by 1
end
if Current_row > 17 then
	broadcast "scroll" and wait
end
broadcast (join "r" (Current_row)) and wait
change Current_column by length of Character

define-atomic ~head [s]
set ~string to ""
set ~index to 1
repeat length of s - 1
	set ~string to (join (~string) (letter ~index of s))
	change ~index by 1
end
set Current_column to length of ~string

when I receive "cls"
set row0 to ""
hide variable row0
set row1 to ""
hide variable row1
set row2 to ""
hide variable row2
set row3 to ""
hide variable row3
set row4 to ""
hide variable row4
set row5 to ""
hide variable row5
set row6 to ""
hide variable row6
set row7 to ""
hide variable row7
set row8 to ""
hide variable row8
set row9 to ""
hide variable row9
set row10 to ""
hide variable row10
set row11 to ""
hide variable row11
set row12 to ""
hide variable row12
set row13 to ""
hide variable row13
set row14 to ""
hide variable row14
set row15 to ""
hide variable row15
set row16 to ""
hide variable row16
set row17 to ""
hide variable row17
set Current_row to 0
set Current_column to 0

when I receive "scroll"
set row0 to row1
if length of row0 = 0 then
	hide variable row0
else
	show variable row0
end
set row1 to row2
if length of row1 = 0 then
	hide variable row1
else
	show variable row1
end
set row2 to row3
if length of row2 = 0 then
	hide variable row2
else
	show variable row2
end
set row3 to row4
if length of row3 = 0 then
	hide variable row3
else
	show variable row3
end
set row4 to row5
if length of row4 = 0 then
	hide variable row4
else
	show variable row4
end
set row5 to row6
if length of row5 = 0 then
	hide variable row5
else
	show variable row5
end
set row6 to row7
if length of row6 = 0 then
	hide variable row6
else
	show variable row6
end
set row7 to row8
if length of row7 = 0 then
	hide variable row7
else
	show variable row7
end
set row8 to row9
if length of row8 = 0 then
	hide variable row8
else
	show variable row8
end
set row9 to row10
if length of row9 = 0 then
	hide variable row9
else
	show variable row9
end
set row10 to row11
if length of row10 = 0 then
	hide variable row10
else
	show variable row10
end
set row11 to row12
if length of row11 = 0 then
	hide variable row11
else
	show variable row11
end
set row12 to row13
if length of row12 = 0 then
	hide variable row12
else
	show variable row12
end
set row13 to row14
if length of row13 = 0 then
	hide variable row13
else
	show variable row13
end
set row14 to row15
if length of row14 = 0 then
	hide variable row14
else
	show variable row14
end
set row15 to row16
if length of row15 = 0 then
	hide variable row15
else
	show variable row15
end
set row16 to row17
if length of row16 = 0 then
	hide variable row16
else
	show variable row16
end
set row17 to ""
hide variable row17
set Current_column to 0
set Current_row to 17

when I receive "r0"
set row0 to (join (row0) (Character))
if length of row0 = 1 then
	show variable row0
end

when I receive "r1"
set row1 to (join (row1) (Character))
if length of row1 = 1 then
	show variable row1
end

when I receive "r2"
set row2 to (join (row2) (Character))
if length of row2 = 1 then
	show variable row2
end

when I receive "r3"
set row3 to (join (row3) (Character))
if length of row3 = 1 then
	show variable row3
end

when I receive "r4"
set row4 to (join (row4) (Character))
if length of row4 = 1 then
	show variable row4
end

when I receive "r5"
set row5 to (join (row5) (Character))
if length of row5 = 1 then
	show variable row5
end

when I receive "r6"
set row6 to (join (row6) (Character))
if length of row6 = 1 then
	show variable row6
end

when I receive "r7"
set row7 to (join (row7) (Character))
if length of row7 = 1 then
	show variable row7
end

when I receive "r8"
set row8 to (join (row8) (Character))
if length of row8 = 1 then
	show variable row8
end

when I receive "r9"
set row9 to (join (row9) (Character))
if length of row9 = 1 then
	show variable row9
end

when I receive "r10"
set row10 to (join (row10) (Character))
if length of row10 = 1 then
	show variable row10
end

when I receive "r11"
set row11 to (join (row11) (Character))
if length of row11 = 1 then
	show variable row11
end

when I receive "r12"
set row12 to (join (row12) (Character))
if length of row12 = 1 then
	show variable row12
end

when I receive "r13"
set row13 to (join (row13) (Character))
if length of row13 = 1 then
	show variable row13
end

when I receive "r14"
set row14 to (join (row14) (Character))
if length of row14 = 1 then
	show variable row14
end

when I receive "r15"
set row15 to (join (row15) (Character))
if length of row15 = 1 then
	show variable row15
end

when I receive "r16"
set row16 to (join (row16) (Character))
if length of row16 = 1 then
	show variable row16
end

when I receive "r17"
set row17 to (join (row17) (Character))
if length of row17 = 1 then
	show variable row17
end

when I receive "bs0"
~head (row0)
set row0 to ~string
if length of ~string = 0 then
	hide variable row0
end

when I receive "bs1"
~head (row1)
set row1 to ~string
if length of ~string = 0 then
	hide variable row1
end

when I receive "bs2"
~head (row2)
set row2 to ~string
if length of ~string = 0 then
	hide variable row2
end

when I receive "bs3"
~head (row3)
set row3 to ~string
if length of ~string = 0 then
	hide variable row3
end

when I receive "bs4"
~head (row4)
set row4 to ~string
if length of ~string = 0 then
	hide variable row4
end

when I receive "bs5"
~head (row5)
set row5 to ~string
if length of ~string = 0 then
	hide variable row5
end

when I receive "bs6"
~head (row6)
set row6 to ~string
if length of ~string = 0 then
	hide variable row6
end

when I receive "bs7"
~head (row7)
set row7 to ~string
if length of ~string = 0 then
	hide variable row7
end

when I receive "bs8"
~head (row8)
set row8 to ~string
if length of ~string = 0 then
	hide variable row8
end

when I receive "bs9"
~head (row9)
set row9 to ~string
if length of ~string = 0 then
	hide variable row9
end

when I receive "bs10"
~head (row10)
set row10 to ~string
if length of ~string = 0 then
	hide variable row10
end

when I receive "bs11"
~head (row11)
set row11 to ~string
if length of ~string = 0 then
	hide variable row11
end

when I receive "bs12"
~head (row12)
set row12 to ~string
if length of ~string = 0 then
	hide variable row12
end

when I receive "bs13"
~head (row13)
set row13 to ~string
if length of ~string = 0 then
	hide variable row13
end

when I receive "bs14"
~head (row14)
set row14 to ~string
if length of ~string = 0 then
	hide variable row14
end

when I receive "bs15"
~head (row15)
set row15 to ~string
if length of ~string = 0 then
	hide variable row15
end

when I receive "bs16"
~head (row16)
set row16 to ~string
if length of ~string = 0 then
	hide variable row16
end

when I receive "bs17"
~head (row17)
set row17 to ~string
if length of ~string = 0 then
	hide variable row17
end
