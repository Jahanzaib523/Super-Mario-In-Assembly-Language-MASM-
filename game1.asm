.model small
.stack 100h
.data
;***********************************************************variables for coordinates***************************************************************
X DW 32; 
Y DW 64; 
XO DB ?
YO DB ?
X1 DW ?
Y1 DW ?
X2 DW ?
Y2 DW ?
;***********************************************************variables for loop purposes***************************************************************
VAR1 DB ?
var db 0
var2 db 0
var3 db 6
var4 db 1
var5 db 3
var6 db 4
var7 db 0
var8 db 1
var9 db 0
var10 db 0
var11 db 0
var12 db 5
var13 db 10
var14 db 0
var15 db 0
var16 db 5
var17 db 10
var18 db 0
var19 db 0
var20 db 0
var21 db 0
var22 db 0
var23 db 0
var24 db 0
var25 db 0
var26 db 0
;***********************************************************variables for color and indexes***************************************************************
count db 1
index dw 0
index1 dw 0
index2 DW 0
index3 DW 0
level db 1
color db 0
;***********************************************************variables for random numbers***************************************************************
num dw 12
num1 dw 58765
temp1 dw ?
temp2 dw ?
;***********************************************************variables for delays***************************************************************
long_delay db 0
short_delay db 0

;***********************************************************variables for coordinates and range also moves***************************************************************
T1 DW 320
T2 DW 321
TEMP DW ?
RAND DW 12H
RANGE DB 5
RANGEFORBLOCKERS DB 6
SCORE DW 0
MOVES DW 5
MOVESPRINT DW 0
DIGITCOUNT DW 0
SCOREPRINT DW 0
DIGITCOUNT1 DW 0
;***********************************************************strings used***************************************************************
msg1 db "LEVEL 1 ","$"
msg2 db "SCORE : ","$"
msg3 db "NAME : ","$"
msg4 db "REMAINING MOVES = ","$"
msg5 db "PRESS ANY KEY TO START ","$"
msg6 db "ENTER YOUR NAME PLEASE : ","$"
msg7 db "PLAY WITH YOUR HEART NOT JUST YOUR FINGERS :D ","$"
msg8 db "LIFE IS MORE FUN WHEN YOU PLAY GAMES ^_^ :D ","$"
msg9 db "LEVEL 2 ","$"
msg10 db "JUST","$"
msg11 db "PLAY","$"
msg12 db "^_^","$"
msg13 db "HAVE","$"
msg14 db "FUN","$"
msg15 db "!!!","$"
msg16 db "ENJOY :P ","$"
msg17 db "THE ","$"
msg18 db "GAME :)","$"
msg19 db "KIDS PLAY","$"
msg20 db "FIFA","$"
msg21 db "MEN PLAY","$"
msg22 db "DOTA","$"
msg23 db "LEGENDS PLAY","$"
msg24 db "NUMBER","$"
msg25 db "CRUSH !!","$"
msg26 db "LEVEL 3 ","$"
msg27 db "STACK :D","$"
msg28 db "LET THE GOOD TIMES ROLL !! ","$"
msg29 db "PLAY LIKE","$"
msg30 db "YOU'VE","$"
msg31 db "NEVER LOST","$"
msg32 db "AREY!!","$"
msg33 db "BHAI!!","$" 
msg34 db "GAME RULES !!","$"
msg35 db "1.WELCOME TO NUMBER CRUSH !!!","$"
msg36 db "2.CRUSH RANDOM NUMBERS BY MAKING THEIR HORIZONTAL AND VERTICAL COMBINATIONS","$"
msg37 db "3.YOU CAN DO THIS BY SWAPPING THE ADJACENT NUMBERS ","$"
msg38 db "4.MOVE THE CURSOR TO 1ST NUMBER AND CLICK LEFT BUTTON MOUSE ","$"
msg39 db "5.MOVE THE CURSOR TO 2ND NUMBER AND CLICK RIGHT BUTTON MOUSE AND THEY WILL SWAP","$"
msg40 db "6.A COMBINATION OF FOUR WILL MAKE A BOMB APPEAR","$" 
msg41 db "7.AND WHEN BOMB IS SWAPPED WITH A NUMBER ALL THAT NUMBERS ARE CRUSHED","$" 
msg42 db "8.IF A BOMB IS SWAPPED WITH A BOMB THEN THE WHOLE GRID IS CRUSHED","$"
msg43 db "9.BLOCKERS CANNOT BE SWAPPED ","$"
msg44 db "9.THIS GAME HAS THREE DIFFERENT LEVELS !! ","$"
msg45 db "10.BEST OF LUCK ^_^ ","$"
msg46 db " SOME PEOPLE SAY GAMES ROT YOUR BRAIN ","$"
msg47 db " BUT I THINK THEY WORK DIFFERENT MUSCLES THAT ","$"
msg48 db " MAYBE YOU DON'T NORMALLY USE ","$"
msg49 db "LEVEL 1 LOADING...","$"
msg50 db "  I DON'T NEED TO  ","$"
msg51 db "  GET A LIFE  ","$"
msg52 db " I'M A GAMER  ","$"
msg53 db "  I HAVE  ","$"
msg54 db "  ALOT OF LIVES ! ","$"
msg55 db "  LEVEL 2 LOADING...","$"
msg56 db "  GAMES DON'T MAKE YOU VIOLENT,LAG DOES  ","$"
msg57 db "  SAVE OUR KIDS,  ","$"
msg58 db "  INSTALL FASTER INTERNET  ","$"
msg59 db "  LEVEL 3 IS LOADING.. ","$"
msg60 db "  THANK YOU SO MUCH FOR PLAYING ","$"
msg61 db "  GAMERS NEVER DIE THEY RESPAWN :D ","$"
msg62 db "  GAMERS NEVER QUIT !! ","$"
msg63 db "  BE LIKE GAMERS :)  ","$"
msg64 db "  HOPE YOU HAD A GREAT TIME :)  ","$"
msg65 db "  COME AGAIN !!  ","$"
msg66 db "  GOODBYE ! ^_^  ","$"
;***********************************************************arrays used***************************************************************
username db 10 dup("$")
myarray byte 100 dup(1,2,2,2,5)

.code
;***********************************************************MAIN FUNCTION***************************************************************

main proc
mov ax,@data
mov ds,ax
;***********************************************************NAME OF GAME DISPLAY SCREEN 1 AND 2***************************************************************
la:
call new_window
call display_start1
call short_delay_function
call new_window
call display_start2
call short_delay_function
mov ah,06
mov dl,0ffh					;SCREENS DIPLAYED UNTIL KEY IS PRESSED
int 21h
jz la
;***********************************************************GAME RULES***************************************************************
waitforrules:
call new_window
CALL game_rules
CALL long_delay_function
mov ah,06
mov dl,0ffh                  ;RULES DIPLAYED UNTIL KEY IS PRESSED
int 21h
jz waitforrules
;***********************************************************GETTING PLAYER NAME***************************************************************
Call new_window
call get_name_function

;***********************************************************LEVEL 1 STARTS***************************************************************
CALL level1loading
call long_delay_function
call long_delay_function

lb:
CALL RANDOM           ;generate random
CALL SHOW_SCREEN1	  ;level 1 screen
CALL short_delay_function
CALL horizontal_crushing	;crushes the combinations in the start
CALL vertical_crushing
CALL SHOW_SCREEN1
;*****************************************************CONTINUE THE PROCESS UNTIL NO COMBINATION IS POSSIBLE*****************************************
l3:
mov var21,0
CALL short_delay_function
CALL filltoprow
CALL SHOW_SCREEN1
CALL short_delay_function
CALL DROP
CALL SHOW_SCREEN1
CALL short_delay_function
CALL horizontal_crushing
CALL vertical_crushing
CALL CLEAR
CALL SHOW_SCREEN1
CALL CLEAR
mov si,0
l4:
cmp myarray[si],'/'
je l3
inc si
inc var21
cmp var21,100
je l1
jmp l4
;******************************************************AFTER THAT GIVING CONTROL TO THE USER**********************************************************

l1:
DEC MOVES
CALL CLEAR
CALL MOUSE_CLICK
CALL POS
CALL SHOW_SCREEN1
CALL short_delay_function
CMP MOVES,0
JE  skip_crush
CALL horizontal_crushing
CALL vertical_crushing
skip_crush:
CALL SHOW_SCREEN1
CALL CLEAR
CALL sound
CALL CLEAR
CMP MOVES,0
JE MEXT
JMP L3
;******************************************************CONTINUE TILL MOVES GET ZERO**********************************************************

;******************************************************LEVEL 2 STARTS**********************************************************



MEXT:
CALL level2loading
call long_delay_function
call long_delay_function

