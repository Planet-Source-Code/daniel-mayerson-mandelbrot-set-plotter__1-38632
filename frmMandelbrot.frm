VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMandelbrot 
   Caption         =   "Mandelbrot Set Plotter"
   ClientHeight    =   7920
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11325
   Icon            =   "frmMandelbrot.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7920
   ScaleWidth      =   11325
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chkColor 
      Caption         =   "C&olor"
      Height          =   255
      Left            =   9480
      TabIndex        =   22
      Top             =   5040
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.CommandButton cmdLoad 
      Caption         =   "&Load Picture..."
      Height          =   735
      Left            =   9360
      TabIndex        =   19
      Top             =   2160
      Width           =   1575
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save Picture as..."
      Height          =   735
      Left            =   9360
      TabIndex        =   18
      Top             =   1320
      Visible         =   0   'False
      Width           =   1575
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   10080
      Top             =   6720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox picYbar 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   7000
      Left            =   0
      ScaleHeight     =   50
      ScaleMode       =   0  'User
      ScaleWidth      =   100
      TabIndex        =   16
      Top             =   240
      Width           =   255
   End
   Begin VB.PictureBox picXbar 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      ScaleHeight     =   100
      ScaleMode       =   0  'User
      ScaleWidth      =   50
      TabIndex        =   15
      Top             =   0
      Width           =   7000
   End
   Begin MSComctlLib.ProgressBar gaugeProgress 
      Height          =   255
      Left            =   480
      TabIndex        =   10
      Top             =   7680
      Visible         =   0   'False
      Width           =   6615
      _ExtentX        =   11668
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton cmdCalc 
      Caption         =   "&Calculate!"
      Default         =   -1  'True
      Height          =   735
      Left            =   7680
      TabIndex        =   9
      Top             =   4800
      Width           =   1575
   End
   Begin VB.TextBox txtRightY 
      Height          =   375
      Left            =   7800
      TabIndex        =   8
      Top             =   4200
      Width           =   1095
   End
   Begin VB.TextBox txtLeftY 
      Height          =   375
      Left            =   7800
      TabIndex        =   7
      Top             =   3120
      Width           =   1095
   End
   Begin VB.TextBox txtRightX 
      Height          =   375
      Left            =   7800
      TabIndex        =   6
      Top             =   2040
      Width           =   1095
   End
   Begin VB.TextBox txtLeftX 
      Height          =   375
      Left            =   7800
      TabIndex        =   5
      Top             =   840
      Width           =   1095
   End
   Begin VB.PictureBox picMain 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   7000
      Left            =   240
      ScaleHeight     =   1402.402
      ScaleMode       =   0  'User
      ScaleWidth      =   1402.402
      TabIndex        =   0
      Top             =   240
      Width           =   7000
      Begin VB.Shape shpRect 
         BorderColor     =   &H000000FF&
         Height          =   735
         Left            =   1560
         Top             =   1080
         Visible         =   0   'False
         Width           =   1695
      End
   End
   Begin VB.CommandButton cmdStop 
      Cancel          =   -1  'True
      Caption         =   "&Stop"
      Height          =   735
      Left            =   7680
      TabIndex        =   23
      Top             =   4800
      Width           =   1575
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Cl&ear Picture Box"
      Height          =   735
      Left            =   9360
      TabIndex        =   24
      Top             =   3000
      Width           =   1575
   End
   Begin VB.Label lblPos 
      Height          =   495
      Left            =   9240
      TabIndex        =   21
      Top             =   720
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label lblDescriptPos 
      Caption         =   "The cursor is on position:"
      Height          =   255
      Left            =   9240
      TabIndex        =   20
      Top             =   360
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label lblBlock 
      Height          =   855
      Left            =   7440
      TabIndex        =   17
      Top             =   5640
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label lblCurrent 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   7200
      TabIndex        =   14
      Top             =   6840
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label lblOf 
      Alignment       =   2  'Center
      Caption         =   "Of"
      Height          =   255
      Left            =   7200
      TabIndex        =   13
      Top             =   7200
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label lblMax 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   7200
      TabIndex        =   12
      Top             =   7560
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label lblProcessing 
      Alignment       =   2  'Center
      Caption         =   "Calculating, please wait:"
      Height          =   375
      Left            =   480
      TabIndex        =   11
      Top             =   7320
      Visible         =   0   'False
      Width           =   6615
   End
   Begin VB.Label Label4 
      Caption         =   "Enter left limit of real (Y) axis:"
      Height          =   495
      Left            =   7800
      TabIndex        =   4
      Top             =   2520
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Enter right limit of real (Y) axis:"
      Height          =   495
      Left            =   7800
      TabIndex        =   3
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Enter right limit of real (X) axis:"
      Height          =   495
      Left            =   7800
      TabIndex        =   2
      Top             =   1440
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Enter left limit of real (X) axis:"
      Height          =   495
      Left            =   7800
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmMandelbrot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Variables for selecting a region of the picturebox
Private BeginSelX
Private EndSelX
Private BeginSelY
Private EndSelY

