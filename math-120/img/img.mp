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
end;