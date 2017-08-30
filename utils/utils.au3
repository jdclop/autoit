Func WaitAndClickControl($sTitle, $sText, $hControlID)
 
    Local $iEnabled=0, $iVisible=0, $iAttempts=0
 
    Do
        $bEnabled=ControlCommand($sTitle,$sText,$hControlID,"IsEnabled")
        $bVisible=ControlCommand($sTitle,$sText,$hControlID,"IsVisible")
        Sleep(1000) ;Sleeps for 1 second
        $iAttempts+=1 ;Increment 1 counter
    Until(($bEnabled=1 And $bVisible=1) Or $iAttempts=10)
 
    If $iAttempts = 10 Then
        MsgBox(4096,"Error clicking button","Button cannot be clicked after " & $iAttempts  & " seconds.")
    Else
        If ControlClick($sTitle,$sText,$hControlID) Then
            ConsoleWrite("Button '" & $sText & "' clicked successfully!" & @CRLF)
        Else
            ConsoleWrite("Button '" & $sText & "' cannot be clicked!" & @CRLF)
        EndIf
    EndIf
 
EndFunc