numeric u; u := 1pc;

% lecture 7
beginfig(0)
  path p[]; numeric i,j;
  p0 = fullcircle xscaled 4u yscaled 2u;
  p1 = p0 shifted (6u,0);
  z0 = (0,0);
  z1 = (2u,2u);
  z2 = (4u,u);
  z3 = (6u,2u);
  z4 = (8u,0);
  z5 = (6u,-2u);
  z6 = (4u,-u);
  z7 = (2u,-2u);
  z8 = (-u,-6u);
  p2 = (z0..z1..z2..z3..z4..z5..z6..z7..cycle) shifted z8;

  p3 = halfcircle rotated 90 scaled 2u shifted (2u,0) cutbefore p0 cutafter p0;
  fill buildcycle(subpath(0,0.25length(p0)) of p0,p3,p0) withcolor 0.9white;
  draw p3 dashed evenly;
  p4 = halfcircle rotated -90 scaled 2u shifted (4u,0);
  i = xpart ((subpath(0,0.5length(p1)) of p1) intersectiontimes p4);
  j = xpart ((subpath(0.5length(p1),length(p1)) of p1) intersectiontimes p4);
  %fill buildcycle(subpath(i,j+0.5length(p1)) of p1, p4) withcolor 0.9white;
  p4 := halfcircle rotated -90 scaled 2u shifted (4u,0) cutbefore p1 cutafter p1;
  fill ((subpath(i,j+0.5length(p1)) of p1)--p4--cycle) withcolor 0.9white;
  draw p4 dashed evenly;
  z10 = (point 0 of p0) + (3,0);
  z11 = (point 0.5length(p1) of p1) + (-3,0);
  p5 = z10--z11; % f
  % i_{1}
  z12 = (point 0.75length(p0) of p0) + (0,-3);
  z13 = z1 + z8 + (-6,3);
  p6 = z12--z13;
  % i_{2}
  z14 = (point 0.75length(p1) of p1) + (0,-3);
  z15 = z3 + z8 + (6,3);
  p7 = z14--z15;
  label.lft(btex $i_{1}$ etex, 0.5[z12,z13]);
  label.rt(btex $i_{2}$ etex, 0.5[z14,z15]);
  draw p0;
  draw p1;
  draw p2;
  p8 = (fullcircle scaled 2u shifted (z2 + (0,-u) + z8));
  fill p8 withcolor 0.9white;
  draw p8 dashed evenly;
  label.rt(btex $X_{2}$ etex, point 0 of p1);
  label.lft(btex $X_{1}$ etex, point 0.5length(p0) of p0);
  label.rt(btex $U_{2,1}$ etex, point 0.5length(p4) of p4);
  label.lft(btex $U_{1,2}$ etex, point 0.5length(p3) of p3);
  label.top(btex $f$ etex, 0.5[z10,z11]);
  label.lft(btex $X$ etex, z0+z8);
  label.rt(btex $U$ etex, point 0 of p8);
  drawarrow p5;
  drawarrow p6;
  drawarrow p7;
endfig;

