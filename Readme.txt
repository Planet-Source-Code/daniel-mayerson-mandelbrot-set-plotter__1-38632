CONTENTS:

A. A Brief Introduction to Complex Numbers
B. The Mandelbrot Set and Its Wonders
C. About the Program
D. Credits
E. Program Version History
F. Feedback

-------------------------

A. A Brief Introduction to Complex Numbers
---

To start off, let me explain about complex numbers.

As you (should) know, all positive real numbers have exactly two square roots, a positive and
a negative one, eg. the square roots of 9 are 3 and -3, since both square up to 9.

All negative real numbers don't have any roots, that is, any real roots, since no real number
squares up to a negative number.
That's why mathemeticians 'invented' i, the square root of -1, so that i^2=-1. This means all
negative real numbers now have a root. eg. square root of -9 = square root(9) * square root(-1)
= 3i.
One might think these 'imaginary numbers' have no real mathematical meaning or applications,
but they do, eg. in quantum fysics.

This presents something interesting if we explore various powers of i, giving us this repetitive
table:
i^1 = i
i^2 = -1
i^3 = -i (= -1 * i)
i^4 = 1 (= -1 * -1)
i^5 = i
...

Now, a complex number can be written in the following notation a + bi, a being a real number,
the so-called 'real part', and b being a (real number) factor of i.

Mathematics are fairly straightforward with these complex numbers, for instance, to add two,
one just adds the real parts to each other and the imaginary ones to each other.
An example:
(5 + 4i) + (3 + 2i) = (5 + 3) + (4 + 2)i = 8 + 6i
And obviously, subtracting, being the opposite of addition, is the same.

Multiplying complex numbers is a bit more difficult. One first just calculates it as one would
normally calculate (a + b)*(c + d),
eg. (3 + 2i) * (4 + 5i) = 3*4 + 3*5i + 2i*4 + 2i*5i = 12 + 15i + 8i + 10i^2
Now, since i^2 = -1, one plugs that in the last term and just adds them up, to get a new
complex number of the form a + bi,
eg. 12 + 15i + 8i + 10i^2 = 12 + 15i + 8i - 10 = 2 + 23i
I won't go in to dividing complex numbers here, since it's not really neccesary, but it's not too
much more difficult.

Squaring complex numbers is easier the multiplying them, if one uses the formula
(a + b)^2 = a^2 + b^2 + 2*a*b,
eg. (3 + 4i)^2 = 3^2 + (4i)^2 + 2*3*4i = 9 - 8 + 24i
One also notices a interesting fact: due to that i squares up to -1, two of the terms collapse
into each other. This is crucial to the Mandelbrot set.


-------------------------

B. The Mandelbrot Set and Its Wonders
---

A complex number, given by a + bi, can be plotted out on a X and Y coordinate system by making
the X axis the real axis and the Y axis the imaginary one. Then one gets on the X axis,
'..., -2, -1, 0, 1, 2, ...' and on the Y axis '..., -2i, -i, 0, i, 2i, ...'

A small note, although usually the positive values for Y are on the top half of the Y axis,
I put the negative values on top, so the values of Y increases as it goes down. It doesn't really
make that much difference though.

Now, the Mandelbrot set works in this X and Y coordinate system. For every point in the X,Y
surface, we want to test if it is in the set or not. If it is, we'll color it black, otherwise
white.
To test if the point is in the set, one takes c as the number currently being tested, and z as
a complex number, starting from 0, and one does z -> z^2 + c. Basically what this means is you
square z, and add c to it. This process you repeat over and over and over again.,
eg. c = 1 + 2i, so: z -> 0^2 + (1 + 2i) = 1 + 2i; z -> (1 + 2i)^2 + (1+ 2i), and so on..
Eventually,
if the total heads off towards infinity in either the real or imaginary part (ie. either the X
or Y axis), then the point is not a part of the set. If the real or imaginary part becomes larger
then 2 or smaller then -2 then it is surely doing so.
If however, z stays close to the zero-point of the axis', then it is a point of the set and can
be colored black. Usually, after about 100 or 200 iterations of this z -> z^2 + c it is safe
to assume that the point is a point of the set. However, at the border of the set, where black
meets white, one can't be sure, for what would the 1000th, or the 1000000th iteration bring?
At the border of the set one finds extraordinary figures, spirals, and so on. A couple of
examples are included with this program.

