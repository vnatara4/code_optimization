   1              		.syntax unified
   2              		.arch armv7-a
   3              		.eabi_attribute 27, 3
   4              		.eabi_attribute 28, 1
   5              		.fpu vfpv3-d16
   6              		.eabi_attribute 20, 1
   7              		.eabi_attribute 21, 1
   8              		.eabi_attribute 23, 3
   9              		.eabi_attribute 24, 1
  10              		.eabi_attribute 25, 1
  11              		.eabi_attribute 26, 2
  12              		.eabi_attribute 30, 6
  13              		.eabi_attribute 34, 1
  14              		.eabi_attribute 18, 4
  15              		.thumb
  16              		.file	"geometry.c"
  17              		.text
  18              	.Ltext0:
  19              		.cfi_sections	.debug_frame
  20              		.align	2
  21              		.global	Calc_Distance_Bearing
  22              		.thumb
  23              		.thumb_func
  25              	Calc_Distance_Bearing:
  26              	.LFB0:
  27              		.file 1 "geometry.c"
   1:geometry.c    **** #include "geometry.h"
   2:geometry.c    **** #include <math.h>
   3:geometry.c    **** #include <string.h>
   4:geometry.c    **** #define PI 3.14159265f
   5:geometry.c    **** #define PI_OVER_180 (PI/180)
   6:geometry.c    **** 
   7:geometry.c    **** extern const PT_T waypoints[];
   8:geometry.c    **** ///////////////////////////////////////////////////
   9:geometry.c    **** // Step 1
  10:geometry.c    **** #if 0	// Double precision mathlib functions
  11:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
  12:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
  13:geometry.c    ****   return acos(sin(p1->Lat*PI/180)*
  14:geometry.c    **** 	      sin(p2->Lat*PI/180) +
  15:geometry.c    **** 	      cos(p1->Lat*PI/180)*
  16:geometry.c    **** 	      cos(p2->Lat*PI/180)*
  17:geometry.c    **** 	      cos(p2->Lon*PI/180 -
  18:geometry.c    **** 		  p1->Lon*PI/180)) *
  19:geometry.c    ****     6371;
  20:geometry.c    **** }
  21:geometry.c    **** 
  22:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
  23:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
  24:geometry.c    **** 	float angle = atan2(
  25:geometry.c    **** 		sin(p1->Lon*PI/180 -
  26:geometry.c    **** 		    p2->Lon*PI/180)*
  27:geometry.c    **** 		cos(p2->Lat*PI/180),
  28:geometry.c    **** 		cos(p1->Lat*PI/180)*
  29:geometry.c    **** 		sin(p2->Lat*PI/180) - 
  30:geometry.c    **** 		sin(p1->Lat*PI/180)*
  31:geometry.c    **** 		cos(p2->Lat*PI/180)*
  32:geometry.c    **** 		cos(p1->Lon*PI/180 -
  33:geometry.c    **** 		   p2->Lon*PI/180)
  34:geometry.c    **** 		) * (180/PI);
  35:geometry.c    **** 	if (angle < 0.0)
  36:geometry.c    **** 		angle += 360;
  37:geometry.c    **** 	return angle;
  38:geometry.c    **** }
  39:geometry.c    **** 
  40:geometry.c    **** #endif
  41:geometry.c    **** ///////////////////////////////////////////////////
  42:geometry.c    **** // Step 2
  43:geometry.c    **** #if 0	// Single precision mathlib functions
  44:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
  45:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
  46:geometry.c    ****   return acosf(sinf(p1->Lat*PI/180)*
  47:geometry.c    **** 	       sinf(p2->Lat*PI/180) + 
  48:geometry.c    **** 	       cosf(p1->Lat*PI/180)*
  49:geometry.c    **** 	       cosf(p2->Lat*PI/180)*
  50:geometry.c    **** 	       cosf(p2->Lon*PI/180 -
  51:geometry.c    **** 	       p1->Lon*PI/180)) *
  52:geometry.c    ****     6371;
  53:geometry.c    **** }
  54:geometry.c    **** 
  55:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
  56:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
  57:geometry.c    **** 	float angle = atan2f(sinf(p1->Lon*PI/180 -
  58:geometry.c    **** 				  p2->Lon*PI/180)*
  59:geometry.c    **** 			     cosf(p2->Lat*PI/180),
  60:geometry.c    **** 			     cosf(p1->Lat*PI/180)*
  61:geometry.c    **** 			     sinf(p2->Lat*PI/180) - 
  62:geometry.c    **** 			     sinf(p1->Lat*PI/180)*
  63:geometry.c    **** 			     cosf(p2->Lat*PI/180)*
  64:geometry.c    **** 			     cosf(p1->Lon*PI/180 -
  65:geometry.c    **** 				  p2->Lon*PI/180))*
  66:geometry.c    **** 	  (180/PI);
  67:geometry.c    **** 	if (angle < 0.0)
  68:geometry.c    **** 		angle += 360;
  69:geometry.c    **** 	return angle;
  70:geometry.c    **** }
  71:geometry.c    **** #endif
  72:geometry.c    **** 
  73:geometry.c    **** ///////////////////////////////////////////////////
  74:geometry.c    **** // Step 3
  75:geometry.c    **** #if 0  // Compile-time evaluation of expressions - Parenthesize PI/180 
  76:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
  77:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
  78:geometry.c    ****   return acosf(sinf(p1->Lat*(PI/180))*
  79:geometry.c    **** 	       sinf(p2->Lat*(PI/180)) + 
  80:geometry.c    **** 	       cosf(p1->Lat*(PI/180))*
  81:geometry.c    **** 	       cosf(p2->Lat*(PI/180))*
  82:geometry.c    **** 	       cosf(p2->Lon*(PI/180) -
  83:geometry.c    **** 		    p1->Lon*(PI/180)))
  84:geometry.c    ****     * 6371;
  85:geometry.c    **** }
  86:geometry.c    **** 
  87:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
  88:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
  89:geometry.c    **** 	float angle = atan2f(
  90:geometry.c    **** 		sinf(p1->Lon*(PI/180) - p2->Lon*(PI/180))*cosf(p2->Lat*(PI/180)),
  91:geometry.c    **** 		cosf(p1->Lat*(PI/180))*sinf(p2->Lat*(PI/180)) - 
  92:geometry.c    **** 		sinf(p1->Lat*(PI/180))*cosf(p2->Lat*(PI/180))*cosf(p1->Lon*(PI/180) - p2->Lon*(PI/180))
  93:geometry.c    **** 		) * (180/PI);
  94:geometry.c    **** 	if (angle < 0.0)
  95:geometry.c    **** 		angle += 360;
  96:geometry.c    **** 	return angle;
  97:geometry.c    **** }
  98:geometry.c    **** #endif
  99:geometry.c    **** 
 100:geometry.c    **** //////////////////////////////////////////////////
 101:geometry.c    **** // Step 4
 102:geometry.c    **** #if 0	// force compile-time eval of PI/180 -- Skip this, since prev step did it
 103:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
 104:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
 105:geometry.c    ****   return acosf(sinf(p1->Lat*PI_OVER_180)*sinf(p2->Lat*PI_OVER_180) + 
 106:geometry.c    **** 					cosf(p1->Lat*PI_OVER_180)*cosf(p2->Lat*PI_OVER_180)*
 107:geometry.c    **** 							cosf(p2->Lon*PI_OVER_180 - p1->Lon*PI_OVER_180)) * 6371;
 108:geometry.c    **** }
 109:geometry.c    **** 
 110:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
 111:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
 112:geometry.c    **** 	float angle = atan2f(
 113:geometry.c    **** 		sinf(p1->Lon*(PI_OVER_180) - p2->Lon*(PI_OVER_180))*cosf(p2->Lat*(PI_OVER_180)),
 114:geometry.c    **** 		cosf(p1->Lat*(PI_OVER_180))*sinf(p2->Lat*(PI_OVER_180)) - 
 115:geometry.c    **** 		sinf(p1->Lat*(PI_OVER_180))*cosf(p2->Lat*(PI_OVER_180))*cosf(p1->Lon*(PI_OVER_180) - p2->Lon*(PI_
 116:geometry.c    **** 		) * (180/PI);
 117:geometry.c    **** 	if (angle < 0.0)
 118:geometry.c    **** 		angle += 360;
 119:geometry.c    **** 	return angle;
 120:geometry.c    **** }
 121:geometry.c    **** #endif
 122:geometry.c    **** 
 123:geometry.c    **** //////////////////////////////////////////////////
 124:geometry.c    **** // Step 5
 125:geometry.c    **** #if 0 // Copy lat and lon to local variables to reduce scope, enable some CSE
 126:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
 127:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
 128:geometry.c    **** 	float p1Lon, p1Lat, p2Lon, p2Lat;
 129:geometry.c    **** 
 130:geometry.c    **** 	p1Lon = p1->Lon;
 131:geometry.c    **** 	p2Lon = p2->Lon;
 132:geometry.c    **** 	p1Lat = p1->Lat;
 133:geometry.c    **** 	p2Lat = p2->Lat;
 134:geometry.c    **** 
 135:geometry.c    **** 	return acosf(sinf(p1Lat*PI_OVER_180)*
 136:geometry.c    **** 		     sinf(p2Lat*PI_OVER_180) + 
 137:geometry.c    **** 		     cosf(p1Lat*PI_OVER_180)*
 138:geometry.c    **** 		     cosf(p2Lat*PI_OVER_180)*
 139:geometry.c    **** 		     cosf(p2Lon*PI_OVER_180 -
 140:geometry.c    **** 			  p1Lon*PI_OVER_180)
 141:geometry.c    **** 	       ) * 6371;
 142:geometry.c    **** }
 143:geometry.c    **** 
 144:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
 145:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
 146:geometry.c    **** 	float p1Lon, p1Lat, p2Lon, p2Lat;
 147:geometry.c    **** 	float angle;
 148:geometry.c    **** 
 149:geometry.c    **** 	p1Lon = p1->Lon;
 150:geometry.c    **** 	p2Lon = p2->Lon;
 151:geometry.c    **** 	p1Lat = p1->Lat;
 152:geometry.c    **** 	p2Lat = p2->Lat;
 153:geometry.c    **** 
 154:geometry.c    **** 	angle = atan2f(
 155:geometry.c    **** 		sinf(p1Lon*PI_OVER_180 -
 156:geometry.c    **** 		     p2Lon*PI_OVER_180)*
 157:geometry.c    **** 		cosf(p2Lat*PI_OVER_180),
 158:geometry.c    **** 		cosf(p1Lat*PI_OVER_180)*
 159:geometry.c    **** 		sinf(p2Lat*PI_OVER_180) - 
 160:geometry.c    **** 		sinf(p1Lat*PI_OVER_180)*
 161:geometry.c    **** 		cosf(p2Lat*PI_OVER_180)*
 162:geometry.c    **** 		cosf(p1Lon*PI_OVER_180 - p2Lon*PI_OVER_180)
 163:geometry.c    **** 		) * (180/PI);
 164:geometry.c    **** 	if (angle < 0.0)
 165:geometry.c    **** 		angle += 360;
 166:geometry.c    **** 	return angle;
 167:geometry.c    **** }
 168:geometry.c    **** #endif
 169:geometry.c    **** 
 170:geometry.c    **** //////////////////////////////////////////////////
 171:geometry.c    **** // Step 6
 172:geometry.c    **** #if 0 // Force some CSE by converting to radians early
 173:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
 174:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
 175:geometry.c    **** 	float p1LonRad, p1LatRad, p2LonRad, p2LatRad;
 176:geometry.c    **** 
 177:geometry.c    **** 	p1LonRad = p1->Lon*PI_OVER_180;
 178:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
 179:geometry.c    **** 	p1LatRad = p1->Lat*PI_OVER_180;
 180:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
 181:geometry.c    **** 
 182:geometry.c    ****   return acosf(sinf(p1LatRad)*
 183:geometry.c    **** 	       sinf(p2LatRad) + 
 184:geometry.c    **** 	       cosf(p1LatRad)*
 185:geometry.c    **** 	       cosf(p2LatRad)*
 186:geometry.c    **** 	       cosf(p2LonRad - p1LonRad))
 187:geometry.c    ****     * 6371;
 188:geometry.c    **** }
 189:geometry.c    **** 
 190:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
 191:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
 192:geometry.c    **** 	float p1LonRad, p1LatRad, p2LonRad, p2LatRad;
 193:geometry.c    **** 	float angle;
 194:geometry.c    **** 
 195:geometry.c    **** 	p1LonRad = p1->Lon*PI_OVER_180;
 196:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
 197:geometry.c    **** 	p1LatRad = p1->Lat*PI_OVER_180;
 198:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
 199:geometry.c    **** 
 200:geometry.c    **** 	angle = atan2f(
 201:geometry.c    **** 		sinf(p1LonRad - p2LonRad)*
 202:geometry.c    **** 		cosf(p2LatRad),
 203:geometry.c    **** 		cosf(p1LatRad)*
 204:geometry.c    **** 		sinf(p2LatRad) - 
 205:geometry.c    **** 		sinf(p1LatRad)*
 206:geometry.c    **** 		cosf(p2LatRad)*
 207:geometry.c    **** 		cosf(p1LonRad - p2LonRad)
 208:geometry.c    **** 		       ) * (180/PI);
 209:geometry.c    **** 	if (angle < 0.0)
 210:geometry.c    **** 		angle += 360;
 211:geometry.c    **** 	return angle;
 212:geometry.c    **** }
 213:geometry.c    **** #endif
 214:geometry.c    **** 
 215:geometry.c    **** //////////////////////////////////////////////////
 216:geometry.c    **** // Step 7
 217:geometry.c    **** #if 0 // CB: manual CSE with intermediate terms to see if compiler does better
 218:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
 219:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
 220:geometry.c    **** 	float p1LonRad, p1LatRad, p2LonRad, p2LatRad;
 221:geometry.c    **** 
 222:geometry.c    **** 	p1LonRad = p1->Lon*PI_OVER_180;
 223:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
 224:geometry.c    **** 	p1LatRad = p1->Lat*PI_OVER_180;
 225:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
 226:geometry.c    **** 
 227:geometry.c    ****   return acosf(sinf(p1LatRad)*sinf(p2LatRad) + 
 228:geometry.c    **** 	       cosf(p1LatRad)*cosf(p2LatRad)*
 229:geometry.c    **** 	       cosf(p2LonRad - p1LonRad))
 230:geometry.c    ****     * 6371;
 231:geometry.c    **** }
 232:geometry.c    **** 
 233:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
 234:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
 235:geometry.c    **** 	float p1LonRad, p1LatRad, p2LonRad, p2LatRad;
 236:geometry.c    **** 	float angle;
 237:geometry.c    **** 
 238:geometry.c    **** 	float term1, term2;
 239:geometry.c    **** 	
 240:geometry.c    **** 	p1LonRad = p1->Lon*PI_OVER_180;
 241:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
 242:geometry.c    **** 	p1LatRad = p1->Lat*PI_OVER_180;
 243:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
 244:geometry.c    **** 
 245:geometry.c    **** 	term1 = sinf(p1LonRad - p2LonRad)
 246:geometry.c    **** 	  *cosf(p2LatRad);
 247:geometry.c    **** 	term2 = cosf(p1LatRad)*sinf(p2LatRad) - 
 248:geometry.c    **** 	  sinf(p1LatRad)
 249:geometry.c    **** 	  *cosf(p2LatRad)
 250:geometry.c    **** 	  *cosf(p1LonRad - p2LonRad);
 251:geometry.c    **** 	angle = atan2f(term1, term2) * (180/PI);
 252:geometry.c    **** 	if (angle < 0.0)
 253:geometry.c    **** 		angle += 360;
 254:geometry.c    **** 	return angle;
 255:geometry.c    **** }
 256:geometry.c    **** #endif
 257:geometry.c    **** 
 258:geometry.c    **** //////////////////////////////////////////////////
 259:geometry.c    **** // Step 8
 260:geometry.c    **** #if 0 // CB: manual CSE of cos(p2->Lat in radians)
 261:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
 262:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
 263:geometry.c    **** 	float p1LonRad, p1LatRad, p2LonRad, p2LatRad;
 264:geometry.c    **** 
 265:geometry.c    **** 	p1LonRad = p1->Lon*PI_OVER_180;
 266:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
 267:geometry.c    **** 	p1LatRad = p1->Lat*PI_OVER_180;
 268:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
 269:geometry.c    **** 
 270:geometry.c    **** 	return acosf(sinf(p1LatRad)*sinf(p2LatRad) + 
 271:geometry.c    **** 		     cosf(p1LatRad)*cosf(p2LatRad)*
 272:geometry.c    **** 		     cosf(p2LonRad - p1LonRad)) * 6371;
 273:geometry.c    **** }
 274:geometry.c    **** 
 275:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
 276:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
 277:geometry.c    **** 	float p1LonRad, p1LatRad, p2LonRad, p2LatRad;
 278:geometry.c    **** 	float cosp2LatRad;
 279:geometry.c    **** 	float term1, term2;
 280:geometry.c    **** 	
 281:geometry.c    **** 	float angle;
 282:geometry.c    **** 	
 283:geometry.c    **** 	p1LonRad = p1->Lon*PI_OVER_180;
 284:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
 285:geometry.c    **** 	p1LatRad = p1->Lat*PI_OVER_180;
 286:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
 287:geometry.c    **** 	cosp2LatRad = cosf(p2LatRad);
 288:geometry.c    **** 	
 289:geometry.c    **** 	term1 = sinf(p1LonRad - p2LonRad)*cosp2LatRad;
 290:geometry.c    **** 	term2 = cosf(p1LatRad)*sinf(p2LatRad) - 
 291:geometry.c    **** 	  sinf(p1LatRad)*
 292:geometry.c    **** 	  cosp2LatRad*
 293:geometry.c    **** 	  cosf(p1LonRad - p2LonRad);
 294:geometry.c    **** 	angle = atan2f(term1, term2) * (180/PI);
 295:geometry.c    **** 	if (angle < 0.0)
 296:geometry.c    **** 		angle += 360;
 297:geometry.c    **** 	return angle;
 298:geometry.c    **** }
 299:geometry.c    **** #endif
 300:geometry.c    **** 
 301:geometry.c    **** //////////////////////////////////////////////////
 302:geometry.c    **** // Step 9
 303:geometry.c    **** #if 1 // Merged functions with manual CSE 
 304:geometry.c    **** void Calc_Distance_Bearing(float * distance, float * bearing, PT_T * p1,  const PT_T * p2){
  28              		.loc 1 304 0
  29              		.cfi_startproc
  30              		@ args = 0, pretend = 0, frame = 48
  31              		@ frame_needed = 1, uses_anonymous_args = 0
  32 0000 80B5     		push	{r7, lr}
  33              		.cfi_def_cfa_offset 8
  34              		.cfi_offset 7, -8
  35              		.cfi_offset 14, -4
  36 0002 2DED028B 		fstmfdd	sp!, {d8}
  37              		.cfi_def_cfa_offset 16
  38              		.cfi_offset 80, -16
  39              		.cfi_offset 81, -12
  40 0006 8CB0     		sub	sp, sp, #48
  41              		.cfi_def_cfa_offset 64
  42 0008 00AF     		add	r7, sp, #0
  43              		.cfi_def_cfa_register 7
  44 000a F860     		str	r0, [r7, #12]
  45 000c B960     		str	r1, [r7, #8]
  46 000e 7A60     		str	r2, [r7, #4]
  47 0010 3B60     		str	r3, [r7]
 305:geometry.c    **** // calculates distance and bearing in degrees between locations (represented in degrees)	
 306:geometry.c    **** 	float p1LonRad, p1LatRad, p2LonRad, p2LatRad;
 307:geometry.c    **** 	float cosp2LatRad;
 308:geometry.c    **** 	float term1, term2;
 309:geometry.c    **** 	
 310:geometry.c    **** 	float angle;
 311:geometry.c    **** 	
 312:geometry.c    **** 	p1LonRad = p1->Lon*PI_OVER_180;
  48              		.loc 1 312 0
  49 0012 7B68     		ldr	r3, [r7, #4]
  50 0014 D3ED017A 		flds	s15, [r3, #4]
  51 0018 9FED607A 		flds	s14, .L5
  52 001c 67EE877A 		fmuls	s15, s15, s14
  53 0020 C7ED0A7A 		fsts	s15, [r7, #40]
 313:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
  54              		.loc 1 313 0
  55 0024 3B68     		ldr	r3, [r7]
  56 0026 D3ED017A 		flds	s15, [r3, #4]
  57 002a 9FED5C7A 		flds	s14, .L5
  58 002e 67EE877A 		fmuls	s15, s15, s14
  59 0032 C7ED097A 		fsts	s15, [r7, #36]
 314:geometry.c    **** 	p1LatRad = p1->Lat*PI_OVER_180;
  60              		.loc 1 314 0
  61 0036 7B68     		ldr	r3, [r7, #4]
  62 0038 D3ED007A 		flds	s15, [r3]
  63 003c 9FED577A 		flds	s14, .L5
  64 0040 67EE877A 		fmuls	s15, s15, s14
  65 0044 C7ED087A 		fsts	s15, [r7, #32]
 315:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
  66              		.loc 1 315 0
  67 0048 3B68     		ldr	r3, [r7]
  68 004a D3ED007A 		flds	s15, [r3]
  69 004e 9FED537A 		flds	s14, .L5
  70 0052 67EE877A 		fmuls	s15, s15, s14
  71 0056 C7ED077A 		fsts	s15, [r7, #28]
 316:geometry.c    **** 	cosp2LatRad = cosf(p2LatRad);
  72              		.loc 1 316 0
  73 005a 97ED070A 		flds	s0, [r7, #28]
  74 005e FFF7FEFF 		bl	cosf
  75 0062 87ED060A 		fsts	s0, [r7, #24]
 317:geometry.c    **** 	
 318:geometry.c    **** 	
 319:geometry.c    **** 	*distance = acosf(sinf(p1LatRad)*sinf(p2LatRad) + 
  76              		.loc 1 319 0
  77 0066 97ED080A 		flds	s0, [r7, #32]
  78 006a FFF7FEFF 		bl	sinf
  79 006e B0EE408A 		fcpys	s16, s0
  80 0072 97ED070A 		flds	s0, [r7, #28]
  81 0076 FFF7FEFF 		bl	sinf
  82 007a F0EE407A 		fcpys	s15, s0
  83 007e 28EE278A 		fmuls	s16, s16, s15
 320:geometry.c    **** 			  cosf(p1LatRad)*cosf(p2LatRad)*
  84              		.loc 1 320 0
  85 0082 97ED080A 		flds	s0, [r7, #32]
  86 0086 FFF7FEFF 		bl	cosf
  87 008a F0EE408A 		fcpys	s17, s0
  88 008e 97ED070A 		flds	s0, [r7, #28]
  89 0092 FFF7FEFF 		bl	cosf
  90 0096 F0EE407A 		fcpys	s15, s0
  91 009a 68EEA78A 		fmuls	s17, s17, s15
 321:geometry.c    **** 			  cosf(p2LonRad - p1LonRad)) * 6371;
  92              		.loc 1 321 0
  93 009e 97ED097A 		flds	s14, [r7, #36]
  94 00a2 D7ED0A7A 		flds	s15, [r7, #40]
  95 00a6 77EE677A 		fsubs	s15, s14, s15
  96 00aa B0EE670A 		fcpys	s0, s15
  97 00ae FFF7FEFF 		bl	cosf
  98 00b2 F0EE407A 		fcpys	s15, s0
 320:geometry.c    **** 			  cosf(p1LatRad)*cosf(p2LatRad)*
  99              		.loc 1 320 0
 100 00b6 68EEA77A 		fmuls	s15, s17, s15
 319:geometry.c    **** 			  cosf(p1LatRad)*cosf(p2LatRad)*
 101              		.loc 1 319 0
 102 00ba 78EE277A 		fadds	s15, s16, s15
 103 00be B0EE670A 		fcpys	s0, s15
 104 00c2 FFF7FEFF 		bl	acosf
 105 00c6 B0EE407A 		fcpys	s14, s0
 106              		.loc 1 321 0
 107 00ca DFED357A 		flds	s15, .L5+4
 108 00ce 67EE277A 		fmuls	s15, s14, s15
 319:geometry.c    **** 			  cosf(p1LatRad)*cosf(p2LatRad)*
 109              		.loc 1 319 0
 110 00d2 FB68     		ldr	r3, [r7, #12]
 111 00d4 C3ED007A 		fsts	s15, [r3]
 322:geometry.c    **** 	
 323:geometry.c    **** 	term1 = sinf(p1LonRad - p2LonRad)*cosp2LatRad;
 112              		.loc 1 323 0
 113 00d8 97ED0A7A 		flds	s14, [r7, #40]
 114 00dc D7ED097A 		flds	s15, [r7, #36]
 115 00e0 77EE677A 		fsubs	s15, s14, s15
 116 00e4 B0EE670A 		fcpys	s0, s15
 117 00e8 FFF7FEFF 		bl	sinf
 118 00ec B0EE407A 		fcpys	s14, s0
 119 00f0 D7ED067A 		flds	s15, [r7, #24]
 120 00f4 67EE277A 		fmuls	s15, s14, s15
 121 00f8 C7ED057A 		fsts	s15, [r7, #20]
 324:geometry.c    **** 	term2 = cosf(p1LatRad)*sinf(p2LatRad) - 
 122              		.loc 1 324 0
 123 00fc 97ED080A 		flds	s0, [r7, #32]
 124 0100 FFF7FEFF 		bl	cosf
 125 0104 B0EE408A 		fcpys	s16, s0
 126 0108 97ED070A 		flds	s0, [r7, #28]
 127 010c FFF7FEFF 		bl	sinf
 128 0110 F0EE407A 		fcpys	s15, s0
 129 0114 28EE278A 		fmuls	s16, s16, s15
 325:geometry.c    **** 	  sinf(p1LatRad)*cosp2LatRad*cosf(p1LonRad - p2LonRad);
 130              		.loc 1 325 0
 131 0118 97ED080A 		flds	s0, [r7, #32]
 132 011c FFF7FEFF 		bl	sinf
 133 0120 B0EE407A 		fcpys	s14, s0
 134 0124 D7ED067A 		flds	s15, [r7, #24]
 135 0128 67EE278A 		fmuls	s17, s14, s15
 136 012c 97ED0A7A 		flds	s14, [r7, #40]
 137 0130 D7ED097A 		flds	s15, [r7, #36]
 138 0134 77EE677A 		fsubs	s15, s14, s15
 139 0138 B0EE670A 		fcpys	s0, s15
 140 013c FFF7FEFF 		bl	cosf
 141 0140 F0EE407A 		fcpys	s15, s0
 142 0144 68EEA77A 		fmuls	s15, s17, s15
 324:geometry.c    **** 	term2 = cosf(p1LatRad)*sinf(p2LatRad) - 
 143              		.loc 1 324 0
 144 0148 78EE677A 		fsubs	s15, s16, s15
 145 014c C7ED047A 		fsts	s15, [r7, #16]
 326:geometry.c    **** 	angle = atan2f(term1, term2) * (180/PI);
 146              		.loc 1 326 0
 147 0150 97ED050A 		flds	s0, [r7, #20]
 148 0154 D7ED040A 		flds	s1, [r7, #16]
 149 0158 FFF7FEFF 		bl	atan2f
 150 015c B0EE407A 		fcpys	s14, s0
 151 0160 DFED107A 		flds	s15, .L5+8
 152 0164 67EE277A 		fmuls	s15, s14, s15
 153 0168 C7ED0B7A 		fsts	s15, [r7, #44]
 327:geometry.c    **** 	if (angle < 0.0)
 154              		.loc 1 327 0
 155 016c D7ED0B7A 		flds	s15, [r7, #44]
 156 0170 F5EEC07A 		fcmpezs	s15
 157 0174 F1EE10FA 		fmstat
 158 0178 07D5     		bpl	.L2
 328:geometry.c    **** 		angle += 360;
 159              		.loc 1 328 0
 160 017a D7ED0B7A 		flds	s15, [r7, #44]
 161 017e 9FED0A7A 		flds	s14, .L5+12
 162 0182 77EE877A 		fadds	s15, s15, s14
 163 0186 C7ED0B7A 		fsts	s15, [r7, #44]
 164              	.L2:
 329:geometry.c    **** 	*bearing = angle;
 165              		.loc 1 329 0
 166 018a BB68     		ldr	r3, [r7, #8]
 167 018c FA6A     		ldr	r2, [r7, #44]	@ float
 168 018e 1A60     		str	r2, [r3]	@ float
 330:geometry.c    **** }
 169              		.loc 1 330 0
 170 0190 3037     		adds	r7, r7, #48
 171              		.cfi_def_cfa_offset 16
 172 0192 BD46     		mov	sp, r7
 173              		.cfi_def_cfa_register 13
 174              		@ sp needed
 175 0194 BDEC028B 		fldmfdd	sp!, {d8}
 176              		.cfi_restore 80
 177              		.cfi_restore 81
 178              		.cfi_def_cfa_offset 8
 179 0198 80BD     		pop	{r7, pc}
 180              	.L6:
 181 019a 00BF     		.align	2
 182              	.L5:
 183 019c 35FA8E3C 		.word	1016003125
 184 01a0 0018C745 		.word	1170675712
 185 01a4 E02E6542 		.word	1113927392
 186 01a8 0000B443 		.word	1135869952
 187              		.cfi_endproc
 188              	.LFE0:
 190              		.section	.rodata
 191              		.align	2
 192              	.LC0:
 193 0000 52656665 		.ascii	"Reference\000"
 193      72656E63 
 193      6500
 194 000a 0000     		.align	2
 195              	.LC1:
 196 000c 454E4400 		.ascii	"END\000"
 197              		.text
 198              		.align	2
 199              		.global	Find_Nearest_Waypoint
 200              		.thumb
 201              		.thumb_func
 203              	Find_Nearest_Waypoint:
 204              	.LFB1:
 331:geometry.c    **** #endif
 332:geometry.c    **** 
 333:geometry.c    **** void Find_Nearest_Waypoint(float cur_pos_lat, float cur_pos_lon, float * distance, float * bearing,
 334:geometry.c    **** 			   char  * * name) {
 205              		.loc 1 334 0
 206              		.cfi_startproc
 207              		@ args = 0, pretend = 0, frame = 80
 208              		@ frame_needed = 1, uses_anonymous_args = 0
 209 01ac 80B5     		push	{r7, lr}
 210              		.cfi_def_cfa_offset 8
 211              		.cfi_offset 7, -8
 212              		.cfi_offset 14, -4
 213 01ae 94B0     		sub	sp, sp, #80
 214              		.cfi_def_cfa_offset 88
 215 01b0 00AF     		add	r7, sp, #0
 216              		.cfi_def_cfa_register 7
 217 01b2 87ED050A 		fsts	s0, [r7, #20]
 218 01b6 C7ED040A 		fsts	s1, [r7, #16]
 219 01ba F860     		str	r0, [r7, #12]
 220 01bc B960     		str	r1, [r7, #8]
 221 01be 7A60     		str	r2, [r7, #4]
 335:geometry.c    ****   // cur_pos_lat and cur_pos_lon are in degrees
 336:geometry.c    ****   // distance is in kilometers
 337:geometry.c    ****   // bearing is in degrees
 338:geometry.c    ****   
 339:geometry.c    ****   int i=0, closest_i=0;
 222              		.loc 1 339 0
 223 01c0 0023     		movs	r3, #0
 224 01c2 FB64     		str	r3, [r7, #76]
 225 01c4 0023     		movs	r3, #0
 226 01c6 BB64     		str	r3, [r7, #72]
 340:geometry.c    ****   PT_T ref;
 341:geometry.c    ****   float d, b, closest_d=1E10;
 227              		.loc 1 341 0
 228 01c8 40F2F923 		movw	r3, #761
 229 01cc C5F21503 		movt	r3, 20501
 230 01d0 7B64     		str	r3, [r7, #68]	@ float
 342:geometry.c    ****   
 343:geometry.c    ****   *distance = '\0';
 231              		.loc 1 343 0
 232 01d2 FB68     		ldr	r3, [r7, #12]
 233 01d4 4FF00002 		mov	r2, #0
 234 01d8 1A60     		str	r2, [r3]	@ float
 344:geometry.c    ****   *bearing = '\0';
 235              		.loc 1 344 0
 236 01da BB68     		ldr	r3, [r7, #8]
 237 01dc 4FF00002 		mov	r2, #0
 238 01e0 1A60     		str	r2, [r3]	@ float
 345:geometry.c    ****   *name = '\0';
 239              		.loc 1 345 0
 240 01e2 7B68     		ldr	r3, [r7, #4]
 241 01e4 0022     		movs	r2, #0
 242 01e6 1A60     		str	r2, [r3]
 346:geometry.c    ****   
 347:geometry.c    ****   ref.Lat = cur_pos_lat;
 243              		.loc 1 347 0
 244 01e8 7B69     		ldr	r3, [r7, #20]	@ float
 245 01ea 7B62     		str	r3, [r7, #36]	@ float
 348:geometry.c    ****   ref.Lon = cur_pos_lon;
 246              		.loc 1 348 0
 247 01ec 3B69     		ldr	r3, [r7, #16]	@ float
 248 01ee BB62     		str	r3, [r7, #40]	@ float
 349:geometry.c    ****   strcpy(ref.Name, "Reference");
 249              		.loc 1 349 0
 250 01f0 07F12403 		add	r3, r7, #36
 251 01f4 0833     		adds	r3, r3, #8
 252 01f6 40F20002 		movw	r2, #:lower16:.LC0
 253 01fa C0F20002 		movt	r2, #:upper16:.LC0
 254 01fe 07CA     		ldmia	r2, {r0, r1, r2}
 255 0200 03C3     		stmia	r3!, {r0, r1}
 256 0202 1A80     		strh	r2, [r3]	@ movhi
 350:geometry.c    ****   
 351:geometry.c    ****   while (strcmp(waypoints[i].Name, "END")) {
 257              		.loc 1 351 0
 258 0204 1EE0     		b	.L8
 259              	.L11:
 352:geometry.c    **** #if 0  // 1 except for step 9
 353:geometry.c    ****     d = Calc_Distance(&ref, &(waypoints[i]) );
 354:geometry.c    ****     b = Calc_Bearing(&ref, &(waypoints[i]) );
 355:geometry.c    **** #else
 356:geometry.c    ****     Calc_Distance_Bearing(&d, &b, &ref, &(waypoints[i]));
 260              		.loc 1 356 0
 261 0206 FB6C     		ldr	r3, [r7, #76]
 262 0208 5A01     		lsls	r2, r3, #5
 263 020a 40F20003 		movw	r3, #:lower16:waypoints
 264 020e C0F20003 		movt	r3, #:upper16:waypoints
 265 0212 1344     		add	r3, r3, r2
 266 0214 07F12000 		add	r0, r7, #32
 267 0218 07F11C01 		add	r1, r7, #28
 268 021c 07F12402 		add	r2, r7, #36
 269 0220 FFF7FEFF 		bl	Calc_Distance_Bearing
 357:geometry.c    **** #endif
 358:geometry.c    **** 			
 359:geometry.c    ****     // if we found a closer waypoint, remember it and display it
 360:geometry.c    ****     if (d<closest_d) {
 270              		.loc 1 360 0
 271 0224 97ED087A 		flds	s14, [r7, #32]
 272 0228 D7ED117A 		flds	s15, [r7, #68]
 273 022c B4EEE77A 		fcmpes	s14, s15
 274 0230 F1EE10FA 		fmstat
 275 0234 03D5     		bpl	.L9
 361:geometry.c    ****       closest_d = d;
 276              		.loc 1 361 0
 277 0236 3B6A     		ldr	r3, [r7, #32]	@ float
 278 0238 7B64     		str	r3, [r7, #68]	@ float
 362:geometry.c    ****       closest_i = i;
 279              		.loc 1 362 0
 280 023a FB6C     		ldr	r3, [r7, #76]
 281 023c BB64     		str	r3, [r7, #72]
 282              	.L9:
 363:geometry.c    ****     }
 364:geometry.c    ****     i++;
 283              		.loc 1 364 0
 284 023e FB6C     		ldr	r3, [r7, #76]
 285 0240 0133     		adds	r3, r3, #1
 286 0242 FB64     		str	r3, [r7, #76]
 287              	.L8:
 351:geometry.c    **** #if 0  // 1 except for step 9
 288              		.loc 1 351 0
 289 0244 FB6C     		ldr	r3, [r7, #76]
 290 0246 5B01     		lsls	r3, r3, #5
 291 0248 03F10802 		add	r2, r3, #8
 292 024c 40F20003 		movw	r3, #:lower16:waypoints
 293 0250 C0F20003 		movt	r3, #:upper16:waypoints
 294 0254 1344     		add	r3, r3, r2
 295 0256 1846     		mov	r0, r3
 296 0258 40F20001 		movw	r1, #:lower16:.LC1
 297 025c C0F20001 		movt	r1, #:upper16:.LC1
 298 0260 FFF7FEFF 		bl	strcmp
 299 0264 0346     		mov	r3, r0
 300 0266 002B     		cmp	r3, #0
 301 0268 CDD1     		bne	.L11
 365:geometry.c    ****   }
 366:geometry.c    ****   
 367:geometry.c    **** #if 0
 368:geometry.c    ****   d = Calc_Distance(&ref, &(waypoints[closest_i]) );
 369:geometry.c    ****   b = Calc_Bearing(&ref, &(waypoints[closest_i]) );
 370:geometry.c    **** #else
 371:geometry.c    ****   Calc_Distance_Bearing(&d, &b, &ref, &(waypoints[closest_i]));
 302              		.loc 1 371 0
 303 026a BB6C     		ldr	r3, [r7, #72]
 304 026c 5A01     		lsls	r2, r3, #5
 305 026e 40F20003 		movw	r3, #:lower16:waypoints
 306 0272 C0F20003 		movt	r3, #:upper16:waypoints
 307 0276 1344     		add	r3, r3, r2
 308 0278 07F12000 		add	r0, r7, #32
 309 027c 07F11C01 		add	r1, r7, #28
 310 0280 07F12402 		add	r2, r7, #36
 311 0284 FFF7FEFF 		bl	Calc_Distance_Bearing
 372:geometry.c    **** #endif	
 373:geometry.c    ****   // return information to calling function about closest waypoint 
 374:geometry.c    ****   *distance = d;
 312              		.loc 1 374 0
 313 0288 3A6A     		ldr	r2, [r7, #32]	@ float
 314 028a FB68     		ldr	r3, [r7, #12]
 315 028c 1A60     		str	r2, [r3]	@ float
 375:geometry.c    ****   *bearing = b;
 316              		.loc 1 375 0
 317 028e FA69     		ldr	r2, [r7, #28]	@ float
 318 0290 BB68     		ldr	r3, [r7, #8]
 319 0292 1A60     		str	r2, [r3]	@ float
 376:geometry.c    ****   *name = (char * ) (waypoints[closest_i].Name);
 320              		.loc 1 376 0
 321 0294 BB6C     		ldr	r3, [r7, #72]
 322 0296 5B01     		lsls	r3, r3, #5
 323 0298 03F10802 		add	r2, r3, #8
 324 029c 40F20003 		movw	r3, #:lower16:waypoints
 325 02a0 C0F20003 		movt	r3, #:upper16:waypoints
 326 02a4 1A44     		add	r2, r2, r3
 327 02a6 7B68     		ldr	r3, [r7, #4]
 328 02a8 1A60     		str	r2, [r3]
 377:geometry.c    **** }
 329              		.loc 1 377 0
 330 02aa 5037     		adds	r7, r7, #80
 331              		.cfi_def_cfa_offset 8
 332 02ac BD46     		mov	sp, r7
 333              		.cfi_def_cfa_register 13
 334              		@ sp needed
 335 02ae 80BD     		pop	{r7, pc}
 336              		.cfi_endproc
 337              	.LFE1:
 339              	.Letext0:
 340              		.file 2 "geometry.h"
