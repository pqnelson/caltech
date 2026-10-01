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

end;