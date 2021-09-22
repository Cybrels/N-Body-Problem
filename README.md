# N-Body-Problem
The purpose of this program is to simulate gravity among N particles in 3D space.  This program implements the Forward Euler Method to predict where the bodies will travel by calculating the acceleration and updating the velocity and position accordingly.
## Formulas
The calculation for acceleration used in this program is the following:
### Acceleration of a Body in a System of N Bodies
$a(i) = \sum_{j=1}^{N}m_j\frac{p_j-p_i}{d(p_i,p_j)^3 + 0.1}$

In the program this is iterated $3N$ times to calculate each dimension separately.

$a(i_x) = \sum_{j=1}^{N}m_j\frac{x_j-x_i}{d(p_i,p_j)^3 + 0.1}$

$a(i_y) = \sum_{j=1}^{N}m_j\frac{y_j-y_i}{d(p_i,p_j)^3 + 0.1}$

$a(i_z) = \sum_{j=1}^{N}m_j\frac{z_j-z_i}{d(p_i,p_j)^3 + 0.1}$

The $0.1$ in the denominator is there so that when $i=j$, the denominator is not equal to zero.  
The equation also uses a function $d(p_1,p_2)$, which is described by the following:

### Distance Formula of Two 3D Points
$d(p_1,p_2)$ = $\sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2 + (z_2 - z_1)^2}$

The distance formula is calculated using all three dimensions, so it remains equal across the three iterations of each pair of points: