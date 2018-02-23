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
  20              		.global	p1LatRad
  21              		.bss
  22              		.align	2
  25              	p1LatRad:
  26 0000 00000000 		.space	4
  27              		.global	p1LonRad
  28              		.align	2
  31              	p1LonRad:
  32 0004 00000000 		.space	4
  33              		.text
  34              		.align	2
  35              		.global	Calc_Distance
  36              		.thumb
  37              		.thumb_func
  39              	Calc_Distance:
  40              	.LFB0:
  41              		.file 1 "geometry.c"
   1:geometry.c    **** #include "geometry.h"
   2:geometry.c    **** #include <math.h>
   3:geometry.c    **** #include <string.h>
   4:geometry.c    **** #define PI 3.14159265f
   5:geometry.c    **** #define PI_OVER_180 (PI/180)
   6:geometry.c    **** 
   7:geometry.c    **** extern const PT_T waypoints[];
   8:geometry.c    **** float p1LatRad=0.0, p1LonRad=0.0;
   9:geometry.c    **** 
  10:geometry.c    **** //////////////////////////////////////////////////
  11:geometry.c    **** // Step 8
  12:geometry.c    **** #if 1 // CB: manual CSE of cos(p2->Lat in radians)
  13:geometry.c    **** float Calc_Distance( PT_T * p1,  const PT_T * p2) { 
  42              		.loc 1 13 0
  43              		.cfi_startproc
  44              		@ args = 0, pretend = 0, frame = 16
  45              		@ frame_needed = 1, uses_anonymous_args = 0
  46 0000 80B5     		push	{r7, lr}
  47              		.cfi_def_cfa_offset 8
  48              		.cfi_offset 7, -8
  49              		.cfi_offset 14, -4
  50 0002 2DED028B 		fstmfdd	sp!, {d8}
  51              		.cfi_def_cfa_offset 16
  52              		.cfi_offset 80, -16
  53              		.cfi_offset 81, -12
  54 0006 84B0     		sub	sp, sp, #16
  55              		.cfi_def_cfa_offset 32
  56 0008 00AF     		add	r7, sp, #0
  57              		.cfi_def_cfa_register 7
  58 000a 7860     		str	r0, [r7, #4]
  59 000c 3960     		str	r1, [r7]
  14:geometry.c    **** // calculates distance in kilometers between locations (represented in degrees)
  15:geometry.c    **** //	float p1LonRad, p1LatRad,
  16:geometry.c    ****   float p2LonRad, p2LatRad;
  17:geometry.c    **** 
  18:geometry.c    **** 	//	p1LonRad = p1->Lon*PI_OVER_180;
  19:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
  60              		.loc 1 19 0
  61 000e 3B68     		ldr	r3, [r7]
  62 0010 D3ED017A 		flds	s15, [r3, #4]
  63 0014 9FED2D7A 		flds	s14, .L3
  64 0018 67EE877A 		fmuls	s15, s15, s14
  65 001c C7ED037A 		fsts	s15, [r7, #12]
  20:geometry.c    **** 	//	p1LatRad = p1->Lat*PI_OVER_180;
  21:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
  66              		.loc 1 21 0
  67 0020 3B68     		ldr	r3, [r7]
  68 0022 D3ED007A 		flds	s15, [r3]
  69 0026 9FED297A 		flds	s14, .L3
  70 002a 67EE877A 		fmuls	s15, s15, s14
  71 002e C7ED027A 		fsts	s15, [r7, #8]
  22:geometry.c    **** 
  23:geometry.c    **** 	return acosf(sinf(p1LatRad)*sinf(p2LatRad) + 
  72              		.loc 1 23 0
  73 0032 40F20003 		movw	r3, #:lower16:p1LatRad
  74 0036 C0F20003 		movt	r3, #:upper16:p1LatRad
  75 003a D3ED007A 		flds	s15, [r3]
  76 003e B0EE670A 		fcpys	s0, s15
  77 0042 FFF7FEFF 		bl	sinf
  78 0046 B0EE408A 		fcpys	s16, s0
  79 004a 97ED020A 		flds	s0, [r7, #8]
  80 004e FFF7FEFF 		bl	sinf
  81 0052 F0EE407A 		fcpys	s15, s0
  82 0056 28EE278A 		fmuls	s16, s16, s15
  24:geometry.c    **** 		     cosf(p1LatRad)*cosf(p2LatRad)*
  83              		.loc 1 24 0
  84 005a 40F20003 		movw	r3, #:lower16:p1LatRad
  85 005e C0F20003 		movt	r3, #:upper16:p1LatRad
  86 0062 D3ED007A 		flds	s15, [r3]
  87 0066 B0EE670A 		fcpys	s0, s15
  88 006a FFF7FEFF 		bl	cosf
  89 006e F0EE408A 		fcpys	s17, s0
  90 0072 97ED020A 		flds	s0, [r7, #8]
  91 0076 FFF7FEFF 		bl	cosf
  92 007a F0EE407A 		fcpys	s15, s0
  93 007e 68EEA78A 		fmuls	s17, s17, s15
  25:geometry.c    **** 		     cosf(p2LonRad - p1LonRad)) * 6371;
  94              		.loc 1 25 0
  95 0082 40F20003 		movw	r3, #:lower16:p1LonRad
  96 0086 C0F20003 		movt	r3, #:upper16:p1LonRad
  97 008a D3ED007A 		flds	s15, [r3]
  98 008e 97ED037A 		flds	s14, [r7, #12]
  99 0092 77EE677A 		fsubs	s15, s14, s15
 100 0096 B0EE670A 		fcpys	s0, s15
 101 009a FFF7FEFF 		bl	cosf
 102 009e F0EE407A 		fcpys	s15, s0
  24:geometry.c    **** 		     cosf(p1LatRad)*cosf(p2LatRad)*
 103              		.loc 1 24 0
 104 00a2 68EEA77A 		fmuls	s15, s17, s15
  23:geometry.c    **** 		     cosf(p1LatRad)*cosf(p2LatRad)*
 105              		.loc 1 23 0
 106 00a6 78EE277A 		fadds	s15, s16, s15
 107 00aa B0EE670A 		fcpys	s0, s15
 108 00ae FFF7FEFF 		bl	acosf
 109 00b2 B0EE407A 		fcpys	s14, s0
 110 00b6 DFED067A 		flds	s15, .L3+4
 111 00ba 67EE277A 		fmuls	s15, s14, s15
  26:geometry.c    **** }
 112              		.loc 1 26 0
 113 00be B0EE670A 		fcpys	s0, s15
 114 00c2 1037     		adds	r7, r7, #16
 115              		.cfi_def_cfa_offset 16
 116 00c4 BD46     		mov	sp, r7
 117              		.cfi_def_cfa_register 13
 118              		@ sp needed
 119 00c6 BDEC028B 		fldmfdd	sp!, {d8}
 120              		.cfi_restore 80
 121              		.cfi_restore 81
 122              		.cfi_def_cfa_offset 8
 123 00ca 80BD     		pop	{r7, pc}
 124              	.L4:
 125              		.align	2
 126              	.L3:
 127 00cc 35FA8E3C 		.word	1016003125
 128 00d0 0018C745 		.word	1170675712
 129              		.cfi_endproc
 130              	.LFE0:
 132              		.align	2
 133              		.global	Calc_Bearing
 134              		.thumb
 135              		.thumb_func
 137              	Calc_Bearing:
 138              	.LFB1:
  27:geometry.c    **** 
  28:geometry.c    **** float Calc_Bearing( PT_T * p1,  const PT_T * p2){
 139              		.loc 1 28 0
 140              		.cfi_startproc
 141              		@ args = 0, pretend = 0, frame = 32
 142              		@ frame_needed = 1, uses_anonymous_args = 0
 143 00d4 80B5     		push	{r7, lr}
 144              		.cfi_def_cfa_offset 8
 145              		.cfi_offset 7, -8
 146              		.cfi_offset 14, -4
 147 00d6 2DED028B 		fstmfdd	sp!, {d8}
 148              		.cfi_def_cfa_offset 16
 149              		.cfi_offset 80, -16
 150              		.cfi_offset 81, -12
 151 00da 88B0     		sub	sp, sp, #32
 152              		.cfi_def_cfa_offset 48
 153 00dc 00AF     		add	r7, sp, #0
 154              		.cfi_def_cfa_register 7
 155 00de 7860     		str	r0, [r7, #4]
 156 00e0 3960     		str	r1, [r7]
  29:geometry.c    **** // calculates bearing in degrees between locations (represented in degrees)	
  30:geometry.c    **** //	float p1LonRad, p1LatRad,
  31:geometry.c    ****   float p2LonRad, p2LatRad;
  32:geometry.c    **** 	float cosp2LatRad;
  33:geometry.c    **** 	float term1, term2;
  34:geometry.c    **** 	
  35:geometry.c    **** 	float angle;
  36:geometry.c    **** 	
  37:geometry.c    **** 	//	p1LonRad = p1->Lon*PI_OVER_180;
  38:geometry.c    **** 	p2LonRad = p2->Lon*PI_OVER_180;
 157              		.loc 1 38 0
 158 00e2 3B68     		ldr	r3, [r7]
 159 00e4 D3ED017A 		flds	s15, [r3, #4]
 160 00e8 9FED457A 		flds	s14, .L10
 161 00ec 67EE877A 		fmuls	s15, s15, s14
 162 00f0 C7ED067A 		fsts	s15, [r7, #24]
  39:geometry.c    **** 	//	p1LatRad = p1->Lat*PI_OVER_180;
  40:geometry.c    **** 	p2LatRad = p2->Lat*PI_OVER_180;
 163              		.loc 1 40 0
 164 00f4 3B68     		ldr	r3, [r7]
 165 00f6 D3ED007A 		flds	s15, [r3]
 166 00fa 9FED417A 		flds	s14, .L10
 167 00fe 67EE877A 		fmuls	s15, s15, s14
 168 0102 C7ED057A 		fsts	s15, [r7, #20]
  41:geometry.c    **** 	cosp2LatRad = cosf(p2LatRad);
 169              		.loc 1 41 0
 170 0106 97ED050A 		flds	s0, [r7, #20]
 171 010a FFF7FEFF 		bl	cosf
 172 010e 87ED040A 		fsts	s0, [r7, #16]
  42:geometry.c    **** 	
  43:geometry.c    **** 	term1 = sinf(p1LonRad - p2LonRad)*cosp2LatRad;
 173              		.loc 1 43 0
 174 0112 40F20003 		movw	r3, #:lower16:p1LonRad
 175 0116 C0F20003 		movt	r3, #:upper16:p1LonRad
 176 011a 93ED007A 		flds	s14, [r3]
 177 011e D7ED067A 		flds	s15, [r7, #24]
 178 0122 77EE677A 		fsubs	s15, s14, s15
 179 0126 B0EE670A 		fcpys	s0, s15
 180 012a FFF7FEFF 		bl	sinf
 181 012e B0EE407A 		fcpys	s14, s0
 182 0132 D7ED047A 		flds	s15, [r7, #16]
 183 0136 67EE277A 		fmuls	s15, s14, s15
 184 013a C7ED037A 		fsts	s15, [r7, #12]
  44:geometry.c    **** 	term2 = cosf(p1LatRad)*sinf(p2LatRad) - 
 185              		.loc 1 44 0
 186 013e 40F20003 		movw	r3, #:lower16:p1LatRad
 187 0142 C0F20003 		movt	r3, #:upper16:p1LatRad
 188 0146 D3ED007A 		flds	s15, [r3]
 189 014a B0EE670A 		fcpys	s0, s15
 190 014e FFF7FEFF 		bl	cosf
 191 0152 B0EE408A 		fcpys	s16, s0
 192 0156 97ED050A 		flds	s0, [r7, #20]
 193 015a FFF7FEFF 		bl	sinf
 194 015e F0EE407A 		fcpys	s15, s0
 195 0162 28EE278A 		fmuls	s16, s16, s15
  45:geometry.c    **** 	  sinf(p1LatRad)*
 196              		.loc 1 45 0
 197 0166 40F20003 		movw	r3, #:lower16:p1LatRad
 198 016a C0F20003 		movt	r3, #:upper16:p1LatRad
 199 016e D3ED007A 		flds	s15, [r3]
 200 0172 B0EE670A 		fcpys	s0, s15
 201 0176 FFF7FEFF 		bl	sinf
 202 017a B0EE407A 		fcpys	s14, s0
 203 017e D7ED047A 		flds	s15, [r7, #16]
 204 0182 67EE278A 		fmuls	s17, s14, s15
  46:geometry.c    **** 	  cosp2LatRad*
  47:geometry.c    **** 	  cosf(p1LonRad - p2LonRad);
 205              		.loc 1 47 0
 206 0186 40F20003 		movw	r3, #:lower16:p1LonRad
 207 018a C0F20003 		movt	r3, #:upper16:p1LonRad
 208 018e 93ED007A 		flds	s14, [r3]
 209 0192 D7ED067A 		flds	s15, [r7, #24]
 210 0196 77EE677A 		fsubs	s15, s14, s15
 211 019a B0EE670A 		fcpys	s0, s15
 212 019e FFF7FEFF 		bl	cosf
 213 01a2 F0EE407A 		fcpys	s15, s0
  46:geometry.c    **** 	  cosp2LatRad*
 214              		.loc 1 46 0
 215 01a6 68EEA77A 		fmuls	s15, s17, s15
  44:geometry.c    **** 	  sinf(p1LatRad)*
 216              		.loc 1 44 0
 217 01aa 78EE677A 		fsubs	s15, s16, s15
 218 01ae C7ED027A 		fsts	s15, [r7, #8]
  48:geometry.c    **** 	angle = atan2f(term1, term2) * (180/PI);
 219              		.loc 1 48 0
 220 01b2 97ED030A 		flds	s0, [r7, #12]
 221 01b6 D7ED020A 		flds	s1, [r7, #8]
 222 01ba FFF7FEFF 		bl	atan2f
 223 01be B0EE407A 		fcpys	s14, s0
 224 01c2 DFED107A 		flds	s15, .L10+4
 225 01c6 67EE277A 		fmuls	s15, s14, s15
 226 01ca C7ED077A 		fsts	s15, [r7, #28]
  49:geometry.c    **** 	if (angle < 0.0)
 227              		.loc 1 49 0
 228 01ce D7ED077A 		flds	s15, [r7, #28]
 229 01d2 F5EEC07A 		fcmpezs	s15
 230 01d6 F1EE10FA 		fmstat
 231 01da 07D5     		bpl	.L6
  50:geometry.c    **** 		angle += 360;
 232              		.loc 1 50 0
 233 01dc D7ED077A 		flds	s15, [r7, #28]
 234 01e0 9FED097A 		flds	s14, .L10+8
 235 01e4 77EE877A 		fadds	s15, s15, s14
 236 01e8 C7ED077A 		fsts	s15, [r7, #28]
 237              	.L6:
  51:geometry.c    **** 	return angle;
 238              		.loc 1 51 0
 239 01ec FB69     		ldr	r3, [r7, #28]	@ float
 240 01ee 07EE903A 		fmsr	s15, r3
  52:geometry.c    **** }
 241              		.loc 1 52 0
 242 01f2 B0EE670A 		fcpys	s0, s15
 243 01f6 2037     		adds	r7, r7, #32
 244              		.cfi_def_cfa_offset 16
 245 01f8 BD46     		mov	sp, r7
 246              		.cfi_def_cfa_register 13
 247              		@ sp needed
 248 01fa BDEC028B 		fldmfdd	sp!, {d8}
 249              		.cfi_restore 80
 250              		.cfi_restore 81
 251              		.cfi_def_cfa_offset 8
 252 01fe 80BD     		pop	{r7, pc}
 253              	.L11:
 254              		.align	2
 255              	.L10:
 256 0200 35FA8E3C 		.word	1016003125
 257 0204 E02E6542 		.word	1113927392
 258 0208 0000B443 		.word	1135869952
 259              		.cfi_endproc
 260              	.LFE1:
 262              		.section	.rodata
 263              		.align	2
 264              	.LC0:
 265 0000 52656665 		.ascii	"Reference\000"
 265      72656E63 
 265      6500
 266 000a 0000     		.text
 267              		.align	2
 268              		.global	Find_Nearest_Waypoint
 269              		.thumb
 270              		.thumb_func
 272              	Find_Nearest_Waypoint:
 273              	.LFB2:
  53:geometry.c    **** #endif
  54:geometry.c    **** 
  55:geometry.c    **** 
  56:geometry.c    **** 
  57:geometry.c    **** 
  58:geometry.c    **** void Find_Nearest_Waypoint(float cur_pos_lat, float cur_pos_lon, float * distance, float * bearing,
  59:geometry.c    **** 			   char  * * name) {
 274              		.loc 1 59 0
 275              		.cfi_startproc
 276              		@ args = 0, pretend = 0, frame = 80
 277              		@ frame_needed = 1, uses_anonymous_args = 0
 278 020c 80B5     		push	{r7, lr}
 279              		.cfi_def_cfa_offset 8
 280              		.cfi_offset 7, -8
 281              		.cfi_offset 14, -4
 282 020e 94B0     		sub	sp, sp, #80
 283              		.cfi_def_cfa_offset 88
 284 0210 00AF     		add	r7, sp, #0
 285              		.cfi_def_cfa_register 7
 286 0212 87ED050A 		fsts	s0, [r7, #20]
 287 0216 C7ED040A 		fsts	s1, [r7, #16]
 288 021a F860     		str	r0, [r7, #12]
 289 021c B960     		str	r1, [r7, #8]
 290 021e 7A60     		str	r2, [r7, #4]
  60:geometry.c    ****   // cur_pos_lat and cur_pos_lon are in degrees
  61:geometry.c    ****   // distance is in kilometers
  62:geometry.c    ****   // bearing is in degrees
  63:geometry.c    ****   
  64:geometry.c    ****   int i=0, closest_i=0;
 291              		.loc 1 64 0
 292 0220 0023     		movs	r3, #0
 293 0222 FB64     		str	r3, [r7, #76]
 294 0224 0023     		movs	r3, #0
 295 0226 BB64     		str	r3, [r7, #72]
  65:geometry.c    ****   PT_T ref;
  66:geometry.c    ****   float d, b, closest_d=1E10;
 296              		.loc 1 66 0
 297 0228 40F2F923 		movw	r3, #761
 298 022c C5F21503 		movt	r3, 20501
 299 0230 7B64     		str	r3, [r7, #68]	@ float
  67:geometry.c    ****   
  68:geometry.c    ****   *distance = '\0';
 300              		.loc 1 68 0
 301 0232 FB68     		ldr	r3, [r7, #12]
 302 0234 4FF00002 		mov	r2, #0
 303 0238 1A60     		str	r2, [r3]	@ float
  69:geometry.c    ****   *bearing = '\0';
 304              		.loc 1 69 0
 305 023a BB68     		ldr	r3, [r7, #8]
 306 023c 4FF00002 		mov	r2, #0
 307 0240 1A60     		str	r2, [r3]	@ float
  70:geometry.c    ****   *name = '\0';
 308              		.loc 1 70 0
 309 0242 7B68     		ldr	r3, [r7, #4]
 310 0244 0022     		movs	r2, #0
 311 0246 1A60     		str	r2, [r3]
  71:geometry.c    ****   
  72:geometry.c    ****   ref.Lat = cur_pos_lat;
 312              		.loc 1 72 0
 313 0248 7B69     		ldr	r3, [r7, #20]	@ float
 314 024a FB61     		str	r3, [r7, #28]	@ float
  73:geometry.c    ****   ref.Lon = cur_pos_lon;
 315              		.loc 1 73 0
 316 024c 3B69     		ldr	r3, [r7, #16]	@ float
 317 024e 3B62     		str	r3, [r7, #32]	@ float
  74:geometry.c    ****   strcpy(ref.Name, "Reference");
 318              		.loc 1 74 0
 319 0250 07F11C03 		add	r3, r7, #28
 320 0254 0833     		adds	r3, r3, #8
 321 0256 40F20002 		movw	r2, #:lower16:.LC0
 322 025a C0F20002 		movt	r2, #:upper16:.LC0
 323 025e 07CA     		ldmia	r2, {r0, r1, r2}
 324 0260 03C3     		stmia	r3!, {r0, r1}
 325 0262 1A80     		strh	r2, [r3]	@ movhi
  75:geometry.c    **** 
  76:geometry.c    ****   p1LatRad = cur_pos_lat*PI_OVER_180;
 326              		.loc 1 76 0
 327 0264 D7ED057A 		flds	s15, [r7, #20]
 328 0268 9FED2D7A 		flds	s14, .L18
 329 026c 67EE877A 		fmuls	s15, s15, s14
 330 0270 40F20003 		movw	r3, #:lower16:p1LatRad
 331 0274 C0F20003 		movt	r3, #:upper16:p1LatRad
 332 0278 C3ED007A 		fsts	s15, [r3]
  77:geometry.c    ****   p1LonRad = cur_pos_lon*PI_OVER_180;
 333              		.loc 1 77 0
 334 027c D7ED047A 		flds	s15, [r7, #16]
 335 0280 9FED277A 		flds	s14, .L18
 336 0284 67EE877A 		fmuls	s15, s15, s14
 337 0288 40F20003 		movw	r3, #:lower16:p1LonRad
 338 028c C0F20003 		movt	r3, #:upper16:p1LonRad
 339 0290 C3ED007A 		fsts	s15, [r3]
  78:geometry.c    **** 	
  79:geometry.c    ****   //  while (strcmp(waypoints[i].Name, "END")) {
  80:geometry.c    ****   while (i<163) {
 340              		.loc 1 80 0
 341 0294 1EE0     		b	.L13
 342              	.L16:
  81:geometry.c    ****     d = Calc_Distance(&ref, &(waypoints[i]) );
 343              		.loc 1 81 0
 344 0296 FB6C     		ldr	r3, [r7, #76]
 345 0298 5A01     		lsls	r2, r3, #5
 346 029a 40F20003 		movw	r3, #:lower16:waypoints
 347 029e C0F20003 		movt	r3, #:upper16:waypoints
 348 02a2 1344     		add	r3, r3, r2
 349 02a4 07F11C02 		add	r2, r7, #28
 350 02a8 1046     		mov	r0, r2
 351 02aa 1946     		mov	r1, r3
 352 02ac FFF7FEFF 		bl	Calc_Distance
 353 02b0 87ED100A 		fsts	s0, [r7, #64]
  82:geometry.c    ****     // b = Calc_Bearing(&ref, &(waypoints[i]) );
  83:geometry.c    **** 
  84:geometry.c    ****     // if we found a closer waypoint, remember it and display it
  85:geometry.c    ****     if (d<closest_d) {
 354              		.loc 1 85 0
 355 02b4 97ED107A 		flds	s14, [r7, #64]
 356 02b8 D7ED117A 		flds	s15, [r7, #68]
 357 02bc B4EEE77A 		fcmpes	s14, s15
 358 02c0 F1EE10FA 		fmstat
 359 02c4 03D5     		bpl	.L14
  86:geometry.c    ****       closest_d = d;
 360              		.loc 1 86 0
 361 02c6 3B6C     		ldr	r3, [r7, #64]	@ float
 362 02c8 7B64     		str	r3, [r7, #68]	@ float
  87:geometry.c    ****       closest_i = i;
 363              		.loc 1 87 0
 364 02ca FB6C     		ldr	r3, [r7, #76]
 365 02cc BB64     		str	r3, [r7, #72]
 366              	.L14:
  88:geometry.c    ****     }
  89:geometry.c    ****     i++;
 367              		.loc 1 89 0
 368 02ce FB6C     		ldr	r3, [r7, #76]
 369 02d0 0133     		adds	r3, r3, #1
 370 02d2 FB64     		str	r3, [r7, #76]
 371              	.L13:
  80:geometry.c    ****     d = Calc_Distance(&ref, &(waypoints[i]) );
 372              		.loc 1 80 0
 373 02d4 FB6C     		ldr	r3, [r7, #76]
 374 02d6 A22B     		cmp	r3, #162
 375 02d8 DDDD     		ble	.L16
  90:geometry.c    ****   }
  91:geometry.c    ****   
  92:geometry.c    **** 
  93:geometry.c    ****   b = Calc_Bearing(&ref, &(waypoints[closest_i]) );
 376              		.loc 1 93 0
 377 02da BB6C     		ldr	r3, [r7, #72]
 378 02dc 5A01     		lsls	r2, r3, #5
 379 02de 40F20003 		movw	r3, #:lower16:waypoints
 380 02e2 C0F20003 		movt	r3, #:upper16:waypoints
 381 02e6 1344     		add	r3, r3, r2
 382 02e8 07F11C02 		add	r2, r7, #28
 383 02ec 1046     		mov	r0, r2
 384 02ee 1946     		mov	r1, r3
 385 02f0 FFF7FEFF 		bl	Calc_Bearing
 386 02f4 87ED0F0A 		fsts	s0, [r7, #60]
  94:geometry.c    **** 
  95:geometry.c    ****   // return information to calling function about closest waypoint 
  96:geometry.c    ****   *distance = closest_d;
 387              		.loc 1 96 0
 388 02f8 FB68     		ldr	r3, [r7, #12]
 389 02fa 7A6C     		ldr	r2, [r7, #68]	@ float
 390 02fc 1A60     		str	r2, [r3]	@ float
  97:geometry.c    ****   *bearing = b;
 391              		.loc 1 97 0
 392 02fe BB68     		ldr	r3, [r7, #8]
 393 0300 FA6B     		ldr	r2, [r7, #60]	@ float
 394 0302 1A60     		str	r2, [r3]	@ float
  98:geometry.c    ****   *name = (char * ) (waypoints[closest_i].Name);
 395              		.loc 1 98 0
 396 0304 BB6C     		ldr	r3, [r7, #72]
 397 0306 5B01     		lsls	r3, r3, #5
 398 0308 03F10802 		add	r2, r3, #8
 399 030c 40F20003 		movw	r3, #:lower16:waypoints
 400 0310 C0F20003 		movt	r3, #:upper16:waypoints
 401 0314 1A44     		add	r2, r2, r3
 402 0316 7B68     		ldr	r3, [r7, #4]
 403 0318 1A60     		str	r2, [r3]
  99:geometry.c    **** }
 404              		.loc 1 99 0
 405 031a 5037     		adds	r7, r7, #80
 406              		.cfi_def_cfa_offset 8
 407 031c BD46     		mov	sp, r7
 408              		.cfi_def_cfa_register 13
 409              		@ sp needed
 410 031e 80BD     		pop	{r7, pc}
 411              	.L19:
 412              		.align	2
 413              	.L18:
 414 0320 35FA8E3C 		.word	1016003125
 415              		.cfi_endproc
 416              	.LFE2:
 418              	.Letext0:
 419              		.file 2 "geometry.h"
