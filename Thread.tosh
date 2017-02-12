when flag clicked
INIT
run_examples
println "#MOBLuSE_FORTH 0.11.3"
println "© 2016 Orbin, Lund, Sweden"
println "FOSS with license CC BY-SA 2.0"
println ""
set TermInpBuf to ""
print_one "_"
stop all

when I receive "INIT"
INIT

define INIT
set TRUE to <not <>>
set FALSE to <not not <>>
set Running to TRUE
broadcast "initScreen" and wait
broadcast "initKeyboard" and wait
hide
set color effect to 0
pen up
set pen color to (256 * 256 * 256 * 128 + 256 * 256 * 100 + 256 * 255 + 200)
set pen size to 3
set pen shade to 50
go to x: 0 y: 0
point in direction 90
delete all of History
clear_stacks
delete all of tokens
set CP437 to "☺☻♥♦♣♠•◘○◙♂♀♪♫☼►◄↕‼¶§▬↨↑↓→←∟↔▲▼"
set ASCII to " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~⌂"
set BOX_ELEMENTS to "▀▁▂▃▄▅▆▇█▉▊▋▌▍▎▏▐░▒▓▔▕▖▗▘▙▚▛▜▝▞▟"
set BOX_DRAWING to "─━│┃┄┅┆┇┈┉┊┋┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋╌╍╎╏═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬╭╮╯╰╱╲╳╴╵╶╷╸╹╺╻╼╽╾╿"
set CHARACTERS to (join join join (CP437) (ASCII) (BOX_ELEMENTS) (BOX_DRAWING))
make_built_in
make_immediates
make_terminated
delete all of Words
delete all of Word_code
delete all of Codes
run_defs
clear
PAGE
set error to 0
set ip_delete to 0
set in_definition to 0
set TermInpBuf to ""
broadcast "bell"
set Running to FALSE

define run_examples
broadcast "run_examples" and wait

define run_example (ex)
set Number to ex
broadcast "run_example" and wait

define run_defs
broadcast "run_defs" and wait

when I receive "break"
set error to -100
set ip to 1 / 0
broadcast "print_response" and wait
set TermInpBuf to ""
stop all

when I receive "print_response"
if error = 0 then
	println "OK"
else
	if error = -56 then
		println ""
	else
		println (join (code) join "? MSG # " (error))
	end
	set error to 0
end
set Running to FALSE

when I receive "evaluate_buffer"
set Running to TRUE
set Inkey to ""
tokenize
run_tokens

define-atomic tokenize
set ackumulator to ""
delete all of tokens
set token to 0
set idx to 1
repeat until idx > length of TermInpBuf
	set character to letter idx of TermInpBuf
	if token = 0 and not character < "!" then
		set token to 1
	end
	if token = 1 and character < "!" then
		set token to 0
		add ackumulator to tokens
		if not letter 1 of ackumulator = "\"" and Terminated contains letter length of ackumulator of ackumulator? then
			join_to_terminator
			add ackumulator to tokens
		end
		set ackumulator to ""
	end
	if token = 1 then
		set ackumulator to (join (ackumulator) (character))
	end
	change idx by 1
end
if length of ackumulator > 0 then
	add ackumulator to tokens
end

define-atomic join_to_terminator
set ackumulator to letter length of ackumulator of ackumulator
set j to 1
repeat until j > length of Terminated
	if ackumulator = item j of Terminated then
		set ackumulator to ""
		change idx by 1
		set character to letter idx of TermInpBuf
		repeat until character = item j of Terminator or idx > length of TermInpBuf
			set ackumulator to (join (ackumulator) (character))
			change idx by 1
			set character to letter idx of TermInpBuf
		end
		set j to 1 / 0
	end
	change j by 1
end

define run_tokens
set error to 0
set ip_repl to 1
repeat until ip_repl > length of tokens
	set code to item ip_repl of tokens
	set next_code_repl to item (ip_repl + 1) of tokens
	if Words contains code? then
		set ip to ip_repl
		execute_word (code)
	else
		set next_code to next_code_repl
		do_built_in_repl
		if ip_delete > 0 then
			delete_codes
		end
	end
	change ip_repl by 1
