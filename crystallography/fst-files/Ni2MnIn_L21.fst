!Stoichiometric Ni_2 Mn In, austenite cubic phase
BKG  0.900  0.900  0.900  1.000
CELL    6.01 6.01   6.01   90.0000   90.0000   90.0000 COLOR  0.500  0.500  0.500  1.000 MULTIPLE
BOX   -0.05 1.05 -0.05 1.05 -0.05 1.05
ROTAX   141.582 -0.18018  0.29020  0.93985
SPACEG L 21
! x - red, y - green, z -blue
!tag         atom    x         y        z    color  Red   Green  Blue  Transp.  radius
!first cell
ATOM 1         NI  0.00000  0.00000  0.00000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 2         NI  0.50000  0.50000  0.50000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 3         NI  0.00000  0.00000  0.50000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 4         NI  0.50000  0.50000  0.00000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 5         NI  0.50000  0.00000  0.00000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 6         NI  0.00000  0.50000  0.00000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 7         NI  0.00000  0.50000  0.50000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 8         NI  0.50000  0.00000  0.50000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
!
ATOM 11        MN  0.25000  0.25000  0.25000 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 12        MN  0.75000  0.75000  0.25000 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 13        IN  0.75000  0.25000  0.25000 COLOR 0.000 1.000 0.000 1.000 RADIUS 1.000
ATOM 14        IN  0.25000  0.75000  0.25000 COLOR 0.000 1.000 0.000 1.000 RADIUS 1.000
!
ATOM 15        MN  0.75000  0.25000  0.75000 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 16        MN  0.25000  0.75000  0.75000 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 17        IN  0.25000  0.25000  0.75000 COLOR 0.000 1.000 0.000 1.000 RADIUS 1.000
ATOM 18        IN  0.75000  0.75000  0.75000 COLOR 0.000 1.000 0.000 1.000 RADIUS 1.000
!"bonds"
!Mn-Mn
!BOND 15        16         3.005 4.3 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
!BOND 15        11         3.005 4.3 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
!BOND 15        12         3.005 4.3 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
!Mn-In (mixed alloy)
!BOND 15        14         3.005 5.3 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
!BOND 15        13         3.005 4.3 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
!BOND 15        17         3.005 4.3 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
!BOND 15        18         3.005 4.3 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
!"construction" bands
CONN MN IN                3.00 3.1 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
{
}
