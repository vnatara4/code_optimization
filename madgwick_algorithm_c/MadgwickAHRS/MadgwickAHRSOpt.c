
#include "MadgwickAHRS.h"
#include <math.h>

//---------------------------------------------------------------------------------------------------
// Definitions

#define sampleFreq	512.0f		// sample frequency in Hz
#define betaDef		0.1f		// 2 * proportional gain

//---------------------------------------------------------------------------------------------------
// Variable definitions

volatile float q0_opt = 1.0f, q1_opt = 0.0f, q2_opt = 0.0f, q3_opt = 0.0f;	// quaternion of sensor frame relative to auxiliary frame

//---------------------------------------------------------------------------------------------------
// Function declarations

float invSqrtOpt(float x);

//====================================================================================================
// Functions

//---------------------------------------------------------------------------------------------------
// AHRS algorithm update

void MadgwickAHRSupdateOpt(float gx, float gy, float gz, float ax, float ay, float az, float mx, float my, float mz) {
	float recipNorm;
	float s0, s1, s2, s3;
	float qDot1, qDot2, qDot3, qDot4;
	float hx, hy;
	float _2q0_optmx, _2q0_optmy, _2q0_optmz, _2q1_optmx, _2bx, _2bz, _4bx, _4bz, _2q0_opt, _2q1_opt, _2q2_opt, _2q3_opt, _2q0_optq2_opt, _2q2_optq3_opt, q0_optq0_opt, q0_optq1_opt, q0_optq2_opt, q0_optq3_opt, q1_optq1_opt, q1_optq2_opt, q1_optq3_opt, q2_optq2_opt, q2_optq3_opt, q3_optq3_opt;

	// Use IMU algorithm if magnetometer measurement invalid (avoids NaN in magnetometer normalisation)
	if((mx == 0.0f) && (my == 0.0f) && (mz == 0.0f)) {
		MadgwickAHRSupdateIMUOpt(gx, gy, gz, ax, ay, az);
		return;
	}

	// Rate of change of quaternion from gyroscope
	qDot1 = 0.5f * (-q1_opt * gx - q2_opt * gy - q3_opt * gz);
	qDot2 = 0.5f * (q0_opt * gx + q2_opt * gz - q3_opt * gy);
	qDot3 = 0.5f * (q0_opt * gy - q1_opt * gz + q3_opt * gx);
	qDot4 = 0.5f * (q0_opt * gz + q1_opt * gy - q2_opt * gx);

	// Compute feedback only if accelerometer measurement valid (avoids NaN in accelerometer normalisation)
	if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {

		// Normalise accelerometer measurement
		recipNorm = invSqrtOpt(ax * ax + ay * ay + az * az);
		ax *= recipNorm;
		ay *= recipNorm;
		az *= recipNorm;   

		// Normalise magnetometer measurement
		recipNorm = invSqrtOpt(mx * mx + my * my + mz * mz);
		mx *= recipNorm;
		my *= recipNorm;
		mz *= recipNorm;

		// Auxiliary variables to avoid repeated arithmetic
		_2q0_optmx = 2.0f * q0_opt * mx;
		_2q0_optmy = 2.0f * q0_opt * my;
		_2q0_optmz = 2.0f * q0_opt * mz;
		_2q1_optmx = 2.0f * q1_opt * mx;
		_2q0_opt = 2.0f * q0_opt;
		_2q1_opt = 2.0f * q1_opt;
		_2q2_opt = 2.0f * q2_opt;
		_2q3_opt = 2.0f * q3_opt;
		_2q0_optq2_opt = 2.0f * q0_opt * q2_opt;
		_2q2_optq3_opt = 2.0f * q2_opt * q3_opt;
		q0_optq0_opt = q0_opt * q0_opt;
		q0_optq1_opt = q0_opt * q1_opt;
		q0_optq2_opt = q0_opt * q2_opt;
		q0_optq3_opt = q0_opt * q3_opt;
		q1_optq1_opt = q1_opt * q1_opt;
		q1_optq2_opt = q1_opt * q2_opt;
		q1_optq3_opt = q1_opt * q3_opt;
		q2_optq2_opt = q2_opt * q2_opt;
		q2_optq3_opt = q2_opt * q3_opt;
		q3_optq3_opt = q3_opt * q3_opt;

		// Reference direction of Earth's magnetic field
		hx = mx * q0_optq0_opt - _2q0_optmy * q3_opt + _2q0_optmz * q2_opt + mx * q1_optq1_opt + _2q1_opt * my * q2_opt + _2q1_opt * mz * q3_opt - mx * q2_optq2_opt - mx * q3_optq3_opt;
		hy = _2q0_optmx * q3_opt + my * q0_optq0_opt - _2q0_optmz * q1_opt + _2q1_optmx * q2_opt - my * q1_optq1_opt + my * q2_optq2_opt + _2q2_opt * mz * q3_opt - my * q3_optq3_opt;
		_2bx = sqrt(hx * hx + hy * hy);
		_2bz = -_2q0_optmx * q2_opt + _2q0_optmy * q1_opt + mz * q0_optq0_opt + _2q1_optmx * q3_opt - mz * q1_optq1_opt + _2q2_opt * my * q3_opt - mz * q2_optq2_opt + mz * q3_optq3_opt;
		_4bx = 2.0f * _2bx;
		_4bz = 2.0f * _2bz;

		// Gradient decent algorithm corrective step
		s0 = -_2q2_opt * (2.0f * q1_optq3_opt - _2q0_optq2_opt - ax) + _2q1_opt * (2.0f * q0_optq1_opt + _2q2_optq3_opt - ay) - _2bz * q2_opt * (_2bx * (0.5f - q2_optq2_opt - q3_optq3_opt) + _2bz * (q1_optq3_opt - q0_optq2_opt) - mx) + (-_2bx * q3_opt + _2bz * q1_opt) * (_2bx * (q1_optq2_opt - q0_optq3_opt) + _2bz * (q0_optq1_opt + q2_optq3_opt) - my) + _2bx * q2_opt * (_2bx * (q0_optq2_opt + q1_optq3_opt) + _2bz * (0.5f - q1_optq1_opt - q2_optq2_opt) - mz);
		s1 = _2q3_opt * (2.0f * q1_optq3_opt - _2q0_optq2_opt - ax) + _2q0_opt * (2.0f * q0_optq1_opt + _2q2_optq3_opt - ay) - 4.0f * q1_opt * (1 - 2.0f * q1_optq1_opt - 2.0f * q2_optq2_opt - az) + _2bz * q3_opt * (_2bx * (0.5f - q2_optq2_opt - q3_optq3_opt) + _2bz * (q1_optq3_opt - q0_optq2_opt) - mx) + (_2bx * q2_opt + _2bz * q0_opt) * (_2bx * (q1_optq2_opt - q0_optq3_opt) + _2bz * (q0_optq1_opt + q2_optq3_opt) - my) + (_2bx * q3_opt - _4bz * q1_opt) * (_2bx * (q0_optq2_opt + q1_optq3_opt) + _2bz * (0.5f - q1_optq1_opt - q2_optq2_opt) - mz);
		s2 = -_2q0_opt * (2.0f * q1_optq3_opt - _2q0_optq2_opt - ax) + _2q3_opt * (2.0f * q0_optq1_opt + _2q2_optq3_opt - ay) - 4.0f * q2_opt * (1 - 2.0f * q1_optq1_opt - 2.0f * q2_optq2_opt - az) + (-_4bx * q2_opt - _2bz * q0_opt) * (_2bx * (0.5f - q2_optq2_opt - q3_optq3_opt) + _2bz * (q1_optq3_opt - q0_optq2_opt) - mx) + (_2bx * q1_opt + _2bz * q3_opt) * (_2bx * (q1_optq2_opt - q0_optq3_opt) + _2bz * (q0_optq1_opt + q2_optq3_opt) - my) + (_2bx * q0_opt - _4bz * q2_opt) * (_2bx * (q0_optq2_opt + q1_optq3_opt) + _2bz * (0.5f - q1_optq1_opt - q2_optq2_opt) - mz);
		s3 = _2q1_opt * (2.0f * q1_optq3_opt - _2q0_optq2_opt - ax) + _2q2_opt * (2.0f * q0_optq1_opt + _2q2_optq3_opt - ay) + (-_4bx * q3_opt + _2bz * q1_opt) * (_2bx * (0.5f - q2_optq2_opt - q3_optq3_opt) + _2bz * (q1_optq3_opt - q0_optq2_opt) - mx) + (-_2bx * q0_opt + _2bz * q2_opt) * (_2bx * (q1_optq2_opt - q0_optq3_opt) + _2bz * (q0_optq1_opt + q2_optq3_opt) - my) + _2bx * q1_opt * (_2bx * (q0_optq2_opt + q1_optq3_opt) + _2bz * (0.5f - q1_optq1_opt - q2_optq2_opt) - mz);
		recipNorm = invSqrtOpt(s0 * s0 + s1 * s1 + s2 * s2 + s3 * s3); // normalise step magnitude
		s0 *= recipNorm;
		s1 *= recipNorm;
		s2 *= recipNorm;
		s3 *= recipNorm;

		// Apply feedback step
		qDot1 -= beta * s0;
		qDot2 -= beta * s1;
		qDot3 -= beta * s2;
		qDot4 -= beta * s3;
	}

	// Integrate rate of change of quaternion to yield quaternion
	q0_opt += qDot1 * (1.0f / sampleFreq);
	q1_opt += qDot2 * (1.0f / sampleFreq);
	q2_opt += qDot3 * (1.0f / sampleFreq);
	q3_opt += qDot4 * (1.0f / sampleFreq);

	// Normalise quaternion
	recipNorm = invSqrtOpt(q0_opt * q0_opt + q1_opt * q1_opt + q2_opt * q2_opt + q3_opt * q3_opt);
	q0_opt *= recipNorm;
	q1_opt *= recipNorm;
	q2_opt *= recipNorm;
	q3_opt *= recipNorm;
}


