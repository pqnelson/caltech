numeric u; u := 1pc;
numeric pi; pi := 3.1415926535897932384626433;

verbatimtex \input{macros} etex;

beginfig(0)
  path p[];
  z0 = (0,0);
  z1 = (2u,2u);
  z2 = (4u,u);
  z3 = (6u,2u);
  z4 = (8u,0);
  z5 = (6u,-2u);
  z6 = (4u,-u);
  z7 = (2u, -2u);
  p0 = z0..z1..z2..z3..z4..z5..z6..z7..cycle;
  p4 = z2..z6;

  draw p0;
  draw p4;
  label(btex $A$ etex, 0.5[z1,z7]);
  label(btex $B$ etex, 0.5[z3,z5]);
endfig;

beginfig(1)
  path p[];
  numeric i;
  z0 = (0,0);
  z1 = (2u,2u);
  z2 = (4u,u);
  z3 = (6u,2u);
  z4 = (8u,0);
  z5 = (6u,-2u);
  z6 = (4u,-u);
  z7 = (2u, -2u);
  p0 = z0..z1..z2..z3..z4..z5..z6..z7..cycle;
  p1 = (4.25u,1.2u)--(4.25u,-1.2u);
  p2 = p1 cutbefore p0 cutafter p0;

  p3 = (subpath (0, xpart (p0 intersectiontimes
          (subpath(0,0.5length(p1)) of p1))) of p0)--
    p2--
    (subpath (xpart (p0 intersectiontimes (subpath(0.5length(p1), length(p1)) of p1)), length(p0)) of p0)--
    cycle;
  p4 = z2..z6;

  fill p3 withcolor 0.25[white,red];
  draw p0;
  draw p2 dashed evenly;
  draw p4;
  label(btex $A$ etex, 0.5[z1,z7]);
  label(btex $B$ etex, 0.5[z3,z5]);
  label.bot(btex $U_{A}$ etex, z7) withcolor 0.3[black,red];
endfig;

beginfig(2)
  path p[];
  numeric i;
  z0 = (0,0);
  z1 = (2u,2u);
  z2 = (4u,u);
  z3 = (6u,2u);
  z4 = (8u,0);
  z5 = (6u,-2u);
  z6 = (4u,-u);
  z7 = (2u, -2u);
  p0 = z0..z1..z2..z3..z4..z5..z6..z7..cycle;
  p1 = (4u - 0.25u,1.25u)--(4u - 0.25u,-1.25u);
  p2 = p1 cutbefore p0 cutafter p0;

  p3 = (subpath (xpart (p0 intersectiontimes (subpath(0, 0.5length(p1)) of p1)),
                 xpart (p0 intersectiontimes (subpath(0.5length(p1), length(p1)) of p1)))
                of p0)--cycle;
  p4 = z2..z6;

  fill p3 withcolor 0.25[white,blue];
  draw p0;
  draw p2 dashed evenly;
  draw p4;
  label(btex $A$ etex, 0.5[z1,z7]);
  label(btex $B$ etex, 0.5[z3,z5]);
  label.bot(btex $U_{B}$ etex, z5) withcolor 0.3[black,blue];
endfig;

beginfig(3)
  path p[];
  z0 = (0,0);
  z1 = (2u,2u);
  z2 = (4u,u);
  z3 = (6u,2u);
  z4 = (8u,0);
  z5 = (6u,-2u);
  z6 = (4u,-u);
  z7 = (2u, -2u);
  p0 = z0..z1..z2..z3..z4..z5..z6..z7..cycle;
  p4 = z2..z6;

  z8 = point 0.5length(p4) of p4;
  p1 = z8..(z8 + (-u,-0.5u))..(z8 + (-2u,0))..(z8 + (-u,0.5u))..cycle;
  p2 = z8..(z8 + (u,-0.5u))..(z8 + (2u,0))..(z8 + (u,0.5u))..cycle;

  draw p0;
  draw p1 withcolor 0.25[red,black];
  drawarrow subpath(0,0.25length(p1)) of p1 withcolor 0.25[red,black];
  drawarrow subpath(0.5length(p1),0.75length(p1)) of p1 withcolor 0.25[red,black];
  draw p2 withcolor 0.25[blue,black];
  drawarrow subpath(0,0.25length(p2)) of p2 withcolor 0.25[blue,black];
  drawarrow subpath(0.5length(p2),0.75length(p2)) of p2 withcolor 0.25[blue,black];
  draw p4;
  label(btex $\bullet$ etex, z8);
  label.lft(btex $a$ etex, z8+(-2u,0)) withcolor 0.25[red,black];
  label.rt(btex $b$ etex, z8+(2u,0)) withcolor 0.25[blue,black];
endfig;

beginfig(4)
  numeric i, r, n, edges;
  path p[];
  r := 4u;

  n := 9;
  edges := n-1;

  for i=0 upto n:
    z[i] = r*(cosd(-i*360/n), sind(-i*360/n));
  endfor;
  for i=0 upto edges:
    p[i] = z[i]--z[i + 1];
    draw p[i];
  endfor;
  label.top(btex $a_{1}$ etex, point 0.5length(p[edges-2]) of p[edges-2]);
  label.urt(btex $b_{1}$ etex, point 0.5length(p[edges-1]) of p[edges-1]);
  label.rt(btex $a_{1}^{-1}$ etex, point 0.5length(p[edges]) of p[edges]);
  label.rt(btex $b_{1}^{-1}$ etex, point 0.5length(p0) of p0);
  label.lrt(btex $\dots$ etex, point 0.5length(p1) of p1);
  label.bot(btex $a_{g}$ etex, point 0.5length(p[2]) of p[2]);
  label.llft(btex $b_{g}$ etex, point 0.5length(p[3]) of p[3]);
  label.lft(btex $a_{g}^{-1}$ etex, point 0.5length(p[4]) of p[4]);
  label.lft(btex $b_{g}^{-1}$ etex, point 0.5length(p5) of p5);
endfig;

beginfig(5)
  numeric i, r, n, edges;
  path p[], b, polygon;
  r := 4u;
  b = fullcircle scaled 5.5u;
  n := 9;
  edges := n-1;

  for i=0 upto n:
    z[i] = r*(cosd(-i*360/n), sind(-i*360/n));
  endfor;
  for i=0 upto edges:
    p[i] = z[i]--z[i + 1];
  endfor;
  polygon = p0
  for i=1 upto edges:
    --p[i]
  endfor--cycle;
  
  fill polygon withcolor 0.25[white,red];
  fill b withcolor white;
  draw polygon withcolor 0.33[red,black];
  draw b withcolor 0.33[red,black];
  label.lft(btex $A$ etex, point 0 of b) withcolor 0.33[red,black];