end

define-atomic delete_codes
repeat length of Codes - ip_delete + 1
	delete last of Codes
end
set ip_delete to 0

define do_built_in_repl
set error to 0
set ip to ip_repl
if Built_in contains code? then
	broadcast (join "rt" (code)) and wait
else
	if code / code = 1 or code = 0 then
		PUSH (code)
	else
		set error to -13
		clear_stacks
		set ip_repl to 1 / 0
	end
end

define do_built_in
set error to 0
if letter 1 of code = "c" and letter 2 of code = "t" then
	broadcast (code) and wait
else
	if Built_in contains code? then
		broadcast (join "rt" (code)) and wait
	else
		if code / code = 1 or code = 0 then
			PUSH (code)
		else
			set error to -13
			clear_stacks
			set ip to 1 / 0
		end
	end
end

define make_word
if in_definition = 0 then
	set in_definition to 1
	begin_definition
	change ip_repl by 1
end
set error to 0
repeat until item ip_repl of tokens = ";" or error > 0 or ip_repl > length of tokens
	set code to item ip_repl of tokens
	if Immediates contains code? then
		set next_code_repl to item (ip_repl + 1) of tokens
		if Built_in contains code? then
			broadcast (join "ct" (code)) and wait
		else
			set ip to ip_repl
			execute_word (code)
			if ip = 1 / 0 then
				set ip_repl to 1 / 0
			end
		end
	else
		if Built_in contains code? or Words contains code? or code / code = 1 or code = 0 then
			add code to Codes
		else
			set error to -13
			clear_stacks
			set ip_repl to 1 / 0
		end
	end
	change ip_repl by 1
end
if item ip_repl of tokens = ";" then
	add_exit
	end_definition
	set in_definition to 0
end

define-atomic make_marker
begin_definition
set error to 0
add "FORGET" to Codes
add item ip_repl of tokens to Codes
add_exit
end_definition

define-atomic make_create
begin_definition
set error to 0
add length of Codes + 5 to Codes
add "ELSE" to Codes
add "1" to Codes
set does_from to length of Codes
add_exit
end_definition

define-atomic .COMMA.
set error to 0
POP
add Popped to Codes
end_definition

define-atomic make_constant
begin_definition
set error to 0
POP
add Popped to Codes
add_exit
end_definition

define-atomic begin_definition
change ip_repl by 1
add item ip_repl of tokens to Words
add length of Words to Codes
add length of Codes to Word_code
add "0" to Codes
set ilength to length of Codes

define-atomic end_definition
replace item ilength of Codes with length of Codes - ilength

define-atomic add_exit
add "EXIT" to Codes

define execute_word [code_arg]
set ip_save to ip
find_word (code_arg) (length of Words)
set ip to item idx of Word_code + 2
execute_ip

define execute_ip
set code to item ip of Codes
set done to 0
rpush -1
repeat until done = 1
	repeat until code = "EXIT"
		if Words contains code? then
			rpush (ip + 1)
			find_word (code) (length of Words)
			set ip to item idx of Word_code + 2
			set code to item ip of Codes
		else
			if code = "EXECUTE" then
				rpush (ip + 1)
				POP
				set ip to Popped
				set code to item ip of Codes
			else
				set next_code to item (ip + 1) of Codes
				do_built_in
				if ip = 1 / 0 then
					set code to "EXIT"
					set done to 1
					set ip_save to ip
				else
					change ip by 1
					set code to item ip of Codes
				end
			end
		end
	end
	rpop
	if ip_delete > 0 then
		delete_codes
		if Popped > length of Codes then
			set done to 1
		end
	end
	if Popped = -1 then
		set done to 1
	else
		set ip to Popped
		set code to item ip of Codes
	end
end
set ip to ip_save

define-atomic find_word [code_arg] (index)
set idx to index
set found to 0
repeat until found = 1 or idx < 1
	if code_arg = item idx of Words then
		set found to 1
	else
		change idx by -1
	end
