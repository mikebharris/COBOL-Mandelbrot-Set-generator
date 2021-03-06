# COBOL-Mandelbrot-Set-generator
A Mandelbrot Set generator written in COBOL using node-cobol bridge to show in web browser.

![Title](https://raw.githubusercontent.com/mikebharris/COBOL-Mandelbrot-Set-generator/master/screenshot.png)

I am forever experimenting with different programming languages using the algorithm to generate Benoît Mandelbrot's set as an example
for me to learn.  Here is a generator for the set written in COBOL with simple character output.

Wrapping it up with the excellent Node.js to COBOL bridge - https://github.com/IonicaBizau/node-cobol/ - means I can output my set into
my web browser.  I love the combination of the ancient (COBOL was released in 1958) with the latest contemporary code (Node.js was 
released in 2009).

The COBOL code was written using the excellent OpenCobol IDE - https://github.com/OpenCobolIDE/OpenCobolIDE - and you'll need GNU COBOL - https://sourceforge.net/projects/open-cobol/ - to compile and run the code.

To get it to work you'll need to install GNU COBOL, Node.js and the node-cobol bridge, then from the command line do:

`$ node mandelbrot.js`

And then visit http://localhost:8080 in your browser. 

The output is very reminiscent of the original images Benoît Mandelbrot might have seen on his IBM printer back in the 1970s.