MOV SCORE,0
MOV MOVES,5
CALL RANDOM
CALL SHOW_SCREEN2
CALL long_delay_function
CALL short_delay_function
CALL horizontal_crushing2
CALL vertical_crushing2
CALL SHOW_SCREEN2
;*****************************************************CONTINUE THE PROCESS UNTIL NO COMBINATION IS POSSIBLE*****************************************
l5:
mov var26,0
CALL short_delay_function
CALL filltoprow
CALL SHOW_SCREEN2
CALL short_delay_function
CALL DROP
CALL SHOW_SCREEN2
CALL short_delay_function
CALL horizontal_crushing2
CALL vertical_crushing2
CALL CLEAR
CALL SHOW_SCREEN2
CALL CLEAR
mov si,0
l7:
cmp myarray[si],'/'
je l5
inc si
inc var26
cmp var26,100
je l6
jmp l7
;*****************************************************CONTINUE THE PROCESS UNTIL NO COMBINATION IS POSSIBLE*****************************************

;******************************************************AFTER THAT GIVING CONTROL TO THE USER**********************************************************
l6:
DEC MOVES
CALL CLEAR
CALL MOUSE_CLICK
CALL POS
CALL SHOW_SCREEN2
CALL short_delay_function
CMP MOVES,0
JE  skip_crush2
CALL horizontal_crushing2
CALL vertical_crushing2
skip_crush2:
CALL SHOW_SCREEN2
CALL CLEAR
CALL sound
CALL CLEAR
CMP MOVES,0
JE MEXT1
JMP L5
;******************************************************CONTINUE TILL MOVES GET ZERO**********************************************************

;******************************************************LEVEL 3 STARTS**********************************************************
MEXT1:
CALL level3loading
call long_delay_function
call long_delay_function
MOV SCORE,0
MOV MOVES,5
CALL RANDOM3
CALL SHOW_SCREEN3
CALL long_delay_function
CALL short_delay_function
CALL horizontal_crushing
CALL vertical_crushing
CALL SHOW_SCREEN3
l8:
mov var26,0
CALL short_delay_function
CALL filltoprow
CALL SHOW_SCREEN3
CALL short_delay_function
CALL DROP
CALL SHOW_SCREEN3
CALL short_delay_function
CALL horizontal_crushing
CALL vertical_crushing
CALL CLEAR
CALL SHOW_SCREEN3
CALL CLEAR
mov si,0
l10:
cmp myarray[si],'/'
je l8
inc si
inc var26
cmp var26,100
je l9
jmp l10
;******************************************************CONTINUE TILL NO COMBINATION*********************************************************

;******************************************************GIVE USER CONTROL**********************************************************
l9:
DEC MOVES
CALL CLEAR
CALL MOUSE_CLICK
CALL POS
CALL SHOW_SCREEN3
CALL short_delay_function
CMP MOVES,0
JE  skip_crush3
CALL horizontal_crushing
CALL vertical_crushing
skip_crush3:
CALL SHOW_SCREEN3
CALL CLEAR
CALL sound
CALL CLEAR
CMP MOVES,0
JE MEXT2
JMP L8
;******************************************************CONTINUE TILL MOVES GET ZERO**********************************************************

;******************************************************LEVEL 3 ENDS AND GAME OVERS**********************************************************

MEXT2:
call gameoverscreen
call long_delay_function
call long_delay_function
mov ah,4ch
int 21h
main endp

level1loading proc
CALL new_window

mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,29
mov dl,79
mov bh,4
int 10h

CALL CLEAR

mov ah,02h
mov dh,11
mov dl,20
int 10h
mov dx,offset msg46
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,12
mov dl,16
int 10h
mov dx,offset msg47
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,13
mov dl,23
int 10h
mov dx,offset msg48
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,22
mov dl,29
int 10h
mov dx,offset msg49
mov ah,09
int 21h


ret
level1loading endp

level2loading proc
CALL new_window

mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,29
mov dl,79
mov bh,2
int 10h

CALL CLEAR

mov ah,02h
mov dh,8
mov dl,27
int 10h
mov dx,offset msg50
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,9
mov dl,29
int 10h
mov dx,offset msg51
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,10
mov dl,29
int 10h
mov dx,offset msg52
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,11
mov dl,31
int 10h
mov dx,offset msg53
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,12
mov dl,28
int 10h
mov dx,offset msg54
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,22
mov dl,27
int 10h
mov dx,offset msg55
mov ah,09
int 21h

ret
level2loading endp

level3loading proc
CALL new_window

mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,29
mov dl,79
mov bh,1
int 10h

CALL CLEAR

mov ah,02h
mov dh,8
mov dl,19
int 10h
mov dx,offset msg56
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,9
mov dl,30
int 10h
mov dx,offset msg57
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,10
mov dl,26
int 10h
mov dx,offset msg58
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,21
mov dl,27
int 10h
mov dx,offset msg59
mov ah,09
int 21h

ret
level3loading endp

gameoverscreen proc
CALL new_window

mov ah,06
mov al,0
mov ch,6
mov cl,0
mov dh,10
mov dl,79
mov bh,3
int 10h

mov ah,06
mov al,0
mov ch,15
mov cl,0
mov dh,22
mov dl,79
mov bh,2
int 10h

mov ah,06
mov al,0
mov ch,23
mov cl,0
mov dh,29
mov dl,79
mov bh,4
int 10h

mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,6
mov dl,79
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,11
mov cl,0
mov dh,14
mov dl,79
mov bh,5
int 10h

CALL CLEAR

mov ah,02h
mov dh,8
mov dl,19
int 10h
mov dx,offset msg60
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,8
mov dl,51
int 10h
mov dx,offset username
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,16
mov dl,19
int 10h
mov dx,offset msg61
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,17
mov dl,23
int 10h
mov dx,offset msg62
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,18
mov dl,23
int 10h
mov dx,offset msg63
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,19
mov dl,19
int 10h
mov dx,offset msg64
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,20
mov dl,25
int 10h
mov dx,offset msg65
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,21
mov dl,25
int 10h
mov dx,offset msg66
mov ah,09
int 21h



ret
gameoverscreen endp

game_rules proc
mov var10,0
mov var11,0
mov var12,2
mov var13,10
mov count,4
mov ah,02h
mov dh,20
mov dl,15
int 10h

lc:
mov ah,6
mov al,0
mov ch,var10
mov cl,var11
mov dh,var12
mov dl,var13
mov bh,count
int 10h
add var11,10
add var13,10
inc count
cmp count,13
je ld
jmp lc

ld:
mov var10,27
mov var11,0
mov var12,29
mov var13,10
mov count,2
lc1:
mov ah,6
mov al,0
mov ch,var10
mov cl,var11
mov dh,var12
mov dl,var13
mov bh,count
int 10h
add var11,10
add var13,10
inc count
cmp count,11
je lm
jmp lc1

lm:
CALL CLEAR 

mov ah,02h
mov dh,3
mov dl,35
int 10h
mov dx,offset msg34
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,5
mov dl,0
int 10h
mov dx,offset msg35
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,7
mov dl,0
int 10h
mov dx,offset msg36
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,9
mov dl,0
int 10h
mov dx,offset msg37
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,11
mov dl,0
int 10h
mov dx,offset msg38
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,13
mov dl,0
int 10h
mov dx,offset msg39
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,15
mov dl,0
int 10h
mov dx,offset msg40
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,17
mov dl,0
int 10h
mov dx,offset msg41
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,19
mov dl,0
int 10h
mov dx,offset msg42
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,21
mov dl,0
int 10h
mov dx,offset msg43
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,23
mov dl,0
int 10h
mov dx,offset msg44
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,25
mov dl,0
int 10h
mov dx,offset msg45
mov ah,09
int 21h


mov ah,6
mov al,0
mov ch,4
mov cl,33
mov dh,4
mov dl,48
mov bh,1
int 10h

mov var25,6
mov var24,1
linesloop:

mov ah,6
mov al,0
mov ch,var25
mov cl,0
mov dh,var25
mov dl,80
mov bh,var24
int 10h
add var25,2
inc var24
cmp var24,12
je endlinesloop
jmp linesloop

endlinesloop:
mov var10,0
mov var11,0
mov var12,5
mov var13,10
mov count,1
CALL CLEAR
ret
game_rules endp

long_delay_function proc
mov long_delay,0
l8:
mov cx,3
mov dx,0fffffh
mov ah,86h
int 15h
inc long_delay
cmp long_delay,15
je l9
jmp l8

l9:
ret
long_delay_function endp

short_delay_function proc
mov short_delay,0
l8:
mov cx,3
mov dx,0fffffh
mov ah,86h
int 15h
inc short_delay
cmp short_delay,2
je l9
jmp l8

l9:
ret
short_delay_function endp

welcome_messages proc

mov ah,02h
mov dh,0
mov dl,0
int 10h

mov ah,09
mov dx,offset msg3
int 21h

mov ah,09
mov dx,offset username
int 21h

mov ah,02h
mov dh,2
mov dl,0
int 10h

