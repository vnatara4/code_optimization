#include "geometry.h"
#include <math.h>
#include <string.h>
#define PI 3.14159265f
#define PI_OVER_180 (0.017453293f) // (3.1415927/180.0)

extern const PT_T waypoints[];

#define VER 10  

/*
10: radians in table, precalc'd sin, cos
11: Calc_Closeness
12: Don't do bearing
*/

// Table holds precalculated sin/cos for p2. Table Lat/Lon values are in radians

#if VER==10
float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
  // calculates distance in kilometers between locations (represented in radians)

  return acosf(p1->SinLat * p2->SinLat + 
	       p1->CosLat * p2->CosLat*
	       cosf(p2->Lon - p1->Lon))* 6371;
}
#endif

float Calc_Bearing( PT_T * p1,  const PT_T * p2){
  // calculates bearing in degrees between locations (represented in radians)	
  float term1, term2;
  float angle;
	
  term1 = sinf(p1->Lon - p2->Lon)*p2->CosLat;
  term2 = p1->CosLat*p2->SinLat - 
    p1->SinLat*p2->CosLat*cosf(p1->Lon - p2->Lon);
  angle = atan2f(term1, term2) * (180/PI);
  if (angle < 0.0)
    angle += 360;
  return angle;
}

#if (VER==11) || (VER==12)
float Calc_Closeness( PT_T * p1,  const PT_T * p2) { 
  // calculates closeness (decreases as distance increases) of locations

  return p1->SinLat * p2->SinLat + 
    p1->CosLat * p2->CosLat*
    cosf(p2->Lon - p1->Lon);
}
#endif


void Find_Nearest_Waypoint(float cur_pos_lat, float cur_pos_lon, float * distance, float * bearing, 
			   char  * * name) {
  // cur_pos_lat and cur_pos_lon are in degrees
  // distance is in kilometers
  // bearing is in degrees
		
  int i=0, closest_i=0;
  PT_T ref;
  float d, b, c, max_c=0, closest_d=1E10;

  *distance = 0.0f;
  *bearing = 0;
  *name = '\0';

  ref.Lat = cur_pos_lat*PI/180;
  ref.Lon = cur_pos_lon*PI/180;
  ref.SinLat = sinf(ref.Lat);
  ref.CosLat = cosf(ref.Lat);
		
  strcpy(ref.Name, "Reference");

  while (strcmp(waypoints[i].Name, "END")) {
#if VER==10
    d = Calc_Distance(&ref, &(waypoints[i]) );
    // if we found a closer waypoint, remember it and display it
    if (d<closest_d) {
      closest_d = d;
      closest_i = i;
    }
#else
    c = Calc_Closeness(&ref, &(waypoints[i]) );
    if (c>max_c) {
      max_c = c;
      closest_i = i;
    }
#endif

#if (VER==10) || (VER==11)
    b = Calc_Bearing(&ref, &(waypoints[i]) ); // Deletable!
#endif

    i++;
  }

  // Finish calcuations for the closest point

#if VER==10
  d = closest_d; 
#else
  d = acosf(max_c)*6371; // finish distance calcuation
#endif	

#if VER==12
  b = Calc_Bearing(&ref, &(waypoints[closest_i]) );
#endif

  // return information to calling function about closest waypoint 
  *distance = d;
  *bearing = b;
  *name = (char * ) (waypoints[closest_i].Name);
}
