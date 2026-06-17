close; clear; clc;

N = 160;
N = N+2;%N+2 for outer temperature (left,right,top,bottom)
plate = zeros(N,N);
plate(2:N-1,1) = randi([-200,0], N-2, 1);   % Left
plate(2:N-1,N) = randi([100,150], N-2, 1);   % Right
plate(1,2:N-1) = randi([200,250], 1, N-2);   % Top
plate(N,2:N-1) = randi([200,250], 1, N-2);   % Bottom

% --- System Solver ---
num_internal = (N-2)*(N-2); % N^2 unknown knots
A = zeros(num_internal, num_internal);
B = zeros(num_internal, 1);

% helper map
eq_map = zeros(N,N);
eq_map(2:N-1, 2:N-1) = reshape(1:num_internal, N-2, N-2)';


for i = 2:N-1
    for j = 2:N-1
        eq = eq_map(i,j); % Get current equation/row index in matrix A

        A(eq, eq) = -4;   % Center knot coefficient

        % Check Top Neighbor (i-1, j)
        if i-1 == 1
            B(eq) = B(eq) - plate(i-1, j); % Boundary condition goes to vector B
        else
            A(eq, eq_map(i-1, j)) = 1;     % Internal knot link
        end

        % Check Bottom Neighbor (i+1, j)
        if i+1 == N
            B(eq) = B(eq) - plate(i+1, j);
        else
            A(eq, eq_map(i+1, j)) = 1;
        end

        % Check Left Neighbor (i, j-1)
        if j-1 == 1
            B(eq) = B(eq) - plate(i, j-1);
        else
            A(eq, eq_map(i, j-1)) = 1;
        end

        % Check Right Neighbor (i, j+1)
        if j+1 == N
            B(eq) = B(eq) - plate(i, j+1);
        else
            A(eq, eq_map(i, j+1)) = 1;
        end
    end
end

% 3. Solve the entire system simultaneously
T_internal = A \ B;

% 4. Map the solved vector back into the internal grid positions
plate(2:N-1, 2:N-1) = reshape(T_internal, N-2, N-2)';

% --- Display the Final Solved State ---
figure;
imagesc(plate(2:N-1,2:N-1));
colorbar;
colormap(hot);
caxis([0 250]);
title('Exact Simultaneous Solution (Fixed Matrix Solver)');
xlabel('X'); ylabel('Y');