mov ah,09
mov dx,offset msg4
int 21h

MOV AX, MOVES
MOV MOVESPRINT, AX
CALL PRI


mov ah,02h
mov dh,0
mov dl,30
int 10h
mov dx,offset msg1
mov ah,09
int 21h


mov ah,02h
mov dh,0
mov dl,60
int 10h
mov dx,offset msg2
mov ah,09
int 21h

MOV AX, 0
mov ax, SCORE
mov SCOREPRINT,AX
call PRI1

mov ah,6
mov al,0
mov ch,1
mov cl,0
mov dh,1
mov dl,15
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,27
mov dh,1
mov dl,38
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,58
mov dh,1
mov dl,73
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,3
mov cl,0
mov dh,3
mov dl,20
mov bh,9
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,02h
mov dh,28
mov dl,28
int 10h
ret
welcome_messages endp

new_window proc
mov ah,0
mov al,12h
int 10h
ret
new_window endp

DISPLAY_ARRAY PROC
MOV SI, 0
MOV XO, 014H
MOV YO, 08H
MOV TEMP, 10
MOV CX, TEMP
L0:	
MOV TEMP, CX
	MOV CX, 10
		L1:
			MOV  DL, XO   ;COLUMN
			MOV  DH, YO   ;ROW
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 02H  ;SETCURSORPOSITION
			INT  10H	
			MOV  AL, MYARRAY[SI]
			ADD AL, 48
			MOV  BL, MYARRAY[SI]
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 0EH  ;TELETYPE
			INT  10H
			INC SI
			ADD XO, 04H
		LOOP L1
		MOV XO, 014H
		ADD YO, 2
	MOV CX, TEMP
	LOOP L0
RET
DISPLAY_ARRAY ENDP

RANDOM PROC
MOV TEMP, 0
MOV SI, 0
L1:
	MOV AH, 2CH
	INT 21H
	MOV AX, RAND
	MOV BX, 341
	MUL BX
	MOV DX, 0
	MOV BX, 2145
	DIV BX
	MOV RAND, DX
	MOV AH, 0
	DIV RANGE
	INC AH
	MOV MYARRAY[SI], AH
	INC SI
	INC TEMP
	CMP TEMP, 100
	JE L2
	JMP L1
L2:
RET
RANDOM ENDP

horizontal_crushing proc
mov var14,0
mov var15,0
mov index,0
horizontal_outer_iteration:
mov si,index
mov var14,0
lcc:
mov al,myarray[si]
inc si
mov bl,myarray[si]
cmp al,bl
je horizontal_check_third
jmp horizontal_next_step

horizontal_check_third:
inc si
mov cl,myarray[si]
cmp myarray[si],'/'
je horizontal_next_step
cmp bl,cl
je horizontal_crush_them
dec si
jmp horizontal_next_step

horizontal_crush_them:
check_horizontal_fourth:
inc si
mov ch,myarray[si]
cmp ch,40
je crush_horizontal_blocker
cmp ch,cl
je crush_horizontal_four
dec si
jmp crush_horizontal_three
crush_horizontal_four:
mov myarray[si],18
dec si
jmp crush_horizontal_three

crush_horizontal_blocker:
mov myarray[si],'/'
dec si

crush_horizontal_three:
mov myarray[si],'/'
dec si
mov myarray[si],'/'
dec si
mov myarray[si],'/'
inc si
inc si
ADD SCORE,6

horizontal_next_step:
inc var14
cmp var14,8
je ldd
jmp lcc

ldd:
mov var14,0
add index,10
inc var15
cmp var15,11
je lee
jmp horizontal_outer_iteration
lee:
ret
horizontal_crushing endp

vertical_crushing proc
mov ax,0
mov bx,0
mov cx,0
mov dx,0

vertical_outer_iteration:
mov si,index1
mov var11,0
lff:
mov al,myarray[si]
add index1,10
mov si,index1
mov bl,myarray[si]
cmp al,bl
je vertical_check_third
jmp vertical_next_step

vertical_check_third:
add index1,10
mov si,index1
mov cl,myarray[si]
cmp myarray[si],'/'
je vertical_next_step
cmp bl,cl
je vertical_crush_them
sub index1,10
mov si,index1
jmp vertical_next_step

vertical_crush_them:
check_vertical_fourth:
add index1,10
mov si,index1
mov ch,myarray[si]
cmp ch,40
je crush_vertical_blocker
cmp ch,cl
je crush_vertical_four
sub index1,10
mov si,index1
jmp crush_vertical_three

crush_vertical_four:
mov myarray[si],18
sub index1,10
mov si,index1
jmp crush_vertical_three

crush_vertical_blocker:
mov myarray[si],'/'
sub index1,10
mov si,index1

crush_vertical_three:
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
add index1,20
mov si,index1
ADD SCORE,6
vertical_next_step:
inc var11
cmp var11,8
je lgg
jmp lff

lgg:
mov var11,0
mov index1,0
inc var12
mov ax,index1
add al,var12
mov index1,ax

cmp var12,10
je lhh
jmp vertical_outer_iteration

lhh:
ret
vertical_crushing endp

DROP PROC
start_dropping:
mov index2,0
mov si,index2
mov var18,0
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov var10,0
mov var11,0
mov var12,0
mov var14,0
mov var15,0
mov var16,0
mov var17,0
mov var18,0
mov index,0
mov index1,0
mov index2,0
mov var19,0
mov si,0

dropping_first:
add index2,10
mov si,index2

cmp myarray[si],'/'
je swap_them
sub index2,10
jmp next_step

swap_them:

sub index2,10
mov si,index2
mov al,myarray[si]

add index2,10
mov si,index2
mov myarray[si],al

sub index2,10
mov si,index2
mov myarray[si],'/'

next_step:
inc index2
inc var18
cmp var18,90
je repeat_dropping
jmp dropping_first

repeat_dropping:
inc var20
cmp var20,10
je end_dropping
jmp start_dropping
end_dropping:
ret
DROP ENDP

filltoprow proc
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov var10,0
mov var11,0
mov var12,0
mov var14,0
mov var15,0
mov var16,0
mov var17,0
mov var18,0
mov index1,0
mov index,0
mov index2,0
mov var19,0
mov si,0

filltoprow_first:

cmp myarray[si],'/'
je create_new
jmp gotonext

create_new:
	MOV AH, 2CH
	INT 21H
	MOV AX, RAND
	MOV BX, 341
	MUL BX
	MOV DX, 0
	MOV BX, 2145
	DIV BX
	MOV RAND, DX
	MOV AH, 0
	DIV RANGE
	INC AH
	MOV MYARRAY[SI], AH
gotonext:
inc si
inc var19
cmp var19,10
je endfilltop
jmp filltoprow_first
endfilltop:
ret
filltoprow endp

SWAP PROC
MOV AX , 10
MUL Y1
ADD AX, X1
MOV SI, AX
; ---
MOV AX , 10
MUL Y2
ADD AX, X2
MOV DI, AX
; COMPARING ADJACENCY
MOV AX, SI
SUB AX, DI
CMP AX, 1
JE S
MOV AX, SI
SUB AX, DI
ADD AX, 2
CMP AX, 1
JE S
MOV AX, SI
SUB AX, DI
CMP AX, 10
JE S
MOV AX, SI
SUB AX, DI
ADD AX, 20
CMP AX, 10
JE S
JMP R 
S:; IF ADJACENT THEN

MOV AH, MYARRAY[SI]
CMP AH,40
JE R
MOV BH, MYARRAY[DI]
CMP BH,40
JE R
MOV MYARRAY[SI], BH
MOV MYARRAY[DI], AH

;in case of bomb
cmp ah,18
je bomb_crush_case1
cmp bh,18
je bomb_crush_case2
jmp R 

bomb_crush_case1:
cmp ah,bh
je crush_all
mov var22,0
mov si,0
bomb_crush_loop:
cmp myarray[si],bh
je crush_it
jmp go_next

crush_it:
mov myarray[si],'/'

go_next:
inc si
inc var22
cmp var22,100
je R
jmp bomb_crush_loop


bomb_crush_case2:
cmp ah,bh
je crush_all
mov var23,0
mov si,0
bomb_crush_loop1:
cmp myarray[si],ah
je crush_it1
jmp go_next1

crush_it1:
mov myarray[si],'/'

go_next1:
inc si
inc var23
cmp var23,100
je R
jmp bomb_crush_loop1


crush_all:
mov var24,0
mov si,0
crush_all_loop:
mov myarray[si],'/'
inc si
inc var24
cmp var24,100
je R
jmp crush_all_loop


R:; ELSE
RET
SWAP ENDP

MOUSE_CLICK PROC
MOV AX, 1
INT 33H
CLICK1:

MOV BX, 0
MOV AX, 3
INT 33H
CMP BX,1
JB CLICK1

