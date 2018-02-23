#include <stdio.h>
#include <stdlib.h>
#include "MadgwickAHRS.h"
#include <time.h>
//#include <sys/time.h>
//#include <sys/resource.h>

int main() {
	int i;
	struct timespec start, end, start_opt, end_opt;
	unsigned long diff, diff_opt;

    clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start);	
	MadgwickAHRSupdate(1, 1, 1, 1, 1, 1, 1, 1, 1);
    clock_gettime(CLOCK_THREAD_CPUTIME_ID, &end);	

	clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start_opt);
	MadgwickAHRSupdateOpt(1, 1, 1, 1, 1, 1, 1, 1, 1);
	clock_gettime(CLOCK_THREAD_CPUTIME_ID, &end_opt);

	 diff = 1000000000 * (end.tv_sec - start.tv_sec) +
	    end.tv_nsec - start.tv_nsec;

	 diff_opt = 1000000000 * (end_opt.tv_sec - start_opt.tv_sec) +
	    end_opt.tv_nsec - start_opt.tv_nsec;

	printf("Actual Output: %f %f %f %f\n", q0, q1, q2, q3);
	printf("Opt Output: %f %f %f %f\n", q0_opt, q1_opt, q2_opt, q3_opt);	
	printf("Output Difference: %f %f %f %f\n", q0 - q0_opt, q1 - q1_opt, q2 - q2_opt, q3 - q3_opt);

	printf("end sec: %lu; end ns: %lu\n", end.tv_sec, end.tv_nsec);
	printf("Actual time: %lu us\n", diff/1000);
	printf("Opt time: %lu us\n", diff_opt/1000);
	printf("Difference time: %lu\n", (diff - diff_opt)/1000);

	return 0;
}