end

when I receive "rtMS"
POP
wait Popped / 1000 secs

when I receive "rtTIMER"
PUSH (1000 * timer)

when I receive "rtTIME&DATE"
PUSH (current second)
PUSH (current minute)
PUSH (current hour)
PUSH (current date)
PUSH (current month)
PUSH (current year)

when I receive "rtDRUM"
POP
set popped2 to Popped
POP
play drum Popped for popped2 beats

when I receive "rtREST"
POP
rest for Popped beats

when I receive "rtPLAY"
POP
set popped2 to Popped
POP
play note Popped for popped2 beats

when I receive "uv-1!"
POP
set instrument to Popped
set _instrument to Popped

when I receive "uv-2!"
POP
set tempo to Popped bpm

when I receive "uv-2+!"
POP
change tempo by Popped

when I receive "uv-2@"
PUSH (tempo)

when I receive "uv-3!"
POP
set volume to Popped%

when I receive "uv-3+!"
POP
change volume by Popped

when I receive "uv-3@"
PUSH (volume)

when I receive "rtGOTO-XY"
POP
set popped2 to Popped
POP
go to x: Popped y: popped2

when I receive "uv-4!"
POP
set x to Popped

when I receive "uv-4+!"
POP
change x by Popped

when I receive "uv-4@"
PUSH (x position)

when I receive "uv-5!"
POP
set y to Popped

when I receive "uv-5+!"
POP
change y by Popped

when I receive "uv-5@"
PUSH (y position)

when I receive "rtMOVE"
POP
move Popped steps

when I receive "uv-6!"
POP
point in direction Popped

when I receive "uv-6+!"
POP
turn cw Popped degrees

when I receive "uv-6@"
PUSH (direction)

when I receive "uv-7!"
POP
set pen color to (Popped)

when I receive "uv-8!"
POP
set pen hue to Popped

when I receive "uv-8+!"
POP
change pen hue by Popped

when I receive "uv-9!"
POP
set pen shade to Popped

when I receive "uv-9+!"
POP
change pen shade by Popped

when I receive "uv-10!"
POP
set pen size to Popped

when I receive "uv-10+!"
POP
change pen shade by Popped

when I receive "rtDOWN"
pen down

when I receive "rtUP"
pen up

define PAGE
broadcast "cls" and wait

when I receive "rtAT-XY"
POP
set Current_row to Popped
POP
set Current_column to Popped

when I receive "rtPOS@"
set str to (join "row" (Current_row)) of "Screen"
ascii (letter (Current_column + 1) of str)
PUSH (idx)

when I receive "rtEMIT"
POP
..DQ. (letter Popped of CHARACTERS)

when I receive "rt.\""
change ip by 1
..DQ. (next_code)

when I receive "ct.\""
ct.LP.

when I receive "rtSPACES"
POP
repeat Popped
	..DQ. " "
end

when I receive "rt+"
POP
replace item 1 of data with item 1 of data + Popped

when I receive "rt-"
POP
replace item 1 of data with item 1 of data - Popped

when I receive "rt*"
POP
replace item 1 of data with item 1 of data * Popped

when I receive "rt/"
POP
replace item 1 of data with floor of (item 1 of data / Popped)

when I receive "rtF/"
POP
replace item 1 of data with item 1 of data / Popped

when I receive "rtINT"
POP
if Popped < 0 then
	PUSH (ceiling of Popped)
else
	PUSH (floor of Popped)
end

when I receive "rtFLOOR"
POP
PUSH (floor of Popped)

when I receive "rtFROUND"
POP
PUSH (round Popped)

when I receive "rtMOD"
POP
replace item 1 of data with item 1 of data mod Popped

when I receive "rt/MOD"
POP
insert item 1 of data mod Popped at 2 of data
replace item 1 of data with floor of (item 1 of data / Popped)

when I receive "rt*/"
POP
replace item 1 of data with floor of (item 2 of data * item 1 of data / Popped)
delete 2 of data

