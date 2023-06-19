include "globals.mzn";

% Define the number of jobs and machines
int: numJobs = 10;
int: numMachines = 4;

% Define the domain for job start times
set of int: StartTime = 0..10;

% Define the decision variables
array[1..numJobs] of var StartTime: jobStartTimes;

% Define the constraints
constraint alldifferent(jobStartTimes);  % Each job should start at a different time

% Define the resource constraints
constraint forall(j in 1..numJobs)(
  jobStartTimes[j] >= 0 /\ jobStartTimes[j] <= 10
);

% Define the objective function (minimize the makespan)
var int: makespan = max(j in 1..numJobs)(jobStartTimes[j]);

% Solve the problem
solve minimize makespan;

% Output the optimal schedule
output ["The Optimal Schedule is:\n"] ++
       [show(i) ++ " : Job " ++ show(i) ++ "\n" | i in 1..numJobs];
