when I receive "initKeyboard"
set _string to ""
set _index to 0
set Inkey to ""
set _shift to FALSE
set _key to ""
set _semaphore to FALSE
show

when this sprite clicked
_ask

when up arrow key pressed
set _shift to TRUE

define _receive_key [char]
_set_key (char)
if _shift = TRUE or key up arrow pressed? then
	broadcast (join "sh" (Inkey)) and wait
end
set _shift to FALSE
insert Inkey at 1 of _key_buf
if _semaphore = FALSE then
	set _semaphore to TRUE
	broadcast "keys"
end

when I receive "keys"
repeat until length of _key_buf = 0
	set _key to item last of _key_buf
	delete last of _key_buf
	play sound "pop"
	if Running = FALSE then
		if _key = "♪" then
			_cr
		else
			if _key = "◘" then
				if length of TermInpBuf > 0 then
					_backspace_scr
					_backspace_scr
					_backspace_buf
					_print_one "_"
				end
			else
				_print_n_buffer (_key)
			end
		end
	end
end
set _semaphore to FALSE

define-atomic _set_key [char]
set Inkey to char

define _cr
set _semaphore to FALSE
_evaluate_print

define _ask
hide
ask "Enter FORTH:" and wait
set _semaphore to FALSE
set _index to 1
repeat length of TermInpBuf
	_backspace_scr
end
repeat length of answer
	set _string to letter _index of answer
	if _string = "“" or _string = "”" then
		set _string to "\""
	end
	_append_buf (_string)
	change _index by 1
end
_backspace_scr
_print (join (TermInpBuf) " _")
_evaluate_print
show

define _evaluate_print
_backspace_scr
_print_one " "
broadcast "evaluate_buffer" and wait
broadcast "print_response" and wait
add TermInpBuf to History
set TermInpBuf to ""
_print_one "_"

define _print_n_buffer [char]
_backspace_scr
_append_buf (char)
_print (join (char) "_")

define-atomic _append_buf [char]
set TermInpBuf to (join (TermInpBuf) (char))

define _backspace_scr
if Current_column = 0 then
	change Current_row by -1
	if Current_row < 0 then
		set Current_row to 0
	else
		broadcast (join "bs" (Current_row)) and wait
	end
else
	broadcast (join "bs" (Current_row)) and wait
end

define _backspace_buf
_head (TermInpBuf)
set TermInpBuf to _string

define _print [s]
set String to s
broadcast "print" and wait

define _print_one [char]
set Character to letter 1 of char
broadcast "print_one" and wait

define-atomic _head [s]
set _string to ""
set _index to 1
repeat length of s - 1
	set _string to (join (_string) (letter _index of s))
	change _index by 1
end

when I receive "sh1"
_set_key "!"

when I receive "sh2"
_set_key "@"

when I receive "sh3"
_set_key "#"

when I receive "sh4"
_set_key "["

when I receive "sh5"
_set_key "%"

when I receive "sh6"
_set_key "]"

when I receive "sh7"
_set_key "&"

when I receive "sh8"
_set_key "_"

when I receive "sh9"
_set_key "©"

when I receive "sh0"
_set_key "◘"

when I receive "shQ"
_set_key "'"

when I receive "shW"
_set_key "|"

when I receive "shE"
_set_key "~"

when I receive "shR"
_set_key "{"

when I receive "shT"
_set_key "\\"

when I receive "shY"
_set_key "}"

when I receive "shU"
_set_key "$"

when I receive "shI"
_set_key "("

when I receive "shO"
_set_key ")"

when I receive "shP"
_set_key "\""

when I receive "shA"
_set_key ""
set _shift to FALSE
if Running = FALSE then
	_ask
end

when I receive "shS"
_set_key "`"

when I receive "shD"
_set_key "´"

when I receive "shF"
_set_key "¨"

when I receive "shG"
_set_key "€"

when I receive "shH"
_set_key "^"

when I receive "shJ"
_set_key "-"

when I receive "shK"
_set_key "+"

when I receive "shL"
_set_key "="

when I receive "shZ"
_set_key ":"

when I receive "shX"
_set_key ";"

when I receive "shC"
_set_key "?"

when I receive "shV"
_set_key "/"

when I receive "shB"
_set_key "*"

when I receive "shN"
_set_key "<"

when I receive "shM"
_set_key ">"

when I receive "sh."
_set_key ","

when I receive "sh◘"
_set_key "µ"

when I receive "sh♪"
_set_key "Å"

when I receive "sh "
_set_key ""
set _shift to FALSE
broadcast "break" and wait

when space key pressed
_receive_key " "

when a key pressed
_receive_key "A"

when b key pressed
_receive_key "B"

when c key pressed
_receive_key "C"

when d key pressed
_receive_key "D"

when e key pressed
_receive_key "E"

when f key pressed
_receive_key "F"

when g key pressed
_receive_key "G"

when h key pressed
_receive_key "H"

when i key pressed
_receive_key "I"

when j key pressed
_receive_key "J"

when k key pressed
_receive_key "K"

when l key pressed
_receive_key "L"

when m key pressed
_receive_key "M"

when n key pressed
_receive_key "N"

when o key pressed
_receive_key "O"

when p key pressed
_receive_key "P"

when q key pressed
_receive_key "Q"

when r key pressed
_receive_key "R"

when s key pressed
_receive_key "S"

when t key pressed
_receive_key "T"

when u key pressed
_receive_key "U"

when v key pressed
_receive_key "V"

when w key pressed
_receive_key "W"

when x key pressed
_receive_key "X"

when y key pressed
_receive_key "Y"

when z key pressed
_receive_key "Z"

when 0 key pressed
_receive_key "0"

when 1 key pressed
_receive_key "1"

when 2 key pressed
_receive_key "2"

when 3 key pressed
_receive_key "3"

when 4 key pressed
_receive_key "4"

when 5 key pressed
_receive_key "5"

when 6 key pressed
_receive_key "6"

when 7 key pressed
_receive_key "7"

when 8 key pressed
_receive_key "8"

when 9 key pressed
_receive_key "9"

when right arrow key pressed
_receive_key "."

when left arrow key pressed
_receive_key "◘"

when down arrow key pressed
_receive_key "♪"
