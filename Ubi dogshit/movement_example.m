clc; clear;close;

t = 0;
dt = 0.1;

vy = 0;
g = 0.08;
y = 2;

x_traj = [];
y_traj = [];

vx = 1.5;
x = 0;

while(t<100)


  x_traj(end+1) = x;
  y_traj(end+1) = y;

  plot(x_traj,y_traj,'b-');
  xlim([-5 5]);
  ylim([0 2]);
  hold on;

  plot(x,y,'o');
  xlim([-5 5]);
  ylim([0 2]);
  hold off;


  vy = vy - g*dt;
  dy =  vy*dt;
  y = y +dy;
  dx = vx*dt;
  x = x + dx;

  if(x >= 5 || x <= -5)

    vx = -0.9*vx;
  end


  pause(0.05);
    t = t + dt;
  if(y <=0)
    vy = -0.9*vy;
    end

  xlim([-5 5]);
  ylim([0 2]);

end
