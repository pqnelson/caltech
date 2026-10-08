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

end;