MOV VAR1, 32
MOV AX, CX
CMP CX, 146
JB E
CMP CX, 468
JA E
SUB AX,146
DIV VAR1
MOV BL, AL
MOV X1, BX
; ---
MOV VAR1, 32
MOV AX, DX
CMP DX, 112
JB E
CMP DX, 434
JA E
SUB AX,112
DIV VAR1
MOV BL, AL
MOV Y1, BX
; ---
CLICK2:

MOV BX, 0
MOV AX, 3
INT 33H
CMP BX,2
JB CLICK2

MOV VAR1, 32
MOV AX, CX
CMP CX, 146
JB E
CMP CX, 468
JA E
SUB AX,146
DIV VAR1
MOV BL, AL
MOV X2, BX
; ---
MOV VAR1, 32
MOV AX, DX
CMP DX, 112
JB E
CMP DX, 434
JA E
SUB AX,112
DIV VAR1
MOV BL, AL
MOV Y2, BX
; ---
CALL SWAP
E:
RET
MOUSE_CLICK ENDP

POS PROC
MOV AH, 02
MOV DH, 24
MOV DL, 0
INT 10H
RET 
POS ENDP

GRID PROC
; VERTICAL LLINES
MOV X, 146
MOV Y, 112
MOV T1, 322
MOV T2, 12
L2:
	L1:
		MOV AH, 0CH
		MOV AL, 15
		MOV CX, X
		MOV DX, Y
		INT 10H
	INC Y
	DEC T1
	MOV CX, T1
	LOOP L1
ADD X, 32
MOV Y, 112
MOV T1, 322
DEC T2
MOV CX, T2
LOOP L2
;_
; HORIZONTAL LLINES
MOV X, 146
MOV Y, 112
MOV T1, 322
MOV T2, 12
L4:
	L3:
		MOV AH, 0CH
		MOV AL, 15
		MOV CX, X
		MOV DX, Y
		INT 10H
	INC X
	DEC T1
	MOV CX, T1
	LOOP L3
ADD Y, 32
MOV X, 146
MOV T1, 322
DEC T2
MOV CX, T2
LOOP L4

RET
GRID ENDP

CLEAR PROC
MOV AX, 0
MOV BX, 0
MOV CX, 0
MOV DX, 0
MOV SI, 0
RET
CLEAR ENDP

display_start1 proc
mov ah,02h
mov bh,0
mov dh,0
mov dl,0
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,2
mov dh,8
mov dl,3
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,4
mov dh,1
mov dl,5
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,5
mov dh,2
mov dl,6
mov bh,4
int 10h

mov ah,06
mov al,0
mov ch,3
mov cl,6
mov dh,3
mov dl,7
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,7
mov dh,4
mov dl,8
mov bh,1
int 10h

mov ah,06
mov al,0
mov ch,5
mov cl,8
mov dh,5
mov dl,9
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,6
mov cl,9
mov dh,6
mov dl,10
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,7
mov cl,10
mov dh,7
mov dl,11
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,8
mov cl,11
mov dh,8
mov dl,12
mov bh,1
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,12
mov dh,8
mov dl,13
mov bh,2
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,15
mov dh,8
mov dl,16
mov bh,8
int 10h

mov ah,06
mov al,0
mov ch,8
mov cl,17
mov dh,8
mov dl,23
mov bh,6
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,24
mov dh,8
mov dl,25
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,27
mov dh,8
mov dl,28
mov bh,3
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,29
mov dh,1
mov dl,30
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,30
mov dh,2
mov dl,31
mov bh,8
int 10h

mov ah,06
mov al,0
mov ch,3
mov cl,31
mov dh,3
mov dl,32
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,32
mov dh,4
mov dl,33
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,3
mov cl,33
mov dh,3
mov dl,34
mov bh,7
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,34
mov dh,2
mov dl,35
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,35
mov dh,1
mov dl,36
mov bh,5
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,37
mov dh,8
mov dl,38
mov bh,6
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,40
mov dh,8
mov dl,41
mov bh,5
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,42
mov dh,1
mov dl,48
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,49
mov dh,8
mov dl,50
mov bh,3
int 10h

mov ah,06
mov al,0
mov ch,8
mov cl,42
mov dh,8
mov dl,48
mov bh,8
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,42
mov dh,4
mov dl,48
mov bh,1
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,52
mov dh,8
mov dl,53
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,54
mov dh,1
mov dl,60
mov bh,8
int 10h

mov ah,6
mov al,0
mov ch,4
mov cl,54
mov dh,4
mov dl,60
mov bh,5
int 10h

mov ah,6
mov al,0
mov ch,8
mov cl,54
mov dh,8
mov dl,60
mov bh,1
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,62
mov dh,8
mov dl,63
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,64
mov dh,1
mov dl,70
mov bh,1
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,71
mov dh,4
mov dl,72
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,4
mov cl,64
mov dh,4
mov dl,70
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,5
mov cl,64
mov dh,5
mov dl,65
mov bh,8
int 10h

mov ah,6
mov al,0
mov ch,6
mov cl,65
mov dh,6
mov dl,66
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,7
mov cl,67
mov dh,7
mov dl,68
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,8
mov cl,69
mov dh,8
mov dl,70
mov bh,1
int 10h
;*************************************************************************

mov ah,6
mov al,0
mov ch,20
mov cl,10
mov dh,28
mov dl,11
mov bh,6
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,12
mov dh,20
mov dl,19
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,28
mov cl,12
mov dh,28
mov dl,19
mov bh,6
int 10h

mov ah,06
mov al,0
mov ch,20
mov cl,21
mov dh,28
mov dl,22
mov bh,6
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,23
mov dh,20
mov dl,30
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,30
mov dh,24
mov dl,31
mov bh,9
int 10h

mov ah,6
mov al,0
mov ch,24
mov cl,23
mov dh,24
mov dl,29
mov bh,1
int 10h

mov ah,6
mov al,0
mov ch,25
mov cl,23
mov dh,25
mov dl,24
mov bh,1
int 10h

mov ah,6
mov al,0
mov ch,26
mov cl,24
mov dh,26
mov dl,25
mov bh,7
int 10h

mov ah,6
mov al,0
mov ch,27
mov cl,26
mov dh,27
mov dl,27
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,28
mov cl,28
mov dh,28
mov dl,29
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,33
mov dh,28
mov dl,34
mov bh,6
int 10h

mov ah,6
mov al,0
mov ch,28
mov cl,35
mov dh,28
mov dl,42
mov bh,6
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,43
mov dh,28
mov dl,44
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,46
mov dh,24
mov dl,47
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,24
mov cl,48
mov dh,24
mov dl,54
mov bh,7
int 10h

mov ah,6
mov al,0
mov ch,24
mov cl,55
mov dh,28
mov dl,56
mov bh,8
int 10h

mov ah,6
mov al,0
mov ch,28
mov cl,46
mov dh,28
mov dl,56
mov bh,5
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,48
mov dh,20
mov dl,56
mov bh,1
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,58
mov dh,28
mov dl,59
mov bh,7
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,69
mov dh,28
mov dl,70
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,24
mov cl,60
mov dh,24
mov dl,68
mov bh,9
int 10h
;************************************************************************
;**************************BOXES****************************************
;**************************BOX1**********************************************
mov ah,6
mov al,0
mov ch,10
mov cl,4
mov dh,18
mov dl,16
mov bh,2
int 10h
;*************************NUMBER7*********************************************
mov ah,6
mov al,0
mov ch,11
mov cl,6
mov dh,11
mov dl,14
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,14
mov dh,17
mov dl,15
mov bh,0
int 10h
;******************************BOX2*****************************************
mov ah,6
mov al,0
mov ch,10
mov cl,18
mov dh,18
mov dl,30
mov bh,3
int 10h
;*********************NUMBER1******************************************
mov ah,6
mov al,0
mov ch,11
mov cl,23
mov dh,17
mov dl,24
mov bh,0
int 10h
;********************************BOX3**********************************
mov ah,6
mov al,0
mov ch,10
mov cl,32
mov dh,18
mov dl,44
mov bh,9
int 10h
;*************************NUMBER4********************************
mov ah,6
mov al,0
mov ch,11
mov cl,42
mov dh,17
mov dl,43
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,34
mov dh,14
mov dl,43
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,33
mov dh,14
mov dl,34
mov bh,0
int 10h

;********************************BOX4************************************
mov ah,6
mov al,0
mov ch,10
mov cl,46
mov ch,10
mov dh,18
mov dl,58
mov bh,8
int 10h
;******************************NUMBER9**********************************
mov ah,6
mov al,0
mov ch,11
mov cl,56
mov dh,17
mov dl,57
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,49
mov dh,11
mov dl,56
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,47
mov dh,14
mov dl,48
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,49
mov dh,14
mov dl,55
mov bh,0
int 10h
;********************************BOX5************************************
mov ah,6
mov al,0
mov ch,10
mov cl,60
mov dh,18
mov dl,72
mov bh,4
int 10h
;***********************************NUMBER3*****************************
mov ah,06
mov al,0
mov ch,11
mov cl,61
mov dh,11
mov dl,69
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,70
mov dh,17
mov dl,71
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,17
mov cl,61
mov dh,17
mov dl,70
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,61
mov dh,14
mov dl,70
mov bh,0
int 10h

