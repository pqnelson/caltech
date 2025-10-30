numeric u; u := 1pc;

% lecture 10
beginfig(0)
  path axes[]; path p[]; numeric i;
  axes0 = (-4u,0)--(4u,0);
  axes1 = (0,-4u)--(0,4u);
  p0 = (-4u,-4u)--(4u,4u);
  p1 = (-4u,-2u)--(4u,2u);
  p2 = (-4u,-4u/3)--(4u,4u/3);
  for i=0 upto 1:
    drawdblarrow axes[i];
  endfor;
  % drawdblarrow axes0;
  % drawdblarrow axes1;
  draw p0;
  draw p1 dashed evenly;
  draw p2 withcolor 0.6666white;
  %draw p0; draw p1; draw p2;
  label.rt(btex $y$ etex, (4u,0));
  label.top(btex $z$ etex, (0,4u));
  label.top(btex $x=1$ etex, (4u,4u));
  label.urt(btex $x=2$ etex, (4u,2u));
  label.rt(btex $x=3$ etex, (4u,4u/3));
  draw (0,-4u+ahlength)--(0,4u-ahlength) withpen pencircle scaled 1.25 withcolor red;
  label.lft(btex $x=0$ etex, (0,3u)) withcolor red;
endfig;

% lecture 14
beginfig(1) % nodal curve
  path p[];
  numeric w; w = 8u;
  % x^3 - y^2 + xy = 0 is the equation
  % but we will instead plot the "expected" intuition
  % y^2 - x*x*(x+1) = 0
  % y(y - x) = x^3
  z0 = (u,-2u);
  p0 = (u,2u)..(0,0)..(-u,-u)..(-2u,0)..(-u,u)..(0,0)..z0;
  draw p0;
  label(btex $\bullet$ etex, (0,0));
  label.rt(btex $(0,0)$ etex, (0,0));
  label.bot(btex $x_{1}^{3}-x_{2}^{2}+x_{1}x_{2}=0$ etex, z0);

  p1 = (w,2u)--(w,-2u);
  label.rt(btex $x$ etex, (w,-2u));
  label(btex $\bullet$ etex, (w,0));
  label.rt(btex $x=0$ etex, (w,0));
  label(btex $\bullet$ etex, (w,u));
  label.rt(btex $x=1$ etex, (w,u));
  z1 = (w - 2u,0);
  z2 = (3u,0);
  p2 = z1 -- z2;
  drawarrow p2;
  draw p1;
  label.top(btex $\phi^{*}$ etex, 0.5[z1,z2]);
endfig;

beginfig(2)
  path p[];
  numeric i;
  z0 = (u,4u);
  z1 = (3u,u);
  z2 = (u,-4u);
  p0 = (3u,u)..(0,0)..(-1.5u,-u)..(-3u,0)..(-1.5u,u)..(0,0)..z2;
  p1 = p0 shifted z0;
  p2 = (0,0)--z0;
  p3 = (-3u,0)--((-3u,0) + z0);
  p4 = z2--(z2 + z0);
  p5 = subpath (0,0.5length(p0)) of p0; % lower edge, not drawn directly
  % used for cutting

  z3 = point 0.1length(p1) of p1;
  z4 = point 0.8length(p2) of p2;
  z6 = point 0.8length(p3) of p3;
  z5 = 0.5[z4,z6] - (0,0.5u);
  z7 = point 0.5length(p2) of p2;
  z8 = point 0.5length(p4) of p4;
  p6 = z3..z4..z5..z6;
  p7 = z6..z7..z8;

  % the plane
  N = 3;
  z11 = (10u,0);
  z9 = z11 - (N*u,0);
  z10 = z11 + (N*u,0);
  p8 = z9--z10;
  p9 = (0.5[z9,z10] + (0,-N*u))--(0.5[z9,z10] + (0,N*u));
  p10 = (0.5[z9,z10] + (-(N-0.5)*u,-(N-0.5)*u))--(0.5[z9,z10]+((N-0.5)*u,(N-0.5)*u));
  for i=1 upto N-1:
    draw (0.5[z9,z10] + (i*u,-N*u))--(0.5[z9,z10] + (i*u,N*u)) withcolor 0.9white;
    draw (0.5[z9,z10] + (-i*u,-N*u))--(0.5[z9,z10] + (-i*u,N*u)) withcolor 0.9white;
    draw (0.5[z9,z10] + (-N*u,i*u))--(0.5[z9,z10] + (N*u,i*u)) withcolor 0.9white;
    draw (0.5[z9,z10] + (-N*u,-i*u))--(0.5[z9,z10] + (N*u,-i*u)) withcolor 0.9white;
  endfor;
  drawdblarrow p8;
  drawdblarrow p9;
  draw p10 withcolor red;
  label(btex $\bullet$ etex, z11);
  label(btex $\bullet$ etex, z11 + (u,0));
  label(btex $\bullet$ etex, z11 + (0,u));
  label(btex $\bullet$ etex, z11 + (u,u));
  
  draw p0;
  draw p1 cutafter p2;
  draw p1 cutbefore p3 cutafter p2;
  draw (subpath (0,0.5length(p1)) of p1) cutbefore p2 cutafter p3 dashed evenly;
  draw (subpath (0.5length(p1),length(p1)) of p1) cutbefore p2 cutafter p5 dashed evenly;
  draw (subpath (0.5length(p1),length(p1)) of p1) cutbefore p5;
  draw p3;
  draw p2; % (0,0)--z0;
  draw z1--(z1 + z0);
  draw p4;
  draw p6 cutafter p2 withcolor red;
  draw p6 cutbefore p2 dashed evenly withcolor red;
  draw p7 cutafter p2 withcolor red;
  draw p7 cutbefore p2 cutafter p0 dashed evenly withcolor red;
  draw p7 cutbefore p0 withcolor red;
  label(btex $\bullet$ etex, z4);
  label(btex $\bullet$ etex, z7);
endfig;
end;