endfig;

beginfig(6)
  numeric i, r, n, edges;
  path p[], b, polygon;
  r := 4u;
  b = fullcircle scaled 5.5u;
  n := 9;
  edges := n-1;

  for i=0 upto n:
    z[i] = r*(cosd(-i*360/n), sind(-i*360/n));
  endfor;
  for i=0 upto edges:
    p[i] = z[i]--z[i + 1];
  endfor;
  polygon = p0
  for i=1 upto edges:
    --p[i]
  endfor--cycle;
  
  fill b withcolor 0.25[white,blue];
  draw polygon;
  draw b withcolor 0.25[blue,black];
  label.rt(btex $B$ etex, point 0 of b) withcolor 0.25[blue,black];
endfig;

beginfig(7)
  path reals, s;
  s = fullcircle scaled 4u shifted (0, -3u);
  reals = (-5u,0)--(5u,0);

  %drawdblarrow reals;
  draw s;
  % neighborhood of z0
  z0 = point 0.1*length(s) of s;
  label(btex $\bullet$ etex, z0);
  z1 = point 0.05length(s) of s;
  z2 = point 0.15*length(s) of s;
  label(btex $)$ etex, (0,0)) rotated -(3*360/20) shifted z1; 
  label(btex $($ etex, (0,0)) rotated -(3*360/20) shifted z2;
  % first interval
  z3 = (-3.75u,0);
  z4 = z3 + (0.5u, 0);  % lparen
  z5 = z3 + (-0.5u, 0); % rparen
  % second interval
  z6 = z3 + (1.75u, 0);
  z7 = z4 + (1.75u, 0); % lparen
  z8 = z5 + (1.75u, 0); % rparen
  % third interval
  z9 = z6 + (1.75u, 0);
  z10 = z7 + (1.75u, 0); % lparen
  z11 = z8 + (1.75u, 0); % rparen
  % third interval
  z12 = z9 + (1.75u, 0);
  z13 = z10 + (1.75u, 0); % lparen
  z14 = z11 + (1.75u, 0); % rparen
  % draw reals, except the intervals
  drawarrow (z5 + (-1,0))--(-5u,0);
  draw (z5 + (1,0))--(z7 + (-1, 0));
  draw (z8 + (1,0))--(z10 + (-1, 0));
  draw (z11 + (1,0))--(z13 + (-1, 0));
  drawarrow (z13 + (1,0))--(z13 + (0.75u,0));

%  draw (z4 + (1,0))--(z5 + (-1,0)) withcolor white withpen pencircle scaled 2;
  label(btex $\bullet$ etex, z3) withcolor red;
  label(btex $\rparen$ etex, z4) withcolor red;
  label(btex $\lparen$ etex, z5) withcolor red;
  label(btex $\bullet$ etex, z6) withcolor red;
  label(btex $\rparen$ etex, z7) withcolor red;
  label(btex $\lparen$ etex, z8) withcolor red;
  label(btex $\bullet$ etex, z9) withcolor red;
  label(btex $\rparen$ etex, z10) withcolor red;
  label(btex $\lparen$ etex, z11) withcolor red;
  label(btex $\bullet$ etex, z12) withcolor red;
  label(btex $\rparen$ etex, z13) withcolor red;
  label(btex $\lparen$ etex, z14) withcolor red;
  draw z4--z5 withcolor red;
  draw z7--z8 withcolor red; draw z10--z11 withcolor red;
  draw z13--z14 withcolor red;
endfig;

beginfig(8)
  path p[];
  p0 = fullcircle scaled 4u shifted (-2u,0);
  p1 = fullcircle scaled 4u shifted (2u,0);
  draw p0 withcolor red;
  draw p1 withcolor blue;
  label(btex $\bullet$ etex, (0,0));
endfig;


beginfig(9)
  path p[];
  numeric r; r := 2u;
  p0 = fullcircle scaled r shifted (0,r);
  p1 = fullcircle scaled r shifted (0,-r);
  p2 = fullcircle scaled r;
  draw p2 withcolor red;
  draw p1 withcolor blue;
  draw p0 withcolor blue;
  label(btex $\bullet$ etex, (0,-0.5r));
  label(btex $\bullet$ etex, (0,0.5r));
endfig;

beginfig(10)
  path p[];
  z0 = (0, 3u); z1 = (0, -3u);
  z2 = (-u,0); z3 = (u, 0);
  z4 = (-2u, 0); z5 = (2u, 0);
  p0 = z0..z2..z1;
  p1 = z0..z4..z1;
  p2 = z0..z3..z1;
  p3 = z0..z5..z1;
  draw p0 withcolor red;
  draw p1 withcolor red;
  draw p2 withcolor blue;
  draw p3 withcolor blue;
  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z1);
endfig;

beginfig(11)
  path p[]; numeric r; r := 2u;
  p0 = fullcircle scaled 4u;
  z1 = (cosd(90), sind(90));
  p1 = fullcircle scaled r shifted ((1.5r)*z1);
  z2 = (cosd(90 + 120), sind(90 + 120));
  p2 = fullcircle scaled r shifted ((1.5r)*z2);
  z3 = (cosd(90 + 2*120), sind(90 + 2*120));
  p3 = fullcircle scaled r shifted ((1.5r)*z3);
  draw p0 withcolor red;
  draw p1 withcolor blue;
  draw p2 withcolor blue;
  draw p3 withcolor blue;
  label(btex $\bullet$ etex, r*z1);
  label(btex $\bullet$ etex, r*z2);
  label(btex $\bullet$ etex, r*z3);
endfig;

beginfig(12)
  path p[]; numeric i;
  z0 = (0,0);
  z1 = (-2u,-2u);
  z2 = (2u,-2u);
  p0 = fullcircle scaled 4u shifted (0,2u);
  p1 = z0..(-u,-0.5u)..z1; % correct
  p2 = z0..(u,-0.5u)..z2; % correct
  p3 = z1..(0.5[z1,z2] + (0,-0.5u))..z2;
  p4 = z1..(0.5[z1,z2] + (0,0.5u))..z2;
  draw p0 withcolor blue;
  draw p1 withcolor red; draw p2 withcolor red;
  draw p3 withcolor blue;
  draw p4 withcolor blue;
  p5 = z1..(0.5[z1,z2] + (0,-2u))..z2;
  draw p5 withcolor red;
  for i=0 upto 2:
    label(btex $\bullet$ etex, z[i]);
  endfor;
