Attribute VB_Name = "mdlCalculations"
Option Explicit
'The type used to store complex numbers, since
'regular data types can't.
'Since complex numbers exist in the form a + bi, and a
'and b are real numbers, we can put a in the Real Part
'and b in the Imaginary Part
Public Type ComplexNr
    RealPart As Double
    ImPart As Double
End Type

'Initialize various variables used throughout the program
Public LeftX As Double
Public RightX As Double
Public LeftY As Double
Public RightY As Double
Public DifX As Double
Public DifY As Double
Public XUnit As Double
Public YUnit As Double

'These can be changed to your liking, eg. if you want
'more accuracy for the calculations, you can set the
'MAXITERATIONS to a higher number, but beware, speed
'steadily diminishes then.
'And, it's unadvisable to change the STEPS variable,
'since more points in the picture box won't get drawn in
'anyway, and less points would make it less clear.
Public Const STEPS = 1000
Public Const MAXITERATIONS = 300
Public Function PerformMandelbrotOp(Number As ComplexNr) As Integer
Dim StartNumber As ComplexNr
Dim Counter As Integer

'In the Mandelbrot operation z->z^2 + c, StartNumber
'is c, being the number being tested; and z is Number,
'starting from 0.
StartNumber = Number
'MAXITERATIONS can be set higher to get higher accuracy
'about if a point is in the set or not.
For Counter = 1 To MAXITERATIONS
    'Perform z->z^2 + c on Number. What happens is that
    'Number gets squared, and that gets added to
    'StartNumber
    Number = AddComplexNrs(SquareComplexNr(Number), StartNumber)
    'If the real or imaginary part of Number is larger
    'then 2 or smaller then -2, it's surely heading off
    'to infinity and not part of the set, and one can
    'return the amount of iterations performed and exit
    'the function
    If Number.RealPart < -2 Or Number.RealPart > 2 Or Number.ImPart < -2 Or Number.ImPart > 2 Then
        PerformMandelbrotOp = Counter
        Exit Function
    End If
Next Counter
'The point is in the set! Return Counter.
PerformMandelbrotOp = Counter
End Function
Public Function SquareComplexNr(Number As ComplexNr) As ComplexNr
Dim Result As ComplexNr

'Squaring a complex number is a bit harder then adding
'two,
'One must take the real part squared, and subtract the
'imaginary part squared (since i squared is -1) as the
'new real part.
'Then one must take the double of the imaginary part
'times the real part as the new imaginary part.
'eg. (5 + 3i)^2 = 5^2 + (3i)^2 + 2*5*3i
'               = 25 - 9 + 30i
Result.RealPart = Number.RealPart ^ 2 - Number.ImPart ^ 2
Result.ImPart = 2 * Number.ImPart * Number.RealPart

'Now return the result.
SquareComplexNr = Result
End Function

Public Function AddComplexNrs(Number1 As ComplexNr, Number2 As ComplexNr) As ComplexNr
Dim Result As ComplexNr
'Adding complex numbers is really straightforward, just
'add the real parts and the imaginary parts,
'eg. (5 + 3i) + (4 + 2i) = (5 + 4) + (3 + 2)i = 9 + 5i
Result.RealPart = Number1.RealPart + Number2.RealPart
Result.ImPart = Number1.ImPart + Number2.ImPart

'Return the result
AddComplexNrs = Result
End Function