when I receive "rt*/MOD"
POP
replace item 1 of data with item 2 of data * item 1 of data
delete 2 of data
PUSH (item 1 of data mod Popped)
PUSH (floor of (item 2 of data / Popped))
delete 3 of data

when I receive "rt1+"
POP
change Popped by 1
PUSH (Popped)

when I receive "rt1-"
POP
change Popped by -1
PUSH (Popped)

when I receive "rt2+"
POP
change Popped by 2
PUSH (Popped)

when I receive "rt2-"
POP
change Popped by -2
PUSH (Popped)

when I receive "rt2*"
POP
change Popped by Popped
PUSH (Popped)

when I receive "rt2/"
POP
set Popped to floor of (Popped / 2)
PUSH (Popped)

when I receive "rt."
POP
..DQ. (join (Popped) " ")

when I receive "rt.R"
POP
set popped2 to Popped
POP
set str to ""
repeat popped2 - length of Popped
	set str to (join (str) " ")
end
..DQ. (join (str) (Popped))

when I receive "rt.S"
set j to length of data
..DQ. (join join "<" (j) "> ")
repeat j
	..DQ. (join (item j of data) " ")
	change j by -1
end

when I receive "rtR.S"
set j to length of return
..DQ. (join join "<" (j) "> ")
repeat j
	..DQ. (join (item j of return) " ")
	change j by -1
end

when I receive "rt("
change ip by 1

when I receive "ct("
ct.LP.

define-atomic ct.LP.
add code to Codes
add next_code_repl to Codes
change ip_repl by 1
set next_code_repl to item (ip_repl + 1) of tokens

when I receive "ctPOSTPONE"
add (join "ct" (next_code_repl)) to Codes
change ip_repl by 1
set next_code_repl to item ip_repl of tokens

when I receive "rtDROP"
DROP

when I receive "rt2DROP"
_2DROP

define-atomic _2DROP
DROP
DROP

when I receive "rtDUP"
DUP

define-atomic DUP
PUSH (item 1 of data)

when I receive "rt2DUP"
_2DUP

define-atomic _2DUP
PUSH (item 2 of data)
PUSH (item 2 of data)

when I receive "rtSWAP"
SWAP

define-atomic SWAP
POP
insert Popped at 2 of data

when I receive "rt2SWAP"
insert item 1 of data at 5 of data
insert item 2 of data at 6 of data
DROP
DROP

when I receive "rtROT"
PUSH (item 3 of data)
delete 4 of data

when I receive "rt2ROT"
PUSH (item 6 of data)
PUSH (item 6 of data)
delete 7 of data
delete 7 of data

when I receive "rtOVER"
PUSH (item 2 of data)

when I receive "rt2OVER"
PUSH (item 4 of data)
PUSH (item 4 of data)

when I receive "rtABS"
replace item 1 of data with abs of item 1 of data

when I receive "rtNEGATE"
replace item 1 of data with 0 - item 1 of data

when I receive "rtMIN"
POP
if Popped < item 1 of data then
	replace item 1 of data with Popped
end

when I receive "rtMAX"
POP
if Popped > item 1 of data then
	replace item 1 of data with Popped
end

when I receive "rt>R"
POP
rpush (Popped)

when I receive "rtR>"
rpop
PUSH (Popped)

when I receive "rtI"
PUSH (item 1 of return)

when I receive "rtI'"
PUSH (item 2 of return)

when I receive "rtJ"
PUSH (item 3 of return)

when I receive "rtK"
PUSH (item 5 of return)

when I receive "rt:"
make_word

when I receive "rtMARKER"
make_marker

when I receive "rtCREATE"
make_create

when I receive "rtDOES>"
replace item does_from of Codes with ip + 1 - does_from
set ip to 1 / 0

when I receive "rt,"
.COMMA.

when I receive "rtALLOT"
POP
repeat Popped
	PUSH (pick random -32768 to 32767)
	.COMMA.
end

when I receive "rtVARIABLE"
make_create
PUSH (pick random -32768 to 32767)
.COMMA.