% lecture 8
beginfig(1)
  path X[]; path U[]; numeric i,ell;
  numeric t[];
  z1 = (7u,0);
  z2 = (3u,-6u);
  X0 = fullcircle xscaled 5u yscaled 4u; % X_{i}
  X1 = X0 shifted z1;                % X_{j}
  X2 = X0 shifted z2;            % X_{k}
  
  U0 = halfcircle rotated 90 scaled 4u shifted (2.5u,0); % U_{i,j}
  U1 = halfcircle scaled 4u shifted (0,-2u); % U_{i,k}
  ell = length(X0);
  fill buildcycle(subpath (0,0.5ell) of X0,U0,subpath(0.5ell,ell) of X0) withcolor 0.95white;
  fill buildcycle(X0,U1) withcolor 0.95white;
  fill buildcycle(U1,U0,subpath(0.5ell,ell) of X0) withcolor 0.7white;
  U0 := halfcircle rotated 90 scaled 4u shifted (2.5u,0) cutbefore X0 cutafter X0;
  U1 := halfcircle scaled 4u shifted (0,-2u) cutbefore X0 cutafter X0;
  draw U0 dashed evenly;
  draw U1 dashed evenly;
  draw X0;

  U2 = halfcircle rotated -90 scaled 4u shifted (z1 + (-2.5u,0)); % U_{j,i}
  U3 = halfcircle scaled 4u shifted (z1 + (0,-2u)); % U_{j,k}
  fill buildcycle(subpath(0.5ell,ell) of X1,U2,subpath (0,0.5ell) of X1) withcolor 0.95white;
  fill buildcycle(X1,U3) withcolor 0.95white;
  fill buildcycle(subpath(0.5ell,ell) of X1,U2,U3,) withcolor 0.7white;

  U2 := halfcircle rotated -90 scaled 4u shifted (z1 + (-2.5u,0))
  cutbefore X1 cutafter X1; % U_{j,i}
  U3 := halfcircle scaled 4u shifted (z1 + (0,-2u))
  cutbefore X1 cutafter X1; % U_{j,k}
  draw U2 dashed evenly;
  draw U3 dashed evenly;
  draw X1;


  U4 = halfcircle rotated (180+30) xscaled 5u yscaled 4u shifted (z2+(-2u,2u)); % U_{k,i}
  U5 = halfcircle rotated (180-30) xscaled 5u yscaled 4u shifted (z2+(2u,2u)); % U_{k,i}
  fill buildcycle(U4,X2) withcolor 0.95white;
  fill buildcycle(U5,X2) withcolor 0.95white;
  fill buildcycle(U5,U4,X2) withcolor 0.7white;
  U4 := halfcircle rotated (180+30) xscaled 5u yscaled 4u shifted
  (z2+(-2u,2u)) cutbefore X2 cutafter X2; % U_{k,i}
  U5 := halfcircle rotated (180-30) xscaled 5u yscaled 4u shifted (z2+(2u,2u)) cutbefore X2 cutafter X2; % U_{k,i}
  draw U4 dashed evenly;
  draw U5 dashed evenly;
  draw X2;

  z3 = point 0.75ell of X0;
  z4 = (-6,-6) + point 0.4ell of X2;
  drawarrow (z3 + (0,-3))--z4;
  label.lft(btex $f_{i,k}$ etex, 0.5[z3 + (0,-3), z4]);

  z5 = (3,0) + point 0 of X0;
  z6 = (-3,0) + point 0.5ell of X1;
  drawarrow z5--z6;
  label.top(btex $f_{i,j}$ etex, 0.5[z5,z6]);

  z7 = (0, -3) + point 0.75ell of X1;
  z8 = (6,0) + point 0.1ell of X2;
  drawarrow z7--z8;
  label.rt(btex $f_{j,k}$ etex, 0.5[z7,z8]);
  
  X3 = X1 shifted (9u,-3u);
  X4 = X3 shifted (2.5u,0);
  X5 = X3 shifted (1.25u,-2.5u);

  fill buildcycle(X3,X4,subpath (0.75ell,ell) of X3) withcolor 0.95white;
  fill buildcycle(X4,X5) withcolor 0.95white;
  fill buildcycle(X3,X5) withcolor 0.95white;
  
  fill buildcycle(subpath (0.5ell,ell) of X3,X5,X4) withcolor 0.7white;

  t0 = xpart ((subpath(0,0.5ell) of X3) intersectiontimes (subpath(0,0.5ell) of X4));
  t1 = 0.5ell + xpart((subpath (0.5ell,0.75ell) of X3) intersectiontimes X5);
  draw (subpath(t1,t0) of X3) dashed evenly;

  draw X4 cutbefore (subpath (0,0.5ell) of X3) cutafter (subpath
  (0,0.25ell) of X5) dashed evenly;
  draw X5 cutbefore X4 cutafter (subpath(0,0.75ell) of X3) dashed evenly;
  X6 = (subpath(t1,ell) of X3)--(subpath(0,t0) of X3);
  draw X6 dashed evenly;
  
  draw X4 cutbefore (subpath (0,0.25ell) of X5);
  draw X4 cutafter (subpath (0,0.5ell) of X3);
  draw X3 cutbefore X4 cutafter (subpath (0.25ell,ell) of X5);

  draw X5 cutbefore (subpath(0,0.75ell) of X3);
  draw X5 cutafter (subpath(0.75ell,ell) of X4);

  label.lft(btex $X_{i}$ etex, point 0.5ell of X0);
  label.lft(btex $U_{i,j}$ etex, point 0 of X0);
  label.top(btex $U_{i,k}$ etex, point 0.75ell of X0);

  label.rt(btex $X_{j}$ etex, point 0 of X1);
  label.rt(btex $U_{j,i}$ etex, point 0.5ell of X1);
  label.top(btex $U_{j,k}$ etex, point 0.75ell of X1);

  label.top(btex $U_{k,i}$ etex, point 0.25length(U4) of U4);
  label.top(btex $U_{k,j}$ etex, point 0.75length(U5) of U5);
  label.bot(btex $X_{k}$ etex, point 0.75ell of X2);

  z9 = (xpart (point 0 of X1),-4u);
  z10 = z9 + (3u, 0);
  drawarrow z9--z10;
  label.top(btex glue etex, 0.5[z9,z10]);

  label.rt(btex $X$ etex, point 0 of X4);
endfig;
end;