'Variable that's set to True if the Stop button is
'pressed; the main calculating loop checks this variable
'and stops calculating if it is True
Private StopTest As Boolean
Sub SetBars()
Dim CounterX2 As Integer
Dim CounterY2 As Integer

'Make a line in the X and Y bar every so many steps..
'default for steps is 1000, so default amount of lines
'is 50
For CounterX2 = 1 To STEPS / 20
    picXbar.Line (CounterX2, 0)-(CounterX2, 100)
Next CounterX2
For CounterY2 = 1 To STEPS / 20
    picYbar.Line (0, CounterY2)-(100, CounterY2)
Next CounterY2
'Then set lblBlock to display how much every block
'represents
lblBlock.Visible = True
lblBlock = "Each block on the X axis: " & DifX / 50 & vbNewLine & "Each block on the Y axis: " & DifY / 50
End Sub


Private Sub cmdCalc_Click()
'First, check to see if any of the coordinate boxes have
'been left empty, we can't do anything with empty boxes.
'And if any box is empty, notify the user and
'exit the sub
If txtLeftX = "" Or txtLeftY = "" Or txtRightX = "" Or txtRightY = "" Then
    MsgBox "Please enter a value in all boxes.", vbExclamation
    Exit Sub
End If

Dim CounterX As Double
Dim CounterY As Double
Dim CounterX2 As Integer
Dim CounterY2 As Integer
Dim CurrentComplexNr As ComplexNr
Dim IsInSet As Integer

'Set the limit variables to be what's in the text box;
'the error handler is for if an error 13 type mismatch
'happens, which means the user entered something other
'than a number.
'Also, if an error 6, 'Overflow', is generated, meaning
'the user typed in a too small or too large value,
'then the errhandler steps in as well.
On Error GoTo errhandler
LeftX = txtLeftX
RightX = txtRightX
LeftY = txtLeftY
RightY = txtRightY
'unset the errhandler
On Error GoTo 0

'Calculate the difference (=distance) between
'the Xs and the Ys
DifX = RightX - LeftX
DifY = RightY - LeftY

'Now, calculate the amount to move over every step.
'eg. if STEPS is set to 1000 (default) and the difference
'between LeftX and RightX is 1, XUnit will be 0.001.
XUnit = DifX / STEPS
YUnit = DifY / STEPS

'Set the X and Y bars
SetBars

'Make a lot of objects invisible that shouldn't
'be visible during calculations.
chkColor.Visible = False
lblDescriptPos.Visible = False
lblPos.Visible = False
cmdSave.Visible = False
cmdLoad.Visible = False
cmdCalc.Visible = False
cmdClear.Visible = False

'Make objects visible that should be visible during
'calculations
cmdStop.Visible = True
lblProcessing.Visible = True
lblCurrent.Visible = True
lblOf.Visible = True
lblMax.Visible = True
gaugeProgress.Visible = True

'Set the gauge and the counting labels
gaugeProgress.Min = 0
gaugeProgress.Max = STEPS ^ 2
gaugeProgress.Value = 0
lblMax = Str(gaugeProgress.Max)
lblCurrent = 0

'Now, clear whatever there may be on the main picture box
'The .Cls is to get rid of anything drawn on the box
'(ie. any previous calculations) and the LoadPicture("")
'is for getting rid of any loaded pictures on the
'picture box
picMain.Picture = LoadPicture("")
picMain.Cls

'Initially set this to False; if the Stop button is
'pressed, it'll be set to True
StopTest = False