endfig;

% Fall -- lecture 4
beginfig(13)
  path triangle;
  numeric r,i; r := 2u;
  z0 = r*(cosd(90), sind(90));
  z1 = r*(cosd(90+120), sind(90+120));
  z2 = r*(cosd(90+240), sind(90+240));
  triangle = z0--z1--z2--cycle;
  fill triangle withcolor 0.9white;
  draw triangle;
  for i=0 upto 2:
    label(btex $\bullet$ etex, z[i]);
  endfor;
endfig;

beginfig(14)
  path triangle;
  numeric r,i; r := 2u;
  z0 = (2u,0);
  z1 = (0, 2u);
  z2 = (-2u,0);
  z3 = (0,-2u);
  draw z0--z2 dashed evenly;
  draw z0--z1--z2--z3--cycle;
  draw z1--z3;
endfig;

% Delta-complexes of the circle
beginfig(15)
  path p;
  p = fullcircle scaled 4u;
  z0 = point 0 of p;
  draw p;
  label(btex $\bullet$ etex, z0);
endfig;
beginfig(16)
  path p;
  p = fullcircle scaled 4u;
  z0 = point 0 of p;
  z1 = point 0.5length(p) of p;
  draw p;
  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z1);
endfig;
beginfig(17)
  path p;
  p = fullcircle scaled 4u;
  z0 = point 0 of p;
  z1 = point (length(p)/3) of p;
  z2 = point (2length(p)/3) of p;
  draw p;
  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z1);
  label(btex $\bullet$ etex, z2);
endfig;
% Delta-complex for S^2
beginfig(18)
  path p[];
  numeric i,r; r := 4u;
  p0 = fullcircle scaled r;
  z0 = point 0 of p0;
  z3 = point 0.5length(p0) of p0;
  z1 = 0.5[z0,z3] + (0,0.5u);
  z2 = 0.5[z0,z3] - (0,0.5u);
  p1 = z0..z1..z3; % dashed
  p2 = z3..z2..z0;

  z4 = point (2*length(p1)/3) of p1;
  z5 = point (length(p2)/3) of p2;

  draw p0; draw p2;
  draw p1 dashed evenly;

  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z4);
  label(btex $\bullet$ etex, z5);
endfig;

% torus T^2
beginfig(19)
  numeric w; w := 4u;
  z0 = (w,0); % se
  z1 = (w,w); % ne
  z2 = (0,w); % nw
  z3 = (0,0); % sw
  draw z0--z1--z2--z3--cycle;
  drawarrow (0.5[z0,z1] - (0,ahlength))--(0.5[z0,z1]); 
  drawarrow (0.5[z3,z2] - (0,ahlength))--(0.5[z3,z2]);
  drawarrow (0.5[z2,z1] - (ahlength,0))--(0.5[z2,z1]);
  drawarrow (0.5[z2,z1])--(0.5[z2,z1] + (ahlength,0));
  drawarrow (0.5[z3,z0] - (ahlength,0))--(0.5[z3,z0]);
  drawarrow (0.5[z3,z0])--(0.5[z3,z0] + (ahlength,0));

  label.rt(btex $a$ etex, 0.5[z0,z1]);
  label.lft(btex $a$ etex, 0.5[z3,z2]);
  label.bot(btex $b$ etex, 0.5[z3,z0]);
  label.top(btex $b$ etex, 0.5[z2,z1]);
endfig;
% torus T^2
beginfig(20)
  numeric w; w := 4u;
  z0 = (w,0); % se
  z1 = (w,w); % ne
  z2 = (0,w); % nw
  z3 = (0,0); % sw
  draw z0--z1--z2--z3--cycle;
  draw z3--z1;
  drawarrow (0.5[z0,z1] - (0,ahlength))--(0.5[z0,z1]); 
  drawarrow (0.5[z3,z2] - (0,ahlength))--(0.5[z3,z2]);
  drawarrow (0.5[z2,z1] - (ahlength,0))--(0.5[z2,z1]);
  drawarrow (0.5[z2,z1])--(0.5[z2,z1] + (ahlength,0));
  drawarrow (0.5[z3,z0] - (ahlength,0))--(0.5[z3,z0]);
  drawarrow (0.5[z3,z0])--(0.5[z3,z0] + (ahlength,0));

  label.rt(btex $a$ etex, 0.5[z0,z1]);
  label.lft(btex $a$ etex, 0.5[z3,z2]);
  label.bot(btex $b$ etex, 0.5[z3,z0]);
  label.top(btex $b$ etex, 0.5[z2,z1]);
endfig;

beginfig(21)
  path p[];
  numeric w,i,sides,theta; w := 4u;
  sides := 9;
  theta := 360/sides;
  for i=0 upto sides:
    z[i] = w*(cosd((i+1)*theta), sind((i+1)*theta));
  endfor;
  p0 = z0
    for i=1 upto sides:
    --z[i]
  endfor--cycle;

  for i=2 upto (sides-2):
    draw z[i]--z0;
  endfor;
  draw p0;
endfig;

% simplicial complex for the circle
beginfig(22)
  path p;
  p = fullcircle scaled 4u;
  z0 = point 0 of p;
  z1 = point (length(p)/3) of p;
  z2 = point (2length(p)/3) of p;
  draw p;
  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z1);
  label(btex $\bullet$ etex, z2);
  label.rt(btex $v_{0}$ etex, z0);
  label.ulft(btex $v_{1}$ etex, z1);
  label.llft(btex $v_{2}$ etex, z2);
  label.urt(btex $e^{1}_{0,1}$ etex, point (length(p)/6) of p);
  label.lft(btex $e^{1}_{1,2}$ etex, point 0.5length(p) of p);
  label.lrt(btex $e^{1}_{2,0}$ etex, point (5length(p)/6) of p);
endfig;

