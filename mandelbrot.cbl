identification division.
program-id. MandelbrotSet.

*> Mandelbrot Set generator
*> (c) 2015 Mike Harris
*> Free software released under GPL

data division.
working-storage section.
01 ResolutionX          constant 240.
01 ResolutionY          constant 100.
01 RealPlaneMin         constant -2.5.
01 RealPlaneMax         constant 0.8.
01 ImaginaryPlaneMin    constant -1.25.
01 ImaginaryPlaneMax    constant 1.25.
01 ProportionalX        pic S99V9(16) usage comp-5 value zeros.
01 ProportionalY        pic S99V9(16) usage comp-5 value zeros.
01 IterationsMax        constant 60.
01 Threshold            constant 10000.

01 ScreenX              pic 999 usage comp-5.
01 ScreenY              pic 999 usage comp-5.
01 MathPlaneX           pic S99V9(16) usage comp-5.
01 MathPlaneY           pic S99V9(16) usage comp-5.

01 PointX               pic S9(7)V9(8) usage comp-5.
01 PointY               pic S9(7)V9(8) usage comp-5.
01 XSquared             pic S9(10)V9(8) usage comp-5.
01 YSquared             pic S9(10)V9(8) usage comp-5.
01 Iteration            pic 999 value zero.
01 TempVar              pic S9(5)V9(8) usage comp-5.

procedure division.

compute ProportionalX = (RealPlaneMax - RealPlaneMin) / (ResolutionX - 1)
compute ProportionalY = (ImaginaryPlaneMax - ImaginaryPlaneMin) / (ResolutionY - 1)

perform varying ScreenY from 0 by 1 until ScreenY is equal to ResolutionY

    compute MathPlaneY = ImaginaryPlaneMin + (ProportionalY * ScreenY)

    perform varying ScreenX from 0 by 1 until ScreenX is equal to ResolutionX

        compute MathPlaneX = RealPlaneMin + (ProportionalX * ScreenX)

        move zero to PointX
        move zero to PointY
        multiply PointX by PointX giving XSquared
        multiply PointY by PointY giving YSquared

        perform with test after varying Iteration from 0 by 1
            until Iteration >= IterationsMax or
                  XSquared + YSquared >= Threshold
              compute TempVar = XSquared - YSquared + MathPlaneX
              compute PointY = 2 * PointX * PointY + MathPlaneY
              move TempVar to PointX
              compute XSquared = PointX * PointX
              compute YSquared = PointY * PointY
        end-perform

        if Iteration is equal to IterationsMax
            display "*" with no advancing
        else
            display " " with no advancing
        end-if

    end-perform

    display " "

end-perform

stop run.

end program MandelbrotSet.
