!Stoichiometric Ni_2 Mn Sn, "martensite" orthorhombic phase
BKG  0.900  0.900  0.900  1.000
CELL    8.374238    5.978699    4.232971 90.0000 90.0000   90.0000 COLOR  0.500  0.500  0.500  1.000 MULTIPLE
BOX   -0.15 1.15 -0.15 1.15 -0.15 1.15
ROTAX   141.582 -0.18018  0.29020  0.93985
SPACEG P m m a
! x - red, y - green, z -blue
!tag         atom    x         y        z    color  Red   Green  Blue  Transp.  radius
!first cell
ATOM 1         NI  0.00000  0.25000  0.50000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 2         NI  0.25000  0.24000  0.10000 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 3         MN  0.00000  0.00000  0.00000 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 4         MN  0.25000  0.50000  0.57000 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 5         MN  0.00000  0.50000  0.00000 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
ATOM 6         SN  0.25000  0.00000  0.56000 COLOR 0.000 1.000 0.000 1.000 RADIUS 1.000
!other atoms are added due to symmetry          
!"bonds"
!Mn-Mn
!BOND 12        16         3.005 7.3 COLOR 1.000 0.000 0.000 1.000 RADIUS 1.000
!Mn-In (mixed alloy)
!BOND 12        14         3.005 5.3 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
!BOND 12        13         3.005 8.3 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
!BOND 12        17         3.005 4.3 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
!BOND 12        18         3.005 4.3 COLOR 1.000 1.000 0.000 1.000 RADIUS 1.000
!"construction" bands
!CONN NI NI                6.905 7.605 COLOR 0.000 0.000 0.000 1.000 RADIUS 1.000

{
}
