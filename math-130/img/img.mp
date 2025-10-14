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
end;