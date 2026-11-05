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

% lecture 9
beginfig(14)
  path p[];
  numeric w, h;
  w = 6u;
  h = 4u;
  p0 = (0,h)--(0,0)--(w,0); % container
  p1 = (w,6)--(w,h); % container (minus spout)
  p2 = (0,0.75h)--(0,0)--(w,0)--(w,0.75h)--cycle; % fluid
  fill p2 withcolor 0.5[blue,white];
  draw p0;
  draw p1;
endfig;

beginfig(15)
  pair P,Q,dUP;
  P = (0,0); % 
  Q = P + (4u,u);
  dUP = (-u,4u); % relative endpoint for u_{P}
  z0 = P + dUP; % endpoint for u_{P}
  z1 = Q + (4u,2u); % endpoint for u_{Q}
  z2 = Q + dUP;

  drawarrow P--z0; % u_{P}
  drawarrow Q--z1; % u_{Q}
  drawarrow Q--z2; % u_{P} + \delta x
  drawarrow P--Q; % \delta x
  draw z2--z1 dashed evenly;
  label(btex $\bullet$ etex, P);
  label(btex $\bullet$ etex, Q);
  label.bot(btex $P$ etex, P);
  label.bot(btex $Q$ etex, Q);
  label.top(btex $u_{P}$ etex, z0);
  label.rt(btex $u_{Q}$ etex, z1);
  label.top(btex $u_{P}+\delta x$ etex, z2);
  label.urt(btex $\delta u$ etex, 0.5[z1,z2]);
  label.bot(btex $\delta x$ etex, 0.5[P,Q]);
endfig;