;*************************************************************************
mov ah,02h
mov bh,0
mov dh,29     ;cursor position ;dh max=28
mov dl,30
int 10h

mov dx,offset msg5
mov ah,09
int 21h

ret
display_start1 endp

display_start2 proc
mov ah,02h
mov bh,0
mov dh,0
mov dl,0
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,2
mov dh,8
mov dl,3
mov bh,2
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,4
mov dh,1
mov dl,5
mov bh,6
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,5
mov dh,2
mov dl,6
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,3
mov cl,6
mov dh,3
mov dl,7
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,7
mov dh,4
mov dl,8
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,5
mov cl,8
mov dh,5
mov dl,9
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,6
mov cl,9
mov dh,6
mov dl,10
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,7
mov cl,10
mov dh,7
mov dl,11
mov bh,7
int 10h

mov ah,06
mov al,0
mov ch,8
mov cl,11
mov dh,8
mov dl,12
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,12
mov dh,8
mov dl,13
mov bh,2
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,15
mov dh,8
mov dl,16
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,8
mov cl,17
mov dh,8
mov dl,23
mov bh,1
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,24
mov dh,8
mov dl,25
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,27
mov dh,8
mov dl,28
mov bh,8
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,29
mov dh,1
mov dl,30
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,30
mov dh,2
mov dl,31
mov bh,1
int 10h

mov ah,06
mov al,0
mov ch,3
mov cl,31
mov dh,3
mov dl,32
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,32
mov dh,4
mov dl,33
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,3
mov cl,33
mov dh,3
mov dl,34
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,34
mov dh,2
mov dl,35
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,35
mov dh,1
mov dl,36
mov bh,2
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,37
mov dh,8
mov dl,38
mov bh,6
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,40
mov dh,8
mov dl,41
mov bh,5
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,42
mov dh,1
mov dl,48
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,49
mov dh,8
mov dl,50
mov bh,7
int 10h

mov ah,06
mov al,0
mov ch,8
mov cl,42
mov dh,8
mov dl,48
mov bh,3
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,42
mov dh,4
mov dl,48
mov bh,2
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,52
mov dh,8
mov dl,53
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,54
mov dh,1
mov dl,60
mov bh,8
int 10h

mov ah,6
mov al,0
mov ch,4
mov cl,54
mov dh,4
mov dl,60
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,8
mov cl,54
mov dh,8
mov dl,60
mov bh,1
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,62
mov dh,8
mov dl,63
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,64
mov dh,1
mov dl,70
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,71
mov dh,4
mov dl,72
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,4
mov cl,64
mov dh,4
mov dl,70
mov bh,5
int 10h

mov ah,6
mov al,0
mov ch,5
mov cl,64
mov dh,5
mov dl,65
mov bh,8
int 10h

mov ah,6
mov al,0
mov ch,6
mov cl,65
mov dh,6
mov dl,66
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,7
mov cl,67
mov dh,7
mov dl,68
mov bh,6
int 10h

mov ah,6
mov al,0
mov ch,8
mov cl,69
mov dh,8
mov dl,70
mov bh,1
int 10h
;*************************************************************************

mov ah,6
mov al,0
mov ch,20
mov cl,10
mov dh,28
mov dl,11
mov bh,6
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,12
mov dh,20
mov dl,19
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,28
mov cl,12
mov dh,28
mov dl,19
mov bh,7
int 10h

mov ah,06
mov al,0
mov ch,20
mov cl,21
mov dh,28
mov dl,22
mov bh,6
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,23
mov dh,20
mov dl,30
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,30
mov dh,24
mov dl,31
mov bh,9
int 10h

mov ah,6
mov al,0
mov ch,24
mov cl,23
mov dh,24
mov dl,29
mov bh,1
int 10h

mov ah,6
mov al,0
mov ch,25
mov cl,23
mov dh,25
mov dl,24
mov bh,8
int 10h

mov ah,6
mov al,0
mov ch,26
mov cl,24
mov dh,26
mov dl,25
mov bh,7
int 10h

mov ah,6
mov al,0
mov ch,27
mov cl,26
mov dh,27
mov dl,27
mov bh,9
int 10h

mov ah,6
mov al,0
mov ch,28
mov cl,28
mov dh,28
mov dl,29
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,33
mov dh,28
mov dl,34
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,28
mov cl,35
mov dh,28
mov dl,42
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,43
mov dh,28
mov dl,44
mov bh,7
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,46
mov dh,24
mov dl,47
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,24
mov cl,48
mov dh,24
mov dl,54
mov bh,8
int 10h

mov ah,6
mov al,0
mov ch,24
mov cl,55
mov dh,28
mov dl,56
mov bh,1
int 10h

mov ah,6
mov al,0
mov ch,28
mov cl,46
mov dh,28
mov dl,56
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,48
mov dh,20
mov dl,56
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,58
mov dh,28
mov dl,59
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,20
mov cl,69
mov dh,28
mov dl,70
mov bh,8
int 10h

mov ah,6
mov al,0
mov ch,24
mov cl,60
mov dh,24
mov dl,68
mov bh,1
int 10h
;************************************************************************
;**************************BOXES****************************************
;**************************BOX1**********************************************
mov ah,6
mov al,0
mov ch,10
mov cl,4
mov dh,18
mov dl,16
mov bh,4
int 10h
;******************************BOX2*****************************************
mov ah,6
mov al,0
mov ch,10
mov cl,18
mov dh,18
mov dl,30
mov bh,6
int 10h
;********************************BOX3**********************************
mov ah,6
mov al,0
mov ch,10
mov cl,32
mov dh,18
mov dl,44
mov bh,5
int 10h
;********************************BOX4************************************
mov ah,6
mov al,0
mov ch,10
mov cl,46
mov ch,10
mov dh,18
mov dl,58
mov bh,9
int 10h
;********************************BOX5************************************
mov ah,6
mov al,0
mov ch,10
mov cl,60
mov dh,18
mov dl,72
mov bh,1
int 10h
;*************************NUMBER7*********************************************
mov ah,6
mov al,0
mov ch,11
mov cl,34
mov dh,11
mov dl,41
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,42
mov dh,17
mov dl,43
mov bh,0
int 10h
;*********************NUMBER1******************************************
mov ah,6
mov al,0
mov ch,11
mov cl,9
mov dh,17
mov dl,10
mov bh,0
int 10h
;*************************NUMBER4********************************
mov ah,6
mov al,0
mov ch,11
mov cl,28
mov dh,17
mov dl,29
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,20
mov dh,14
mov dl,27
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,19
mov dh,14
mov dl,20
mov bh,0
int 10h


;******************************NUMBER9**********************************
mov ah,6
mov al,0
mov ch,11
mov cl,70
mov dh,17
mov dl,71
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,62
mov dh,11
mov dl,69
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,61
mov dh,14
mov dl,62
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,62
mov dh,14
mov dl,69
mov bh,0
int 10h
;***********************************NUMBER3*****************************
mov ah,06
mov al,0
mov ch,11
mov cl,47
mov dh,11
mov dl,56
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,11
mov cl,56
mov dh,17
mov dl,57
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,17
mov cl,47
mov dh,17
mov dl,57
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,47
mov dh,14
mov dl,57
mov bh,0
int 10h

;*************************************************************************
mov ah,02h
mov bh,0
mov dh,29     ;cursor position ;dh max=28
mov dl,30
int 10h

mov dx,offset msg5
mov ah,09
int 21h

ret
display_start2 endp

get_name_function proc

mov ah,02h
mov dh,20
mov dl,15
int 10h

lc:
mov ah,6
mov al,0
mov ch,var10
mov cl,var11
mov dh,var12
mov dl,var13
mov bh,count
int 10h
add var11,10
add var13,10
inc count
cmp count,9
je ld
jmp lc

ld:
mov var10,6
mov var11,0
mov var12,10
mov var13,9
mov count,1
lg:
mov ah,6
mov al,0
mov ch,var10	 ;5
mov cl,var11	 ;0
mov dh,var12	 ;10
mov dl,var13	 ;10
mov bh,count
int 10h
inc count
add var10,5
add var12,5
cmp count,6
je lf
jmp lg

lf:
mov var10,6
mov var11,70
mov var12,10
mov var13,79
mov count,4

lh:
mov ah,6
mov al,0
mov ch,var10
mov cl,var11
mov dh,var12
mov dl,var13
mov bh,count
int 10h
inc count
add var10,5
add var12,5
cmp count,9
je li
jmp lh