beginfig(23)
  path p[];
  numeric i,r;
  r := 3u;
  z0 = r*(cosd(90),sind(90));
  z1 = r*(cosd(90+120), sind(90+120));
  z2 = r*(cosd(90+240), sind(90+240));
  p0 = z0--z1--z2--cycle;
  z3 = 0.5[z0,z1];
  z4 = 0.5[z1,z2];
  z5 = 0.5[z2,z0];
  p1 = z5--z1;
  p2 = z4--z0;
  p3 = z3--z2;
  z6 = p1 intersectionpoint p2;
  draw p1;
  draw p2;
  draw p3;
  draw p0 dashed evenly;
  for i=3 upto 6:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  for i=0 upto 2:
    drawdot z[i] withpen pencircle scaled 3 withcolor white;
    label(btex $\circ$ etex, z[i]);
  endfor;
endfig;

%%% Lecture 5
beginfig(24)
  numeric i,r; r := 3u;
  z0 = r*(cosd(90), sind(90));
  z1 = r*(cosd(90+120), sind(90+120));
  z2 = r*(cosd(90+240), sind(90+240));
  drawarrow z0--(0.5[z0,z1]);
  draw (0.5[z0,z1])--z1;
  drawarrow z1--(0.5[z1,z2]);
  draw (0.5[z1,z2])--z2;
  drawarrow z2--(0.5[z2,z0]);
  draw (0.5[z2,z0])--z0;
  label.top(btex $v_{0}$ etex, z0);
  label.llft(btex $v_{1}$ etex, z1);
  label.lrt(btex $v_{2}$ etex, z2);
  for i=0 upto 2:
    label(btex $\bullet$ etex, z[i]);
  endfor;
endfig;

beginfig(25) % S^1
  path p[];
  p0 = fullcircle scaled 3u;
  z0 = point 0 of p0;
  p1 = subpath (0,0.5length(p0)) of p0;
  p2 = subpath (0.5length(p0), length(p0)) of p0;
  drawarrow p1;
  draw p2;
  label(btex $\bullet$ etex, z0);
  label.rt(btex $a$ etex, z0);
  label.lft(btex $e$ etex, point 0.5length(p0) of p0);
endfig;

beginfig(26) % S^1
  numeric i;
  path p[];
  p0 = fullcircle scaled 3u;
  z0 = point 0 of p0;
  z1 = point 0.5length(p0) of p0;
  p1 = subpath (0.5length(p0),0) of p0;
  p2 = subpath (0.5length(p0), length(p0)) of p0;
  for i=0 upto 1:
    drawarrow subpath(0,0.5length(p[i+1])) of p[i+1];
    draw p[i+1];
    label(btex $\bullet$ etex, z[i]);
  endfor;
  draw p2;
  label.rt(btex $b$ etex, z0);
  label.lft(btex $a$ etex, z1);
  label.top(btex $e_{1}$ etex, point 0.5length(p1) of p1);
  label.bot(btex $e_{2}$ etex, point 0.5length(p2) of p2);
endfig;

beginfig(27)
  picture triangle;
  path p[];
  numeric i,r; r:=2u;
  z0 = r*(cosd(90), sind(90));
  z1 = r*(cosd(90+120), sind(90+120));
  z2 = r*(cosd(90+240), sind(90+240));
  p0 = z0--z1; p1 = z1--z2; p2 = z2--z0;

  triangle := image(
    for i=0 upto 2:
      label(btex $\bullet$ etex, z[i]);
      drawarrow subpath(0,0.5length(p[i])) of p[i];
      draw subpath(0.5length(p[i]),length(p[i])) of p[i];
    endfor;
    label.top(btex $a_{0}$ etex, z0);
    label.llft (btex $a_{1}$ etex, z1);
    label.lrt(btex $a_{2}$ etex, z2);
    label.ulft(btex $e_{0}$ etex, point 0.5length(p0) of p0);
    label.bot(btex $e_{1}$ etex, point 0.5length(p1) of p1);
    label.urt(btex $e_{2}$ etex, point 0.5length(p2) of p2);
    );
  draw triangle;
  label(btex $\sigma_{+}$ etex, (0,0));
  label(btex $\sigma_{-}$ etex, (0,-r-3u));
  draw triangle shifted (0,-r-3u);
endfig;

%% p = path
% vardef arrowhead expr p =
%   save q,e; path q; pair e;
%   e = point length p of p;
%   q = gobble(p shifted -e cutafter makepath(pencircle scaled 2ahlength))
%     cuttings;
%   (q rotated .5ahangle & reverse q rotated -.5ahangle -- cycle)  shifted e
% enddef;

%% Lecture 7
beginfig(28)
  path e[];
  numeric w,i,ell; w := 3u;
  z0 = (0,0);
  z1 = (w,0);
  z2 = (w,w);
  z3 = (0,w);
  e0 = z0--z1; % bottom
  e1 = z2--z3; % top
  e2 = z1--z2; % right
  e3 = z3--z0; % left
  e4 = z0--z2; % diagonal

  % e0 and e1
  for i=0 upto 1:
    ell := length(e[i]);
    drawarrow subpath(0,0.5ell) of e[i];
    draw subpath(0.5ell,ell) of e[i];
  endfor;
  % e2
  drawarrow z1--(0.5[z1,z2] - 0.5(0,ahlength));
  drawarrow (0.5[z1,z2] - 0.5(0,ahlength))--(0.5[z1,z2] + 0.5(0,ahlength));
  draw (0.5[z1,z2] + 0.5(0,ahlength))--z2;
  % e3
  drawarrow z3--(0.5[z3,z0] + 0.5(0,ahlength));
  drawarrow (0.5[z3,z0] + 0.5(0,ahlength))--(0.5[z3,z0] - 0.5(0,ahlength));
  draw (0.5[z3,z0] + 0.5(0,ahlength))--z0;
  % e4
  drawarrow z0--(0.5[z0,z2] - 0.5ahlength*(1,1));
  drawarrow (0.5[z0,z2] - 0.5ahlength*(1,1))--(0.5[z0,z2] + 0.5ahlength*(1,1));
  drawarrow (0.5[z0,z2] + 0.5ahlength*(1,1))--(0.5[z0,z2] + 1.5ahlength*(1,1));
  draw (0.5[z0,z2] + 1.5ahlength*(1,1))--z2;

  label.bot(btex $e_{1}$ etex, 0.5[z0,z1]);
  label.rt(btex $e_{2}$ etex, 0.5[z1,z2]);
  label.top(btex $e_{1}$ etex, 0.5[z2,z3]);
  label.lft(btex $e_{2}$ etex, 0.5[z3,z0]);
  label.lrt(btex $e_{3}$ etex, 0.5[z0,z2]);

  for i=0 upto 3:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  label.llft(btex $a$ etex, z0);
  label.lrt(btex $b$ etex, z1);
  label.urt(btex $a$ etex, z2);
  label.ulft(btex $b$ etex, z3);
