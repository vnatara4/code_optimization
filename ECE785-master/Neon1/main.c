/*----------------------------------------------------------------------------
 *----------------------------------------------------------------------------*/
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <arm_neon.h>
#include <arm_acle.h>

#define DEBUG (0)
#define USE_SIMD (1)

#define N_TESTS (1000)

#define N_POINTS (10000)
/*----------------------------------------------------------------------------
  MAIN function
 *----------------------------------------------------------------------------*/
float x[N_POINTS];

void init_data(void) {
  int i;

  for (i=0; i<N_POINTS; i++) {
    x[i] = ((float) rand())/rand();
  }
}

void print_float32x4(float32x4_t v4) {
  int i;
  float v[4];
  float32x2_t v2;

  v2 = vget_low_f32(v4);
  v[0] = vget_lane_f32(v2, 0);
  v[1] = vget_lane_f32(v2, 1);
  v2 = vget_high_f32(v4);
  v[2] = vget_lane_f32(v2, 0);
  v[3] = vget_lane_f32(v2, 1);
  
  for (i=0; i<4; i++)
    printf("%f \t", v[i]);
  
}

int main (void) {
  struct timespec start, end;
  unsigned long diff, total=0, min=1234567890;
  float sum_val = 0, min_val = 1e30, max_val = -1e30;
  int n, i;

  float32x4_t v4_x, v4_min_val, v4_max_val, v4_sum_val;
  
  init_data();
    
  for (n=0; n<N_TESTS; n++) {
    sum_val = 0;
    min_val = 1e30;
    max_val = -1e30;

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    
#if USE_SIMD==0
    for (i=0; i<N_POINTS; i++) {
      if (x[i] < min_val)
	min_val = x[i];
      if (x[i] > max_val)
	max_val = x[i];
      sum_val += x[i];
    }
#if DEBUG
    printf("Min: %f \tMax: %f \tSum: %f\n\n", min_val, max_val, sum_val);
#endif

#else // USE_SIMD == 1
    
    v4_min_val = vld1q_dup_f32(&min_val);
    v4_max_val = vld1q_dup_f32(&max_val);
    v4_sum_val = vld1q_dup_f32(&sum_val);

    // process all elements through lanes
    for (i=0; i<N_POINTS; i+=4) {
      //     Can we prefetch here? Cache line size, data size
      v4_x = vld1q_f32(&x[i]); // load vector of 4 x values
      // find minima
      v4_min_val = vminq_f32(v4_min_val, v4_x);
      // find maxima
      v4_max_val = vmaxq_f32(v4_max_val, v4_x);
      // find sums
      v4_sum_val = vaddq_f32(v4_sum_val, v4_x);
    }
    
    // Debug info per lane
#if DEBUG
    printf("SIMD\n");
    printf("\nMin: \t");
    print_float32x4(v4_min_val);
    printf("\nMax: \t");
    print_float32x4(v4_max_val);
    printf("\nSum: \t");
    print_float32x4(v4_sum_val);
    printf("\n");
#endif

    // Reduce lane results to single values
    // min
    float32x2_t v2_u, v2_l;
    float32x2_t v2_zero = vdup_n_f32(0.0);

    v2_u = vget_high_f32(v4_min_val);
    v2_l = vget_low_f32(v4_min_val);
    v2_u = vpmin_f32(v2_u, v2_l);
    v2_u = vpmin_f32(v2_u, v2_u);
    min_val = vget_lane_f32(v2_u, 0);

    // max
    v2_u = vget_high_f32(v4_max_val);
    v2_l = vget_low_f32(v4_max_val);
    v2_u = vpmax_f32(v2_u, v2_l);
    v2_u = vpmax_f32(v2_u, v2_zero);
    max_val = vget_lane_f32(v2_u, 0);

    // sum
    v2_u = vget_high_f32(v4_sum_val);
    v2_l = vget_low_f32(v4_sum_val);
    v2_u = vpadd_f32(v2_u, v2_l);
    v2_u = vpadd_f32(v2_u, v2_zero);
    sum_val = vget_lane_f32(v2_u, 0);

#if DEBUG
    printf("Min: %f\n", min_val);
    printf("Max: %f\n", max_val);
    printf("Sum: %f\n", sum_val);
#endif
    
#endif // USE_SIMD
    
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    
    diff = 1000000000 * (end.tv_sec - start.tv_sec) +
      end.tv_nsec - start.tv_nsec;
    //	  printf("%2d: %8lu ns\n", n, diff);
    total += diff;
    if (diff < min)
      min = diff;
  }
  printf("Min: %f\t Max: %f\t Sum: %f\n", min_val, max_val, sum_val);
  printf("Average %10.3f us\n", ((float) total)/(N_POINTS*N_TESTS));
  printf("Minimum %10.3f us\n", ((float)  min)/N_POINTS);
  exit(0);
}