'Now for the main bit.. begin with setting CounterX to
'start at the Left X
CounterX = LeftX
For CounterX2 = 1 To STEPS
    'Check if Stop button has been pressed
    If StopTest = True Then
        Exit For
    End If
    'Increment CounterX
    CounterX = CounterX + XUnit
    'Set CounterY to start at the Left Y
    CounterY = LeftY
    For CounterY2 = 1 To 1000
        'Check to see if Stop button has been pressed
        If StopTest = True Then
            Exit For
        End If
        'Increment CounterY
        CounterY = CounterY + YUnit
        
        'Now for the main thing; set
        'the CurrentComplexNr variable to the current
        'point being tested.
        CurrentComplexNr.RealPart = CounterX
        CurrentComplexNr.ImPart = CounterY
        'Then perform the operation on it
        IsInSet = PerformMandelbrotOp(CurrentComplexNr)
        'Now, check to see what color dot to paint for
        'the point being tested. If color is selected,
        'and the point was heading off to infinity after
        'less then ten sets, it is colored white. After
        'more then ten but less then twenty, yellow. And
        'so on. Colors can of course be adjusted, but I
        'tried to put the lightest ones to be the
        'furthest from the set, and the darker ones the
        'closest (with black if the point is in the set)
        'However, if the color checkbox is not checked,
        'only points that are in the set need to be
        'colored in black and the rest left alone.
        If chkColor.Value = 1 Then
            Select Case IsInSet
                Case Is >= MAXITERATIONS
                    picMain.PSet (CounterX2, CounterY2), vbBlack
                Case Is < 10
                    picMain.PSet (CounterX2, CounterY2), vbWhite
                Case Is < 20
                    picMain.PSet (CounterX2, CounterY2), vbYellow
                Case Is < 30
                    picMain.PSet (CounterX2, CounterY2), vbGreen
                Case Is < 40
                    picMain.PSet (CounterX2, CounterY2), vbCyan
                Case Is < 60
                    picMain.PSet (CounterX2, CounterY2), vbBlue
                Case Is < 80
                    picMain.PSet (CounterX2, CounterY2), vbRed
                Case Else
                    picMain.PSet (CounterX2, CounterY2), vbMagenta
            End Select
        Else
            If IsInSet >= MAXITERATIONS Then
                picMain.PSet (CounterX2, CounterY2), vbBlack
            End If
        End If
        
        'Increment the gauge and the label with the
        'amount of calculations performed on it.
        gaugeProgress.Value = gaugeProgress.Value + 1
        lblCurrent = Str(gaugeProgress.Value)
        'Very important, without a DoEvents statement
        'you wouldn't see the program paint in the dots
        'dot by dot, and you wouldn't be able to click
        'the Stop button during the calculations
        DoEvents
    Next CounterY2
    DoEvents
Next CounterX2

'After the whole calculation has been done, make all the
'objects visible that should be and the objects that were
'only needed during the calculation, set to invisible
lblProcessing.Visible = False
gaugeProgress.Visible = False
lblCurrent.Visible = False
lblOf.Visible = False
lblMax.Visible = False
cmdSave.Visible = True
cmdLoad.Visible = True
cmdCalc.Visible = True
cmdStop.Visible = False
lblDescriptPos.Visible = True
lblPos.Visible = True
chkColor.Visible = True
cmdClear.Visible = True
'And exit the sub, wouldn't want to enter the errhandler
Exit Sub

errhandler:
'If the error is 13, Type Mismatch (ie. the user entered
'something other than a valid number in one of the
'text boxes, then display a warning message and exit the
'sub
If Err = 13 Then
    MsgBox "Please enter valid numbers.", vbExclamation
ElseIf Err = 6 Then
    MsgBox "Number entered in one or more of the boxes is too large or too small. Please stay within the limit of -1.79769313486232E308 to -4.94065645841247E-324 for negative values and from 4.94065645841247E-324 to 1.79769313486232E308 for positive values.", vbExclamation
Else
    MsgBox "Error occured while entered numbers. Please try again.", vbExclamation
End If
End Sub

Private Sub cmdClear_Click()
'This clears the picture box.. the picture box gets
'cleared automaticly anyway when you start a new
'calculation or load a new picture, but it might be
'nicer for the user if he wants to, to clear the picture
'box when he wants
picMain.Cls
picMain.Picture = LoadPicture("")
picXbar.Cls
picYbar.Cls
lblDescriptPos.Visible = False
lblPos.Visible = False
lblBlock.Visible = False
cmdSave.Visible = False
End Sub

Private Sub cmdLoad_Click()
On Error GoTo errhandler
Dim PictureFile As String
With CommonDialog
    'Set a couple of things in the commondialog
    .DialogTitle = "Load Mandelbrot Set..."
    .FileName = "*.mbs"
    .Filter = "Mandelbrot Set (*.mbs)|*.mbs|Mandelbrot Picture (*.bmp)|*.bmp"
    'Generate error cdlCancel if user presses Cancel
    .CancelError = True
    'This hides the 'Open as Read Only' check box, since
    'we don't want it
    .Flags = cdlOFNHideReadOnly
    'Now show the CommonDialog box!
    .ShowOpen
    'If the user didn't enter of select a valid file,
    'exit the sub
    If .FileName = "" Or .FileName = "*.mbs" Then
        Exit Sub
    End If
    'Now just load the picture onto the main picture box
    'The picture filename is the same file as the
    'user just selected, only with the extension .bmp;
    'so get rid of the extension and add .bmp on
    '(ie. pic.mbs -> pic. -> pic.bmp)
    'If the extension was .bmp to begin with, nothing
    'really changes
    picMain.Cls
    picMain.Picture = LoadPicture(Left(.FileName, Len(.FileName) - 3) & "bmp")
    'If the file the user selected is a .bmp file;
    'no coordinates can be loaded from it, so set them
    'all to the default 0 and set the rest
    If Right(.FileName, 3) = "bmp" Then
        LeftX = 0
        RightX = 0
        LeftY = 0
        RightY = 0
        GoTo SetExtra
    End If
    'Now, it's simple, just open the file
    'the user selected and read 4 lines:
    'the 4 X and Y limits.
    Dim FileNum As Integer
    FileNum = FreeFile
    Open .FileName For Input As FileNum
    Input #FileNum, LeftX
    Input #FileNum, RightX
    Input #FileNum, LeftY
    Input #FileNum, RightY
    'And close the file when we're done with it!
    Close FileNum
    
'Now we have to use the limits for X and Y that have
'been set above to fill in the rest of the stuff
SetExtra:
End With
'Now set the text boxes to display the limits, calculate
'the difference and units for X and Y, and set the X
'and Y bars.
txtLeftX = LeftX
txtRightX = RightX
txtLeftY = LeftY
txtRightY = RightY
DifX = RightX - LeftX
DifY = RightY - LeftY
XUnit = DifX / STEPS
YUnit = DifY / STEPS
SetBars

'Set some now needed objects to be visible, if they're
'not already so.
lblDescriptPos.Visible = True
lblPos.Visible = True
cmdSave.Visible = True

Exit Sub
errhandler:
'User selected a bad filename
If Err.Number = 62 Or Err.Number = 53 Then
    MsgBox "Incorrect file. Please try loading the picture again.", vbCritical
ElseIf Err.Number = cdlCancel Then 'user selected Cancel
                                   'in one of the dialog
                                   'boxes; set filename
                                   'to "" and resume the
                                   'program
    CommonDialog.FileName = ""
    Resume Next
Else
'With File I/O, something weird can always go wrong
'(that's my experience anyways); so make sure we
'put in a extra error checker just in case.
    If MsgBox("Error " & Err.Number & " occurred:" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbYesNo + vbCritical) = vbNo Then
        End
    End If
End If
End Sub


Private Sub cmdSave_Click()
'On Error GoTo errhandler
With CommonDialog
    'Set some things in the dialog
    .DialogTitle = "Save Mandelbrot Set as.."
    .FileName = "*.mbs"
    .Filter = "Mandelbrot Set (*.mbs)|*.mbs"
    'These flags hide the 'Open As Read Only' check box
    'and shows a message box to confirm the file if the
    'user selected an existing file name
    .Flags = cdlOFNHideReadOnly Or cdlOFNOverwritePrompt
    'Don't generate a error if the user selects Cancel
    .CancelError = False
    'Now show the dialog!
    .ShowSave
    'If the user selected or entered nothing valid in the
    'dialog box, exit the sub
    If .FileName = "" Or .FileName = "*.mbs" Then
        Exit Sub
    End If
    'Now save the picture to a file called the same as
    'the file the user indicated, only in a .bmp file
    'instead, so chop off the mbs extension and add bmp
    '(ie. pic.mbs -> pic. -> pic.bmp)
    SavePicture picMain.Image, Left(.FileName, Len(.FileName) - 3) & "bmp"
    'Now write all 4 coords to the file indicated by the
    'user
    Dim FileNum As Integer
    FileNum = FreeFile
    Open .FileName For Output As FileNum
    Write #FileNum, LeftX
    Write #FileNum, RightX
    Write #FileNum, LeftY
    Write #FileNum, RightY
    'Make sure we close the file after we're done!
    Close FileNum
End With

Exit Sub
'With File I/O, something can always go wrong (that's
'my experience anyways); so make sure we put in a
'error checker just in case.
errhandler:
If MsgBox("Error " & Err.Number & " occurred:" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbYesNo + vbCritical) = vbNo Then
    End
