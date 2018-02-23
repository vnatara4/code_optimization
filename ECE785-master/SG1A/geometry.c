#include "geometry.h"
#include <math.h>
#include <string.h>
#define PI 3.14159265f
#define PI_OVER_180 (PI/180)

extern const PT_T waypoints[];
float p1LatRad=0.0, p1LonRad=0.0;

//////////////////////////////////////////////////
// Step 8
#if 1 // CB: manual CSE of cos(p2->Lat in radians)
float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
// calculates distance in kilometers between locations (represented in degrees)
//	float p1LonRad, p1LatRad,
  float p2LonRad, p2LatRad;

	//	p1LonRad = p1->Lon*PI_OVER_180;
	p2LonRad = p2->Lon*PI_OVER_180;
	//	p1LatRad = p1->Lat*PI_OVER_180;
	p2LatRad = p2->Lat*PI_OVER_180;

	return acosf(sinf(p1LatRad)*sinf(p2LatRad) + 
		     cosf(p1LatRad)*cosf(p2LatRad)*
		     cosf(p2LonRad - p1LonRad)) * 6371;
}

float Calc_Bearing( PT_T * p1,  const PT_T * p2){
// calculates bearing in degrees between locations (represented in degrees)	
//	float p1LonRad, p1LatRad,
  float p2LonRad, p2LatRad;
	float cosp2LatRad;
	float term1, term2;
	
	float angle;
	
	//	p1LonRad = p1->Lon*PI_OVER_180;
	p2LonRad = p2->Lon*PI_OVER_180;
	//	p1LatRad = p1->Lat*PI_OVER_180;
	p2LatRad = p2->Lat*PI_OVER_180;
	cosp2LatRad = cosf(p2LatRad);
	
	term1 = sinf(p1LonRad - p2LonRad)*cosp2LatRad;
	term2 = cosf(p1LatRad)*sinf(p2LatRad) - 
	  sinf(p1LatRad)*
	  cosp2LatRad*
	  cosf(p1LonRad - p2LonRad);
	angle = atan2f(term1, term2) * (180/PI);
	if (angle < 0.0)
		angle += 360;
	return angle;
}
#endif




void Find_Nearest_Waypoint(float cur_pos_lat, float cur_pos_lon, float * distance, float * bearing, 
			   char  * * name) {
  // cur_pos_lat and cur_pos_lon are in degrees
  // distance is in kilometers
  // bearing is in degrees
  
  int i=0, closest_i=0;
  PT_T ref;
  float d, b, closest_d=1E10;
  
  *distance = '\0';
  *bearing = '\0';
  *name = '\0';
  
  ref.Lat = cur_pos_lat;
  ref.Lon = cur_pos_lon;
  strcpy(ref.Name, "Reference");

  p1LatRad = cur_pos_lat*PI_OVER_180;
  p1LonRad = cur_pos_lon*PI_OVER_180;
	
  //  while (strcmp(waypoints[i].Name, "END")) {
  while (i<163) {
    d = Calc_Distance(&ref, &(waypoints[i]) );
    // b = Calc_Bearing(&ref, &(waypoints[i]) );

    // if we found a closer waypoint, remember it and display it
    if (d<closest_d) {
      closest_d = d;
      closest_i = i;
    }
    i++;
  }
  

  b = Calc_Bearing(&ref, &(waypoints[closest_i]) );

  // return information to calling function about closest waypoint 
  *distance = closest_d;
  *bearing = b;
  *name = (char * ) (waypoints[closest_i].Name);
}