when I receive "rt!"
POP
set popped2 to Popped
if popped2 < 0 then
	broadcast (join join "uv" (popped2) "!") and wait
else
	POP
	replace item popped2 of Codes with Popped
end

when I receive "rt+!"
POP
set popped2 to Popped
if popped2 < 0 then
	broadcast (join join "uv" (popped2) "+!") and wait
else
	POP
	replace item popped2 of Codes with item popped2 of Codes + Popped
end

when I receive "rt@"
POP
if Popped < 0 then
	broadcast (join join "uv" (Popped) "@") and wait
else
	PUSH (item Popped of Codes)
end

when I receive "rtCONSTANT"
make_constant

when I receive "rt="
.EQ.

define-atomic .EQ.
POP
if item 1 of data = Popped then
	DROP
	PUSH -1
else
	DROP
	PUSH 0
end

when I receive "rt<"
POP
if item 1 of data < Popped then
	DROP
	PUSH -1
else
	DROP
	PUSH 0
end

when I receive "rt>"
POP
if item 1 of data > Popped then
	DROP
	PUSH -1
else
	DROP
	PUSH 0
end

when I receive "rtINVERT"
POP
PUSH (-1 - Popped)

define-atomic FALSE
PUSH 0

define-atomic TRUE
PUSH -1

when I receive "rt0="
POP
if Popped = 0 then
	TRUE
else
	FALSE
end

when I receive "rt0<"
POP
if Popped < 0 then
	TRUE
else
	FALSE
end

when I receive "rtAND"
POP
if abs of item 1 of data = 0 or abs of Popped = 0 then
	DROP
	FALSE
else
	DROP
	TRUE
end

when I receive "rtOR"
POP
if abs of item 1 of data = 0 and abs of Popped = 0 then
	DROP
	FALSE
else
	DROP
	TRUE
end

when I receive "rtXOR"
POP
if <abs of item 1 of data = 0> = <abs of Popped = 0> then
	DROP
	FALSE
else
	DROP
	TRUE
end

when I receive "rt?DUP"
if not abs of item 1 of data = 0 then
	DUP
end

when I receive "rtABORT\""
POP
if not abs of Popped = 0 then
	..DQ. (next_code)
	set error to -2
	clear_stacks
	set ip to 1 / 0
else
	change ip by 1
end

when I receive "ctABORT\""
ct.LP.

define-atomic clear_stacks
delete all of data
delete all of return

when I receive "rtQUIT"
set error to -56
delete all of return
set ip to 1 / 0

when I receive "rt?STACK"
if length of data = 0 then
	TRUE
else
	FALSE
end

when I receive "rtIF"
POP
if abs of Popped = 0 then
	change ip by next_code
else
	change ip by 1
end

when I receive "ctIF"
add "IF" to Codes
add "0" to Codes
PUSH (length of Codes)

when I receive "rtELSE"
change ip by next_code

when I receive "ctELSE"
POP
add "ELSE" to Codes
add "0" to Codes
replace item Popped of Codes with length of Codes - Popped + 1
PUSH (length of Codes)

when I receive "ctTHEN"
POP
replace item Popped of Codes with length of Codes - Popped + 1

when I receive "rt[CHAR]"
ascii (next_code)
PUSH (idx)
change ip by 1

when I receive "ct[CHAR]"
ascii (next_code_repl)
add idx to Codes
change ip_repl by 1
set next_code_repl to item (ip_repl + 1) of tokens

when I receive "rtINKEY"
if Inkey = "" then
	PUSH 0
else
	ascii (Inkey)
	set Inkey to ""
	PUSH (idx)
end

define-atomic ascii [char]
set idx to 1
repeat until letter idx of CHARACTERS = letter 1 of char or idx > length of CHARACTERS
	change idx by 1
end

when I receive "rtEXECUTE"
set ip_save to ip
POP
set ip to Popped
execute_ip

when I receive "rt'"
find_word (next_code_repl) (length of Words)
PUSH (item idx of Word_code + 2)
change ip_repl by 1
set next_code_repl to item (ip_repl + 1) of tokens