endfig;

% lecture 7
beginfig(29)
  path p[];
  z0 = (0,0);
  z1 = (2u,-u);
  z2 = (u,2u);
  z3 = z0 + (4u,0);
  z4 = z1 + (4u,0);
  z5 = z2 + (4u,0);
  draw z0--z1--z2--cycle;
  draw z2--z5;
  draw z1--z4;
  draw z0--z3 dashed evenly;
  draw z3--z4 dashed evenly;
  draw z3--z5 dashed evenly;
  draw z4--z5;
endfig;

beginfig(30)
  path p[]; numeric i;
  z0 = (0,0);           % v_{1}
  z1 = (2u,-u);         % v_{n}
  z2 = (2u,3u);         % v_{0} 
  z3 = z0 + 1.5*(4u,0); % w_{1}
  z4 = z1 + 1.5*(4u,0); % w_{n}
  z5 = z2 + 1.5*(4u,0); % w_{0}
  draw z0--z1--z2--cycle;
  draw z2--z5;
  draw z1--z4;
  draw z0--z3 dashed evenly;
  draw z3--z4 dashed evenly;
  draw z3--z5 dashed evenly;
  draw z4--z5;

  for i=0 upto 5:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  label.top(btex $v_{0}$ etex, z2);
  label.lft(btex $v_{1}$ etex, z0);
  label.lrt(btex $v_{n}$ etex, z1);
  label.llft(btex $\dots$ etex, 0.5[z0,z1]);

  label.ulft(btex $w_{1}$ etex, z3);
  label.top(btex $w_{0}$ etex, z5);
  label.rt(btex $w_{n}$ etex, z4);
endfig;

beginfig(31)
  path p[]; numeric i;
  z0 = 0.5*(0,0);        % v_{1}
  z1 = 0.5*(2u,-u);         % v_{n}
  z2 = 0.5*(2u,3u);         % v_{0} 
  z3 = z0 + 0.5*(4u,0);
  z4 = z1 + 0.5*(4u,0);
  z5 = z2 + 0.5*(4u,0);
  draw z0--z1--z2--cycle;
  draw z2--z5;
  draw z1--z4;
  draw z0--z3 dashed evenly;
  draw z3--z4 dashed evenly;
  draw z3--z5 dashed evenly;
  draw z4--z5;

  for i=0 upto 1:
    label(btex $\bullet$ etex, z[i]);
  endfor;

  for i=2 upto 5:
    label(btex $\bullet$ etex, z[i]) withcolor red;
  endfor;
  % label.top(btex $v_{0}$ etex, z2);
  % label.lft(btex $v_{1}$ etex, z0);
  % label.lrt(btex $v_{n}$ etex, z1);
  % label.llft(btex $\dots$ etex, 0.5[z0,z1]);

  % label.ulft(btex $w_{1}$ etex, z3);
  % label.top(btex $w_{0}$ etex, z5);
  % label.rt(btex $w_{n}$ etex, z4);
endfig;

beginfig(32)
  path p[]; numeric i; color c[];
  z0 = 0.5*(0,0);        % v_{1}
  z1 = 0.5*(2u,-u);         % v_{n}
  z2 = 0.5*(2u,3u);         % v_{0} 
  z3 = z0 + 0.5*(4u,0);
  z4 = z1 + 0.5*(4u,0);
  z5 = z2 + 0.5*(4u,0);
  draw z0--z1--z2--cycle;
  draw z2--z5;
  draw z1--z4;
  draw z0--z3 dashed evenly;
  draw z3--z4 dashed evenly;
  draw z3--z5 dashed evenly;
  draw z4--z5;
  c0 = red; %v_{1}
  c1 = black; %v_{n}
  c2 = red; %v_{0}
  c3 = red; % w_{1}
  c4 = red; % w_{n}
  c5 = black; % w_{0}

  for i=0 upto 5:
    label(btex $\bullet$ etex, z[i]) withcolor c[i];
  endfor;
  % label.top(btex $v_{0}$ etex, z2);
  % label.lft(btex $v_{1}$ etex, z0);
  % label.lrt(btex $v_{n}$ etex, z1);
  % label.llft(btex $\dots$ etex, 0.5[z0,z1]);

  % label.ulft(btex $w_{1}$ etex, z3);
  % label.top(btex $w_{0}$ etex, z5);
  % label.rt(btex $w_{n}$ etex, z4);
endfig;


beginfig(33)
  path p[]; numeric i; color c[];
  z0 = 0.5*(0,0);        % v_{1}
  z1 = 0.5*(2u,-u);         % v_{n}
  z2 = 0.5*(2u,3u);         % v_{0} 
  z3 = z0 + 0.5*(4u,0);
  z4 = z1 + 0.5*(4u,0);
  z5 = z2 + 0.5*(4u,0);
  draw z0--z1--z2--cycle;
  draw z2--z5;
  draw z1--z4;
  draw z0--z3 dashed evenly;
  draw z3--z4 dashed evenly;
  draw z3--z5 dashed evenly;
  draw z4--z5;
  c0 = red; %v_{1}
  c1 = red; %v_{n}
  c2 = red; %v_{0}
  c3 = black; % w_{1}
  c4 = red; % w_{n}
  c5 = black; % w_{0}

  for i=0 upto 5:
    label(btex $\bullet$ etex, z[i]) withcolor c[i];
  endfor;
endfig;

beginfig(34)
  path p[]; numeric i; pair v[];
  z0 = 0.5*(0,0u);        % v_{1}
  z1 = 0.5*(2u,-u);         % v_{n}
  z2 = 0.5*(2u,3u);         % v_{0} 
  z3 = z0 + 0.5*(4u,0); % w_1
  z4 = z1 + 0.5*(4u,0); % w_n
  z5 = z2 + 0.5*(4u,0); % w_0
  v0 = z2; % v_0
  v1 = z5; % w_0
  v2 = z3; % w_1
  v3 = z4; % w_n
  draw v0--v1; draw v1--v3;
  draw v0--v2; draw v0--v3;
  draw v2--v1 dashed evenly;
  draw v2--v3;