beginfig(16) % planar Couette flow
  path p[];
  numeric w,h,i,dy;
  w = 10u;
  h = 3u;
  dy = 4;
  p0 = (0,h)--(w,h); % top wall
  p1 = (0,0)--(w,0); % bottom wall
  z0 = (0.25w,h+3);
  z1 = z0 + (u,0);
  p2 = z0--z1; % u0 vector
  p3 = (0.5w,0)--(0.5w,h); % initial positions
  p4 = (0.5w,0)--(0.5w + h, h); % velocity gradient
  draw p3 withcolor blue;
  draw p4 withcolor blue;
  draw p0;
  draw p1;
  drawarrow p2;
  label.top(btex $\vec{u}_{0}$ etex, 0.5[z0,z1]);
  label.lft(btex $h\Biggl\{$ etex, (-0.0625u,0.5h));
  for i=dy step dy until h: %(h - dy):
    drawarrow (0.5w,i)--(0.5w + i, i) withcolor blue;
  endfor;
  % axes
  z5 = (-4u,0);
  z6 = z5 + (u,0);
  z7 = z5 + (0,u);
  drawarrow z5--z6;
  label.rt(btex $x$ etex, z6);
  drawarrow z5--z7;
  label.top(btex $y$ etex, z7);
endfig;

% lecture 10 (Fall 2026)
% Emacs Lisp code for generating the wall:
% (defun generate-node (x y d)
%   (cons (+ x (- (random d) d d))
%         (+ y (- (random d) d d))))
%
% (list (generate-node 6 6 2)
%       (generate-node 12 -6 2)
%       (generate-node 18 6 2)
%       (generate-node 24 -6 2)
%       (generate-node 30 6 2)
%       (generate-node 36 -6 2)
%       (generate-node 42 6 2)
%       (generate-node 48 -6 2)
%       (generate-node 54 6 2)
%       (generate-node 60 -6 2)
%       )
beginfig(17)
  path wall;
  path particle;
  path trajectory;
  z0 = (0,0);
  z1 = (66,0);
  wall = z0--(2, 2)--(8, -9)--(15, 2)--(21, -9)--(26, 2)--(32, -9)--(39, 2)--(45, -9)--(51, 3)--(56, -9)--z1;
  fill wall--(z1 + (0, -u))--(z0 + (0, -u))--cycle withcolor 0.8white;
  draw wall;
  particle = fullcircle scaled u shifted (u,4u);
  trajectory = ((u,4u)--(2.5u,4u-1.5u)) cutbefore particle;
  fill particle withcolor blue;
  drawarrow trajectory;
endfig;

% lecture 12
beginfig(18)
  path U,lift,drag,object,L;
  object = fullcircle xscaled 6u yscaled 2u;

  z0 = (point 0 of object);
  z1 = (point 0.5length(object) of object);
  L = (z0 -- z1)
    shifted (0, -2u);

  drag = (z0 + (-0.5u,0))--(z0 + (2u,0));

  z2 = 0.5[z0,z1];
  lift = z2 -- (z2 + (0, 3u));

  U = (z1 + (-4u, 0))--(z1 + (-u,0));

  fill object withcolor 0.8white;
  draw object;
  drawarrow U;
  drawarrow lift;
  drawarrow drag;
  drawdblarrow L;
  label.lft(btex $U$ etex, point 0 of U);
  label.rt(btex drag etex, z0 + (2u, 0));
  label.rt(btex lift etex, z2 + (0, 3u));
  label.bot(btex $L$ etex, 0.5[z0 + (0,-2u), z1 + (0,-2u)]);
endfig;

% lecture 17 (Wednesday 4 November 2026)
beginfig(30)
  path frame;
  path p, V, S[];
  numeric w,h;
  w = 6u;
  h = 6u;
  p = (0,0) -- (0,h); % pressure axis
  V = (0,0) -- (w,0); % volume axis
  frame = (0,0)--(w,0)--(w,h)--(0,h)--cycle;
  S1 = (0.5u,h)..(2u,2u)..(w,0.5u);
  S2 = (2u,h)..(3u,3u)..(w,2u);
  z0 = point (0.5*length(S1)) of S1;
  drawarrow p;
  drawarrow V;
  draw S1;
  draw S2;
  draw z0--(xpart z0,0) dashed evenly;
  draw z0--(0,ypart z0) dashed evenly;
  label.lft(btex $p$ etex, (0,h));
  label.lft(btex $p_{1}$ etex, (0, ypart z0));
  label.bot(btex $V$ etex, (w,0));
  label.bot(btex $V_{1}$ etex, (xpart z0, 0));
  label.rt(btex $S_{1}$ etex, (w,0.5u));
  label.rt(btex $S_{2}$ etex, (w, 2u));
  label(btex $\bullet$ etex, z0);
endfig;

beginfig(31)
  path frame;
  path p, V, S[];
  numeric w,h;
  w = 6u;
  h = 6u;
  p = (0,0) -- (0,h); % pressure axis
  V = (0,0) -- (w,0); % volume axis
  frame = (0,0)--(w,0)--(w,h)--(0,h)--cycle;
  S1 = (0.5u,h)..(2u,2u)..(w,0.5u);
  S2 = (2u,h)..(3u,3u)..(w,2u);
  z0 = point (0.5*length(S1)) of S1;
  z1 = point (0.25*length(S1)) of S1;
  drawarrow p;
  drawarrow V;
  draw S1 withcolor 0.5white;
  draw S2 withcolor 0.5white;
  draw z0--(xpart z0,0) dashed evenly;
  draw z0--(0,ypart z0) dashed evenly;
  draw z1--(xpart z1,0) dashed evenly;
  draw z1--(0,ypart z1) dashed evenly;
  drawarrow (subpath (0.5*length(S1),0.25*length(S1)) of S1);
  label.lft(btex $p$ etex, (0,h));
  label.bot(btex $V$ etex, (w,0));
  label.lft(btex $p_{1}$ etex, (0, ypart z0));
  label.bot(btex $V_{1}$ etex, (xpart z0, 0));
  label.lft(btex $p_{2}$ etex, (0, ypart z1));
  label.bot(btex $V_{2}$ etex, (xpart z1, 0));
  label.rt(btex $S_{1}$ etex, (w,0.5u));
  label.rt(btex $S_{2}$ etex, (w, 2u));
  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z1);
