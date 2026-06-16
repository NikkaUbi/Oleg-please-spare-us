clc; clear; close;

a = sqrt(2+1);

for i=1:7

  a = sqrt(2+a);

end

pi_app = 768 * sqrt(2-a)