endfig;

beginfig(35)
  path p[]; numeric i; pair v[];
  z0 = 0.5*(0,0u);        % v_{1}
  z1 = 0.5*(2u,-u);         % v_{n}
  z2 = 0.5*(2u,3u);         % v_{0} 
  z3 = z0 + 0.5*(4u,0); % w_1
  z4 = z1 + 0.5*(4u,0); % w_n
  z5 = z2 + 0.5*(4u,0); % w_0
  v0 = z2; % v_0
  v1 = z0; % v_1
  v2 = z3; % w_1
  v3 = z4; % w_n
  draw v0--v1; % v_0 -- v_1
  draw v1--v3; % v_1 -- w_n
  draw v0--v3; % v_0 -- w_n
  draw v0--v2 dashed evenly; % v_0 -- w_1
  draw v2--v1 dashed evenly; % w_1 -- v_1
  draw v2--v3 dashed evenly; % w_1 -- w_n
endfig;

beginfig(36)
  path p[]; numeric i; pair v[];
  z0 = 0.5*(0,0u);        % v_{1}
  z1 = 0.5*(2u,-u);         % v_{n}
  z2 = 0.5*(2u,3u);         % v_{0} 
  z3 = z0 + 0.5*(4u,0); % w_1
  z4 = z1 + 0.5*(4u,0); % w_n
  z5 = z2 + 0.5*(4u,0); % w_0
  v0 = z2; % v_0
  v1 = z0; % v_1
  v2 = z1; % v_n
  v3 = z4; % w_n
  draw v0--v1; draw v1--v3 dashed evenly;
  draw v0--v2; draw v0--v3;
  draw v2--v1;
  draw v2--v3;
endfig;

% lecture 8
beginfig(37)
  numeric w; w := 2u;
  z0 = (0,0);
  z1 = (3u,0);
  label(btex $\partial$ etex, z0);
  label.rt(btex $[\alpha] = $ etex, z0);
  label(btex $[\partial\alpha]$ etex, z1);

  z2 = (z0 + (0,-w));
  drawarrow (z2--(z0 + (0,-6)));
  label.bot(btex Connecting morphism etex,z2);
  
  w := 1.5u;
  z3 = (z1 + (-3,-w));
  z4 = (z3 + (2u,0));
  drawarrow (z4--z3--(z1 + (-3,-6)));
  label.rt(btex Boundary morphism etex, z4);
endfig;

% lecture 13
% torus T^2
beginfig(38)
  numeric w,i; w := 4u;
  z0 = (w,0); % se
  z1 = (w,w); % ne
  z2 = (0,w); % nw
  z3 = (0,0); % sw
  draw z0--z1--z2--z3--cycle;
  drawarrow (0.5[z0,z1] - (0,ahlength))--(0.5[z0,z1]); 
  drawarrow (0.5[z3,z2] - (0,ahlength))--(0.5[z3,z2]);
  drawarrow (0.5[z2,z1] - (ahlength,0))--(0.5[z2,z1]);
  drawarrow (0.5[z2,z1])--(0.5[z2,z1] + (ahlength,0));
  drawarrow (0.5[z3,z0] - (ahlength,0))--(0.5[z3,z0]);
  drawarrow (0.5[z3,z0])--(0.5[z3,z0] + (ahlength,0));
  for i=0 upto 3:
    label(btex $\bullet$ etex, z[i]);
  endfor;

  label.rt(btex $a$ etex, 0.5[z0,z1]);
  label.lft(btex $a$ etex, 0.5[z3,z2]);
  label.bot(btex $b$ etex, 0.5[z3,z0]);
  label.top(btex $b$ etex, 0.5[z2,z1]);
  label.lrt(btex $p$ etex, z0);
  label.urt(btex $p$ etex, z1);
  label.ulft(btex $p$ etex, z2);
  label.llft(btex $p$ etex, z3);
endfig;

% torus T^2
beginfig(39)
  numeric w,i,ell; w := 4u;
  path p[];
  z0 = (w,0); % se
  z1 = (w,w); % ne
  z2 = (0,w); % nw
  z3 = (0,0); % sw
  draw z0--z1--z2--z3--cycle;
  drawarrow (0.5[z0,z1] - (0,ahlength))--(0.5[z0,z1]); 
  drawarrow (0.5[z3,z2] - (0,ahlength))--(0.5[z3,z2]);
  drawarrow (0.5[z2,z1] - (ahlength,0))--(0.5[z2,z1]);
  drawarrow (0.5[z2,z1])--(0.5[z2,z1] + (ahlength,0));
  drawarrow (0.5[z3,z0] - (ahlength,0))--(0.5[z3,z0]);
  drawarrow (0.5[z3,z0])--(0.5[z3,z0] + (ahlength,0));
  for i=0 upto 3:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  p0 = fullcircle rotated (90+45) scaled 0.85w shifted 0.5[z1,z3];
  ell = length(p0);
  drawarrow (subpath (0.025ell,0.975ell) of p0) withcolor red;

  label.rt(btex $a$ etex, 0.5[z0,z1]);
  label.lft(btex $a$ etex, 0.5[z3,z2]);
  label.bot(btex $b$ etex, 0.5[z3,z0]);
  label.top(btex $b$ etex, 0.5[z2,z1]);
  label.lrt(btex $p$ etex, z0);
  label.urt(btex $p$ etex, z1);
  label.ulft(btex $p$ etex, z2);
  label.llft(btex $p$ etex, z3);
endfig;

% X^{1} of the torus
beginfig(40)
  path p[]; numeric i,ell;
  p0 = fullcircle xscaled 4u yscaled 2u shifted (-2u,0);
  p1 = fullcircle rotated 180 xscaled 4u yscaled 2u shifted (2u,0);
  ell = length(p0);
  for i=0 upto 1:
    drawarrow subpath(0.025ell,0.95ell) of p[i];
  endfor;
  label(btex $\bullet$ etex, (0,0));
  label.top(btex $a$ etex, point 0.25ell of p0);
  label.bot(btex $b$ etex, point 0.25ell of p1);
endfig;