endfig;

beginfig(32)
  path frame;
  path p, V, S[];
  numeric w,h;
  w = 6u;
  h = 6u;
  p = (0,0) -- (0,h); % pressure axis
  V = (0,0) -- (w,0); % volume axis
  frame = (0,0)--(w,0)--(w,h)--(0,h)--cycle;
  S1 = (0.5u,h)..(2u,2u)..(w,0.5u);
  S2 = (2u,h)..(3u,3u)..(w,2u);
  z0 = point (0.5*length(S1)) of S1;
  z1 = point (0.25*length(S1)) of S1;
  z2 = (z1 -- (z1 + (3u,0))) intersectionpoint S2;
  drawarrow p;
  drawarrow V;
  draw S1 withcolor 0.5white;
  draw S2 withcolor 0.5white;
  draw z0--(xpart z0,0) dashed evenly;
  draw z0--(0,ypart z0) dashed evenly;
  draw z1--(xpart z1,0) dashed evenly;
 % draw z1--(0,ypart z1) dashed evenly;
  draw z2--(xpart z2,0) dashed evenly;
  draw z2--(0,ypart z2) dashed evenly;
  drawarrow (subpath (0.5*length(S1),0.25*length(S1)) of S1);
  drawarrow z1--z2;
  label.lft(btex $p$ etex, (0,h));
  label.bot(btex $V$ etex, (w,0));
  label.lft(btex $p_{1}$ etex, (0, ypart z0));
  label.bot(btex $V_{1}$ etex, (xpart z0, 0));
  label.lft(btex $p_{2}$ etex, (0, ypart z1));
  label.bot(btex $V_{2}$ etex, (xpart z1, 0));
%  label.lft(btex $p_{3}$ etex, (0, ypart z1));
  label.lrt(btex $V_{3}$ etex, (xpart z2, 0));
  label.rt(btex $S_{1}$ etex, (w,0.5u));
  label.rt(btex $S_{2}$ etex, (w, 2u));
  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z1);
  label(btex $\bullet$ etex, z2);
endfig;

beginfig(33) % plot of c_{V}/R against temperature
  path p[];
  numeric w,h,dw;
  w = 12u;
  h = 5u;
  dw = 3u;
  p0 = (0,0)--(w,0); % temperature axis
  p1 = (0,0)--(0,h); % c_{V}/R axis
  
  p2 = (dw,0)--(dw,h);
  p3 = (2dw,0)--(2dw,h);
  p4 = (3dw,0)--(3dw,h);

  p5 = (0,1.5u)--(dw,1.5u); % c_V/R
  p6 = (dw,2.5u)--(2dw,2.5u);
  p7 = (2dw,3.5u)--(3dw,3.5u);

  draw p2 dashed evenly;
  draw p3 dashed evenly;
  draw p4 dashed evenly;
  
  drawarrow p0;
  drawarrow p1;
  draw p5;
  draw p6;
  draw p7;
  
  label.lft(btex $c_{V}/R$ etex, (0,h));
  label.rt(btex $T$ etex, (w,0));
  label.bot(btex $\Theta_{\rm rot}$ etex, (dw, 0));
  label.lrt(btex $\Theta_{\rm vib}$ etex, (2dw, 0));
  label.lrt(btex $\Theta_{\rm dissoc}$ etex, (3dw, 0));
  label.top(btex $3/2$ etex, 0.5[point 0 of p5, point length(p5) of p5]);
  label.top(btex $5/2$ etex, 0.5[point 0 of p6, point length(p6) of p6]);
  label.top(btex $7/2$ etex, 0.5[point 0 of p7, point length(p7) of p7]);
endfig;

end;