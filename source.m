N = 15;
delta_t = 0.01;
eps = 0.1;

pos = rand(N,3);
vel = zeros(N,3);
acc = zeros(N,3);
mass = 100 * rand(1,N);
s = mass * 0.001;

mv = VideoWriter('nbody.mp4','MPEG-4');
open(mv);

for i = 1:1000
acc = getAcceleration(N,mass,pos,eps);
vel = updateVelocity(N,vel,acc,delta_t);
pos = updatePosition(N,pos,vel,delta_t);

for j=1:N
  % Generate a sphere 
  [rx,ry,rz]=sphere;
  % use surf function to plot
  hSurface=surf(s(j)*rx+pos(j,1),s(j)*ry+pos(j,2),s(j)*rz+pos(j,3));
  hold on
  set(hSurface,'FaceColor',[0 0 1], ...
      'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')
  axis([-1 2 -1 2 -1 2]);
  daspect([1 1 1]);
end
hold off
xlabel('X')
ylabel('Y')
zlabel('Z')
camlight
drawnow;

frame = getframe(gcf);
writeVideo(mv,frame);
end
close(mv);

% Updates positions of all bodies given the updated velocities
function[c] = updatePosition(N, pos, vel, delta_t)
    c = pos;
    for i = 1:N
        for j = 1:3
            c(i,j) = c(i,j) + vel(i,j) * delta_t;
        end
    end
end

% Updates velocities of all bodies given the updated accelerations
function[c] = updateVelocity(N,vel,acc,delta_t)
    c = vel;
    for i = 1:N
        for j = 1:3
           c(i,j) = c(i,j) + acc(i,j) * delta_t; 
        end        
    end
end

% Finds acceleration of each axis for each body
function [c] = getAcceleration(N, mass, pos, eps)
    c = zeros(N,3);
    for i = 1:N
        for j = 1:N
            for k = 1:3
                c(i,k) = c(i,k) + (mass(j) * (pos(j,k)-pos(i,k)))/(distanceBetween(pos(i,:),pos(j,:)) + eps);
            end
        end
    end
end

% Determines distance between two 3D points
function [c] = distanceBetween(x1, x2)
    c = sqrt((x2(1)-x1(1))^2 + (x2(2)-x1(2))^2 + (x2(3)-x1(3))^2);
end