li:
mov var10,34
mov var11,10
mov var12,39
mov var13,19
mov count,2

lk:
mov ah,6
mov al,0
mov ch,var10
mov cl,var11
mov dh,var12
mov dl,var13
mov bh,count
int 10h
inc count
add var11,10
add var13,10
cmp count,8
je lm
jmp lk

lm:

mov ah,6
mov al,0
mov ch,8
mov cl,34
mov dh,9
mov dl,35
mov bh,9
int 10h

mov ah,6
mov al,0
mov ch,8
mov cl,42
mov dh,9
mov dl,43
mov bh,9
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,28
mov dh,14
mov dl,49
mov bh,9
int 10h

mov ah,6
mov al,0
mov ch,12
mov cl,28
mov dh,13
mov dl,29
mov bh,9
int 10h

mov ah,6
mov al,0
mov ch,12
mov cl,48
mov dh,13
mov dl,49
mov bh,9
int 10h

mov dx,offset msg6
mov ah,09h
int 21h

mov si,offset username
lq:
mov ah,01
int 21h
cmp al,13
je lr
mov [si],al
inc si
call sound
jmp lq
lr:
mov count,0
ret
get_name_function endp

sound proc
MOV	DX,10000	; Number of times to repeat whole routine.

MOV	BX,1		; Frequency value.

MOV	AL, 10110110B	; The Magic Number (use this binary number only)
OUT     43H, AL          ; Send it to the initializing port 43H Timer 2.

NEXT_FREQUENCY:          ; This is were we will jump back to 2000 times.

MOV     AX, BX           ; Move our Frequency value into AX.

OUT     42H, AL          ; Send LSB to port 42H.
MOV     AL, AH           ; Move MSB into AL  
OUT     42H, AL          ; Send MSB to port 42H.

IN      AL, 61H          ; Get current value of port 61H.
OR      AL, 00000011B    ; OR AL to this value, forcing first two bits high.
OUT     61H, AL          ; Copy it to port 61H of the PPI Chip
                         ; to turn ON the speaker.

MOV     CX, 100          ; Repeat loop 100 times
DELAY_LOOP:              ; Here is where we loop back too.
LOOP    DELAY_LOOP       ; Jump repeatedly to DELAY_LOOP until CX = 0


INC     BX               ; Incrementing the value of BX lowers 
                         ; the frequency each time we repeat the
                         ; whole routine

DEC     DX               ; Decrement repeat routine count

CMP     DX, 0            ; Is DX (repeat count) = to 0
JNZ     NEXT_FREQUENCY   ; If not jump to NEXT_FREQUENCY
                         ; and do whole routine again.

                         ; Else DX = 0 time to turn speaker OFF

IN      AL,61H           ; Get current value of port 61H.
AND	AL,11111100B	; AND AL to this value, forcing first two bits low.
OUT     61H,AL           ; Copy it to port 61H of the PPI Chip
                         ; to turn OFF the speaker.
ret 
sound endp
;_
; PRINTING TWO DIGIT VALUE
PRI PROC		
PRINT:
	MOV DL,32   ;SPACE
	MOV AH,02H
	INT 21H
	MOV AX,0
	MOV AX,MOVESPRINT;SAVES ELEMENT IN REGISTER
	MOV DIGITCOUNT,0  ;COUNTS NO OF DIGITS IN AN ELEMENT
	
PUSH_IN:
	MOV DX,0
	MOV BX,10 
	DIV BX  ;  AX % 10
	PUSH DX   ;PUSHES DIGIT IN A STACK
	INC DIGITCOUNT  ;COUNTS NO OF DIGITS IN A NUMBER
	CMP AX,0
	JNE PUSH_IN
			
POP_UP:
	CMP DIGITCOUNT,0  ;STOPS WHEN EQUAL TO NO OF DIGITS
	JE EXT
	DEC DIGITCOUNT
	POP DX    ;POP FROM STACK ONE BY ONE
	ADD DX,48
	MOV AH,02H
	INT 21H
	JMP POP_UP
		
EXT:
RET
PRI ENDP
;_
PRI1 PROC		
PRINT:
	MOV DL,32   ;SPACE
	MOV AH,02H
	INT 21H
	MOV AX,0
	MOV AX,SCOREPRINT;SAVES ELEMENT IN REGISTER
	MOV DIGITCOUNT1,0  ;COUNTS NO OF DIGITS IN AN ELEMENT
	
PUSH_IN:
	MOV DX,0
	MOV BX,10 
	DIV BX  ;  AX % 10
	PUSH DX   ;PUSHES DIGIT IN A STACK
	INC DIGITCOUNT1  ;COUNTS NO OF DIGITS IN A NUMBER
	CMP AX,0
	JNE PUSH_IN
			
POP_UP:
	CMP DIGITCOUNT1,0  ;STOPS WHEN EQUAL TO NO OF DIGITS
	JE EXT
	DEC DIGITCOUNT1
	POP DX    ;POP FROM STACK ONE BY ONE
	ADD DX,48
	MOV AH,02H
	INT 21H
	JMP POP_UP
		
EXT:
RET
PRI1 ENDP
;_
SHOW_SCREEN1 PROC
CALL new_window         ;correct
CALL CLEAR
CALL DECORATION
CALL welcome_messages	;correct
CALL CLEAR
CALL GRID				;write this now
CALL CLEAR
CALL DISPLAY_ARRAY
ret 
SHOW_SCREEN1 ENDP

DECORATION PROC

mov ah,06
mov al,0
mov ch,7
mov cl,18
mov dh,26
mov dl,58
mov bh,0
int 10h

mov ah,06
mov al,0
mov ch,7
mov cl,0
mov dh,26
mov dl,17
mov bh,2
int 10h

mov ah,06
mov al,0
mov ch,5
mov cl,0
mov dh,6
mov dl,79
mov bh,4
int 10h

mov ah,06
mov al,0
mov ch,7
mov cl,59
mov dh,26
mov dl,79
mov bh,2
int 10h

mov ah,06
mov al,0
mov ch,27
mov cl,0
mov dh,29
mov dl,79
mov bh,4
int 10h

call CLEAR

mov ah,02h
mov dh,6
mov dl,16
int 10h


mov dx,offset msg7
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

mov ah,02h
mov dh,28
mov dl,16
int 10h

mov dx,offset msg8
mov ah,09
int 21h

CALL CLEAR

RET
DECORATION ENDP

SHOW_SCREEN2 PROC
CALL new_window         ;correct
CALL CLEAR
CALL welcome_messages2	;correct
CALL CLEAR
CALL DISPLAY_ARRAY
CALL DECORATION2
ret 
SHOW_SCREEN2 ENDP

SHOW_SCREEN3 PROC
CALL new_window         ;correct
CALL CLEAR
CALL welcome_messages3	;correct
CALL CLEAR
CALL DECORATION3
CALL CLEAR
CALL GRID
CALL DISPLAY_ARRAY

ret 
SHOW_SCREEN3 ENDP

DECORATION2 PROC
mov ah,6
mov al,0
mov ch,7
mov cl,43       ;top right
mov dh,12
mov dl,58
mov bh,9
int 10h

mov ah,6
mov al,0
mov ch,22
mov cl,15
mov dh,27		;bottom left 
mov dl,29
mov bh,14
int 10h

mov ah,6
mov al,0
mov ch,7
mov cl,15          ;top left
mov dh,12
mov dl,29
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,22
mov cl,43     				;bottom right
mov dh,27
mov dl,58
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,16
mov cl,31					;centre
mov dh,18
mov dl,41
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,13
mov cl,55
mov dh,20
mov dl,58    				;line
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,5
mov cl,63
mov dh,5
mov dl,77    				
mov bh,5
int 10h

mov ah,6
mov al,0
mov ch,29
mov cl,63
mov dh,29
mov dl,77    				
mov bh,5
int 10h

mov ah,6
mov al,0
mov ch,7
mov cl,63
mov dh,12
mov dl,77    				
mov bh,15
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,63
mov dh,20
mov dl,77    				
mov bh,14
int 10h

mov ah,6
mov al,0
mov ch,22
mov cl,63
mov dh,27
mov dl,77    				
mov bh,13
int 10h

mov ah,6
mov al,0
mov ch,5
mov cl,1
mov dh,5
mov dl,10    				
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,29
mov cl,1
mov dh,29
mov dl,10    				
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,7
mov cl,1
mov dh,27
mov dl,10    				
mov bh,15
int 10h
;***************************************************border lines*******************************************************
mov ah,6
mov al,0
mov ch,6
mov cl,12
mov dh,28
mov dl,13   				;line
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,5
mov cl,12
mov dh,5
mov dl,61   				;line
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,6
mov cl,60
mov dh,28
mov dl,61   				;line
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,29
mov cl,12
mov dh,29
mov dl,61   				;line
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,7
mov dh,14
mov dl,8   				
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,14
mov cl,3
mov dh,14
mov dl,4   				
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,19
mov cl,2
mov dh,19
mov dl,8   				
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,18
mov cl,2
mov dh,19
mov dl,3   				
mov bh,0
int 10h