This is called chaos, and is a mathematical paradox; such complex figures held within the simple
equation of z->z^2+c

Now, about the colors. One can put in different colors for when the point headed off to infinity.
If the point became too large (or to small) before 10 iterations, color it white. If it became
too large (or too small) after 20, yellow, and so on. In my program I tried to make it so that
those that are furthest from being in the set (ie. those that break off and get too large or
small in just a couple iterations) are colored light colors and those closer to the set (ie.
those that required more iterations to break off and go to infinity) are colored darker, until
one reaches those that are part of the set which are colored black.


-------------------------

C. About the Program
---

A few notes about the program:

-In the comments in the source code of the program, the user is always referred to as a 'he'
instead of 'he/she' for simplicity.

-The values entered for the X and Y limits (in the 4 text boxes) are also called coordinates
(coords for short) by me in my text and comments.

-To enter a exponential number, meaning something like 2*10^3, use E instead of the '*10^' part.
eg. 2*10^3 -> enter in the text box: 2E3

-In my program I used the largest data type available to me, the Double data type, which ranges
from -1.79769313486232E308 to -4.94065645841247E-324 for negative values and from
4.94065645841247E-324 to 1.79769313486232E308 for positive values.
If anyone knows another larger data type or a way around this limit, please let me know.

-For best and most accurate results, it's best to enter the smallest value for the left X or Y,
and the largest value in the right X or Y (note that negative numbers are always smaller than
positive ones, eg. -2 is smaller then 0.01). Also, it's best to make the difference between Xs
and Ys the same, otherwise the picture may seem a bit stretched out.

-For the best results, don't minimize the form while calculating; sometimes the picture gets
damaged then. It should run on the the foreground the whole time it is calculating, which
shouldn't matter much anyway, since its calculating is very processing-intensive and takes
up virtually all processing power. It WILL take a long time to calculate a full region.

-For saving a Mandelbrot Set to file, what I did was make the program save the coordinates to
a file of the users choice, with the extension .mbs, and then automatically save the picture
to a file that has the same name but with the extension .bmp. For loading a Mandelbrot Set,
the user selects a file (.mbs), the coordinates are loaded from that file, and the picture
with the same name but with extension .bmp is loaded to the picture box. So, you can't rename
the .mbs file without renaming the .bmp file it's associated with, and vice versa.
If anyone knows a better way to do this, eg. putting both picture and coords in the same file
and retrieving them, please tell me.

-Some of the sample color pictures were calculated before the color bug was fixed (it is now
fixed from version 1.02.0002), so there may be white spaces between the black and the magenta
of the color pictures. This white should be magenta.

-------------------------

D. Credits
---

Programming done entirely by me, Daniel R. Mayerson.
I am indebted to the book 'Chaos, the Amazing Science of the Unpredictable', by James Gleick,
for its clear and detailed explanation of fractals, Julia sets, and the Mandelbrot set; the book
is a definite must-read for anyone who finds this program of mine interesting.
Visit our web-site at http://damadros.cjb.net !!


-------------------------

E. Program Version History
---

Make sure to check http://damadros.cjb.net for future updates!

-Version 1.02.0002: When color was selected; the points that needed more than 80 iterations and
less then the max. iterations were colored white instead of magenta, this has been fixed.
-Version 1.02: Changed file saving/loading to make a .mbs file and a .bmp file; so the user
doesn't have to manually enter the coordinates every time he loads a file; added Section E
to manual; Updates example magnifications of the set.
-Version 1.01.0002 & 1.01.0003: Cleaned up various little problems; added Section C, F to manual.
-Versions 1.01.0001: Added Readme.txt (manual) and comments.
-Version 1.01: Added: selection option; ability to save and load .bmp's
and then manually enter the coordinates for it.
-Version 1.00: First version.


-------------------------

F. Feedback
---

Feedback of any kind is greatly appreciated: comments, suggestions, improvements, problems, 
jokes even, etc are all welcome at drmayerson@lycos.co.uk .