when I receive "rt[']"
find_word (next_code) (length of Words)
PUSH (item idx of Word_code + 2)
change ip by 1

when I receive "ct[']"
ct.LP.

when I receive "rtDO"
SWAP
POP
rpush (Popped)
POP
rpush (Popped)

when I receive "ctDO"
add "DO" to Codes
PUSH (length of Codes)
rpush -1

when I receive "rt?DO"
_2DUP
.EQ.
POP
if Popped = 0 then
	broadcast "rtDO" and wait
	change ip by 1
else
	_2DROP
	change ip by next_code
end

when I receive "ct?DO"
add "?DO" to Codes
add "0" to Codes
PUSH (length of Codes)
rpush -1
rpush (length of Codes)

when I receive "rtLOOP"
rpop
change Popped by 1
if Popped < item 1 of return then
	rpush (Popped)
	change ip by next_code
else
	rpop
	change ip by 1
end

when I receive "rt+LOOP"
POP
set str to Popped
rpop
change Popped by str
set j to <Popped < item 1 of return>
if not <str < 0> = <j = TRUE> then
	rpush (Popped)
	change ip by next_code
else
	rpop
	change ip by 1
end

when I receive "ctLOOP"
add "LOOP" to Codes
ct_loop

when I receive "ct+LOOP"
add "+LOOP" to Codes
ct_loop

define-atomic ct_loop
add length of Codes to Codes
rpop
repeat until Popped = -1
	replace item Popped of Codes with length of Codes - Popped + 1
	rpop
end
POP
replace item last of Codes with Popped - item last of Codes

when I receive "rtLEAVE"
delete 1 of return
delete 1 of return
change ip by next_code

when I receive "ctLEAVE"
add "LEAVE" to Codes
add "0" to Codes
rpush (length of Codes)

when I receive "ctBEGIN"
PUSH (length of Codes)

when I receive "rtUNTIL"
POP
if Popped = 0 then
	change ip by next_code
else
	change ip by 1
end

when I receive "ctUNTIL"
POP
add "UNTIL" to Codes
add Popped - length of Codes to Codes

when I receive "rtWHILE"
POP
if Popped = 0 then
	change ip by next_code
else
	change ip by 1
end

when I receive "ctWHILE"
add "WHILE" to Codes
add "0" to Codes
PUSH (length of Codes)

when I receive "rtREPEAT"
change ip by next_code

when I receive "ctREPEAT"
POP
replace item Popped of Codes with length of Codes - Popped + 3
POP
add "REPEAT" to Codes
add Popped - length of Codes to Codes

when I receive "rtHERE"
PUSH (length of Codes + 1)

when I receive "rtFORGET"
if ip = ip_repl then
	change ip_repl by 1
else
	change ip by 1
end
if Words contains next_code? then
	find_word (next_code) (length of Words)
	set ip_delete to item idx of Word_code
	repeat length of Words - idx + 1
		delete last of Words
		delete last of Word_code
	end
else
	set error to -15
end

when I receive "PUSH"
PUSH (Number)

define-atomic PUSH (arg1)
insert arg1 at 1 of data

define-atomic rpush (arg1)
insert arg1 at 1 of return

when I receive "POP"
POP

define-atomic POP
check_data
set Popped to item 1 of data
delete 1 of data

define-atomic DROP
check_data
delete 1 of data

define-atomic check_data
if length of data = 0 then
	set error to -4
	set ip to 1 / 0
end

define-atomic rpop
set Popped to item 1 of return
delete 1 of return

define println [s]
..DQ. (s)
change Current_row by 1
set Current_column to 0

define ..DQ. [s]
set String to s
broadcast "print" and wait

define print_one [char]
set Character to char
broadcast "print_one" and wait

define-atomic make_terminated
delete all of Terminated
delete all of Terminator
add "\"" to Terminated
add "\"" to Terminator
add "(" to Terminated
add ")" to Terminator

