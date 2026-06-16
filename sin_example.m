clc; clear;

x = 0.45;
s = 0;

for n = 1:12
    s = s + x^n/n;
end

disp(s);

disp(sin(x))
