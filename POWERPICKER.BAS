#COMPILE EXE

%WHITEBALL_NUMBERS = 69
%POWERBALL_NUMBERS = 26

Function PBMain
    Local sBuff         As String
    Local iFile         As Long
    Local i             As Long
    Local y             As Long
    DIM WhiteBalls(%WHITEBALL_NUMBERS)  As Long

    RANDOMIZE

    For i = 1 To %WHITEBALL_NUMBERS
        WhiteBalls(i) = i
    Next

    'Fisher/Yates shuffle
    For i = 1 To %WHITEBALL_NUMBERS - 2
        y = RND(1, %WHITEBALL_NUMBERS - i) 
        Swap WhiteBalls(i), WhiteBalls(i + y)
    Next

    For i = 1 To 5
        sBuff = sBuff + trim$(WhiteBalls(i)) + " "
    Next i

    sBuff += trim$(RND(1, %POWERBALL_NUMBERS))

    iFile = FreeFile
    Open "NUMBERS" For Output As #iFile
    Print #iFile, sBuff;
    Close #iFile
End Function