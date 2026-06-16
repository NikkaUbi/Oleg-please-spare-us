close; clear; clc;

N = 20;


plate = zeros(N,N);
plate(2:N-1,1) = randi([200,400], N-2, 1);
plate(2:N-1,N) = randi([200,400], N-2, 1);
plate(1,2:N-1) = randi([200,400], 1, N-2);
plate(N,2:N-1) = randi([200,500], 1, N-2);


tolerance = 1e-3;
max_error = 1;


while max_error > tolerance
    old_plate = plate;
    max_error = 0;

    for i = 2:N-1
        for j = 2:N-1

            plate(i,j) = (old_plate(i-1,j) + old_plate(i+1,j) + old_plate(i,j-1) + old_plate(i,j+1)) / 4;

            knot_error = abs(plate(i,j) - old_plate(i,j));
            if knot_error > max_error
                max_error = knot_error;
            end
        end
    end
end

figure;
imagesc(plate(2:N-1,2:N-1));
colorbar;
colormap(hot);
caxis([0 700]);
title('Heat dist');
xlabel('X'); ylabel('Y');