define-atomic make_immediates
delete all of Immediates
add "IF" to Immediates
add "ELSE" to Immediates
add "THEN" to Immediates
add "[CHAR]" to Immediates
add "DO" to Immediates
add "LOOP" to Immediates
add "+LOOP" to Immediates
add "LEAVE" to Immediates
add "?DO" to Immediates
add "BEGIN" to Immediates
add "UNTIL" to Immediates
add "WHILE" to Immediates
add "REPEAT" to Immediates
add ".\"" to Immediates
add "(" to Immediates
add "ABORT\"" to Immediates
add "[']" to Immediates
add "POSTPONE" to Immediates

define-atomic make_built_in
delete all of Built_in
add "INKEY" to Built_in
add "MS" to Built_in
add "TIMER" to Built_in
add "TIME&DATE" to Built_in
add "BELL" to Built_in
add "DRUM" to Built_in
add "REST" to Built_in
add "PLAY" to Built_in
add "GOTO-XY" to Built_in
add "MOVE" to Built_in
add "DOWN" to Built_in
add "UP" to Built_in
add "CLEAR" to Built_in
add "PAGE" to Built_in
add "AT-XY" to Built_in
add "POS@" to Built_in
add "EMIT" to Built_in
add ".\"" to Built_in
add "CR" to Built_in
add "SPACE" to Built_in
add "SPACES" to Built_in
add "+" to Built_in
add "-" to Built_in
add "*" to Built_in
add "/" to Built_in
add "F/" to Built_in
add "INT" to Built_in
add "FLOOR" to Built_in
add "FROUND" to Built_in
add "1+" to Built_in
add "1-" to Built_in
add "2+" to Built_in
add "2-" to Built_in
add "2*" to Built_in
add "2/" to Built_in
add "MOD" to Built_in
add "/MOD" to Built_in
add "*/" to Built_in
add "*/MOD" to Built_in
add "." to Built_in
add ".R" to Built_in
add ".S" to Built_in
add "(" to Built_in
add "DROP" to Built_in
add "2DROP" to Built_in
add "DUP" to Built_in
add "2DUP" to Built_in
add "SWAP" to Built_in
add "2SWAP" to Built_in
add "ROT" to Built_in
add "2ROT" to Built_in
add "OVER" to Built_in
add "2OVER" to Built_in
add "ABS" to Built_in
add "NEGATE" to Built_in
add "MIN" to Built_in
add "MAX" to Built_in
add ">R" to Built_in
add "R>" to Built_in
add "I" to Built_in
add "I'" to Built_in
add "J" to Built_in
add "K" to Built_in
add "R.S" to Built_in
add ":" to Built_in
add "MARKER" to Built_in
add "CREATE" to Built_in
add "DOES>" to Built_in
add "," to Built_in
add "ALLOT" to Built_in
add "VARIABLE" to Built_in
add "!" to Built_in
add "+!" to Built_in
add "@" to Built_in
add "CONSTANT" to Built_in
add "=" to Built_in
add "<" to Built_in
add ">" to Built_in
add "INVERT" to Built_in
add "0=" to Built_in
add "0<" to Built_in
add "AND" to Built_in
add "OR" to Built_in
add "?DUP" to Built_in
add "ABORT\"" to Built_in
add "QUIT" to Built_in
add "?STACK" to Built_in
add "IF" to Built_in
add "ELSE" to Built_in
add "THEN" to Built_in
add "[CHAR]" to Built_in
add "EXIT" to Built_in
add "EXECUTE" to Built_in
add "'" to Built_in
add "[']" to Built_in
add "POSTPONE" to Built_in
add "DO" to Built_in
add "LOOP" to Built_in
add "+LOOP" to Built_in
add "LEAVE" to Built_in
add "?DO" to Built_in
add "BEGIN" to Built_in
add "WHILE" to Built_in
add "REPEAT" to Built_in
add "UNTIL" to Built_in
add ".KEYB" to Built_in
add "IMMEDIATE" to Built_in
add "HERE" to Built_in
add "FORGET" to Built_in
add "WORDS" to Built_in