mov ah,6
mov al,0
mov ch,18
mov cl,8
mov dh,19
mov dl,9   				
mov bh,0
int 10h

CALL CLEAR
mov ah,02h
mov dh,8
mov dl,20
int 10h

mov dx,offset msg10
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,9
mov dl,20
int 10h

mov dx,offset msg11
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,11
mov dl,20
int 10h

mov dx,offset msg12
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,8
mov dl,49
int 10h

mov dx,offset msg13
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,9
mov dl,49
int 10h

mov dx,offset msg14
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,11
mov dl,49
int 10h

mov dx,offset msg15
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,25
mov dl,18
int 10h

mov dx,offset msg16
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,24
mov dl,49
int 10h


mov dx,offset msg17
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,25
mov dl,49
int 10h

mov dx,offset msg18
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,9
mov dl,66
int 10h

mov dx,offset msg19
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,10
mov dl,68
int 10h

mov dx,offset msg20
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,16
mov dl,66
int 10h

mov dx,offset msg21
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,17
mov dl,68
int 10h

mov dx,offset msg22
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,23
mov dl,65
int 10h

mov dx,offset msg23
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,24
mov dl,68
int 10h

mov dx,offset msg24
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

CALL CLEAR
mov ah,02h
mov dh,25
mov dl,67
int 10h

mov dx,offset msg25
mov bl,2
mov ah,09
mov al,0
int 10h
int 21h

RET
DECORATION2 ENDP

welcome_messages2 proc

mov ah,02h
mov dh,0
mov dl,0
int 10h

mov ah,09
mov dx,offset msg3
int 21h

mov ah,09
mov dx,offset username
int 21h

mov ah,02h
mov dh,2
mov dl,0
int 10h

mov ah,09
mov dx,offset msg4
int 21h

MOV AX, MOVES
MOV MOVESPRINT, AX
CALL PRI


mov ah,02h
mov dh,0
mov dl,30
int 10h
mov dx,offset msg9
mov ah,09
int 21h


mov ah,02h
mov dh,0
mov dl,60
int 10h
mov dx,offset msg2
mov ah,09
int 21h

MOV AX, 0
mov ax, SCORE
mov SCOREPRINT,AX
call PRI1

mov ah,6
mov al,0
mov ch,1
mov cl,0
mov dh,1
mov dl,15
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,27
mov dh,1
mov dl,38
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,58
mov dh,1
mov dl,73
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,3
mov cl,0
mov dh,3
mov dl,20
mov bh,9
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,02h
mov dh,28
mov dl,28
int 10h
ret
welcome_messages2 endp
horizontal_crushing2 proc
MOV var24,0
MOV index3,3

loopfor:
CALL CLEAR
mov si,index3
mov ah,myarray[si]
inc si
mov al,myarray[si]
cmp al,ah
je checkforthird
jmp gonextline
checkforthird:
inc si
mov bl,myarray[si]
cmp al,bl
je crushthem
jmp gonextline
crushthem:
mov myarray[si],'/'
dec si
mov myarray[si],'/'
dec si
mov myarray[si],'/'

gonextline:
add index3,10
inc var24
cmp var24,3
je line4
jmp loopfor

line4:
inc var25
cmp var25,2
je endthis
jmp loopfor
mov index3,73

endthis:
mov var25,0
mov index3,30
horizontal_outer_iterationinline4and7:
mov si,index3
mov var24,0
lccinline4and7:
mov al,myarray[si]
inc si
mov bl,myarray[si]
cmp al,bl
je checkforthirdinline4andline7
jmp horizontal_next_go

checkforthirdinline4andline7:
inc si
mov cl,myarray[si]
cmp bl,cl
je horizontal_crush_theminline4andline7
dec si
jmp horizontal_next_go

horizontal_crush_theminline4andline7:

check_horizontal_fourthinline4and7:
inc si
mov ch,myarray[si]
cmp ch,cl
je crush_horizontal_fourinline4and7
dec si
jmp crush_horizontal_threeinline4and7
crush_horizontal_fourinline4and7:
mov myarray[si],18
dec si
crush_horizontal_threeinline4and7:
mov myarray[si],'/'
dec si
mov myarray[si],'/'
dec si
mov myarray[si],'/'
inc si
inc si
ADD SCORE,1

horizontal_next_go:
inc var24
cmp var24,6
je lddinline4and7
jmp lccinline4and7

lddinline4and7:
MOV index3,60
mov var24,0
inc var25
cmp var25,2
je hardcode
jmp horizontal_outer_iterationinline4and7



hardcode:
CALL CLEAR
mov ah,myarray[40]
mov al,myarray[41]
cmp ah,al
je check42
jmp goto46 
check42:
mov bl,myarray[42]
je crush40till42
jmp goto46
crush40till42:
mov myarray[40],'/'
mov myarray[41],'/'
mov myarray[42],'/'

goto46:
mov ah,myarray[46]
mov al,myarray[47]
cmp ah,al
je check48
jmp goto50
check48:
mov bl,myarray[48]
je crush46till48
jmp goto50
crush46till48:
mov myarray[46],'/'
mov myarray[47],'/'
mov myarray[48],'/'

goto50:
mov ah,myarray[50]
mov al,myarray[51]
cmp ah,al
je check52
jmp goto56
check52:
mov bl,myarray[52]
je crush50till52
jmp goto56
crush50till52:
mov myarray[50],'/'
mov myarray[51],'/'
mov myarray[52],'/'

goto56:
mov ah,myarray[56]
mov al,myarray[57]
cmp ah,al
je check58
jmp endthishorizontal2
check58:
mov bl,myarray[58]
je crush56till58
jmp endthishorizontal2
crush56till58:
mov myarray[56],'/'
mov myarray[57],'/'
mov myarray[58],'/'

endthishorizontal2:
ret
horizontal_crushing2 endp

vertical_crushing2 proc
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov index1,30
mov var12,0
mov var11,0

vertical_outer_iteration2:
mov si,index1
mov var11,0
lff2:
mov al,myarray[si]
add index1,10
mov si,index1
mov bl,myarray[si]
cmp al,bl
je vertical_check_third2
jmp vertical_next_step2

vertical_check_third2:
add index1,10
mov si,index1
mov cl,myarray[si]
cmp myarray[si],'/'
je vertical_next_step2
cmp bl,cl
je vertical_crush_them2
sub index1,10
mov si,index1
jmp vertical_next_step2

vertical_crush_them2:
check_vertical_fourth2:
add index1,10
mov si,index1
mov ch,myarray[si]
cmp ch,cl
je crush_vertical_four2
sub index1,10
mov si,index1
jmp crush_vertical_three2

crush_vertical_four2:
mov myarray[si],18
sub index1,10
mov si,index1

crush_vertical_three2:
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
add index1,20
mov si,index1
ADD SCORE,6

vertical_next_step2:
inc var11
cmp var11,2
je lgg2
jmp lff2

lgg2:
mov var11,0
mov index1,30
inc var12
mov ax,index1
add al,var12
mov index1,ax

cmp var12,3
je lhh2
jmp vertical_outer_iteration2

lhh2:

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov index1,36
mov var12,0
mov var11,0

vertical_outer_iteration3:
mov si,index1
mov var11,0
lff3:
mov al,myarray[si]
add index1,10
mov si,index1
mov bl,myarray[si]
cmp al,bl
je vertical_check_third3
jmp vertical_next_step3

vertical_check_third3:
add index1,10
mov si,index1
mov cl,myarray[si]
cmp bl,cl
je vertical_crush_them3
sub index1,10
mov si,index1
jmp vertical_next_step3

vertical_crush_them3:
check_vertical_fourth3:
add index1,10
mov si,index1
mov ch,myarray[si]
cmp ch,cl
je crush_vertical_four3
sub index1,10
mov si,index1
jmp crush_vertical_three3

crush_vertical_four3:
mov myarray[si],18
sub index1,10
mov si,index1

crush_vertical_three3:
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
add index1,20
mov si,index1
ADD SCORE,1

vertical_next_step3:
inc var11
cmp var11,2
je lgg3
jmp lff3

lgg3:
mov var11,0
mov index1,36
inc var12
mov ax,index1
add al,var12
mov index1,ax

cmp var12,3
je lhh3
jmp vertical_outer_iteration3

lhh3:

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov index1,03
mov var12,0
mov var11,0

vertical_outer_iteration4:
mov si,index1
mov var11,0
lff4:
mov al,myarray[si]
add index1,10
mov si,index1
mov bl,myarray[si]
cmp al,bl
je vertical_check_third4
jmp vertical_next_step4

vertical_check_third4:
add index1,10
mov si,index1
mov cl,myarray[si]
cmp bl,cl
je vertical_crush_them4
sub index1,10
mov si,index1
jmp vertical_next_step4