% X^{1}/(X^{1}\setminus\{b\}) of the torus
beginfig(41)
  path p[]; numeric i,ell;
  p0 = fullcircle xscaled 4u yscaled 2u shifted (-2u,0);
  %p1 = fullcircle rotated 180 xscaled 4u yscaled 2u shifted (2u,0);
  ell = length(p0);
  for i=0 upto 0:
    drawarrow subpath(0.025ell,0.95ell) of p[i];
  endfor;
  label(btex $\bullet$ etex, (0,0));
  label.top(btex $a$ etex, point 0.25ell of p0);
  %label.bot(btex $b$ etex, point 0.25ell of p1);
endfig;

% torus T^2
beginfig(42)
  numeric w,i,ell; w := 4u;
  path p[];
  z0 = (w,0); % se
  z1 = (w,w); % ne
  z2 = (0,w); % nw
  z3 = (0,0); % sw
  z4 = (0,u); % y
  z5 = (w,u); % y
  draw z0--z1--z2--z3--cycle;
  drawarrow (0.5[z0,z1] - (0,ahlength))--(0.5[z0,z1]); 
  drawarrow (0.5[z3,z2] - (0,ahlength))--(0.5[z3,z2]);
  drawarrow (0.5[z2,z1] - (ahlength,0))--(0.5[z2,z1]); % b
  drawarrow (0.5[z2,z1])--(0.5[z2,z1] + (ahlength,0));
  drawarrow (0.5[z3,z0] - (ahlength,0))--(0.5[z3,z0]);
  drawarrow (0.5[z3,z0])--(0.5[z3,z0] + (ahlength,0));
  for i=0 upto 3:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  p0 = fullcircle rotated (90+45) scaled 0.85w shifted 0.5[z1,z3];
  ell = length(p0);
  drawarrow (subpath (0.025ell,0.975ell) of p0) withcolor red;

  label(btex $\circ$ etex, z4);
  label(btex $\circ$ etex, z5);
  label.lft(btex $y$ etex, z4);
  label.rt(btex $y$  etex, z5);
  label.rt(btex $a$ etex, 0.5[z0,z1]);
  label.lft(btex $a$ etex, 0.5[z3,z2]);
  label.bot(btex $b$ etex, 0.5[z3,z0]);
  label.top(btex $b$ etex, 0.5[z2,z1]);
  label.lrt(btex $p$ etex, z0);
  label.urt(btex $p$ etex, z1);
  label.ulft(btex $p$ etex, z2);
  label.llft(btex $p$ etex, z3);
endfig;

% genus g-surface for g=2
def midpoint(expr a) = if path a: (point .5*length a of a)
  else: .5(llcorner a + urcorner a) fi
enddef;

marksize=4pt;

% draw a single perpendicular mark on path `p`, arclength of `a`
def draw_mark(expr p, a) =
  begingroup
    save t, dm; pair dm;
    t = arctime a of p;
    dm = marksize*unitvector direction t of p
      rotated 90;
    draw (-.5dm.. .5dm) shifted point t of p;
  endgroup
enddef;

% draws BOTH `n` perpendicular lines centered around the midpoint of path `p`
% AND the path `p` itself
def draw_marked(expr p, n) =
  begingroup
    save amid;
    amid = .5*arclength p;
    for i=-(n-1)/2 upto (n-1)/2:
      draw_mark(p, amid+.6marksize*i);
    endfor
    draw p;
  endgroup
enddef;

% I wish I had a better way to draw arrows in the middle of paths,
% similar to `draw_marked`, but I don't...alas...
def draw_mid_dblarrow(expr p) =
  begingroup;
    path m_q, m_c, m_r;
    draw (subpath (0.5length(p),length(p)) of p);
    m_c = fullcircle scaled ahlength shifted point 1/2*length(p) of p;
    m_q = p cutbefore m_c;
    drawarrow cuttings;
			
    m_r = p cutafter m_c;
    drawarrow subpath (0, xpart((reverse p) intersectiontimes m_c ) ) of p;
  endgroup;
enddef;

def draw_mid_arrow(expr p) = 
  draw subpath (0.5length(p), length(p)) of p;
  drawarrow subpath (0, 0.5length(p)) of p;
enddef;

beginfig(43)
  numeric i,r,theta,offset;
  path p[];
  theta = 360/8;
  offset = theta/2;
  r := 4u;

  for i=0 upto 7:
    z[i] = r*(cosd((i-1)*theta - offset),sind((i-1)*theta - offset));
  endfor;
  for i=0 upto 6:
    p[i] = z[i]--z[i+1];
  endfor;
  p7 = z7--z0;

  for i=0 upto 1:
    draw_mid_arrow(p[4i]);
    draw_mid_arrow(reverse(p[4i+2]));
  endfor;
  % now draw the b labeled edges
  for i=0 upto 1:
    draw_mid_dblarrow(p[4*i+1]);
    draw_mid_dblarrow(reverse(p[4i+3]));
  endfor;
  label.urt(btex $a_{1}$ etex, midpoint(p2)); % good
  label.lrt(btex $a_{1}$ etex, midpoint(p0)); % good
  label.rt(btex $b_{1}$ etex, midpoint(p1));
  label.top(btex $b_{1}$ etex, midpoint(p3));
  label.ulft(btex $a_{2}$ etex, midpoint(p4));
  label.llft(btex $a_{2}$ etex, midpoint(p6)); % good
  label.lft(btex $b_{2}$ etex, midpoint(p5));
  label.bot(btex $b_{2}$ etex, midpoint(p7));
endfig;



def midarrow_od (expr p, t) =
  draw p;
  filldraw arrowhead subpath(0,
      arctime(t*(arclength(p)-ahlength)+ahlength) of p) of p;
enddef;

def midarrow (expr p, t) =
  begingroup
    filldraw arrowhead subpath(0,t) of p;
  endgroup
enddef;

def draw_mid_arr(expr p, n) =
  begingroup
    save amid;
    amid = 0.5*arclength(p);
    for i=-(n-1)/2 upto (n-1)/2:
      midarrow(p, arctime(amid+(i+1)*ahlength) of p);
    endfor;
    draw p;
  endgroup
enddef;

