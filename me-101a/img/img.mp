numeric u; u := 1pc;

% lecture 1 (Fall 2026)
beginfig(0)
  z0 = (0,0);
  z1 = (3u, 0);
  label(btex $\bullet$ etex, z0);
  draw fullcircle scaled (2 * xpart z1);
  draw z0--z1;
  label.bot(btex $d/2$ etex, 0.5[z0,z1]);
  draw fullcircle scaled (4 * (xpart z1)) dashed evenly;
endfig;

% lecture 4
beginfig(2)
  numeric w,i,dx;
  path p[];
  w = 4u;
  dx = h/3;
  h = 1.5u;
  z1 = (h,h);
  z2 = z1 + (w, 0);
  z3 = (h,-2h);
  z4 = z3 + (w, 0);
  p0 = (0,0)--(h,0)--z1--(z2 + (0.5u,0));
  p1 = (0,-h)--(h,-h)--z3--(z4 + (0.5u,0));
  p2 = z1--z2--z4--z3--cycle;

  draw p0;
  draw p1;
  draw p2 withpen pencircle scaled 3 dashed evenly scaled 2 withcolor red;

  drawarrow (0,-h/3)--(h,-h/3) withcolor blue;
  drawarrow (0,-2h/3)--(h,-2h/3) withcolor blue;
  for i = (h - 0.5dx) step -dx until -2h:
    drawarrow (w + h,i)--(w + 2h,i) withcolor blue;
  endfor;
  label.lft(btex $p_{1}$, $\rho_{1}$, $\vec{u}_{1}$ etex, (0,-0.5h));
  label.rt(btex $p_{2}$, $\rho_{2}$, $\vec{u}_{2}$ etex, (w + 2h,-0.5h));
  label.lft(btex $p_{1}$ etex, (h,0.5h));
  label.lft(btex $p_{1}$ etex, (h,-1.5h));
endfig; % fig 2

beginfig(3)
  z0 = (0,0);
  z1 = (3u,3u);
  draw fullcircle xscaled 2u yscaled u shifted z1;
  drawarrow z0--z1;
  label.lrt(btex $\vec{r}$ etex, 0.5[z1,z0]);
  label(btex $\bullet$ etex, z0);
  label.bot(btex $O$ etex, z0);
  label.rt(btex CV etex, z1 + (u,0));
endfig;

% lecture 8 (fall 2026)
beginfig(10) % box half full of liquid at rest
  numeric w,h;
  path p[];
  w := 6u;
  h := 3u;
  z0 = (0.5w,0.25h);
  p0 = (0,0.5h)--(0,0)--(w,0)--(w,0.5h)--cycle;
  p1 = (0,0)--(w,0)--(w,h)--(0,h)--cycle;
  fill p0 withcolor 0.7[blue,white];
  draw p1 withpen pencircle scaled 2;
  label(btex $\bullet$ etex, z0);
  drawarrow z0--(z0 + (0,0.6h));
  label.rt(btex $\partial_{z}p$ etex, z0 + (0,0.6h));
  drawarrow z0--(z0 + (0,-0.6h));
  label.bot(btex $\gamma=\rho g$ etex, z0 + (0,-0.6h));
  % oh, and the wheels
  draw fullcircle scaled u shifted (0.5u,-0.5u);
  draw fullcircle scaled u shifted (w-0.5u,-0.5u);
  % might as well note the time explicitly
  label.rt(btex $t = 0$ etex, (w,h));
endfig;
beginfig(11) % box half full of liquid at motion
  numeric w,h;
  path p[];
  w := 6u;
  h := 3u;
  z0 = (0.5w,0.25h);
  p0 = (0,0.75h)--(0,0)--(w,0)--(w,0.25h)--cycle;
  p1 = (0,0)--(w,0)--(w,h)--(0,h)--cycle;
  fill p0 withcolor 0.7[blue,white];
  draw p1 withpen pencircle scaled 2;
  label(btex $\bullet$ etex, z0);
  % pressure gradient
  drawarrow z0--(z0 + (2u,0.6h));
  label.lft(btex $\partial_{z}p$ etex, z0 + (2u - 5,0.5h));
  % gravity force
  drawarrow z0--(z0 + (0,-0.6h));
  label.lrt(btex $\gamma=\rho g$ etex, z0 + (0,-0.6h));
  % acceleration on the parcel
  drawarrow z0--(z0 - (2u,0));
  label.top(btex $\rho a$ etex, (z0 - (2u,0)));
  % effective force on the parcel
  drawarrow z0--(z0 - (2u,0.6h));
  label.bot(btex $\gamma_{\rm eff}$ etex, (z0 - (2u,0.6h)));
  % acceleration vector on the container
  drawarrow (w,0.5h)--(w + 2u,0.5h);
  label.top(btex $a$ etex, (w + 2u,0.5h));
  % oh, and the wheels
  draw fullcircle scaled u shifted (0.5u,-0.5u);
  draw fullcircle scaled u shifted (w-0.5u,-0.5u);
endfig;

beginfig(12) % cylinder cross section at rest
  path p[];
  numeric w,h;
  w = 4u;
  h = 6u;

  z0 = (0.5w,0.25h);
  p0 = (0,0.5h)--(0,0)--(w,0)--(w,0.5h)--cycle;
  p1 = (0,0)--(w,0)--(w,h)--(0,h)--cycle;
  fill p0 withcolor 0.7[blue,white];
  draw p1 withpen pencircle scaled 2;
  label(btex $\bullet$ etex, z0);
  drawarrow z0--(z0 + (0,0.6h));
  label.rt(btex $\partial_{z}p$ etex, z0 + (0,0.6h));
  drawarrow z0--(z0 + (0,-0.6h));
  label.bot(btex $\gamma=\rho g$ etex, z0 + (0,-0.6h));
  % might as well note the time explicitly
  label.rt(btex $t = 0$ etex, (w,h));
endfig;

beginfig(13) % cylinder cross section at constant rotation
  path p[];
  numeric w,h;
  w = 4u;
  h = 6u;

  p2 = fullcircle xscaled w yscaled u;
  drawarrow (subpath (0.05length(p2),0.95length(p2)) of p2) shifted (0.5w,h+u);
  label.rt(btex $\omega$ etex, (w, h+u));
  
  z0 = (0.75w,0.125h);
  p0 = (0,0.5h)--(0,0)--(w,0)--(w,0.5h)..(0.5w,0.25h)..cycle;
  p1 = (0,0)--(w,0)--(w,h)--(0,h)--cycle;
  fill p0 withcolor 0.7[blue,white];
  draw p1 withpen pencircle scaled 2;
  label(btex $\bullet$ etex, z0);
  % gravity
  drawarrow z0--(z0 + (0,-0.6h));
  label.bot(btex $\gamma=\rho g$ etex, z0 + (0,-0.6h));
  % centrifugal force
  drawarrow z0--(z0 + (w,0));
  label.rt(btex $\rho\omega^{2}r$ etex, z0 + (w, 0));
  % effective force
  drawarrow z0--(z0 + (w, -0.6h));
  label.lrt(btex $\gamma_{\rm eff}$ etex, z0 + (w, -0.6h));
  % parallelogram law
  draw (z0 + (w, 0)) -- (z0 + (w, -0.6h)) dashed evenly;
  draw (z0 + (0, -0.6h)) -- (z0 + (w, -0.6h)) dashed evenly;
  % pressure gradient
  drawarrow z0--(z0 - (w, -0.6h));
  label.top(btex $\partial_{z}p$ etex, z0 - (w, -0.6h));
endfig;

end;