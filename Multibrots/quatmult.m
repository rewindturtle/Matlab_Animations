function [Q] = quatmult(q,r)
qw = q(1);
qx = q(2);
qy = q(3);
qz = q(4);
rw = r(1);
rx = r(2);
ry = r(3);
rz = r(4);

tw = rw*qw-rx*qx-ry*qy-rz*qz;
tx = rw*qx+rx*qw-ry*qz+rz*qy;
ty = rw*qy+rx*qz+ry*qw-rz*qx;
tz = rw*qz-rx*qy+ry*qx+rz*qw;
Q = [tw,tx,ty,tz];
end