vertical_crush_them4:
check_vertical_fourth4:
add index1,10
mov si,index1
mov ch,myarray[si]
cmp ch,cl
je crush_vertical_four4
sub index1,10
mov si,index1
jmp crush_vertical_three4

crush_vertical_four4:
mov myarray[si],18
sub index1,10
mov si,index1

crush_vertical_three4:
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
add index1,20
mov si,index1
ADD SCORE,1

vertical_next_step4:
inc var11
cmp var11,2
je lgg4
jmp lff4

lgg4:
mov var11,0
mov index1,03
inc var12
mov ax,index1
add al,var12
mov index1,ax

cmp var12,3
je lhh4
jmp vertical_outer_iteration4

lhh4:

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov index1,63
mov var12,0
mov var11,0

vertical_outer_iteration5:
mov si,index1
mov var11,0
lff5:
mov al,myarray[si]
add index1,10
mov si,index1
mov bl,myarray[si]
cmp al,bl
je vertical_check_third5
jmp vertical_next_step5

vertical_check_third5:
add index1,10
mov si,index1
mov cl,myarray[si]
cmp bl,cl
je vertical_crush_them5
sub index1,10
mov si,index1
jmp vertical_next_step5

vertical_crush_them5:
check_vertical_fourth5:
add index1,10
mov si,index1
mov ch,myarray[si]
cmp ch,cl
je crush_vertical_four5
sub index1,10
mov si,index1
jmp crush_vertical_three5

crush_vertical_four5:
mov myarray[si],18
sub index1,10
mov si,index1

crush_vertical_three5:
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
sub index1,10
mov si,index1
mov myarray[si],'/'
add index1,20
mov si,index1
ADD SCORE,1

vertical_next_step5:
inc var11
cmp var11,2
je lgg5
jmp lff5

lgg5:
mov var11,0
mov index1,63
inc var12
mov ax,index1
add al,var12
mov index1,ax

cmp var12,3
je lhh5
jmp vertical_outer_iteration5

lhh5:
ret
vertical_crushing2 endp

welcome_messages3 proc

mov ah,02h
mov dh,0
mov dl,0
int 10h

mov ah,09
mov dx,offset msg3
int 21h

mov ah,09
mov dx,offset username
int 21h

mov ah,02h
mov dh,2
mov dl,0
int 10h

mov ah,09
mov dx,offset msg4
int 21h

MOV AX, MOVES
MOV MOVESPRINT, AX
CALL PRI


mov ah,02h
mov dh,0
mov dl,30
int 10h
mov dx,offset msg26
mov ah,09
int 21h


mov ah,02h
mov dh,0
mov dl,60
int 10h
mov dx,offset msg2
mov ah,09
int 21h

MOV AX, 0
mov ax, SCORE
mov SCOREPRINT,AX
call PRI1

mov ah,6
mov al,0
mov ch,1
mov cl,0
mov dh,1
mov dl,15
mov bh,3
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,27
mov dh,1
mov dl,38
mov bh,4
int 10h

mov ah,6
mov al,0
mov ch,1
mov cl,58
mov dh,1
mov dl,73
mov bh,2
int 10h

mov ah,6
mov al,0
mov ch,3
mov cl,0
mov dh,3
mov dl,20
mov bh,9
int 10h

mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,02h
mov dh,28
mov dl,28
int 10h
ret
welcome_messages3 endp

RANDOM3 PROC
MOV TEMP, 0
MOV SI, 0
L1:
	MOV AH, 2CH
	INT 21H
	MOV AX, RAND
	MOV BX, 341
	MUL BX
	MOV DX, 0
	MOV BX, 2145
	DIV BX
	MOV RAND, DX
	MOV AH, 0
	DIV RANGEFORBLOCKERS
	INC AH
	MOV MYARRAY[SI], AH
	cmp ah,6
	je createblocker
	jmp checkfornextblocker
	
	createblocker:
	mov myarray[si],40
	
	checkfornextblocker:
	INC SI
	INC TEMP
	CMP TEMP, 100
	JE L2
	JMP L1
L2:
RET
RANDOM3 ENDP

DECORATION3 PROC
mov ah,06
mov al,0
mov ch,7
mov cl,18
mov dh,26
mov dl,58
mov bh,0
int 10h

mov ah,06
mov al,0
mov ch,27
mov cl,17
mov dh,27
mov dl,59
mov bh,4
int 10h

mov ah,06
mov al,0
mov ch,6
mov cl,17
mov dh,6
mov dl,59
mov bh,4
int 10h

mov ah,06
mov al,0
mov ch,6
mov cl,16
mov dh,27
mov dl,17
mov bh,4
int 10h

mov ah,06
mov al,0
mov ch,6
mov cl,58
mov dh,27
mov dl,60
mov bh,4
int 10h

mov ah,06
mov al,0
mov ch,5
mov cl,45
mov dh,5
mov dl,45
mov bh,5
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,46
mov dh,4
mov dl,46
mov bh,6
int 10h

mov ah,06
mov al,0
mov ch,3
mov cl,47
mov dh,3
mov dl,47
mov bh,7
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,48
mov dh,2
mov dl,48
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,49
mov dh,1
mov dl,49
mov bh,10
int 10h

mov ah,06
mov al,0
mov ch,5
mov cl,28
mov dh,5
mov dl,28
mov bh,5
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,27
mov dh,4
mov dl,27
mov bh,6
int 10h

mov ah,06
mov al,0
mov ch,3
mov cl,26
mov dh,3
mov dl,26
mov bh,7
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,25
mov dh,2
mov dl,25
mov bh,9
int 10h

mov ah,06
mov al,0
mov ch,1
mov cl,24
mov dh,1
mov dl,24
mov bh,10
int 10h


mov var24,1
mov var25,6

stackloop:
mov ah,06
mov al,0
mov ch,var25
mov cl,64
mov dh,var25
mov dl,75
mov bh,var24
int 10h
inc var24
add var25,3
cmp var24,9
je endthisfunc
jmp stackloop

endthisfunc:

mov ah,06
mov al,0
mov ch,6
mov cl,62
mov dh,27
mov dl,63
mov bh,13
int 10h

mov ah,06
mov al,0
mov ch,6
mov cl,76
mov dh,27
mov dl,77
mov bh,13
int 10h

mov ah,06
mov al,0
mov ch,28
mov cl,0
mov dh,29
mov dl,79
mov bh,12
int 10h

mov ah,06
mov al,0
mov ch,6
mov cl,1
mov dh,27
mov dl,14
mov bh,8
int 10h

CALL CLEAR

mov ah,02h
mov dh,5
mov dl,66
int 10h
mov dx,offset msg27
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,28
mov dl,25
int 10h
mov dx,offset msg28
mov ah,09
int 21h

CALL CLEAR

mov ah,02h
mov dh,14
mov dl,4
int 10h
mov dx,offset msg29
mov ah,09
int 21h

mov ah,02h
mov dh,15
mov dl,5
int 10h
mov dx,offset msg30
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,16
mov dl,3
int 10h
mov dx,offset msg31
mov ah,09
int 21h

CALL CLEAR 

mov ah,02h
mov dh,8
mov dl,67
int 10h
mov dx,offset msg32
mov ah,09
int 21h

mov var25,0
mov var24,11
bhailoop:
CALL CLEAR 

mov ah,02h
mov dh,var24
mov dl,67
int 10h
mov dx,offset msg33
mov ah,09
int 21h
add var24,3
inc var25
cmp var25,4
je endbhailoop
jmp bhailoop

endbhailoop:
			MOV  DL, 68   ;COLUMN
			MOV  DH, 23   ;ROW
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 02H  ;SETCURSORPOSITION
			INT  10H	
			MOV  AL,34
			ADD AL, 48
			MOV  BL, 2
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 0EH  ;TELETYPE
			INT  10H
			
			MOV  DL, 69   ;COLUMN
			MOV  DH, 23   ;ROW
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 02H  ;SETCURSORPOSITION
			INT  10H	
			MOV  AL,21
			ADD AL, 48
			MOV  BL, 9
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 0EH  ;TELETYPE
			INT  10H
			
			MOV  DL, 70   ;COLUMN
			MOV  DH, 23   ;ROW
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 02H  ;SETCURSORPOSITION
			INT  10H	
			MOV  AL,36
			ADD AL, 48
			MOV  BL, 14
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 0EH  ;TELETYPE
			INT  10H
			
			MOV  DL, 69   ;COLUMN
			MOV  DH, 26   ;ROW
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 02H  ;SETCURSORPOSITION
			INT  10H	
			MOV  AL,40
			ADD AL, 48
			MOV  BL, 4
			MOV  BH, 0    ;DISPLAY PAGE
			MOV  AH, 0EH  ;TELETYPE
			INT  10H
RET
DECORATION3 ENDP

end