End If
End Sub


Private Sub cmdStop_Click()
'Set StopTest to True; in the calculating Loop this will
'make it exit the loop.
StopTest = True
End Sub

Private Sub Form_Load()
'Set the ScaleHeight and ScaleWidth to be the amount of
'points needed on the X and Y axis
picMain.ScaleHeight = STEPS
picMain.ScaleWidth = STEPS
End Sub

Private Sub Form_Terminate()
'Make sure the program ends immediatly if the form is
'closed
End
End Sub


Private Sub Form_Unload(Cancel As Integer)
'Make sure the program ends immediatly if the form is
'closed
End
End Sub


Private Sub picMain_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'First, check if some picture is on the picture box
'(ie. check if lblPos is visible) and check to see if
'The user entered values for the X and Y limits.
'If so, then make the selection rectangle visible and
'set its coordinates to be where the mouse is.
'Also, set BeginSelX and BeginSelY
If lblPos.Visible = True And XUnit <> 0 And YUnit <> 0 Then
    BeginSelX = X * XUnit + LeftX
    BeginSelY = Y * YUnit * LeftY
    shpRect.Left = X
    shpRect.Top = Y
    shpRect.Height = 0
    shpRect.Width = 0
    shpRect.Visible = True
End If
End Sub


Private Sub picMain_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'If the position label is visible, update it so that it
'states the current position of the mouse on the
'picture box
If lblPos.Visible = True Then
    lblPos = "(" & X * XUnit + LeftX & ", " & Y * YUnit + LeftY & ")"
End If
'If a region is being selected, update shpRect's values
'to match where the mouse is being dragged
If shpRect.Visible = True Then
    'If where the user's dragging the mouse to is to the
    'left of the rectangle, make it stop at it's left
    'point. Same for the Y.
    If X < shpRect.Left Then
        shpRect.Width = 0
    Else
        shpRect.Width = X - shpRect.Left
    End If
    If Y < shpRect.Top Then
        shpRect.Height = 0
    Else
        shpRect.Height = Y - shpRect.Top
    End If
End If
End Sub


Private Sub picMain_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Check if we are selecting a region
If lblPos.Visible = True And BeginSelX <> 0 Then
    'Set the end of the selection variables to where the
    'mouse ended up
    EndSelX = X * XUnit + LeftX
    EndSelY = Y * YUnit + LeftY
    'Ask if the user wants to plot out what he selected,
    'if he doesn't, reset all selection variables, rehide
    'the selecting rectangle, and exit the sub
    If MsgBox("Plot out selected region?", vbYesNo + vbQuestion) = vbNo Then
        BeginSelX = 0
        EndSelX = 0
        BeginSelY = 0
        EndSelY = 0
        shpRect.Visible = False
        Exit Sub
    End If
    'If the user wants to plot it out, then set the
    'LeftX and RightX text boxes (for the upcoming call
    'to cmd_Calc's Click Sub)
    'DifX and DifY are set here for a brief time to help
    'calculate which we should take as the Left X (or Y)
    'and which as the right X (or Y).
    shpRect.Visible = False
    If BeginSelX < EndSelX Then
        DifX = EndSelX - BeginSelX
        txtLeftX = BeginSelX
        txtRightX = EndSelX
    Else
        DifX = EndSelX - BeginSelX
        txtRightX = BeginSelX
        txtLeftX = EndSelX
    End If
    If BeginSelY < EndSelY Then
        DifY = EndSelY - BeginSelY
        If DifX <> DifY Then
            If MsgBox("Difference between X and Y is not the same. Adjust Y so that it is?", vbQuestion + vbYesNo) = vbYes Then
                EndSelY = BeginSelY + DifX
            End If
        End If
        txtLeftY = BeginSelY
        txtRightY = EndSelY
    Else
        DifY = BeginSelY - EndSelY
        If DifX <> DifY Then
            If MsgBox("Difference between X and Y is not the same. Adjust Y so that it is?", vbQuestion + vbYesNo) = vbYes Then
                BeginSelY = EndSelY + DifX
            End If
        End If
        txtRightY = EndSelY
        txtLeftY = BeginSelY
    End If
    'Now reset the DifX and DifY variables to 0, they'll
    'be reset in cmdCalc_Click anyways.
    DifX = 0
    DifY = 0
    'Now, call the Calculate button's Click Sub to plot
    'out the selected region.
    Call cmdCalc_Click
End If
End Sub