beginfig(44)
  path p[],e;
  numeric i,r,theta,N,offset; r := 4pc;
  N=6;
  theta = 360/N;
  offset=0; % usually theta/2
  for i=0 upto N-1:
    z[i] = r*(cosd((i-1)*theta - offset),sind((i-1)*theta - offset));
  endfor;
  for i=0 upto (N-2):
    p[i] = z[i]--z[i+1];
  endfor;
  p[N-1] = z[N-1]--z0;
  e = fullcircle rotated 2theta scaled r;
  drawarrow (subpath (0.025length(e),0.975length(e)) of e) withcolor red;

  draw_mid_arrow(p0);
  draw_mid_arrow(p1);
  draw_mid_dblarrow(p2);
  draw_mid_dblarrow(p3);
  draw_mid_arr(p4, 3);
  draw_mid_arr(p5, 3);

  label.lrt(btex $a_{1}$ etex, midpoint(p0));
  label.urt(btex $a_{1}$ etex, midpoint(p1));
  label.top(btex $a_{2}$ etex, midpoint(p2));
  label.ulft(btex $a_{2}$ etex, midpoint(p3));
  label.llft(btex $a_{3}$ etex, midpoint(p4));
  label.bot(btex $a_{3}$ etex, midpoint(p5));
endfig;

beginfig(45)
  path p[]; path e;
  numeric i,r,theta,N,offset; r := 4pc;
  N=6;
  theta = 360/N;
  offset=0; % usually theta/2
  for i=0 upto N-1:
    z[i] = r*(cosd((i-1)*theta - offset),sind((i-1)*theta - offset));
  endfor;
  for i=0 upto (N-2):
    p[i] = z[i]--z[i+1];
  endfor;
  p[N-1] = z[N-1]--z0;

  e = halfcircle rotated -90 scaled r shifted (0.5u,0);
  drawarrow (subpath (0.05length(e),0.95length(e)) of e) withcolor red;

  draw_mid_arrow(p0);
  draw_mid_arrow(p1);

  label.lrt(btex $a_{1}$ etex, midpoint(p0));
  label.urt(btex $a_{1}$ etex, midpoint(p1));

  label(btex $\circ$ etex, point 0.25length(p0) of p0);
  label(btex $\circ$ etex, point 0.25length(p0) of p1);
  label.rt(btex $y$ etex, point 0.25length(p0) of p0);
  label.urt(btex $y$ etex, point 0.25length(p0) of p1);
endfig;

beginfig(46)
  numeric r,dy; r := 5u; dy := 0.5u;
  path p[];
  p0 = fullcircle scaled 4u;
  z0 = point 0 of p0;
  z1 = point 0.5length(p0) of p0;
  p1 = z0..(0.5[z0,z1] + (0,-dy))..z1;
  p2 = z0..(0.5[z0,z1] + (0,dy))..z1;
  draw p0;
  draw p1;
  draw p2 dashed evenly;
  z2 = point (length(p0)/6) of p0;
  z3 = point (5length(p0)/6) of p0;
  label.rt(btex $S^{k-1}$ etex, z0);
  label.urt(btex $e^{k}_{+}$ etex, z2);
  label.lrt(btex $e^{k}_{-}$ etex, z3);
endfig;

% lecture 15
beginfig(47) % Mobius strip
  path p[];
  pair t;
  numeric i,w,l,dt,start; w = 1.5u;
  z0 = (0,0);
  z1 = (-4u,-3u);
  z2 = (0,-6u);
  z3 = (3u,-3u);
  z4 = z0 + (0,-w);
  z5 = z1 + (w, 0);
  z6 = z2 + (0, w);
  z7 = z3;
  p0 = z0..z1..z2..z3..z4..z5..z6..z7..cycle;
  p1 = z3..(0.5[z0,z4])..(0.5[z1,z5])..(0.5[z2,z6])..cycle;
  l = length(p0);
  dt=l/64;
  start=(-l/8);
  draw (point (start + 2dt) of p0)--(point ((3l/8)+dt) of p0) withcolor
    0.9white;
  draw (point (start + 3dt) of p0)--(point ((3l/8)+2dt) of p0) withcolor
    0.9white;
  draw (point (start - dt) of p0)--(point ((3l/8)-2dt) of p0) withcolor
    0.9white;
  draw (point (start - 2dt) of p0)--(point ((3l/8)-3dt) of p0) withcolor
    0.9white;
  dt := l/32;
  t = (subpath (0,l/2) of p0) intersectiontimes (subpath (l/2,l) of p0);
  for i=2dt step dt until ((xpart t)+2dt):%(3l/8):
    draw (point (start + i) of p0)--(point ((3l/8)+i) of p0)
      withcolor 0.9white;
  endfor;
  draw p0;
  draw p1 withcolor red;
endfig;

beginfig(48) % Mobius strip
  path p[];
  pair t;
  numeric i,w,l,dt,start; w = 1.5u;
  z0 = (0,0);
  z1 = (-4u,-3u);
  z2 = (0,-6u);
  z3 = (3u,-3u);
  z4 = z0 + (0,-w);
  z5 = z1 + (w, 0);
  z6 = z2 + (0, w);
  z7 = z3;
  p0 = z0..z1..z2..z3..z4..z5..z6..z7..cycle;
  p1 = z3..(0.5[z0,z4])..(0.5[z1,z5])..(0.5[z2,z6])..cycle;
  l = length(p0);
  dt=l/64;
  start=(-l/8);
  draw (point (start + 2dt) of p0)--(point ((3l/8)+dt) of p0) withcolor
    0.9white;
  draw (point (start + 3dt) of p0)--(point ((3l/8)+2dt) of p0) withcolor
    0.9white;
  draw (point (start - dt) of p0)--(point ((3l/8)-2dt) of p0) withcolor
    0.9white;
  draw (point (start - 2dt) of p0)--(point ((3l/8)-3dt) of p0) withcolor
    0.9white;
  dt := l/32;
  t = (subpath (0,l/2) of p0) intersectiontimes (subpath (l/2,l) of p0);
  for i=2dt step dt until ((xpart t)+2dt):%(3l/8):
    draw (point (start + i) of p0)--(point ((3l/8)+i) of p0)
      withcolor 0.9white;
  endfor;
  draw p0;
  draw p1 withcolor red;
  z8 = point (start + 5dt) of p0;
  z9 = point ((3l/8) + 5dt) of p0;
  % label(btex $\bullet$ etex, z8);
  % label(btex $\bullet$ etex, z9);
  p2 = (fullcircle scaled 4u shifted (z3 + (4u,0)));
  draw p2;
  l := -length(p2)/8;
  z10 = point (l) of p2;
  z11 = point (l + 0.5length(p2)) of p2;
  for i:=8 upto 11:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  label.ulft(btex $p(x)$ etex, z11);
  label.lrt(btex $x$ etex, z10);
endfig;
end;