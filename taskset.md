# taskset

NAME
       taskset - retrieve or set a process's CPU affinity


SYNOPSIS
       taskset [options] mask command [arg]...
       taskset [options] -p [mask] pid

DESCRIPTION
       taskset  is used to set or retrieve the CPU affinity of a running process given its PID or to launch a new COMMAND with a given CPU affinity.  CPU
       affinity is a scheduler property that "bonds" a process to a given set of CPUs on the system.  The Linux scheduler will honor the given CPU affin‐
       ity  and  the process will not run on any other CPUs.  Note that the Linux scheduler also supports natural CPU affinity: the scheduler attempts to
       keep processes on the same CPU as long as practical for performance reasons.  Therefore, forcing a specific CPU affinity is useful only in certain
       applications.

       The  CPU  affinity  is represented as a bitmask, with the lowest order bit corresponding to the first logical CPU and the highest order bit corre‐
       sponding to the last logical CPU.  Not all CPUs may exist on a given system but a mask may specify more CPUs than are present.  A  retrieved  mask
       will  reflect only the bits that correspond to CPUs physically on the system.  If an invalid mask is given (i.e., one that corresponds to no valid
       CPUs on the current system) an error is returned.  The masks are typically given in hexadecimal.  For example,

       0x00000001
              is processor #0

       0x00000003
              is processors #0 and #1

       0xFFFFFFFF
              is all processors (#0 through #31).

       When taskset returns, it is guaranteed that the given program has been scheduled to a legal CPU.


OPTIONS
       -a, --all-tasks
              Set or retrieve the CPU affinity of all the tasks (threads) for a given PID.

       -p, --pid
              Operate on an existing PID and do not launch a new task.

       -c, --cpu-list
              Specify a numerical list of processors instead of a bitmask.  The numbers are separated by commas and may  include  ranges.   For  example:
              0,5,7,9-11.

       -h, --help
              Display usage information and exit.

       -V, --version
              Display version information and exit.

USAGE
       The default behavior is to run a new command with a given affinity mask:
              taskset mask command [arguments]

       You can also retrieve the CPU affinity of an existing task:
              taskset -p pid

       Or set it:
              taskset -p mask pid

PERMISSIONS
       A  user  can  change  the  CPU affinity of a process belonging to the same user.  A user must possess CAP_SYS_NICE to change the CPU affinity of a
       process belonging to another user.  A user can retrieve the affinity mask of any process.

AUTHOR
       Written by Robert M. Love.

COPYRIGHT
       Copyright © 2004 Robert M. Love
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR‐
       POSE.

SEE ALSO
       chrt(1), nice(1), renice(1), sched_setaffinity(2), sched_getaffinity(2)

       See sched_setscheduler(2) for a description of the Linux scheduling scheme.