//---------------------------------------------------------------------------------------------------
// IMU algorithm update

void MadgwickAHRSupdateIMUOpt(float gx, float gy, float gz, float ax, float ay, float az) {
	float recipNorm;
	float s0, s1, s2, s3;
	float qDot1, qDot2, qDot3, qDot4;
	float _2q0_opt, _2q1_opt, _2q2_opt, _2q3_opt, _4q0_opt, _4q1_opt, _4q2_opt ,_8q1_opt, _8q2_opt, q0_optq0_opt, q1_optq1_opt, q2_optq2_opt, q3_optq3_opt;

	// Rate of change of quaternion from gyroscope
	qDot1 = 0.5f * (-q1_opt * gx - q2_opt * gy - q3_opt * gz);
	qDot2 = 0.5f * (q0_opt * gx + q2_opt * gz - q3_opt * gy);
	qDot3 = 0.5f * (q0_opt * gy - q1_opt * gz + q3_opt * gx);
	qDot4 = 0.5f * (q0_opt * gz + q1_opt * gy - q2_opt * gx);

	// Compute feedback only if accelerometer measurement valid (avoids NaN in accelerometer normalisation)
	if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {

		// Normalise accelerometer measurement
		recipNorm = invSqrtOpt(ax * ax + ay * ay + az * az);
		ax *= recipNorm;
		ay *= recipNorm;
		az *= recipNorm;   

		// Auxiliary variables to avoid repeated arithmetic
		_2q0_opt = 2.0f * q0_opt;
		_2q1_opt = 2.0f * q1_opt;
		_2q2_opt = 2.0f * q2_opt;
		_2q3_opt = 2.0f * q3_opt;
		_4q0_opt = 4.0f * q0_opt;
		_4q1_opt = 4.0f * q1_opt;
		_4q2_opt = 4.0f * q2_opt;
		_8q1_opt = 8.0f * q1_opt;
		_8q2_opt = 8.0f * q2_opt;
		q0_optq0_opt = q0_opt * q0_opt;
		q1_optq1_opt = q1_opt * q1_opt;
		q2_optq2_opt = q2_opt * q2_opt;
		q3_optq3_opt = q3_opt * q3_opt;

		// Gradient decent algorithm corrective step
		s0 = _4q0_opt * q2_optq2_opt + _2q2_opt * ax + _4q0_opt * q1_optq1_opt - _2q1_opt * ay;
		s1 = _4q1_opt * q3_optq3_opt - _2q3_opt * ax + 4.0f * q0_optq0_opt * q1_opt - _2q0_opt * ay - _4q1_opt + _8q1_opt * q1_optq1_opt + _8q1_opt * q2_optq2_opt + _4q1_opt * az;
		s2 = 4.0f * q0_optq0_opt * q2_opt + _2q0_opt * ax + _4q2_opt * q3_optq3_opt - _2q3_opt * ay - _4q2_opt + _8q2_opt * q1_optq1_opt + _8q2_opt * q2_optq2_opt + _4q2_opt * az;
		s3 = 4.0f * q1_optq1_opt * q3_opt - _2q1_opt * ax + 4.0f * q2_optq2_opt * q3_opt - _2q2_opt * ay;
		recipNorm = invSqrtOpt(s0 * s0 + s1 * s1 + s2 * s2 + s3 * s3); // normalise step magnitude
		s0 *= recipNorm;
		s1 *= recipNorm;
		s2 *= recipNorm;
		s3 *= recipNorm;

		// Apply feedback step
		qDot1 -= beta * s0;
		qDot2 -= beta * s1;
		qDot3 -= beta * s2;
		qDot4 -= beta * s3;
	}

	// Integrate rate of change of quaternion to yield quaternion
	q0_opt += qDot1 * (1.0f / sampleFreq);
	q1_opt += qDot2 * (1.0f / sampleFreq);
	q2_opt += qDot3 * (1.0f / sampleFreq);
	q3_opt += qDot4 * (1.0f / sampleFreq);

	// Normalise quaternion
	recipNorm = invSqrtOpt(q0_opt * q0_opt + q1_opt * q1_opt + q2_opt * q2_opt + q3_opt * q3_opt);
	q0_opt *= recipNorm;
	q1_opt *= recipNorm;
	q2_opt *= recipNorm;
	q3_opt *= recipNorm;
}

//---------------------------------------------------------------------------------------------------
// Fast inverse square-root
// See: http://en.wikipedia.org/wiki/Fast_inverse_square_root

float invSqrtOpt(float x) {
	float halfx = 0.5f * x;
	float y = x;
	long i = *(long*)&y;
	i = 0x5f3759df - (i>>1);
	y = *(float*)&i;
	y = y * (1.5f - (halfx * y * y));
	return y;
}

//====================================================================================================
// END OF CODE
//====================================================================================================
