; Allow only 1 instance of the script to run
#SingleInstance Force
; Tracks if lbutton should spam
toggle := 0
; End of AES
Exit

; Hotkey to toggle the spam function on/off
*F8::toggle:=!toggle

; Directive that turns this hotkey on when the condition is met
#If (toggle = true)
*LButton::SpamClick()
#If

; Function for spam clicking
SpamClick(){
	; Send click event
	Click
	; Check if lbutton is still being held
	If GetKeyState("LButton", "P")
		; If yes, set a timer to run this function again
		SetTimer, % A_ThisFunc, -1
	Return
}