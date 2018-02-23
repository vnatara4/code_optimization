   1              		.syntax unified
   2              		.cpu cortex-a8
   3              		.eabi_attribute 27, 3
   4              		.eabi_attribute 28, 1
   5              		.fpu neon
   6              		.eabi_attribute 23, 1
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 2
  10              		.eabi_attribute 30, 2
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.align	2
  19              		.global	init_data
  20              		.thumb
  21              		.thumb_func
  23              	init_data:
  24              	.LFB1912:
  25              		.file 1 "main.c"
   1:main.c        **** /*----------------------------------------------------------------------------
   2:main.c        ****  *----------------------------------------------------------------------------*/
   3:main.c        **** #include <math.h>
   4:main.c        **** #include <stdio.h>
   5:main.c        **** #include <stdint.h>
   6:main.c        **** #include <stdlib.h>
   7:main.c        **** #include <string.h>
   8:main.c        **** #include <time.h>
   9:main.c        **** #include <arm_neon.h>
  10:main.c        **** #include <arm_acle.h>
  11:main.c        **** 
  12:main.c        **** #define DEBUG (0)
  13:main.c        **** #define USE_SIMD (1)
  14:main.c        **** 
  15:main.c        **** #define N_TESTS (1000)
  16:main.c        **** 
  17:main.c        **** #define N_POINTS (10000)
  18:main.c        **** /*----------------------------------------------------------------------------
  19:main.c        ****   MAIN function
  20:main.c        ****  *----------------------------------------------------------------------------*/
  21:main.c        **** float x[N_POINTS];
  22:main.c        **** 
  23:main.c        **** void init_data(void) {
  26              		.loc 1 23 0
  27              		.cfi_startproc
  28              		@ args = 0, pretend = 0, frame = 0
  29              		@ frame_needed = 0, uses_anonymous_args = 0
  30              	.LVL0:
  31 0000 38B5     		push	{r3, r4, r5, lr}
  32              		.cfi_def_cfa_offset 16
  33              		.cfi_offset 3, -16
  34              		.cfi_offset 4, -12
  35              		.cfi_offset 5, -8
  36              		.cfi_offset 14, -4
  37 0002 40F20004 		movw	r4, #:lower16:x
  38 0006 2DED028B 		fstmfdd	sp!, {d8}
  39              		.cfi_def_cfa_offset 24
  40              		.cfi_offset 80, -24
  41              		.cfi_offset 81, -20
  42 000a C0F20004 		movt	r4, #:upper16:x
  43 000e 0B4D     		ldr	r5, .L6
  44              	.LVL1:
  45              	.L2:
  24:main.c        ****   int i;
  25:main.c        **** 
  26:main.c        ****   for (i=0; i<N_POINTS; i++) {
  27:main.c        ****     x[i] = ((float) rand())/rand();
  46              		.loc 1 27 0 discriminator 3
  47 0010 FFF7FEFF 		bl	rand
  48              	.LVL2:
  49 0014 08EE100A 		fmsr	s16, r0	@ int
  50 0018 FFF7FEFF 		bl	rand
  51              	.LVL3:
  52 001c B8EEC88A 		fsitos	s16, s16
  53 0020 07EE900A 		fmsr	s15, r0	@ int
  54 0024 F8EEE77A 		fsitos	s15, s15
  55 0028 88EE278A 		fdivs	s16, s16, s15
  56 002c A4EC018A 		fstmias	r4!, {s16}
  26:main.c        ****     x[i] = ((float) rand())/rand();
  57              		.loc 1 26 0 discriminator 3
  58 0030 AC42     		cmp	r4, r5
  59 0032 EDD1     		bne	.L2
  28:main.c        ****   }
  29:main.c        **** }
  60              		.loc 1 29 0
  61 0034 BDEC028B 		fldmfdd	sp!, {d8}
  62              		.cfi_restore 80
  63              		.cfi_restore 81
  64              		.cfi_def_cfa_offset 16
  65 0038 38BD     		pop	{r3, r4, r5, pc}
  66              	.L7:
  67 003a 00BF     		.align	2
  68              	.L6:
  69 003c 409C0000 		.word	x+40000
  70              		.cfi_endproc
  71              	.LFE1912:
  73              		.align	2
  74              		.global	print_float32x4
  75              		.thumb
  76              		.thumb_func
  78              	print_float32x4:
  79              	.LFB1913:
  30:main.c        **** 
  31:main.c        **** void print_float32x4(float32x4_t v4) {
  80              		.loc 1 31 0
  81              		.cfi_startproc
  82              		@ args = 0, pretend = 0, frame = 16
  83              		@ frame_needed = 0, uses_anonymous_args = 0
  84              	.LVL4:
  85              	.LBB61:
  86              	.LBB62:
  87              		.file 2 "/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h"
   1:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** /* ARM NEON intrinsics include file.
   2:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
   3:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    Copyright (C) 2006-2014 Free Software Foundation, Inc.
   4:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    Contributed by CodeSourcery.
   5:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
   6:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    This file is part of GCC.
   7:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
   8:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    GCC is free software; you can redistribute it and/or modify it
   9:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    under the terms of the GNU General Public License as published
  10:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    by the Free Software Foundation; either version 3, or (at your
  11:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    option) any later version.
  12:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  13:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    GCC is distributed in the hope that it will be useful, but WITHOUT
  14:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  15:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
  16:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    License for more details.
  17:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  18:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    Under Section 7 of GPL version 3, you are granted additional
  19:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    permissions described in the GCC Runtime Library Exception, version
  20:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    3.1, as published by the Free Software Foundation.
  21:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  22:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    You should have received a copy of the GNU General Public License and
  23:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    a copy of the GCC Runtime Library Exception along with this program;
  24:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  25:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    <http://www.gnu.org/licenses/>.  */
  26:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  27:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifndef _GCC_ARM_NEON_H
  28:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #define _GCC_ARM_NEON_H 1
  29:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  30:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifndef __ARM_NEON__
  31:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
  32:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
  33:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  34:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __cplusplus
  35:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** extern "C" {
  36:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
  37:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  38:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #include <stdint.h>
  39:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  40:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_qi int8x8_t	__attribute__ ((__vector_size__ (8)));
  41:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_hi int16x4_t	__attribute__ ((__vector_size__ (8)));
  42:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_si int32x2_t	__attribute__ ((__vector_size__ (8)));
  43:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_di int64x1_t;
  44:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_hf float16x4_t	__attribute__ ((__vector_size__ (8)));
  45:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_sf float32x2_t	__attribute__ ((__vector_size__ (8)));
  46:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly8 poly8x8_t	__attribute__ ((__vector_size__ (8)));
  47:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly16 poly16x4_t	__attribute__ ((__vector_size__ (8)));
  48:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
  49:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly64 poly64x1_t;
  50:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
  51:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_uqi uint8x8_t	__attribute__ ((__vector_size__ (8)));
  52:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_uhi uint16x4_t	__attribute__ ((__vector_size__ (8)));
  53:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_usi uint32x2_t	__attribute__ ((__vector_size__ (8)));
  54:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_udi uint64x1_t;
  55:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_qi int8x16_t	__attribute__ ((__vector_size__ (16)));
  56:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_hi int16x8_t	__attribute__ ((__vector_size__ (16)));
  57:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_si int32x4_t	__attribute__ ((__vector_size__ (16)));
  58:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_di int64x2_t	__attribute__ ((__vector_size__ (16)));
  59:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_sf float32x4_t	__attribute__ ((__vector_size__ (16)));
  60:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly8 poly8x16_t	__attribute__ ((__vector_size__ (16)));
  61:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly16 poly16x8_t	__attribute__ ((__vector_size__ (16)));
  62:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
  63:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly64 poly64x2_t	__attribute__ ((__vector_size__ (16)));
  64:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
  65:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_uqi uint8x16_t	__attribute__ ((__vector_size__ (16)));
  66:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_uhi uint16x8_t	__attribute__ ((__vector_size__ (16)));
  67:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_usi uint32x4_t	__attribute__ ((__vector_size__ (16)));
  68:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_udi uint64x2_t	__attribute__ ((__vector_size__ (16)));
  69:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  70:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef float float32_t;
  71:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly8 poly8_t;
  72:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly16 poly16_t;
  73:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
  74:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly64 poly64_t;
  75:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef __builtin_neon_poly128 poly128_t;
  76:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
  77:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  78:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int8x8x2_t
  79:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
  80:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x8_t val[2];
  81:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int8x8x2_t;
  82:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  83:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int8x16x2_t
  84:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
  85:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x16_t val[2];
  86:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int8x16x2_t;
  87:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  88:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int16x4x2_t
  89:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
  90:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x4_t val[2];
  91:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int16x4x2_t;
  92:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  93:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int16x8x2_t
  94:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
  95:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x8_t val[2];
  96:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int16x8x2_t;
  97:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
  98:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int32x2x2_t
  99:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x2_t val[2];
 101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int32x2x2_t;
 102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int32x4x2_t
 104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x4_t val[2];
 106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int32x4x2_t;
 107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int64x1x2_t
 109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int64x1_t val[2];
 111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int64x1x2_t;
 112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int64x2x2_t
 114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int64x2_t val[2];
 116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int64x2x2_t;
 117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint8x8x2_t
 119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x8_t val[2];
 121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint8x8x2_t;
 122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint8x16x2_t
 124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x16_t val[2];
 126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint8x16x2_t;
 127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint16x4x2_t
 129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x4_t val[2];
 131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint16x4x2_t;
 132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint16x8x2_t
 134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x8_t val[2];
 136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint16x8x2_t;
 137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint32x2x2_t
 139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x2_t val[2];
 141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint32x2x2_t;
 142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint32x4x2_t
 144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x4_t val[2];
 146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint32x4x2_t;
 147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint64x1x2_t
 149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint64x1_t val[2];
 151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint64x1x2_t;
 152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint64x2x2_t
 154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint64x2_t val[2];
 156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint64x2x2_t;
 157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct float32x2x2_t
 159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x2_t val[2];
 161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } float32x2x2_t;
 162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct float32x4x2_t
 164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x4_t val[2];
 166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } float32x4x2_t;
 167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly8x8x2_t
 169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x8_t val[2];
 171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly8x8x2_t;
 172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly8x16x2_t
 174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x16_t val[2];
 176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly8x16x2_t;
 177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly16x4x2_t
 179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x4_t val[2];
 181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly16x4x2_t;
 182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly16x8x2_t
 184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x8_t val[2];
 186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly16x8x2_t;
 187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
 189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly64x1x2_t
 190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly64x1_t val[2];
 192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly64x1x2_t;
 193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
 194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
 197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly64x2x2_t
 198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly64x2_t val[2];
 200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly64x2x2_t;
 201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
 202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int8x8x3_t
 205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x8_t val[3];
 207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int8x8x3_t;
 208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int8x16x3_t
 210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x16_t val[3];
 212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int8x16x3_t;
 213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int16x4x3_t
 215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x4_t val[3];
 217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int16x4x3_t;
 218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int16x8x3_t
 220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x8_t val[3];
 222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int16x8x3_t;
 223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int32x2x3_t
 225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x2_t val[3];
 227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int32x2x3_t;
 228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int32x4x3_t
 230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x4_t val[3];
 232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int32x4x3_t;
 233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int64x1x3_t
 235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int64x1_t val[3];
 237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int64x1x3_t;
 238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int64x2x3_t
 240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int64x2_t val[3];
 242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int64x2x3_t;
 243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint8x8x3_t
 245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x8_t val[3];
 247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint8x8x3_t;
 248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint8x16x3_t
 250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x16_t val[3];
 252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint8x16x3_t;
 253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint16x4x3_t
 255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x4_t val[3];
 257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint16x4x3_t;
 258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint16x8x3_t
 260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x8_t val[3];
 262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint16x8x3_t;
 263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint32x2x3_t
 265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x2_t val[3];
 267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint32x2x3_t;
 268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint32x4x3_t
 270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x4_t val[3];
 272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint32x4x3_t;
 273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint64x1x3_t
 275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint64x1_t val[3];
 277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint64x1x3_t;
 278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint64x2x3_t
 280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint64x2_t val[3];
 282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint64x2x3_t;
 283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct float32x2x3_t
 285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x2_t val[3];
 287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } float32x2x3_t;
 288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct float32x4x3_t
 290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x4_t val[3];
 292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } float32x4x3_t;
 293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly8x8x3_t
 295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x8_t val[3];
 297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly8x8x3_t;
 298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly8x16x3_t
 300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x16_t val[3];
 302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly8x16x3_t;
 303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly16x4x3_t
 305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x4_t val[3];
 307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly16x4x3_t;
 308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly16x8x3_t
 310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x8_t val[3];
 312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly16x8x3_t;
 313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
 315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly64x1x3_t
 316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly64x1_t val[3];
 318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly64x1x3_t;
 319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
 320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
 323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly64x2x3_t
 324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly64x2_t val[3];
 326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly64x2x3_t;
 327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
 328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int8x8x4_t
 331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x8_t val[4];
 333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int8x8x4_t;
 334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int8x16x4_t
 336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x16_t val[4];
 338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int8x16x4_t;
 339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int16x4x4_t
 341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x4_t val[4];
 343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int16x4x4_t;
 344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int16x8x4_t
 346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x8_t val[4];
 348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int16x8x4_t;
 349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int32x2x4_t
 351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x2_t val[4];
 353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int32x2x4_t;
 354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int32x4x4_t
 356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x4_t val[4];
 358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int32x4x4_t;
 359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int64x1x4_t
 361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int64x1_t val[4];
 363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int64x1x4_t;
 364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct int64x2x4_t
 366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int64x2_t val[4];
 368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } int64x2x4_t;
 369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint8x8x4_t
 371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x8_t val[4];
 373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint8x8x4_t;
 374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint8x16x4_t
 376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x16_t val[4];
 378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint8x16x4_t;
 379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint16x4x4_t
 381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x4_t val[4];
 383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint16x4x4_t;
 384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint16x8x4_t
 386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x8_t val[4];
 388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint16x8x4_t;
 389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint32x2x4_t
 391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x2_t val[4];
 393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint32x2x4_t;
 394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint32x4x4_t
 396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x4_t val[4];
 398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint32x4x4_t;
 399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint64x1x4_t
 401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint64x1_t val[4];
 403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint64x1x4_t;
 404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct uint64x2x4_t
 406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint64x2_t val[4];
 408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } uint64x2x4_t;
 409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct float32x2x4_t
 411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x2_t val[4];
 413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } float32x2x4_t;
 414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct float32x4x4_t
 416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x4_t val[4];
 418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } float32x4x4_t;
 419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly8x8x4_t
 421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x8_t val[4];
 423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly8x8x4_t;
 424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly8x16x4_t
 426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x16_t val[4];
 428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly8x16x4_t;
 429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly16x4x4_t
 431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x4_t val[4];
 433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly16x4x4_t;
 434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly16x8x4_t
 436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x8_t val[4];
 438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly16x8x4_t;
 439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
 441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly64x1x4_t
 442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly64x1_t val[4];
 444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly64x1x4_t;
 445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
 446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
 449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** typedef struct poly64x2x4_t
 450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly64x2_t val[4];
 452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** } poly64x2x4_t;
 453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
 454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
 458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_s8 (int8x8_t __a, int8x8_t __b)
 459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vaddv8qi (__a, __b, 1);
 461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
 464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_s16 (int16x4_t __a, int16x4_t __b)
 465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vaddv4hi (__a, __b, 1);
 467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
 470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_s32 (int32x2_t __a, int32x2_t __b)
 471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vaddv2si (__a, __b, 1);
 473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
 476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_f32 (float32x2_t __a, float32x2_t __b)
 477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vaddv2sf (__a, __b, 3);
 479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
 482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_u8 (uint8x8_t __a, uint8x8_t __b)
 483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vaddv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
 485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
 488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_u16 (uint16x4_t __a, uint16x4_t __b)
 489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vaddv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
 491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
 494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_u32 (uint32x2_t __a, uint32x2_t __b)
 495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vaddv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
 497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
 500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_s64 (int64x1_t __a, int64x1_t __b)
 501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vadddi (__a, __b, 1);
 503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
 506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vadd_u64 (uint64x1_t __a, uint64x1_t __b)
 507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vadddi ((int64x1_t) __a, (int64x1_t) __b, 0);
 509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
 512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_s8 (int8x16_t __a, int8x16_t __b)
 513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vaddv16qi (__a, __b, 1);
 515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
 518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_s16 (int16x8_t __a, int16x8_t __b)
 519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vaddv8hi (__a, __b, 1);
 521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
 524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_s32 (int32x4_t __a, int32x4_t __b)
 525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vaddv4si (__a, __b, 1);
 527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
 530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_s64 (int64x2_t __a, int64x2_t __b)
 531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vaddv2di (__a, __b, 1);
 533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
 536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_f32 (float32x4_t __a, float32x4_t __b)
 537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vaddv4sf (__a, __b, 3);
 539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
 542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_u8 (uint8x16_t __a, uint8x16_t __b)
 543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vaddv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
 545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
 548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_u16 (uint16x8_t __a, uint16x8_t __b)
 549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vaddv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
 551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
 554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_u32 (uint32x4_t __a, uint32x4_t __b)
 555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vaddv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
 557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
 560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddq_u64 (uint64x2_t __a, uint64x2_t __b)
 561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vaddv2di ((int64x2_t) __a, (int64x2_t) __b, 0);
 563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
 566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddl_s8 (int8x8_t __a, int8x8_t __b)
 567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vaddlv8qi (__a, __b, 1);
 569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
 572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddl_s16 (int16x4_t __a, int16x4_t __b)
 573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vaddlv4hi (__a, __b, 1);
 575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
 578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddl_s32 (int32x2_t __a, int32x2_t __b)
 579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vaddlv2si (__a, __b, 1);
 581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
 584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddl_u8 (uint8x8_t __a, uint8x8_t __b)
 585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vaddlv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
 587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
 590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddl_u16 (uint16x4_t __a, uint16x4_t __b)
 591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vaddlv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
 593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
 596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddl_u32 (uint32x2_t __a, uint32x2_t __b)
 597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vaddlv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
 599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
 602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddw_s8 (int16x8_t __a, int8x8_t __b)
 603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vaddwv8qi (__a, __b, 1);
 605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
 608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddw_s16 (int32x4_t __a, int16x4_t __b)
 609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vaddwv4hi (__a, __b, 1);
 611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
 614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddw_s32 (int64x2_t __a, int32x2_t __b)
 615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vaddwv2si (__a, __b, 1);
 617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
 620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddw_u8 (uint16x8_t __a, uint8x8_t __b)
 621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vaddwv8qi ((int16x8_t) __a, (int8x8_t) __b, 0);
 623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
 626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddw_u16 (uint32x4_t __a, uint16x4_t __b)
 627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vaddwv4hi ((int32x4_t) __a, (int16x4_t) __b, 0);
 629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
 632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddw_u32 (uint64x2_t __a, uint32x2_t __b)
 633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vaddwv2si ((int64x2_t) __a, (int32x2_t) __b, 0);
 635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
 638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhadd_s8 (int8x8_t __a, int8x8_t __b)
 639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vhaddv8qi (__a, __b, 1);
 641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
 644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhadd_s16 (int16x4_t __a, int16x4_t __b)
 645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vhaddv4hi (__a, __b, 1);
 647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
 650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhadd_s32 (int32x2_t __a, int32x2_t __b)
 651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vhaddv2si (__a, __b, 1);
 653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
 656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhadd_u8 (uint8x8_t __a, uint8x8_t __b)
 657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vhaddv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
 659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
 662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhadd_u16 (uint16x4_t __a, uint16x4_t __b)
 663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vhaddv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
 665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
 668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhadd_u32 (uint32x2_t __a, uint32x2_t __b)
 669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vhaddv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
 671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
 674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhaddq_s8 (int8x16_t __a, int8x16_t __b)
 675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vhaddv16qi (__a, __b, 1);
 677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
 680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhaddq_s16 (int16x8_t __a, int16x8_t __b)
 681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vhaddv8hi (__a, __b, 1);
 683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
 686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhaddq_s32 (int32x4_t __a, int32x4_t __b)
 687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vhaddv4si (__a, __b, 1);
 689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
 692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhaddq_u8 (uint8x16_t __a, uint8x16_t __b)
 693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vhaddv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
 695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
 698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhaddq_u16 (uint16x8_t __a, uint16x8_t __b)
 699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vhaddv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
 701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
 704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhaddq_u32 (uint32x4_t __a, uint32x4_t __b)
 705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vhaddv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
 707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
 710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhadd_s8 (int8x8_t __a, int8x8_t __b)
 711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vhaddv8qi (__a, __b, 5);
 713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
 716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhadd_s16 (int16x4_t __a, int16x4_t __b)
 717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vhaddv4hi (__a, __b, 5);
 719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
 722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhadd_s32 (int32x2_t __a, int32x2_t __b)
 723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vhaddv2si (__a, __b, 5);
 725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
 728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhadd_u8 (uint8x8_t __a, uint8x8_t __b)
 729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vhaddv8qi ((int8x8_t) __a, (int8x8_t) __b, 4);
 731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
 734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhadd_u16 (uint16x4_t __a, uint16x4_t __b)
 735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vhaddv4hi ((int16x4_t) __a, (int16x4_t) __b, 4);
 737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
 740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhadd_u32 (uint32x2_t __a, uint32x2_t __b)
 741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vhaddv2si ((int32x2_t) __a, (int32x2_t) __b, 4);
 743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
 746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhaddq_s8 (int8x16_t __a, int8x16_t __b)
 747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vhaddv16qi (__a, __b, 5);
 749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
 752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhaddq_s16 (int16x8_t __a, int16x8_t __b)
 753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vhaddv8hi (__a, __b, 5);
 755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
 758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhaddq_s32 (int32x4_t __a, int32x4_t __b)
 759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vhaddv4si (__a, __b, 5);
 761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
 764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhaddq_u8 (uint8x16_t __a, uint8x16_t __b)
 765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vhaddv16qi ((int8x16_t) __a, (int8x16_t) __b, 4);
 767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
 770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhaddq_u16 (uint16x8_t __a, uint16x8_t __b)
 771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vhaddv8hi ((int16x8_t) __a, (int16x8_t) __b, 4);
 773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
 776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrhaddq_u32 (uint32x4_t __a, uint32x4_t __b)
 777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vhaddv4si ((int32x4_t) __a, (int32x4_t) __b, 4);
 779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
 782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqadd_s8 (int8x8_t __a, int8x8_t __b)
 783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqaddv8qi (__a, __b, 1);
 785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
 788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqadd_s16 (int16x4_t __a, int16x4_t __b)
 789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqaddv4hi (__a, __b, 1);
 791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
 794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqadd_s32 (int32x2_t __a, int32x2_t __b)
 795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqaddv2si (__a, __b, 1);
 797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
 800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqadd_s64 (int64x1_t __a, int64x1_t __b)
 801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vqadddi (__a, __b, 1);
 803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
 806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqadd_u8 (uint8x8_t __a, uint8x8_t __b)
 807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqaddv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
 809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
 812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqadd_u16 (uint16x4_t __a, uint16x4_t __b)
 813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqaddv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
 815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
 818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqadd_u32 (uint32x2_t __a, uint32x2_t __b)
 819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqaddv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
 821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
 824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqadd_u64 (uint64x1_t __a, uint64x1_t __b)
 825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vqadddi ((int64x1_t) __a, (int64x1_t) __b, 0);
 827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
 830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqaddq_s8 (int8x16_t __a, int8x16_t __b)
 831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vqaddv16qi (__a, __b, 1);
 833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
 836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqaddq_s16 (int16x8_t __a, int16x8_t __b)
 837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqaddv8hi (__a, __b, 1);
 839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
 842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqaddq_s32 (int32x4_t __a, int32x4_t __b)
 843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqaddv4si (__a, __b, 1);
 845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
 848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqaddq_s64 (int64x2_t __a, int64x2_t __b)
 849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqaddv2di (__a, __b, 1);
 851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
 854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqaddq_u8 (uint8x16_t __a, uint8x16_t __b)
 855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vqaddv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
 857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
 860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqaddq_u16 (uint16x8_t __a, uint16x8_t __b)
 861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vqaddv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
 863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
 866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqaddq_u32 (uint32x4_t __a, uint32x4_t __b)
 867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vqaddv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
 869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
 872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqaddq_u64 (uint64x2_t __a, uint64x2_t __b)
 873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vqaddv2di ((int64x2_t) __a, (int64x2_t) __b, 0);
 875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
 878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddhn_s16 (int16x8_t __a, int16x8_t __b)
 879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vaddhnv8hi (__a, __b, 1);
 881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
 884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddhn_s32 (int32x4_t __a, int32x4_t __b)
 885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vaddhnv4si (__a, __b, 1);
 887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
 890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddhn_s64 (int64x2_t __a, int64x2_t __b)
 891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vaddhnv2di (__a, __b, 1);
 893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
 896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddhn_u16 (uint16x8_t __a, uint16x8_t __b)
 897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vaddhnv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
 899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
 902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddhn_u32 (uint32x4_t __a, uint32x4_t __b)
 903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vaddhnv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
 905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
 908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaddhn_u64 (uint64x2_t __a, uint64x2_t __b)
 909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vaddhnv2di ((int64x2_t) __a, (int64x2_t) __b, 0);
 911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
 914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vraddhn_s16 (int16x8_t __a, int16x8_t __b)
 915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vaddhnv8hi (__a, __b, 5);
 917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
 920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vraddhn_s32 (int32x4_t __a, int32x4_t __b)
 921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vaddhnv4si (__a, __b, 5);
 923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
 926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vraddhn_s64 (int64x2_t __a, int64x2_t __b)
 927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vaddhnv2di (__a, __b, 5);
 929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
 932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vraddhn_u16 (uint16x8_t __a, uint16x8_t __b)
 933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vaddhnv8hi ((int16x8_t) __a, (int16x8_t) __b, 4);
 935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
 938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vraddhn_u32 (uint32x4_t __a, uint32x4_t __b)
 939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vaddhnv4si ((int32x4_t) __a, (int32x4_t) __b, 4);
 941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
 944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vraddhn_u64 (uint64x2_t __a, uint64x2_t __b)
 945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vaddhnv2di ((int64x2_t) __a, (int64x2_t) __b, 4);
 947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
 950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_s8 (int8x8_t __a, int8x8_t __b)
 951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vmulv8qi (__a, __b, 1);
 953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
 956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_s16 (int16x4_t __a, int16x4_t __b)
 957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmulv4hi (__a, __b, 1);
 959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
 962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_s32 (int32x2_t __a, int32x2_t __b)
 963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmulv2si (__a, __b, 1);
 965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
 968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_f32 (float32x2_t __a, float32x2_t __b)
 969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmulv2sf (__a, __b, 3);
 971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
 974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_u8 (uint8x8_t __a, uint8x8_t __b)
 975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 976:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vmulv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
 977:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 978:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 979:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
 980:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_u16 (uint16x4_t __a, uint16x4_t __b)
 981:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 982:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmulv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
 983:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 984:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 985:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
 986:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_u32 (uint32x2_t __a, uint32x2_t __b)
 987:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 988:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmulv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
 989:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 990:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 991:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
 992:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_p8 (poly8x8_t __a, poly8x8_t __b)
 993:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
 994:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vmulv8qi ((int8x8_t) __a, (int8x8_t) __b, 2);
 995:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 996:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
 997:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
 998:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_s8 (int8x16_t __a, int8x16_t __b)
 999:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1000:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vmulv16qi (__a, __b, 1);
1001:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1002:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1003:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1004:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_s16 (int16x8_t __a, int16x8_t __b)
1005:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1006:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmulv8hi (__a, __b, 1);
1007:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1008:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1009:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1010:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_s32 (int32x4_t __a, int32x4_t __b)
1011:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1012:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmulv4si (__a, __b, 1);
1013:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1014:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1015:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1016:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_f32 (float32x4_t __a, float32x4_t __b)
1017:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1018:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmulv4sf (__a, __b, 3);
1019:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1020:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1021:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
1022:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_u8 (uint8x16_t __a, uint8x16_t __b)
1023:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1024:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vmulv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
1025:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1026:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1027:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1028:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_u16 (uint16x8_t __a, uint16x8_t __b)
1029:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1030:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmulv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
1031:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1032:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1033:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1034:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_u32 (uint32x4_t __a, uint32x4_t __b)
1035:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1036:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmulv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
1037:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1038:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1039:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
1040:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_p8 (poly8x16_t __a, poly8x16_t __b)
1041:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1042:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vmulv16qi ((int8x16_t) __a, (int8x16_t) __b, 2);
1043:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1044:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1045:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1046:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulh_s16 (int16x4_t __a, int16x4_t __b)
1047:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1048:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqdmulhv4hi (__a, __b, 1);
1049:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1050:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1051:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1052:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulh_s32 (int32x2_t __a, int32x2_t __b)
1053:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1054:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqdmulhv2si (__a, __b, 1);
1055:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1056:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1057:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1058:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulhq_s16 (int16x8_t __a, int16x8_t __b)
1059:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1060:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqdmulhv8hi (__a, __b, 1);
1061:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1062:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1063:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1064:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulhq_s32 (int32x4_t __a, int32x4_t __b)
1065:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1066:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmulhv4si (__a, __b, 1);
1067:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1068:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1069:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1070:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulh_s16 (int16x4_t __a, int16x4_t __b)
1071:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1072:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqdmulhv4hi (__a, __b, 5);
1073:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1074:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1075:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1076:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulh_s32 (int32x2_t __a, int32x2_t __b)
1077:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1078:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqdmulhv2si (__a, __b, 5);
1079:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1080:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1081:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1082:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulhq_s16 (int16x8_t __a, int16x8_t __b)
1083:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1084:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqdmulhv8hi (__a, __b, 5);
1085:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1086:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1087:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1088:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulhq_s32 (int32x4_t __a, int32x4_t __b)
1089:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1090:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmulhv4si (__a, __b, 5);
1091:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1092:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1093:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1094:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_s8 (int8x8_t __a, int8x8_t __b)
1095:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1096:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmullv8qi (__a, __b, 1);
1097:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1098:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1099:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_s16 (int16x4_t __a, int16x4_t __b)
1101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmullv4hi (__a, __b, 1);
1103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_s32 (int32x2_t __a, int32x2_t __b)
1107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmullv2si (__a, __b, 1);
1109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_u8 (uint8x8_t __a, uint8x8_t __b)
1113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmullv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
1115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_u16 (uint16x4_t __a, uint16x4_t __b)
1119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmullv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
1121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
1124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_u32 (uint32x2_t __a, uint32x2_t __b)
1125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmullv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
1127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
1130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_p8 (poly8x8_t __a, poly8x8_t __b)
1131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vmullv8qi ((int8x8_t) __a, (int8x8_t) __b, 2);
1133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmull_s16 (int16x4_t __a, int16x4_t __b)
1137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmullv4hi (__a, __b, 1);
1139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmull_s32 (int32x2_t __a, int32x2_t __b)
1143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmullv2si (__a, __b, 1);
1145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
1148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_s8 (int8x8_t __a, int8x8_t __b, int8x8_t __c)
1149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vmlav8qi (__a, __b, __c, 1);
1151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_s16 (int16x4_t __a, int16x4_t __b, int16x4_t __c)
1155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmlav4hi (__a, __b, __c, 1);
1157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_s32 (int32x2_t __a, int32x2_t __b, int32x2_t __c)
1161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmlav2si (__a, __b, __c, 1);
1163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_f32 (float32x2_t __a, float32x2_t __b, float32x2_t __c)
1167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmlav2sf (__a, __b, __c, 3);
1169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_u8 (uint8x8_t __a, uint8x8_t __b, uint8x8_t __c)
1173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vmlav8qi ((int8x8_t) __a, (int8x8_t) __b, (int8x8_t) __c, 0);
1175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_u16 (uint16x4_t __a, uint16x4_t __b, uint16x4_t __c)
1179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmlav4hi ((int16x4_t) __a, (int16x4_t) __b, (int16x4_t) __c, 0)
1181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_u32 (uint32x2_t __a, uint32x2_t __b, uint32x2_t __c)
1185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmlav2si ((int32x2_t) __a, (int32x2_t) __b, (int32x2_t) __c, 0)
1187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
1190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_s8 (int8x16_t __a, int8x16_t __b, int8x16_t __c)
1191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vmlav16qi (__a, __b, __c, 1);
1193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_s16 (int16x8_t __a, int16x8_t __b, int16x8_t __c)
1197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmlav8hi (__a, __b, __c, 1);
1199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_s32 (int32x4_t __a, int32x4_t __b, int32x4_t __c)
1203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmlav4si (__a, __b, __c, 1);
1205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_f32 (float32x4_t __a, float32x4_t __b, float32x4_t __c)
1209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmlav4sf (__a, __b, __c, 3);
1211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
1214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_u8 (uint8x16_t __a, uint8x16_t __b, uint8x16_t __c)
1215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vmlav16qi ((int8x16_t) __a, (int8x16_t) __b, (int8x16_t) __c, 0
1217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_u16 (uint16x8_t __a, uint16x8_t __b, uint16x8_t __c)
1221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmlav8hi ((int16x8_t) __a, (int16x8_t) __b, (int16x8_t) __c, 0)
1223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_u32 (uint32x4_t __a, uint32x4_t __b, uint32x4_t __c)
1227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmlav4si ((int32x4_t) __a, (int32x4_t) __b, (int32x4_t) __c, 0)
1229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_s8 (int16x8_t __a, int8x8_t __b, int8x8_t __c)
1233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmlalv8qi (__a, __b, __c, 1);
1235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c)
1239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmlalv4hi (__a, __b, __c, 1);
1241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c)
1245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmlalv2si (__a, __b, __c, 1);
1247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_u8 (uint16x8_t __a, uint8x8_t __b, uint8x8_t __c)
1251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmlalv8qi ((int16x8_t) __a, (int8x8_t) __b, (int8x8_t) __c, 0);
1253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_u16 (uint32x4_t __a, uint16x4_t __b, uint16x4_t __c)
1257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmlalv4hi ((int32x4_t) __a, (int16x4_t) __b, (int16x4_t) __c, 0
1259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
1262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_u32 (uint64x2_t __a, uint32x2_t __b, uint32x2_t __c)
1263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmlalv2si ((int64x2_t) __a, (int32x2_t) __b, (int32x2_t) __c, 0
1265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlal_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c)
1269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmlalv4hi (__a, __b, __c, 1);
1271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlal_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c)
1275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmlalv2si (__a, __b, __c, 1);
1277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
1280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_s8 (int8x8_t __a, int8x8_t __b, int8x8_t __c)
1281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vmlsv8qi (__a, __b, __c, 1);
1283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_s16 (int16x4_t __a, int16x4_t __b, int16x4_t __c)
1287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmlsv4hi (__a, __b, __c, 1);
1289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_s32 (int32x2_t __a, int32x2_t __b, int32x2_t __c)
1293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmlsv2si (__a, __b, __c, 1);
1295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_f32 (float32x2_t __a, float32x2_t __b, float32x2_t __c)
1299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmlsv2sf (__a, __b, __c, 3);
1301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_u8 (uint8x8_t __a, uint8x8_t __b, uint8x8_t __c)
1305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vmlsv8qi ((int8x8_t) __a, (int8x8_t) __b, (int8x8_t) __c, 0);
1307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_u16 (uint16x4_t __a, uint16x4_t __b, uint16x4_t __c)
1311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmlsv4hi ((int16x4_t) __a, (int16x4_t) __b, (int16x4_t) __c, 0)
1313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_u32 (uint32x2_t __a, uint32x2_t __b, uint32x2_t __c)
1317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmlsv2si ((int32x2_t) __a, (int32x2_t) __b, (int32x2_t) __c, 0)
1319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
1322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_s8 (int8x16_t __a, int8x16_t __b, int8x16_t __c)
1323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vmlsv16qi (__a, __b, __c, 1);
1325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_s16 (int16x8_t __a, int16x8_t __b, int16x8_t __c)
1329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmlsv8hi (__a, __b, __c, 1);
1331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_s32 (int32x4_t __a, int32x4_t __b, int32x4_t __c)
1335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmlsv4si (__a, __b, __c, 1);
1337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_f32 (float32x4_t __a, float32x4_t __b, float32x4_t __c)
1341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmlsv4sf (__a, __b, __c, 3);
1343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
1346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_u8 (uint8x16_t __a, uint8x16_t __b, uint8x16_t __c)
1347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vmlsv16qi ((int8x16_t) __a, (int8x16_t) __b, (int8x16_t) __c, 0
1349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_u16 (uint16x8_t __a, uint16x8_t __b, uint16x8_t __c)
1353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmlsv8hi ((int16x8_t) __a, (int16x8_t) __b, (int16x8_t) __c, 0)
1355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_u32 (uint32x4_t __a, uint32x4_t __b, uint32x4_t __c)
1359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmlsv4si ((int32x4_t) __a, (int32x4_t) __b, (int32x4_t) __c, 0)
1361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_s8 (int16x8_t __a, int8x8_t __b, int8x8_t __c)
1365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmlslv8qi (__a, __b, __c, 1);
1367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c)
1371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmlslv4hi (__a, __b, __c, 1);
1373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c)
1377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmlslv2si (__a, __b, __c, 1);
1379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_u8 (uint16x8_t __a, uint8x8_t __b, uint8x8_t __c)
1383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmlslv8qi ((int16x8_t) __a, (int8x8_t) __b, (int8x8_t) __c, 0);
1385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_u16 (uint32x4_t __a, uint16x4_t __b, uint16x4_t __c)
1389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmlslv4hi ((int32x4_t) __a, (int16x4_t) __b, (int16x4_t) __c, 0
1391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
1394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_u32 (uint64x2_t __a, uint32x2_t __b, uint32x2_t __c)
1395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmlslv2si ((int64x2_t) __a, (int32x2_t) __b, (int32x2_t) __c, 0
1397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlsl_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c)
1401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmlslv4hi (__a, __b, __c, 1);
1403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlsl_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c)
1407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmlslv2si (__a, __b, __c, 1);
1409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_FMA
1412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vfma_f32 (float32x2_t __a, float32x2_t __b, float32x2_t __c)
1414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vfmav2sf (__a, __b, __c, 3);
1416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_FMA
1420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vfmaq_f32 (float32x4_t __a, float32x4_t __b, float32x4_t __c)
1422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vfmav4sf (__a, __b, __c, 3);
1424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_FMA
1428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vfms_f32 (float32x2_t __a, float32x2_t __b, float32x2_t __c)
1430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vfmsv2sf (__a, __b, __c, 3);
1432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_FMA
1436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vfmsq_f32 (float32x4_t __a, float32x4_t __b, float32x4_t __c)
1438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vfmsv4sf (__a, __b, __c, 3);
1440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrndn_f32 (float32x2_t __a)
1446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrintnv2sf (__a);
1448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrndqn_f32 (float32x4_t __a)
1454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrintnv4sf (__a);
1456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrnda_f32 (float32x2_t __a)
1462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrintav2sf (__a);
1464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrndqa_f32 (float32x4_t __a)
1470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrintav4sf (__a);
1472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrndp_f32 (float32x2_t __a)
1478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrintpv2sf (__a);
1480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrndqp_f32 (float32x4_t __a)
1486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrintpv4sf (__a);
1488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrndm_f32 (float32x2_t __a)
1494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrintmv2sf (__a);
1496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrndqm_f32 (float32x4_t __a)
1502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrintmv4sf (__a);
1504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrnd_f32 (float32x2_t __a)
1510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrintzv2sf (__a);
1512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if __ARM_ARCH >= 8
1516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrndq_f32 (float32x4_t __a)
1518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrintzv4sf (__a);
1520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
1523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
1524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_s8 (int8x8_t __a, int8x8_t __b)
1525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vsubv8qi (__a, __b, 1);
1527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_s16 (int16x4_t __a, int16x4_t __b)
1531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vsubv4hi (__a, __b, 1);
1533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_s32 (int32x2_t __a, int32x2_t __b)
1537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vsubv2si (__a, __b, 1);
1539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
1542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_f32 (float32x2_t __a, float32x2_t __b)
1543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vsubv2sf (__a, __b, 3);
1545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_u8 (uint8x8_t __a, uint8x8_t __b)
1549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vsubv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
1551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_u16 (uint16x4_t __a, uint16x4_t __b)
1555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vsubv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
1557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_u32 (uint32x2_t __a, uint32x2_t __b)
1561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vsubv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
1563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
1566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_s64 (int64x1_t __a, int64x1_t __b)
1567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vsubdi (__a, __b, 1);
1569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
1572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsub_u64 (uint64x1_t __a, uint64x1_t __b)
1573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vsubdi ((int64x1_t) __a, (int64x1_t) __b, 0);
1575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
1578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_s8 (int8x16_t __a, int8x16_t __b)
1579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vsubv16qi (__a, __b, 1);
1581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_s16 (int16x8_t __a, int16x8_t __b)
1585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vsubv8hi (__a, __b, 1);
1587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_s32 (int32x4_t __a, int32x4_t __b)
1591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vsubv4si (__a, __b, 1);
1593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_s64 (int64x2_t __a, int64x2_t __b)
1597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vsubv2di (__a, __b, 1);
1599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
1602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_f32 (float32x4_t __a, float32x4_t __b)
1603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vsubv4sf (__a, __b, 3);
1605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
1608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_u8 (uint8x16_t __a, uint8x16_t __b)
1609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vsubv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
1611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_u16 (uint16x8_t __a, uint16x8_t __b)
1615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vsubv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
1617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_u32 (uint32x4_t __a, uint32x4_t __b)
1621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vsubv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
1623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
1626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubq_u64 (uint64x2_t __a, uint64x2_t __b)
1627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vsubv2di ((int64x2_t) __a, (int64x2_t) __b, 0);
1629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubl_s8 (int8x8_t __a, int8x8_t __b)
1633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vsublv8qi (__a, __b, 1);
1635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubl_s16 (int16x4_t __a, int16x4_t __b)
1639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vsublv4hi (__a, __b, 1);
1641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubl_s32 (int32x2_t __a, int32x2_t __b)
1645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vsublv2si (__a, __b, 1);
1647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubl_u8 (uint8x8_t __a, uint8x8_t __b)
1651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vsublv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
1653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubl_u16 (uint16x4_t __a, uint16x4_t __b)
1657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vsublv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
1659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
1662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubl_u32 (uint32x2_t __a, uint32x2_t __b)
1663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vsublv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
1665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubw_s8 (int16x8_t __a, int8x8_t __b)
1669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vsubwv8qi (__a, __b, 1);
1671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubw_s16 (int32x4_t __a, int16x4_t __b)
1675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vsubwv4hi (__a, __b, 1);
1677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubw_s32 (int64x2_t __a, int32x2_t __b)
1681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vsubwv2si (__a, __b, 1);
1683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubw_u8 (uint16x8_t __a, uint8x8_t __b)
1687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vsubwv8qi ((int16x8_t) __a, (int8x8_t) __b, 0);
1689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubw_u16 (uint32x4_t __a, uint16x4_t __b)
1693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vsubwv4hi ((int32x4_t) __a, (int16x4_t) __b, 0);
1695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
1698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubw_u32 (uint64x2_t __a, uint32x2_t __b)
1699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vsubwv2si ((int64x2_t) __a, (int32x2_t) __b, 0);
1701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
1704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsub_s8 (int8x8_t __a, int8x8_t __b)
1705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vhsubv8qi (__a, __b, 1);
1707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsub_s16 (int16x4_t __a, int16x4_t __b)
1711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vhsubv4hi (__a, __b, 1);
1713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsub_s32 (int32x2_t __a, int32x2_t __b)
1717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vhsubv2si (__a, __b, 1);
1719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsub_u8 (uint8x8_t __a, uint8x8_t __b)
1723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vhsubv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
1725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsub_u16 (uint16x4_t __a, uint16x4_t __b)
1729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vhsubv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
1731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsub_u32 (uint32x2_t __a, uint32x2_t __b)
1735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vhsubv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
1737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
1740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsubq_s8 (int8x16_t __a, int8x16_t __b)
1741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vhsubv16qi (__a, __b, 1);
1743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsubq_s16 (int16x8_t __a, int16x8_t __b)
1747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vhsubv8hi (__a, __b, 1);
1749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsubq_s32 (int32x4_t __a, int32x4_t __b)
1753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vhsubv4si (__a, __b, 1);
1755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
1758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsubq_u8 (uint8x16_t __a, uint8x16_t __b)
1759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vhsubv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
1761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsubq_u16 (uint16x8_t __a, uint16x8_t __b)
1765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vhsubv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
1767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vhsubq_u32 (uint32x4_t __a, uint32x4_t __b)
1771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vhsubv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
1773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
1776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsub_s8 (int8x8_t __a, int8x8_t __b)
1777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqsubv8qi (__a, __b, 1);
1779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsub_s16 (int16x4_t __a, int16x4_t __b)
1783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqsubv4hi (__a, __b, 1);
1785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsub_s32 (int32x2_t __a, int32x2_t __b)
1789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqsubv2si (__a, __b, 1);
1791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
1794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsub_s64 (int64x1_t __a, int64x1_t __b)
1795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vqsubdi (__a, __b, 1);
1797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsub_u8 (uint8x8_t __a, uint8x8_t __b)
1801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqsubv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
1803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsub_u16 (uint16x4_t __a, uint16x4_t __b)
1807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqsubv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
1809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsub_u32 (uint32x2_t __a, uint32x2_t __b)
1813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqsubv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
1815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
1818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsub_u64 (uint64x1_t __a, uint64x1_t __b)
1819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vqsubdi ((int64x1_t) __a, (int64x1_t) __b, 0);
1821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
1824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsubq_s8 (int8x16_t __a, int8x16_t __b)
1825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vqsubv16qi (__a, __b, 1);
1827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
1830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsubq_s16 (int16x8_t __a, int16x8_t __b)
1831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqsubv8hi (__a, __b, 1);
1833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
1836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsubq_s32 (int32x4_t __a, int32x4_t __b)
1837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqsubv4si (__a, __b, 1);
1839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
1842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsubq_s64 (int64x2_t __a, int64x2_t __b)
1843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqsubv2di (__a, __b, 1);
1845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
1848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsubq_u8 (uint8x16_t __a, uint8x16_t __b)
1849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vqsubv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
1851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsubq_u16 (uint16x8_t __a, uint16x8_t __b)
1855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vqsubv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
1857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
1860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsubq_u32 (uint32x4_t __a, uint32x4_t __b)
1861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vqsubv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
1863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
1866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqsubq_u64 (uint64x2_t __a, uint64x2_t __b)
1867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vqsubv2di ((int64x2_t) __a, (int64x2_t) __b, 0);
1869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
1872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubhn_s16 (int16x8_t __a, int16x8_t __b)
1873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vsubhnv8hi (__a, __b, 1);
1875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubhn_s32 (int32x4_t __a, int32x4_t __b)
1879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vsubhnv4si (__a, __b, 1);
1881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubhn_s64 (int64x2_t __a, int64x2_t __b)
1885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vsubhnv2di (__a, __b, 1);
1887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubhn_u16 (uint16x8_t __a, uint16x8_t __b)
1891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vsubhnv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
1893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubhn_u32 (uint32x4_t __a, uint32x4_t __b)
1897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vsubhnv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
1899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsubhn_u64 (uint64x2_t __a, uint64x2_t __b)
1903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vsubhnv2di ((int64x2_t) __a, (int64x2_t) __b, 0);
1905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
1908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsubhn_s16 (int16x8_t __a, int16x8_t __b)
1909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vsubhnv8hi (__a, __b, 5);
1911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
1914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsubhn_s32 (int32x4_t __a, int32x4_t __b)
1915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vsubhnv4si (__a, __b, 5);
1917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
1920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsubhn_s64 (int64x2_t __a, int64x2_t __b)
1921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vsubhnv2di (__a, __b, 5);
1923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsubhn_u16 (uint16x8_t __a, uint16x8_t __b)
1927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vsubhnv8hi ((int16x8_t) __a, (int16x8_t) __b, 4);
1929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsubhn_u32 (uint32x4_t __a, uint32x4_t __b)
1933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vsubhnv4si ((int32x4_t) __a, (int32x4_t) __b, 4);
1935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsubhn_u64 (uint64x2_t __a, uint64x2_t __b)
1939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vsubhnv2di ((int64x2_t) __a, (int64x2_t) __b, 4);
1941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceq_s8 (int8x8_t __a, int8x8_t __b)
1945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vceqv8qi (__a, __b, 1);
1947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceq_s16 (int16x4_t __a, int16x4_t __b)
1951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vceqv4hi (__a, __b, 1);
1953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceq_s32 (int32x2_t __a, int32x2_t __b)
1957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vceqv2si (__a, __b, 1);
1959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceq_f32 (float32x2_t __a, float32x2_t __b)
1963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vceqv2sf (__a, __b, 3);
1965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceq_u8 (uint8x8_t __a, uint8x8_t __b)
1969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vceqv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
1971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
1974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceq_u16 (uint16x4_t __a, uint16x4_t __b)
1975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1976:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vceqv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
1977:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1978:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1979:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
1980:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceq_u32 (uint32x2_t __a, uint32x2_t __b)
1981:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1982:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vceqv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
1983:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1984:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1985:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
1986:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceq_p8 (poly8x8_t __a, poly8x8_t __b)
1987:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1988:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vceqv8qi ((int8x8_t) __a, (int8x8_t) __b, 2);
1989:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1990:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1991:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
1992:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceqq_s8 (int8x16_t __a, int8x16_t __b)
1993:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
1994:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vceqv16qi (__a, __b, 1);
1995:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
1996:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
1997:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
1998:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceqq_s16 (int16x8_t __a, int16x8_t __b)
1999:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2000:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vceqv8hi (__a, __b, 1);
2001:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2002:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2003:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2004:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceqq_s32 (int32x4_t __a, int32x4_t __b)
2005:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2006:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vceqv4si (__a, __b, 1);
2007:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2008:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2009:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2010:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceqq_f32 (float32x4_t __a, float32x4_t __b)
2011:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2012:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vceqv4sf (__a, __b, 3);
2013:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2014:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2015:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2016:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceqq_u8 (uint8x16_t __a, uint8x16_t __b)
2017:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2018:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vceqv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
2019:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2020:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2021:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2022:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceqq_u16 (uint16x8_t __a, uint16x8_t __b)
2023:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2024:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vceqv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
2025:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2026:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2027:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2028:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceqq_u32 (uint32x4_t __a, uint32x4_t __b)
2029:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2030:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vceqv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
2031:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2032:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2033:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2034:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vceqq_p8 (poly8x16_t __a, poly8x16_t __b)
2035:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2036:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vceqv16qi ((int8x16_t) __a, (int8x16_t) __b, 2);
2037:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2038:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2039:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2040:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcge_s8 (int8x8_t __a, int8x8_t __b)
2041:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2042:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcgev8qi (__a, __b, 1);
2043:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2044:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2045:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2046:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcge_s16 (int16x4_t __a, int16x4_t __b)
2047:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2048:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcgev4hi (__a, __b, 1);
2049:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2050:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2051:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2052:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcge_s32 (int32x2_t __a, int32x2_t __b)
2053:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2054:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgev2si (__a, __b, 1);
2055:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2056:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2057:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2058:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcge_f32 (float32x2_t __a, float32x2_t __b)
2059:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2060:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgev2sf (__a, __b, 3);
2061:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2062:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2063:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2064:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcge_u8 (uint8x8_t __a, uint8x8_t __b)
2065:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2066:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcgeuv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
2067:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2068:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2069:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2070:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcge_u16 (uint16x4_t __a, uint16x4_t __b)
2071:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2072:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcgeuv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
2073:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2074:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2075:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2076:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcge_u32 (uint32x2_t __a, uint32x2_t __b)
2077:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2078:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgeuv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
2079:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2080:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2081:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2082:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgeq_s8 (int8x16_t __a, int8x16_t __b)
2083:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2084:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcgev16qi (__a, __b, 1);
2085:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2086:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2087:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2088:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgeq_s16 (int16x8_t __a, int16x8_t __b)
2089:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2090:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcgev8hi (__a, __b, 1);
2091:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2092:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2093:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2094:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgeq_s32 (int32x4_t __a, int32x4_t __b)
2095:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2096:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgev4si (__a, __b, 1);
2097:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2098:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2099:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgeq_f32 (float32x4_t __a, float32x4_t __b)
2101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgev4sf (__a, __b, 3);
2103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgeq_u8 (uint8x16_t __a, uint8x16_t __b)
2107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcgeuv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
2109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgeq_u16 (uint16x8_t __a, uint16x8_t __b)
2113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcgeuv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
2115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgeq_u32 (uint32x4_t __a, uint32x4_t __b)
2119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgeuv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
2121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcle_s8 (int8x8_t __a, int8x8_t __b)
2125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcgev8qi (__b, __a, 1);
2127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcle_s16 (int16x4_t __a, int16x4_t __b)
2131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcgev4hi (__b, __a, 1);
2133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcle_s32 (int32x2_t __a, int32x2_t __b)
2137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgev2si (__b, __a, 1);
2139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcle_f32 (float32x2_t __a, float32x2_t __b)
2143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgev2sf (__b, __a, 3);
2145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcle_u8 (uint8x8_t __a, uint8x8_t __b)
2149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcgeuv8qi ((int8x8_t) __b, (int8x8_t) __a, 0);
2151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcle_u16 (uint16x4_t __a, uint16x4_t __b)
2155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcgeuv4hi ((int16x4_t) __b, (int16x4_t) __a, 0);
2157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcle_u32 (uint32x2_t __a, uint32x2_t __b)
2161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgeuv2si ((int32x2_t) __b, (int32x2_t) __a, 0);
2163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcleq_s8 (int8x16_t __a, int8x16_t __b)
2167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcgev16qi (__b, __a, 1);
2169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcleq_s16 (int16x8_t __a, int16x8_t __b)
2173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcgev8hi (__b, __a, 1);
2175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcleq_s32 (int32x4_t __a, int32x4_t __b)
2179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgev4si (__b, __a, 1);
2181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcleq_f32 (float32x4_t __a, float32x4_t __b)
2185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgev4sf (__b, __a, 3);
2187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcleq_u8 (uint8x16_t __a, uint8x16_t __b)
2191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcgeuv16qi ((int8x16_t) __b, (int8x16_t) __a, 0);
2193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcleq_u16 (uint16x8_t __a, uint16x8_t __b)
2197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcgeuv8hi ((int16x8_t) __b, (int16x8_t) __a, 0);
2199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcleq_u32 (uint32x4_t __a, uint32x4_t __b)
2203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgeuv4si ((int32x4_t) __b, (int32x4_t) __a, 0);
2205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgt_s8 (int8x8_t __a, int8x8_t __b)
2209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcgtv8qi (__a, __b, 1);
2211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgt_s16 (int16x4_t __a, int16x4_t __b)
2215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcgtv4hi (__a, __b, 1);
2217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgt_s32 (int32x2_t __a, int32x2_t __b)
2221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgtv2si (__a, __b, 1);
2223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgt_f32 (float32x2_t __a, float32x2_t __b)
2227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgtv2sf (__a, __b, 3);
2229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgt_u8 (uint8x8_t __a, uint8x8_t __b)
2233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcgtuv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
2235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgt_u16 (uint16x4_t __a, uint16x4_t __b)
2239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcgtuv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
2241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgt_u32 (uint32x2_t __a, uint32x2_t __b)
2245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgtuv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
2247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgtq_s8 (int8x16_t __a, int8x16_t __b)
2251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcgtv16qi (__a, __b, 1);
2253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgtq_s16 (int16x8_t __a, int16x8_t __b)
2257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcgtv8hi (__a, __b, 1);
2259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgtq_s32 (int32x4_t __a, int32x4_t __b)
2263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgtv4si (__a, __b, 1);
2265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgtq_f32 (float32x4_t __a, float32x4_t __b)
2269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgtv4sf (__a, __b, 3);
2271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgtq_u8 (uint8x16_t __a, uint8x16_t __b)
2275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcgtuv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
2277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgtq_u16 (uint16x8_t __a, uint16x8_t __b)
2281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcgtuv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
2283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcgtq_u32 (uint32x4_t __a, uint32x4_t __b)
2287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgtuv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
2289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclt_s8 (int8x8_t __a, int8x8_t __b)
2293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcgtv8qi (__b, __a, 1);
2295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclt_s16 (int16x4_t __a, int16x4_t __b)
2299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcgtv4hi (__b, __a, 1);
2301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclt_s32 (int32x2_t __a, int32x2_t __b)
2305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgtv2si (__b, __a, 1);
2307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclt_f32 (float32x2_t __a, float32x2_t __b)
2311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgtv2sf (__b, __a, 3);
2313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclt_u8 (uint8x8_t __a, uint8x8_t __b)
2317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcgtuv8qi ((int8x8_t) __b, (int8x8_t) __a, 0);
2319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclt_u16 (uint16x4_t __a, uint16x4_t __b)
2323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcgtuv4hi ((int16x4_t) __b, (int16x4_t) __a, 0);
2325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclt_u32 (uint32x2_t __a, uint32x2_t __b)
2329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcgtuv2si ((int32x2_t) __b, (int32x2_t) __a, 0);
2331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcltq_s8 (int8x16_t __a, int8x16_t __b)
2335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcgtv16qi (__b, __a, 1);
2337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcltq_s16 (int16x8_t __a, int16x8_t __b)
2341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcgtv8hi (__b, __a, 1);
2343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcltq_s32 (int32x4_t __a, int32x4_t __b)
2347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgtv4si (__b, __a, 1);
2349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcltq_f32 (float32x4_t __a, float32x4_t __b)
2353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgtv4sf (__b, __a, 3);
2355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcltq_u8 (uint8x16_t __a, uint8x16_t __b)
2359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcgtuv16qi ((int8x16_t) __b, (int8x16_t) __a, 0);
2361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcltq_u16 (uint16x8_t __a, uint16x8_t __b)
2365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcgtuv8hi ((int16x8_t) __b, (int16x8_t) __a, 0);
2367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcltq_u32 (uint32x4_t __a, uint32x4_t __b)
2371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcgtuv4si ((int32x4_t) __b, (int32x4_t) __a, 0);
2373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcage_f32 (float32x2_t __a, float32x2_t __b)
2377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcagev2sf (__a, __b, 3);
2379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcageq_f32 (float32x4_t __a, float32x4_t __b)
2383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcagev4sf (__a, __b, 3);
2385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcale_f32 (float32x2_t __a, float32x2_t __b)
2389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcagev2sf (__b, __a, 3);
2391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcaleq_f32 (float32x4_t __a, float32x4_t __b)
2395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcagev4sf (__b, __a, 3);
2397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcagt_f32 (float32x2_t __a, float32x2_t __b)
2401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcagtv2sf (__a, __b, 3);
2403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcagtq_f32 (float32x4_t __a, float32x4_t __b)
2407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcagtv4sf (__a, __b, 3);
2409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcalt_f32 (float32x2_t __a, float32x2_t __b)
2413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcagtv2sf (__b, __a, 3);
2415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcaltq_f32 (float32x4_t __a, float32x4_t __b)
2419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcagtv4sf (__b, __a, 3);
2421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtst_s8 (int8x8_t __a, int8x8_t __b)
2425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtstv8qi (__a, __b, 1);
2427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtst_s16 (int16x4_t __a, int16x4_t __b)
2431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vtstv4hi (__a, __b, 1);
2433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtst_s32 (int32x2_t __a, int32x2_t __b)
2437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vtstv2si (__a, __b, 1);
2439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtst_u8 (uint8x8_t __a, uint8x8_t __b)
2443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtstv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
2445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtst_u16 (uint16x4_t __a, uint16x4_t __b)
2449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vtstv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
2451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtst_u32 (uint32x2_t __a, uint32x2_t __b)
2455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vtstv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
2457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtst_p8 (poly8x8_t __a, poly8x8_t __b)
2461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtstv8qi ((int8x8_t) __a, (int8x8_t) __b, 2);
2463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtstq_s8 (int8x16_t __a, int8x16_t __b)
2467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vtstv16qi (__a, __b, 1);
2469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtstq_s16 (int16x8_t __a, int16x8_t __b)
2473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vtstv8hi (__a, __b, 1);
2475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtstq_s32 (int32x4_t __a, int32x4_t __b)
2479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vtstv4si (__a, __b, 1);
2481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtstq_u8 (uint8x16_t __a, uint8x16_t __b)
2485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vtstv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
2487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtstq_u16 (uint16x8_t __a, uint16x8_t __b)
2491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vtstv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
2493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtstq_u32 (uint32x4_t __a, uint32x4_t __b)
2497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vtstv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
2499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtstq_p8 (poly8x16_t __a, poly8x16_t __b)
2503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vtstv16qi ((int8x16_t) __a, (int8x16_t) __b, 2);
2505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
2508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabd_s8 (int8x8_t __a, int8x8_t __b)
2509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vabdv8qi (__a, __b, 1);
2511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
2514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabd_s16 (int16x4_t __a, int16x4_t __b)
2515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vabdv4hi (__a, __b, 1);
2517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
2520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabd_s32 (int32x2_t __a, int32x2_t __b)
2521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vabdv2si (__a, __b, 1);
2523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
2526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabd_f32 (float32x2_t __a, float32x2_t __b)
2527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vabdv2sf (__a, __b, 3);
2529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabd_u8 (uint8x8_t __a, uint8x8_t __b)
2533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vabdv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
2535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabd_u16 (uint16x4_t __a, uint16x4_t __b)
2539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vabdv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
2541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabd_u32 (uint32x2_t __a, uint32x2_t __b)
2545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vabdv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
2547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
2550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdq_s8 (int8x16_t __a, int8x16_t __b)
2551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vabdv16qi (__a, __b, 1);
2553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
2556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdq_s16 (int16x8_t __a, int16x8_t __b)
2557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vabdv8hi (__a, __b, 1);
2559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
2562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdq_s32 (int32x4_t __a, int32x4_t __b)
2563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vabdv4si (__a, __b, 1);
2565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
2568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdq_f32 (float32x4_t __a, float32x4_t __b)
2569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vabdv4sf (__a, __b, 3);
2571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdq_u8 (uint8x16_t __a, uint8x16_t __b)
2575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vabdv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
2577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdq_u16 (uint16x8_t __a, uint16x8_t __b)
2581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vabdv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
2583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdq_u32 (uint32x4_t __a, uint32x4_t __b)
2587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vabdv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
2589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
2592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdl_s8 (int8x8_t __a, int8x8_t __b)
2593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vabdlv8qi (__a, __b, 1);
2595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
2598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdl_s16 (int16x4_t __a, int16x4_t __b)
2599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vabdlv4hi (__a, __b, 1);
2601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
2604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdl_s32 (int32x2_t __a, int32x2_t __b)
2605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vabdlv2si (__a, __b, 1);
2607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdl_u8 (uint8x8_t __a, uint8x8_t __b)
2611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vabdlv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
2613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdl_u16 (uint16x4_t __a, uint16x4_t __b)
2617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vabdlv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
2619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
2622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabdl_u32 (uint32x2_t __a, uint32x2_t __b)
2623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vabdlv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
2625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
2628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaba_s8 (int8x8_t __a, int8x8_t __b, int8x8_t __c)
2629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vabav8qi (__a, __b, __c, 1);
2631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
2634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaba_s16 (int16x4_t __a, int16x4_t __b, int16x4_t __c)
2635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vabav4hi (__a, __b, __c, 1);
2637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
2640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaba_s32 (int32x2_t __a, int32x2_t __b, int32x2_t __c)
2641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vabav2si (__a, __b, __c, 1);
2643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaba_u8 (uint8x8_t __a, uint8x8_t __b, uint8x8_t __c)
2647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vabav8qi ((int8x8_t) __a, (int8x8_t) __b, (int8x8_t) __c, 0);
2649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaba_u16 (uint16x4_t __a, uint16x4_t __b, uint16x4_t __c)
2653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vabav4hi ((int16x4_t) __a, (int16x4_t) __b, (int16x4_t) __c, 0)
2655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vaba_u32 (uint32x2_t __a, uint32x2_t __b, uint32x2_t __c)
2659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vabav2si ((int32x2_t) __a, (int32x2_t) __b, (int32x2_t) __c, 0)
2661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
2664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabaq_s8 (int8x16_t __a, int8x16_t __b, int8x16_t __c)
2665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vabav16qi (__a, __b, __c, 1);
2667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
2670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabaq_s16 (int16x8_t __a, int16x8_t __b, int16x8_t __c)
2671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vabav8hi (__a, __b, __c, 1);
2673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
2676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabaq_s32 (int32x4_t __a, int32x4_t __b, int32x4_t __c)
2677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vabav4si (__a, __b, __c, 1);
2679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabaq_u8 (uint8x16_t __a, uint8x16_t __b, uint8x16_t __c)
2683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vabav16qi ((int8x16_t) __a, (int8x16_t) __b, (int8x16_t) __c, 0
2685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabaq_u16 (uint16x8_t __a, uint16x8_t __b, uint16x8_t __c)
2689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vabav8hi ((int16x8_t) __a, (int16x8_t) __b, (int16x8_t) __c, 0)
2691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabaq_u32 (uint32x4_t __a, uint32x4_t __b, uint32x4_t __c)
2695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vabav4si ((int32x4_t) __a, (int32x4_t) __b, (int32x4_t) __c, 0)
2697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
2700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabal_s8 (int16x8_t __a, int8x8_t __b, int8x8_t __c)
2701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vabalv8qi (__a, __b, __c, 1);
2703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
2706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabal_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c)
2707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vabalv4hi (__a, __b, __c, 1);
2709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
2712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabal_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c)
2713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vabalv2si (__a, __b, __c, 1);
2715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabal_u8 (uint16x8_t __a, uint8x8_t __b, uint8x8_t __c)
2719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vabalv8qi ((int16x8_t) __a, (int8x8_t) __b, (int8x8_t) __c, 0);
2721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabal_u16 (uint32x4_t __a, uint16x4_t __b, uint16x4_t __c)
2725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vabalv4hi ((int32x4_t) __a, (int16x4_t) __b, (int16x4_t) __c, 0
2727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
2730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabal_u32 (uint64x2_t __a, uint32x2_t __b, uint32x2_t __c)
2731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vabalv2si ((int64x2_t) __a, (int32x2_t) __b, (int32x2_t) __c, 0
2733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
2736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmax_s8 (int8x8_t __a, int8x8_t __b)
2737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vmaxv8qi (__a, __b, 1);
2739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
2742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmax_s16 (int16x4_t __a, int16x4_t __b)
2743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmaxv4hi (__a, __b, 1);
2745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
2748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmax_s32 (int32x2_t __a, int32x2_t __b)
2749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmaxv2si (__a, __b, 1);
2751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
2754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmax_f32 (float32x2_t __a, float32x2_t __b)
2755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmaxv2sf (__a, __b, 3);
2757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmax_u8 (uint8x8_t __a, uint8x8_t __b)
2761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vmaxv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
2763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmax_u16 (uint16x4_t __a, uint16x4_t __b)
2767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmaxv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
2769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmax_u32 (uint32x2_t __a, uint32x2_t __b)
2773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmaxv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
2775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
2778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmaxq_s8 (int8x16_t __a, int8x16_t __b)
2779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vmaxv16qi (__a, __b, 1);
2781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
2784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmaxq_s16 (int16x8_t __a, int16x8_t __b)
2785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmaxv8hi (__a, __b, 1);
2787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
2790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmaxq_s32 (int32x4_t __a, int32x4_t __b)
2791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmaxv4si (__a, __b, 1);
2793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
2796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmaxq_f32 (float32x4_t __a, float32x4_t __b)
2797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmaxv4sf (__a, __b, 3);
2799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmaxq_u8 (uint8x16_t __a, uint8x16_t __b)
2803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vmaxv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
2805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmaxq_u16 (uint16x8_t __a, uint16x8_t __b)
2809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmaxv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
2811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmaxq_u32 (uint32x4_t __a, uint32x4_t __b)
2815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmaxv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
2817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
2820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmin_s8 (int8x8_t __a, int8x8_t __b)
2821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vminv8qi (__a, __b, 1);
2823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
2826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmin_s16 (int16x4_t __a, int16x4_t __b)
2827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vminv4hi (__a, __b, 1);
2829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
2832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmin_s32 (int32x2_t __a, int32x2_t __b)
2833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vminv2si (__a, __b, 1);
2835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
2838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmin_f32 (float32x2_t __a, float32x2_t __b)
2839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vminv2sf (__a, __b, 3);
2841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmin_u8 (uint8x8_t __a, uint8x8_t __b)
2845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vminv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
2847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmin_u16 (uint16x4_t __a, uint16x4_t __b)
2851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vminv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
2853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmin_u32 (uint32x2_t __a, uint32x2_t __b)
2857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vminv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
2859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
2862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vminq_s8 (int8x16_t __a, int8x16_t __b)
2863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vminv16qi (__a, __b, 1);
2865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
2868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vminq_s16 (int16x8_t __a, int16x8_t __b)
2869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vminv8hi (__a, __b, 1);
2871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
2874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vminq_s32 (int32x4_t __a, int32x4_t __b)
2875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vminv4si (__a, __b, 1);
2877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
2880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vminq_f32 (float32x4_t __a, float32x4_t __b)
2881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vminv4sf (__a, __b, 3);
2883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
2886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vminq_u8 (uint8x16_t __a, uint8x16_t __b)
2887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vminv16qi ((int8x16_t) __a, (int8x16_t) __b, 0);
2889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
2892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vminq_u16 (uint16x8_t __a, uint16x8_t __b)
2893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vminv8hi ((int16x8_t) __a, (int16x8_t) __b, 0);
2895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
2898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vminq_u32 (uint32x4_t __a, uint32x4_t __b)
2899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vminv4si ((int32x4_t) __a, (int32x4_t) __b, 0);
2901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
2904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadd_s8 (int8x8_t __a, int8x8_t __b)
2905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vpaddv8qi (__a, __b, 1);
2907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
2910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadd_s16 (int16x4_t __a, int16x4_t __b)
2911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vpaddv4hi (__a, __b, 1);
2913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
2916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadd_s32 (int32x2_t __a, int32x2_t __b)
2917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vpaddv2si (__a, __b, 1);
2919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
2922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadd_f32 (float32x2_t __a, float32x2_t __b)
2923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vpaddv2sf (__a, __b, 3);
2925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
2928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadd_u8 (uint8x8_t __a, uint8x8_t __b)
2929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vpaddv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
2931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadd_u16 (uint16x4_t __a, uint16x4_t __b)
2935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vpaddv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
2937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadd_u32 (uint32x2_t __a, uint32x2_t __b)
2941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vpaddv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
2943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
2946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddl_s8 (int8x8_t __a)
2947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vpaddlv8qi (__a, 1);
2949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
2952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddl_s16 (int16x4_t __a)
2953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vpaddlv4hi (__a, 1);
2955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
2958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddl_s32 (int32x2_t __a)
2959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vpaddlv2si (__a, 1);
2961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
2964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddl_u8 (uint8x8_t __a)
2965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vpaddlv8qi ((int8x8_t) __a, 0);
2967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
2970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddl_u16 (uint16x4_t __a)
2971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vpaddlv4hi ((int16x4_t) __a, 0);
2973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
2976:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddl_u32 (uint32x2_t __a)
2977:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2978:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vpaddlv2si ((int32x2_t) __a, 0);
2979:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2980:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2981:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
2982:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddlq_s8 (int8x16_t __a)
2983:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2984:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vpaddlv16qi (__a, 1);
2985:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2986:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2987:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
2988:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddlq_s16 (int16x8_t __a)
2989:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2990:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vpaddlv8hi (__a, 1);
2991:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2992:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2993:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
2994:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddlq_s32 (int32x4_t __a)
2995:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
2996:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vpaddlv4si (__a, 1);
2997:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
2998:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
2999:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
3000:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddlq_u8 (uint8x16_t __a)
3001:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3002:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vpaddlv16qi ((int8x16_t) __a, 0);
3003:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3004:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3005:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
3006:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddlq_u16 (uint16x8_t __a)
3007:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3008:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vpaddlv8hi ((int16x8_t) __a, 0);
3009:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3010:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3011:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
3012:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpaddlq_u32 (uint32x4_t __a)
3013:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3014:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vpaddlv4si ((int32x4_t) __a, 0);
3015:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3016:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3017:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3018:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadal_s8 (int16x4_t __a, int8x8_t __b)
3019:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3020:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vpadalv8qi (__a, __b, 1);
3021:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3022:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3023:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3024:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadal_s16 (int32x2_t __a, int16x4_t __b)
3025:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3026:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vpadalv4hi (__a, __b, 1);
3027:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3028:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3029:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
3030:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadal_s32 (int64x1_t __a, int32x2_t __b)
3031:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3032:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vpadalv2si (__a, __b, 1);
3033:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3034:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3035:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3036:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadal_u8 (uint16x4_t __a, uint8x8_t __b)
3037:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3038:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vpadalv8qi ((int16x4_t) __a, (int8x8_t) __b, 0);
3039:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3040:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3041:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3042:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadal_u16 (uint32x2_t __a, uint16x4_t __b)
3043:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3044:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vpadalv4hi ((int32x2_t) __a, (int16x4_t) __b, 0);
3045:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3046:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3047:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
3048:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadal_u32 (uint64x1_t __a, uint32x2_t __b)
3049:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3050:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vpadalv2si ((int64x1_t) __a, (int32x2_t) __b, 0);
3051:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3052:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3053:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
3054:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadalq_s8 (int16x8_t __a, int8x16_t __b)
3055:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3056:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vpadalv16qi (__a, __b, 1);
3057:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3058:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3059:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
3060:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadalq_s16 (int32x4_t __a, int16x8_t __b)
3061:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3062:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vpadalv8hi (__a, __b, 1);
3063:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3064:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3065:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
3066:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadalq_s32 (int64x2_t __a, int32x4_t __b)
3067:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3068:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vpadalv4si (__a, __b, 1);
3069:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3070:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3071:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
3072:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadalq_u8 (uint16x8_t __a, uint8x16_t __b)
3073:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3074:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vpadalv16qi ((int16x8_t) __a, (int8x16_t) __b, 0);
3075:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3076:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3077:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
3078:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadalq_u16 (uint32x4_t __a, uint16x8_t __b)
3079:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3080:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vpadalv8hi ((int32x4_t) __a, (int16x8_t) __b, 0);
3081:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3082:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3083:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
3084:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpadalq_u32 (uint64x2_t __a, uint32x4_t __b)
3085:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3086:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vpadalv4si ((int64x2_t) __a, (int32x4_t) __b, 0);
3087:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3088:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3089:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3090:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmax_s8 (int8x8_t __a, int8x8_t __b)
3091:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3092:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vpmaxv8qi (__a, __b, 1);
3093:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3094:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3095:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3096:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmax_s16 (int16x4_t __a, int16x4_t __b)
3097:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3098:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vpmaxv4hi (__a, __b, 1);
3099:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmax_s32 (int32x2_t __a, int32x2_t __b)
3103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vpmaxv2si (__a, __b, 1);
3105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
3108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmax_f32 (float32x2_t __a, float32x2_t __b)
3109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vpmaxv2sf (__a, __b, 3);
3111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmax_u8 (uint8x8_t __a, uint8x8_t __b)
3115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vpmaxv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
3117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmax_u16 (uint16x4_t __a, uint16x4_t __b)
3121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vpmaxv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
3123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmax_u32 (uint32x2_t __a, uint32x2_t __b)
3127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vpmaxv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
3129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmin_s8 (int8x8_t __a, int8x8_t __b)
3133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vpminv8qi (__a, __b, 1);
3135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmin_s16 (int16x4_t __a, int16x4_t __b)
3139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vpminv4hi (__a, __b, 1);
3141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmin_s32 (int32x2_t __a, int32x2_t __b)
3145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vpminv2si (__a, __b, 1);
3147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
3150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmin_f32 (float32x2_t __a, float32x2_t __b)
3151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vpminv2sf (__a, __b, 3);
3153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmin_u8 (uint8x8_t __a, uint8x8_t __b)
3157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vpminv8qi ((int8x8_t) __a, (int8x8_t) __b, 0);
3159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmin_u16 (uint16x4_t __a, uint16x4_t __b)
3163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vpminv4hi ((int16x4_t) __a, (int16x4_t) __b, 0);
3165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vpmin_u32 (uint32x2_t __a, uint32x2_t __b)
3169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vpminv2si ((int32x2_t) __a, (int32x2_t) __b, 0);
3171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
3174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrecps_f32 (float32x2_t __a, float32x2_t __b)
3175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrecpsv2sf (__a, __b, 3);
3177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
3180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrecpsq_f32 (float32x4_t __a, float32x4_t __b)
3181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrecpsv4sf (__a, __b, 3);
3183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
3186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsqrts_f32 (float32x2_t __a, float32x2_t __b)
3187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrsqrtsv2sf (__a, __b, 3);
3189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
3192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsqrtsq_f32 (float32x4_t __a, float32x4_t __b)
3193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrsqrtsv4sf (__a, __b, 3);
3195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_s8 (int8x8_t __a, int8x8_t __b)
3199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vshlv8qi (__a, __b, 1);
3201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_s16 (int16x4_t __a, int16x4_t __b)
3205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vshlv4hi (__a, __b, 1);
3207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_s32 (int32x2_t __a, int32x2_t __b)
3211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vshlv2si (__a, __b, 1);
3213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
3216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_s64 (int64x1_t __a, int64x1_t __b)
3217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vshldi (__a, __b, 1);
3219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_u8 (uint8x8_t __a, int8x8_t __b)
3223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vshlv8qi ((int8x8_t) __a, __b, 0);
3225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_u16 (uint16x4_t __a, int16x4_t __b)
3229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vshlv4hi ((int16x4_t) __a, __b, 0);
3231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_u32 (uint32x2_t __a, int32x2_t __b)
3235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vshlv2si ((int32x2_t) __a, __b, 0);
3237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
3240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_u64 (uint64x1_t __a, int64x1_t __b)
3241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vshldi ((int64x1_t) __a, __b, 0);
3243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
3246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_s8 (int8x16_t __a, int8x16_t __b)
3247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vshlv16qi (__a, __b, 1);
3249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
3252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_s16 (int16x8_t __a, int16x8_t __b)
3253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vshlv8hi (__a, __b, 1);
3255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
3258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_s32 (int32x4_t __a, int32x4_t __b)
3259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vshlv4si (__a, __b, 1);
3261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
3264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_s64 (int64x2_t __a, int64x2_t __b)
3265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vshlv2di (__a, __b, 1);
3267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
3270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_u8 (uint8x16_t __a, int8x16_t __b)
3271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vshlv16qi ((int8x16_t) __a, __b, 0);
3273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
3276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_u16 (uint16x8_t __a, int16x8_t __b)
3277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vshlv8hi ((int16x8_t) __a, __b, 0);
3279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
3282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_u32 (uint32x4_t __a, int32x4_t __b)
3283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vshlv4si ((int32x4_t) __a, __b, 0);
3285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
3288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_u64 (uint64x2_t __a, int64x2_t __b)
3289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vshlv2di ((int64x2_t) __a, __b, 0);
3291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshl_s8 (int8x8_t __a, int8x8_t __b)
3295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vshlv8qi (__a, __b, 5);
3297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshl_s16 (int16x4_t __a, int16x4_t __b)
3301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vshlv4hi (__a, __b, 5);
3303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshl_s32 (int32x2_t __a, int32x2_t __b)
3307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vshlv2si (__a, __b, 5);
3309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
3312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshl_s64 (int64x1_t __a, int64x1_t __b)
3313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vshldi (__a, __b, 5);
3315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshl_u8 (uint8x8_t __a, int8x8_t __b)
3319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vshlv8qi ((int8x8_t) __a, __b, 4);
3321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshl_u16 (uint16x4_t __a, int16x4_t __b)
3325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vshlv4hi ((int16x4_t) __a, __b, 4);
3327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshl_u32 (uint32x2_t __a, int32x2_t __b)
3331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vshlv2si ((int32x2_t) __a, __b, 4);
3333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
3336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshl_u64 (uint64x1_t __a, int64x1_t __b)
3337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vshldi ((int64x1_t) __a, __b, 4);
3339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
3342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshlq_s8 (int8x16_t __a, int8x16_t __b)
3343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vshlv16qi (__a, __b, 5);
3345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
3348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshlq_s16 (int16x8_t __a, int16x8_t __b)
3349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vshlv8hi (__a, __b, 5);
3351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
3354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshlq_s32 (int32x4_t __a, int32x4_t __b)
3355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vshlv4si (__a, __b, 5);
3357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
3360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshlq_s64 (int64x2_t __a, int64x2_t __b)
3361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vshlv2di (__a, __b, 5);
3363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
3366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshlq_u8 (uint8x16_t __a, int8x16_t __b)
3367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vshlv16qi ((int8x16_t) __a, __b, 4);
3369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
3372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshlq_u16 (uint16x8_t __a, int16x8_t __b)
3373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vshlv8hi ((int16x8_t) __a, __b, 4);
3375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
3378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshlq_u32 (uint32x4_t __a, int32x4_t __b)
3379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vshlv4si ((int32x4_t) __a, __b, 4);
3381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
3384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshlq_u64 (uint64x2_t __a, int64x2_t __b)
3385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vshlv2di ((int64x2_t) __a, __b, 4);
3387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_s8 (int8x8_t __a, int8x8_t __b)
3391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqshlv8qi (__a, __b, 1);
3393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_s16 (int16x4_t __a, int16x4_t __b)
3397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqshlv4hi (__a, __b, 1);
3399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_s32 (int32x2_t __a, int32x2_t __b)
3403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqshlv2si (__a, __b, 1);
3405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
3408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_s64 (int64x1_t __a, int64x1_t __b)
3409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vqshldi (__a, __b, 1);
3411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_u8 (uint8x8_t __a, int8x8_t __b)
3415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqshlv8qi ((int8x8_t) __a, __b, 0);
3417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_u16 (uint16x4_t __a, int16x4_t __b)
3421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqshlv4hi ((int16x4_t) __a, __b, 0);
3423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_u32 (uint32x2_t __a, int32x2_t __b)
3427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqshlv2si ((int32x2_t) __a, __b, 0);
3429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
3432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_u64 (uint64x1_t __a, int64x1_t __b)
3433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vqshldi ((int64x1_t) __a, __b, 0);
3435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
3438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_s8 (int8x16_t __a, int8x16_t __b)
3439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vqshlv16qi (__a, __b, 1);
3441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
3444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_s16 (int16x8_t __a, int16x8_t __b)
3445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqshlv8hi (__a, __b, 1);
3447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
3450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_s32 (int32x4_t __a, int32x4_t __b)
3451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqshlv4si (__a, __b, 1);
3453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
3456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_s64 (int64x2_t __a, int64x2_t __b)
3457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqshlv2di (__a, __b, 1);
3459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
3462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_u8 (uint8x16_t __a, int8x16_t __b)
3463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vqshlv16qi ((int8x16_t) __a, __b, 0);
3465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
3468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_u16 (uint16x8_t __a, int16x8_t __b)
3469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vqshlv8hi ((int16x8_t) __a, __b, 0);
3471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
3474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_u32 (uint32x4_t __a, int32x4_t __b)
3475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vqshlv4si ((int32x4_t) __a, __b, 0);
3477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
3480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_u64 (uint64x2_t __a, int64x2_t __b)
3481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vqshlv2di ((int64x2_t) __a, __b, 0);
3483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshl_s8 (int8x8_t __a, int8x8_t __b)
3487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqshlv8qi (__a, __b, 5);
3489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshl_s16 (int16x4_t __a, int16x4_t __b)
3493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqshlv4hi (__a, __b, 5);
3495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshl_s32 (int32x2_t __a, int32x2_t __b)
3499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqshlv2si (__a, __b, 5);
3501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
3504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshl_s64 (int64x1_t __a, int64x1_t __b)
3505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vqshldi (__a, __b, 5);
3507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshl_u8 (uint8x8_t __a, int8x8_t __b)
3511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqshlv8qi ((int8x8_t) __a, __b, 4);
3513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshl_u16 (uint16x4_t __a, int16x4_t __b)
3517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqshlv4hi ((int16x4_t) __a, __b, 4);
3519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshl_u32 (uint32x2_t __a, int32x2_t __b)
3523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqshlv2si ((int32x2_t) __a, __b, 4);
3525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
3528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshl_u64 (uint64x1_t __a, int64x1_t __b)
3529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vqshldi ((int64x1_t) __a, __b, 4);
3531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
3534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshlq_s8 (int8x16_t __a, int8x16_t __b)
3535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vqshlv16qi (__a, __b, 5);
3537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
3540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshlq_s16 (int16x8_t __a, int16x8_t __b)
3541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqshlv8hi (__a, __b, 5);
3543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
3546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshlq_s32 (int32x4_t __a, int32x4_t __b)
3547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqshlv4si (__a, __b, 5);
3549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
3552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshlq_s64 (int64x2_t __a, int64x2_t __b)
3553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqshlv2di (__a, __b, 5);
3555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
3558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshlq_u8 (uint8x16_t __a, int8x16_t __b)
3559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vqshlv16qi ((int8x16_t) __a, __b, 4);
3561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
3564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshlq_u16 (uint16x8_t __a, int16x8_t __b)
3565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vqshlv8hi ((int16x8_t) __a, __b, 4);
3567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
3570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshlq_u32 (uint32x4_t __a, int32x4_t __b)
3571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vqshlv4si ((int32x4_t) __a, __b, 4);
3573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
3576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshlq_u64 (uint64x2_t __a, int64x2_t __b)
3577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vqshlv2di ((int64x2_t) __a, __b, 4);
3579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshr_n_s8 (int8x8_t __a, const int __b)
3583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vshr_nv8qi (__a, __b, 1);
3585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshr_n_s16 (int16x4_t __a, const int __b)
3589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vshr_nv4hi (__a, __b, 1);
3591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshr_n_s32 (int32x2_t __a, const int __b)
3595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vshr_nv2si (__a, __b, 1);
3597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
3600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshr_n_s64 (int64x1_t __a, const int __b)
3601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vshr_ndi (__a, __b, 1);
3603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshr_n_u8 (uint8x8_t __a, const int __b)
3607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vshr_nv8qi ((int8x8_t) __a, __b, 0);
3609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshr_n_u16 (uint16x4_t __a, const int __b)
3613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vshr_nv4hi ((int16x4_t) __a, __b, 0);
3615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshr_n_u32 (uint32x2_t __a, const int __b)
3619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vshr_nv2si ((int32x2_t) __a, __b, 0);
3621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
3624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshr_n_u64 (uint64x1_t __a, const int __b)
3625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vshr_ndi ((int64x1_t) __a, __b, 0);
3627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
3630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrq_n_s8 (int8x16_t __a, const int __b)
3631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vshr_nv16qi (__a, __b, 1);
3633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
3636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrq_n_s16 (int16x8_t __a, const int __b)
3637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vshr_nv8hi (__a, __b, 1);
3639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
3642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrq_n_s32 (int32x4_t __a, const int __b)
3643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vshr_nv4si (__a, __b, 1);
3645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
3648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrq_n_s64 (int64x2_t __a, const int __b)
3649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vshr_nv2di (__a, __b, 1);
3651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
3654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrq_n_u8 (uint8x16_t __a, const int __b)
3655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vshr_nv16qi ((int8x16_t) __a, __b, 0);
3657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
3660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrq_n_u16 (uint16x8_t __a, const int __b)
3661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vshr_nv8hi ((int16x8_t) __a, __b, 0);
3663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
3666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrq_n_u32 (uint32x4_t __a, const int __b)
3667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vshr_nv4si ((int32x4_t) __a, __b, 0);
3669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
3672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrq_n_u64 (uint64x2_t __a, const int __b)
3673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vshr_nv2di ((int64x2_t) __a, __b, 0);
3675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshr_n_s8 (int8x8_t __a, const int __b)
3679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vshr_nv8qi (__a, __b, 5);
3681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshr_n_s16 (int16x4_t __a, const int __b)
3685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vshr_nv4hi (__a, __b, 5);
3687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshr_n_s32 (int32x2_t __a, const int __b)
3691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vshr_nv2si (__a, __b, 5);
3693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
3696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshr_n_s64 (int64x1_t __a, const int __b)
3697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vshr_ndi (__a, __b, 5);
3699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshr_n_u8 (uint8x8_t __a, const int __b)
3703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vshr_nv8qi ((int8x8_t) __a, __b, 4);
3705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshr_n_u16 (uint16x4_t __a, const int __b)
3709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vshr_nv4hi ((int16x4_t) __a, __b, 4);
3711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshr_n_u32 (uint32x2_t __a, const int __b)
3715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vshr_nv2si ((int32x2_t) __a, __b, 4);
3717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
3720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshr_n_u64 (uint64x1_t __a, const int __b)
3721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vshr_ndi ((int64x1_t) __a, __b, 4);
3723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
3726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrq_n_s8 (int8x16_t __a, const int __b)
3727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vshr_nv16qi (__a, __b, 5);
3729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
3732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrq_n_s16 (int16x8_t __a, const int __b)
3733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vshr_nv8hi (__a, __b, 5);
3735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
3738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrq_n_s32 (int32x4_t __a, const int __b)
3739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vshr_nv4si (__a, __b, 5);
3741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
3744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrq_n_s64 (int64x2_t __a, const int __b)
3745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vshr_nv2di (__a, __b, 5);
3747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
3750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrq_n_u8 (uint8x16_t __a, const int __b)
3751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vshr_nv16qi ((int8x16_t) __a, __b, 4);
3753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
3756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrq_n_u16 (uint16x8_t __a, const int __b)
3757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vshr_nv8hi ((int16x8_t) __a, __b, 4);
3759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
3762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrq_n_u32 (uint32x4_t __a, const int __b)
3763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vshr_nv4si ((int32x4_t) __a, __b, 4);
3765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
3768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrq_n_u64 (uint64x2_t __a, const int __b)
3769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vshr_nv2di ((int64x2_t) __a, __b, 4);
3771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrn_n_s16 (int16x8_t __a, const int __b)
3775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vshrn_nv8hi (__a, __b, 1);
3777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrn_n_s32 (int32x4_t __a, const int __b)
3781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vshrn_nv4si (__a, __b, 1);
3783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrn_n_s64 (int64x2_t __a, const int __b)
3787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vshrn_nv2di (__a, __b, 1);
3789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrn_n_u16 (uint16x8_t __a, const int __b)
3793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vshrn_nv8hi ((int16x8_t) __a, __b, 0);
3795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrn_n_u32 (uint32x4_t __a, const int __b)
3799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vshrn_nv4si ((int32x4_t) __a, __b, 0);
3801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshrn_n_u64 (uint64x2_t __a, const int __b)
3805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vshrn_nv2di ((int64x2_t) __a, __b, 0);
3807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrn_n_s16 (int16x8_t __a, const int __b)
3811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vshrn_nv8hi (__a, __b, 5);
3813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrn_n_s32 (int32x4_t __a, const int __b)
3817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vshrn_nv4si (__a, __b, 5);
3819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrn_n_s64 (int64x2_t __a, const int __b)
3823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vshrn_nv2di (__a, __b, 5);
3825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrn_n_u16 (uint16x8_t __a, const int __b)
3829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vshrn_nv8hi ((int16x8_t) __a, __b, 4);
3831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrn_n_u32 (uint32x4_t __a, const int __b)
3835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vshrn_nv4si ((int32x4_t) __a, __b, 4);
3837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrshrn_n_u64 (uint64x2_t __a, const int __b)
3841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vshrn_nv2di ((int64x2_t) __a, __b, 4);
3843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrn_n_s16 (int16x8_t __a, const int __b)
3847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqshrn_nv8hi (__a, __b, 1);
3849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrn_n_s32 (int32x4_t __a, const int __b)
3853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqshrn_nv4si (__a, __b, 1);
3855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrn_n_s64 (int64x2_t __a, const int __b)
3859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqshrn_nv2di (__a, __b, 1);
3861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrn_n_u16 (uint16x8_t __a, const int __b)
3865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqshrn_nv8hi ((int16x8_t) __a, __b, 0);
3867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrn_n_u32 (uint32x4_t __a, const int __b)
3871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqshrn_nv4si ((int32x4_t) __a, __b, 0);
3873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrn_n_u64 (uint64x2_t __a, const int __b)
3877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqshrn_nv2di ((int64x2_t) __a, __b, 0);
3879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrn_n_s16 (int16x8_t __a, const int __b)
3883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqshrn_nv8hi (__a, __b, 5);
3885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrn_n_s32 (int32x4_t __a, const int __b)
3889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqshrn_nv4si (__a, __b, 5);
3891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrn_n_s64 (int64x2_t __a, const int __b)
3895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqshrn_nv2di (__a, __b, 5);
3897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrn_n_u16 (uint16x8_t __a, const int __b)
3901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqshrn_nv8hi ((int16x8_t) __a, __b, 4);
3903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrn_n_u32 (uint32x4_t __a, const int __b)
3907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqshrn_nv4si ((int32x4_t) __a, __b, 4);
3909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrn_n_u64 (uint64x2_t __a, const int __b)
3913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqshrn_nv2di ((int64x2_t) __a, __b, 4);
3915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrun_n_s16 (int16x8_t __a, const int __b)
3919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqshrun_nv8hi (__a, __b, 1);
3921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrun_n_s32 (int32x4_t __a, const int __b)
3925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqshrun_nv4si (__a, __b, 1);
3927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshrun_n_s64 (int64x2_t __a, const int __b)
3931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqshrun_nv2di (__a, __b, 1);
3933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrun_n_s16 (int16x8_t __a, const int __b)
3937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqshrun_nv8hi (__a, __b, 5);
3939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrun_n_s32 (int32x4_t __a, const int __b)
3943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqshrun_nv4si (__a, __b, 5);
3945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrshrun_n_s64 (int64x2_t __a, const int __b)
3949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqshrun_nv2di (__a, __b, 5);
3951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
3954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_n_s8 (int8x8_t __a, const int __b)
3955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vshl_nv8qi (__a, __b, 1);
3957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
3960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_n_s16 (int16x4_t __a, const int __b)
3961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vshl_nv4hi (__a, __b, 1);
3963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
3966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_n_s32 (int32x2_t __a, const int __b)
3967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vshl_nv2si (__a, __b, 1);
3969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
3972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_n_s64 (int64x1_t __a, const int __b)
3973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vshl_ndi (__a, __b, 1);
3975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3976:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3977:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
3978:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_n_u8 (uint8x8_t __a, const int __b)
3979:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3980:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vshl_nv8qi ((int8x8_t) __a, __b, 0);
3981:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3982:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3983:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
3984:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_n_u16 (uint16x4_t __a, const int __b)
3985:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3986:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vshl_nv4hi ((int16x4_t) __a, __b, 0);
3987:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3988:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3989:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
3990:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_n_u32 (uint32x2_t __a, const int __b)
3991:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3992:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vshl_nv2si ((int32x2_t) __a, __b, 0);
3993:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
3994:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
3995:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
3996:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshl_n_u64 (uint64x1_t __a, const int __b)
3997:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
3998:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vshl_ndi ((int64x1_t) __a, __b, 0);
3999:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4000:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4001:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4002:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_n_s8 (int8x16_t __a, const int __b)
4003:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4004:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vshl_nv16qi (__a, __b, 1);
4005:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4006:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4007:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4008:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_n_s16 (int16x8_t __a, const int __b)
4009:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4010:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vshl_nv8hi (__a, __b, 1);
4011:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4012:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4013:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4014:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_n_s32 (int32x4_t __a, const int __b)
4015:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4016:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vshl_nv4si (__a, __b, 1);
4017:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4018:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4019:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
4020:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_n_s64 (int64x2_t __a, const int __b)
4021:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4022:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vshl_nv2di (__a, __b, 1);
4023:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4024:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4025:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
4026:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_n_u8 (uint8x16_t __a, const int __b)
4027:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4028:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vshl_nv16qi ((int8x16_t) __a, __b, 0);
4029:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4030:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4031:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4032:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_n_u16 (uint16x8_t __a, const int __b)
4033:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4034:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vshl_nv8hi ((int16x8_t) __a, __b, 0);
4035:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4036:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4037:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4038:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_n_u32 (uint32x4_t __a, const int __b)
4039:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4040:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vshl_nv4si ((int32x4_t) __a, __b, 0);
4041:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4042:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4043:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
4044:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshlq_n_u64 (uint64x2_t __a, const int __b)
4045:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4046:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vshl_nv2di ((int64x2_t) __a, __b, 0);
4047:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4048:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4049:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4050:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_n_s8 (int8x8_t __a, const int __b)
4051:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4052:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqshl_nv8qi (__a, __b, 1);
4053:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4054:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4055:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4056:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_n_s16 (int16x4_t __a, const int __b)
4057:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4058:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqshl_nv4hi (__a, __b, 1);
4059:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4060:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4061:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4062:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_n_s32 (int32x2_t __a, const int __b)
4063:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4064:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqshl_nv2si (__a, __b, 1);
4065:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4066:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4067:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
4068:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_n_s64 (int64x1_t __a, const int __b)
4069:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4070:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vqshl_ndi (__a, __b, 1);
4071:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4072:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4073:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
4074:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_n_u8 (uint8x8_t __a, const int __b)
4075:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4076:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqshl_nv8qi ((int8x8_t) __a, __b, 0);
4077:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4078:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4079:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
4080:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_n_u16 (uint16x4_t __a, const int __b)
4081:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4082:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqshl_nv4hi ((int16x4_t) __a, __b, 0);
4083:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4084:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4085:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
4086:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_n_u32 (uint32x2_t __a, const int __b)
4087:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4088:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqshl_nv2si ((int32x2_t) __a, __b, 0);
4089:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4090:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4091:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
4092:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshl_n_u64 (uint64x1_t __a, const int __b)
4093:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4094:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vqshl_ndi ((int64x1_t) __a, __b, 0);
4095:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4096:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4097:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4098:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_n_s8 (int8x16_t __a, const int __b)
4099:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vqshl_nv16qi (__a, __b, 1);
4101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_n_s16 (int16x8_t __a, const int __b)
4105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqshl_nv8hi (__a, __b, 1);
4107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_n_s32 (int32x4_t __a, const int __b)
4111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqshl_nv4si (__a, __b, 1);
4113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
4116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_n_s64 (int64x2_t __a, const int __b)
4117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqshl_nv2di (__a, __b, 1);
4119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
4122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_n_u8 (uint8x16_t __a, const int __b)
4123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vqshl_nv16qi ((int8x16_t) __a, __b, 0);
4125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_n_u16 (uint16x8_t __a, const int __b)
4129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vqshl_nv8hi ((int16x8_t) __a, __b, 0);
4131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_n_u32 (uint32x4_t __a, const int __b)
4135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vqshl_nv4si ((int32x4_t) __a, __b, 0);
4137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
4140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlq_n_u64 (uint64x2_t __a, const int __b)
4141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vqshl_nv2di ((int64x2_t) __a, __b, 0);
4143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
4146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlu_n_s8 (int8x8_t __a, const int __b)
4147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqshlu_nv8qi (__a, __b, 1);
4149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
4152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlu_n_s16 (int16x4_t __a, const int __b)
4153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqshlu_nv4hi (__a, __b, 1);
4155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
4158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlu_n_s32 (int32x2_t __a, const int __b)
4159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqshlu_nv2si (__a, __b, 1);
4161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
4164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshlu_n_s64 (int64x1_t __a, const int __b)
4165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vqshlu_ndi (__a, __b, 1);
4167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
4170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshluq_n_s8 (int8x16_t __a, const int __b)
4171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vqshlu_nv16qi (__a, __b, 1);
4173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshluq_n_s16 (int16x8_t __a, const int __b)
4177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vqshlu_nv8hi (__a, __b, 1);
4179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshluq_n_s32 (int32x4_t __a, const int __b)
4183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vqshlu_nv4si (__a, __b, 1);
4185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
4188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqshluq_n_s64 (int64x2_t __a, const int __b)
4189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vqshlu_nv2di (__a, __b, 1);
4191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshll_n_s8 (int8x8_t __a, const int __b)
4195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vshll_nv8qi (__a, __b, 1);
4197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshll_n_s16 (int16x4_t __a, const int __b)
4201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vshll_nv4hi (__a, __b, 1);
4203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
4206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshll_n_s32 (int32x2_t __a, const int __b)
4207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vshll_nv2si (__a, __b, 1);
4209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshll_n_u8 (uint8x8_t __a, const int __b)
4213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vshll_nv8qi ((int8x8_t) __a, __b, 0);
4215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshll_n_u16 (uint16x4_t __a, const int __b)
4219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vshll_nv4hi ((int16x4_t) __a, __b, 0);
4221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
4224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vshll_n_u32 (uint32x2_t __a, const int __b)
4225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vshll_nv2si ((int32x2_t) __a, __b, 0);
4227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsra_n_s8 (int8x8_t __a, int8x8_t __b, const int __c)
4231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vsra_nv8qi (__a, __b, __c, 1);
4233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsra_n_s16 (int16x4_t __a, int16x4_t __b, const int __c)
4237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vsra_nv4hi (__a, __b, __c, 1);
4239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsra_n_s32 (int32x2_t __a, int32x2_t __b, const int __c)
4243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vsra_nv2si (__a, __b, __c, 1);
4245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
4248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsra_n_s64 (int64x1_t __a, int64x1_t __b, const int __c)
4249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vsra_ndi (__a, __b, __c, 1);
4251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
4254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsra_n_u8 (uint8x8_t __a, uint8x8_t __b, const int __c)
4255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vsra_nv8qi ((int8x8_t) __a, (int8x8_t) __b, __c, 0);
4257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
4260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsra_n_u16 (uint16x4_t __a, uint16x4_t __b, const int __c)
4261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vsra_nv4hi ((int16x4_t) __a, (int16x4_t) __b, __c, 0);
4263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
4266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsra_n_u32 (uint32x2_t __a, uint32x2_t __b, const int __c)
4267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vsra_nv2si ((int32x2_t) __a, (int32x2_t) __b, __c, 0);
4269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
4272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsra_n_u64 (uint64x1_t __a, uint64x1_t __b, const int __c)
4273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vsra_ndi ((int64x1_t) __a, (int64x1_t) __b, __c, 0);
4275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsraq_n_s8 (int8x16_t __a, int8x16_t __b, const int __c)
4279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vsra_nv16qi (__a, __b, __c, 1);
4281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsraq_n_s16 (int16x8_t __a, int16x8_t __b, const int __c)
4285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vsra_nv8hi (__a, __b, __c, 1);
4287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsraq_n_s32 (int32x4_t __a, int32x4_t __b, const int __c)
4291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vsra_nv4si (__a, __b, __c, 1);
4293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
4296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsraq_n_s64 (int64x2_t __a, int64x2_t __b, const int __c)
4297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vsra_nv2di (__a, __b, __c, 1);
4299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
4302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsraq_n_u8 (uint8x16_t __a, uint8x16_t __b, const int __c)
4303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vsra_nv16qi ((int8x16_t) __a, (int8x16_t) __b, __c, 0);
4305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsraq_n_u16 (uint16x8_t __a, uint16x8_t __b, const int __c)
4309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vsra_nv8hi ((int16x8_t) __a, (int16x8_t) __b, __c, 0);
4311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsraq_n_u32 (uint32x4_t __a, uint32x4_t __b, const int __c)
4315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vsra_nv4si ((int32x4_t) __a, (int32x4_t) __b, __c, 0);
4317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
4320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsraq_n_u64 (uint64x2_t __a, uint64x2_t __b, const int __c)
4321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vsra_nv2di ((int64x2_t) __a, (int64x2_t) __b, __c, 0);
4323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsra_n_s8 (int8x8_t __a, int8x8_t __b, const int __c)
4327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vsra_nv8qi (__a, __b, __c, 5);
4329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsra_n_s16 (int16x4_t __a, int16x4_t __b, const int __c)
4333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vsra_nv4hi (__a, __b, __c, 5);
4335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsra_n_s32 (int32x2_t __a, int32x2_t __b, const int __c)
4339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vsra_nv2si (__a, __b, __c, 5);
4341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
4344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsra_n_s64 (int64x1_t __a, int64x1_t __b, const int __c)
4345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vsra_ndi (__a, __b, __c, 5);
4347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
4350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsra_n_u8 (uint8x8_t __a, uint8x8_t __b, const int __c)
4351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vsra_nv8qi ((int8x8_t) __a, (int8x8_t) __b, __c, 4);
4353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
4356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsra_n_u16 (uint16x4_t __a, uint16x4_t __b, const int __c)
4357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vsra_nv4hi ((int16x4_t) __a, (int16x4_t) __b, __c, 4);
4359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
4362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsra_n_u32 (uint32x2_t __a, uint32x2_t __b, const int __c)
4363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vsra_nv2si ((int32x2_t) __a, (int32x2_t) __b, __c, 4);
4365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
4368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsra_n_u64 (uint64x1_t __a, uint64x1_t __b, const int __c)
4369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vsra_ndi ((int64x1_t) __a, (int64x1_t) __b, __c, 4);
4371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsraq_n_s8 (int8x16_t __a, int8x16_t __b, const int __c)
4375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vsra_nv16qi (__a, __b, __c, 5);
4377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsraq_n_s16 (int16x8_t __a, int16x8_t __b, const int __c)
4381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vsra_nv8hi (__a, __b, __c, 5);
4383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsraq_n_s32 (int32x4_t __a, int32x4_t __b, const int __c)
4387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vsra_nv4si (__a, __b, __c, 5);
4389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
4392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsraq_n_s64 (int64x2_t __a, int64x2_t __b, const int __c)
4393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vsra_nv2di (__a, __b, __c, 5);
4395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
4398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsraq_n_u8 (uint8x16_t __a, uint8x16_t __b, const int __c)
4399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vsra_nv16qi ((int8x16_t) __a, (int8x16_t) __b, __c, 4);
4401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsraq_n_u16 (uint16x8_t __a, uint16x8_t __b, const int __c)
4405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vsra_nv8hi ((int16x8_t) __a, (int16x8_t) __b, __c, 4);
4407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsraq_n_u32 (uint32x4_t __a, uint32x4_t __b, const int __c)
4411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vsra_nv4si ((int32x4_t) __a, (int32x4_t) __b, __c, 4);
4413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
4416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsraq_n_u64 (uint64x2_t __a, uint64x2_t __b, const int __c)
4417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vsra_nv2di ((int64x2_t) __a, (int64x2_t) __b, __c, 4);
4419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
4422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
4423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_p64 (poly64x1_t __a, poly64x1_t __b, const int __c)
4424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vsri_ndi (__a, __b, __c);
4426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
4429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_s8 (int8x8_t __a, int8x8_t __b, const int __c)
4431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vsri_nv8qi (__a, __b, __c);
4433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_s16 (int16x4_t __a, int16x4_t __b, const int __c)
4437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vsri_nv4hi (__a, __b, __c);
4439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_s32 (int32x2_t __a, int32x2_t __b, const int __c)
4443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vsri_nv2si (__a, __b, __c);
4445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
4448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_s64 (int64x1_t __a, int64x1_t __b, const int __c)
4449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vsri_ndi (__a, __b, __c);
4451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
4454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_u8 (uint8x8_t __a, uint8x8_t __b, const int __c)
4455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vsri_nv8qi ((int8x8_t) __a, (int8x8_t) __b, __c);
4457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
4460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_u16 (uint16x4_t __a, uint16x4_t __b, const int __c)
4461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vsri_nv4hi ((int16x4_t) __a, (int16x4_t) __b, __c);
4463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
4466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_u32 (uint32x2_t __a, uint32x2_t __b, const int __c)
4467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vsri_nv2si ((int32x2_t) __a, (int32x2_t) __b, __c);
4469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
4472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_u64 (uint64x1_t __a, uint64x1_t __b, const int __c)
4473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vsri_ndi ((int64x1_t) __a, (int64x1_t) __b, __c);
4475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
4478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_p8 (poly8x8_t __a, poly8x8_t __b, const int __c)
4479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vsri_nv8qi ((int8x8_t) __a, (int8x8_t) __b, __c);
4481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
4484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsri_n_p16 (poly16x4_t __a, poly16x4_t __b, const int __c)
4485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vsri_nv4hi ((int16x4_t) __a, (int16x4_t) __b, __c);
4487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
4490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
4491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_p64 (poly64x2_t __a, poly64x2_t __b, const int __c)
4492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vsri_nv2di ((int64x2_t) __a, (int64x2_t) __b, __c);
4494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
4497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_s8 (int8x16_t __a, int8x16_t __b, const int __c)
4499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vsri_nv16qi (__a, __b, __c);
4501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_s16 (int16x8_t __a, int16x8_t __b, const int __c)
4505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vsri_nv8hi (__a, __b, __c);
4507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_s32 (int32x4_t __a, int32x4_t __b, const int __c)
4511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vsri_nv4si (__a, __b, __c);
4513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
4516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_s64 (int64x2_t __a, int64x2_t __b, const int __c)
4517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vsri_nv2di (__a, __b, __c);
4519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
4522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_u8 (uint8x16_t __a, uint8x16_t __b, const int __c)
4523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vsri_nv16qi ((int8x16_t) __a, (int8x16_t) __b, __c);
4525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_u16 (uint16x8_t __a, uint16x8_t __b, const int __c)
4529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vsri_nv8hi ((int16x8_t) __a, (int16x8_t) __b, __c);
4531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_u32 (uint32x4_t __a, uint32x4_t __b, const int __c)
4535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vsri_nv4si ((int32x4_t) __a, (int32x4_t) __b, __c);
4537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
4540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_u64 (uint64x2_t __a, uint64x2_t __b, const int __c)
4541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vsri_nv2di ((int64x2_t) __a, (int64x2_t) __b, __c);
4543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
4546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_p8 (poly8x16_t __a, poly8x16_t __b, const int __c)
4547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vsri_nv16qi ((int8x16_t) __a, (int8x16_t) __b, __c);
4549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
4552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsriq_n_p16 (poly16x8_t __a, poly16x8_t __b, const int __c)
4553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vsri_nv8hi ((int16x8_t) __a, (int16x8_t) __b, __c);
4555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
4558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
4559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_p64 (poly64x1_t __a, poly64x1_t __b, const int __c)
4560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vsli_ndi (__a, __b, __c);
4562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
4565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_s8 (int8x8_t __a, int8x8_t __b, const int __c)
4567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vsli_nv8qi (__a, __b, __c);
4569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_s16 (int16x4_t __a, int16x4_t __b, const int __c)
4573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vsli_nv4hi (__a, __b, __c);
4575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_s32 (int32x2_t __a, int32x2_t __b, const int __c)
4579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vsli_nv2si (__a, __b, __c);
4581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
4584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_s64 (int64x1_t __a, int64x1_t __b, const int __c)
4585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vsli_ndi (__a, __b, __c);
4587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
4590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_u8 (uint8x8_t __a, uint8x8_t __b, const int __c)
4591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vsli_nv8qi ((int8x8_t) __a, (int8x8_t) __b, __c);
4593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
4596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_u16 (uint16x4_t __a, uint16x4_t __b, const int __c)
4597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vsli_nv4hi ((int16x4_t) __a, (int16x4_t) __b, __c);
4599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
4602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_u32 (uint32x2_t __a, uint32x2_t __b, const int __c)
4603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vsli_nv2si ((int32x2_t) __a, (int32x2_t) __b, __c);
4605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
4608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_u64 (uint64x1_t __a, uint64x1_t __b, const int __c)
4609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vsli_ndi ((int64x1_t) __a, (int64x1_t) __b, __c);
4611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
4614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_p8 (poly8x8_t __a, poly8x8_t __b, const int __c)
4615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vsli_nv8qi ((int8x8_t) __a, (int8x8_t) __b, __c);
4617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
4620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsli_n_p16 (poly16x4_t __a, poly16x4_t __b, const int __c)
4621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vsli_nv4hi ((int16x4_t) __a, (int16x4_t) __b, __c);
4623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
4626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
4627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_p64 (poly64x2_t __a, poly64x2_t __b, const int __c)
4628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vsli_nv2di ((int64x2_t) __a, (int64x2_t) __b, __c);
4630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
4633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_s8 (int8x16_t __a, int8x16_t __b, const int __c)
4635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vsli_nv16qi (__a, __b, __c);
4637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_s16 (int16x8_t __a, int16x8_t __b, const int __c)
4641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vsli_nv8hi (__a, __b, __c);
4643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_s32 (int32x4_t __a, int32x4_t __b, const int __c)
4647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vsli_nv4si (__a, __b, __c);
4649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
4652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_s64 (int64x2_t __a, int64x2_t __b, const int __c)
4653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vsli_nv2di (__a, __b, __c);
4655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
4658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_u8 (uint8x16_t __a, uint8x16_t __b, const int __c)
4659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vsli_nv16qi ((int8x16_t) __a, (int8x16_t) __b, __c);
4661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_u16 (uint16x8_t __a, uint16x8_t __b, const int __c)
4665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vsli_nv8hi ((int16x8_t) __a, (int16x8_t) __b, __c);
4667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_u32 (uint32x4_t __a, uint32x4_t __b, const int __c)
4671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vsli_nv4si ((int32x4_t) __a, (int32x4_t) __b, __c);
4673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
4676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_u64 (uint64x2_t __a, uint64x2_t __b, const int __c)
4677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vsli_nv2di ((int64x2_t) __a, (int64x2_t) __b, __c);
4679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
4682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_p8 (poly8x16_t __a, poly8x16_t __b, const int __c)
4683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vsli_nv16qi ((int8x16_t) __a, (int8x16_t) __b, __c);
4685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
4688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsliq_n_p16 (poly16x8_t __a, poly16x8_t __b, const int __c)
4689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vsli_nv8hi ((int16x8_t) __a, (int16x8_t) __b, __c);
4691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabs_s8 (int8x8_t __a)
4695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vabsv8qi (__a, 1);
4697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabs_s16 (int16x4_t __a)
4701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vabsv4hi (__a, 1);
4703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabs_s32 (int32x2_t __a)
4707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vabsv2si (__a, 1);
4709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
4712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabs_f32 (float32x2_t __a)
4713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vabsv2sf (__a, 3);
4715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabsq_s8 (int8x16_t __a)
4719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vabsv16qi (__a, 1);
4721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabsq_s16 (int16x8_t __a)
4725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vabsv8hi (__a, 1);
4727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabsq_s32 (int32x4_t __a)
4731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vabsv4si (__a, 1);
4733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
4736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vabsq_f32 (float32x4_t __a)
4737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vabsv4sf (__a, 3);
4739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqabs_s8 (int8x8_t __a)
4743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqabsv8qi (__a, 1);
4745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqabs_s16 (int16x4_t __a)
4749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqabsv4hi (__a, 1);
4751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqabs_s32 (int32x2_t __a)
4755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqabsv2si (__a, 1);
4757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqabsq_s8 (int8x16_t __a)
4761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vqabsv16qi (__a, 1);
4763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqabsq_s16 (int16x8_t __a)
4767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqabsv8hi (__a, 1);
4769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqabsq_s32 (int32x4_t __a)
4773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqabsv4si (__a, 1);
4775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vneg_s8 (int8x8_t __a)
4779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vnegv8qi (__a, 1);
4781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vneg_s16 (int16x4_t __a)
4785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vnegv4hi (__a, 1);
4787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vneg_s32 (int32x2_t __a)
4791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vnegv2si (__a, 1);
4793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
4796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vneg_f32 (float32x2_t __a)
4797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vnegv2sf (__a, 3);
4799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vnegq_s8 (int8x16_t __a)
4803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vnegv16qi (__a, 1);
4805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vnegq_s16 (int16x8_t __a)
4809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vnegv8hi (__a, 1);
4811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vnegq_s32 (int32x4_t __a)
4815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vnegv4si (__a, 1);
4817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
4820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vnegq_f32 (float32x4_t __a)
4821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vnegv4sf (__a, 3);
4823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqneg_s8 (int8x8_t __a)
4827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqnegv8qi (__a, 1);
4829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqneg_s16 (int16x4_t __a)
4833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqnegv4hi (__a, 1);
4835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqneg_s32 (int32x2_t __a)
4839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqnegv2si (__a, 1);
4841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqnegq_s8 (int8x16_t __a)
4845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vqnegv16qi (__a, 1);
4847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqnegq_s16 (int16x8_t __a)
4851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqnegv8hi (__a, 1);
4853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqnegq_s32 (int32x4_t __a)
4857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqnegv4si (__a, 1);
4859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvn_s8 (int8x8_t __a)
4863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vmvnv8qi (__a, 1);
4865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvn_s16 (int16x4_t __a)
4869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmvnv4hi (__a, 1);
4871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvn_s32 (int32x2_t __a)
4875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmvnv2si (__a, 1);
4877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
4880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvn_u8 (uint8x8_t __a)
4881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vmvnv8qi ((int8x8_t) __a, 0);
4883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
4886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvn_u16 (uint16x4_t __a)
4887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmvnv4hi ((int16x4_t) __a, 0);
4889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
4892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvn_u32 (uint32x2_t __a)
4893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmvnv2si ((int32x2_t) __a, 0);
4895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
4898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvn_p8 (poly8x8_t __a)
4899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vmvnv8qi ((int8x8_t) __a, 2);
4901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvnq_s8 (int8x16_t __a)
4905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vmvnv16qi (__a, 1);
4907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvnq_s16 (int16x8_t __a)
4911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmvnv8hi (__a, 1);
4913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvnq_s32 (int32x4_t __a)
4917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmvnv4si (__a, 1);
4919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
4922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvnq_u8 (uint8x16_t __a)
4923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vmvnv16qi ((int8x16_t) __a, 0);
4925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
4928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvnq_u16 (uint16x8_t __a)
4929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmvnv8hi ((int16x8_t) __a, 0);
4931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
4934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvnq_u32 (uint32x4_t __a)
4935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmvnv4si ((int32x4_t) __a, 0);
4937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
4940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmvnq_p8 (poly8x16_t __a)
4941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vmvnv16qi ((int8x16_t) __a, 2);
4943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcls_s8 (int8x8_t __a)
4947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vclsv8qi (__a, 1);
4949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcls_s16 (int16x4_t __a)
4953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vclsv4hi (__a, 1);
4955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcls_s32 (int32x2_t __a)
4959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vclsv2si (__a, 1);
4961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
4964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclsq_s8 (int8x16_t __a)
4965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vclsv16qi (__a, 1);
4967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
4970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclsq_s16 (int16x8_t __a)
4971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vclsv8hi (__a, 1);
4973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
4976:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclsq_s32 (int32x4_t __a)
4977:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4978:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vclsv4si (__a, 1);
4979:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4980:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4981:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
4982:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclz_s8 (int8x8_t __a)
4983:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4984:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vclzv8qi (__a, 1);
4985:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4986:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4987:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
4988:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclz_s16 (int16x4_t __a)
4989:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4990:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vclzv4hi (__a, 1);
4991:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4992:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4993:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
4994:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclz_s32 (int32x2_t __a)
4995:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
4996:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vclzv2si (__a, 1);
4997:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
4998:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
4999:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
5000:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclz_u8 (uint8x8_t __a)
5001:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5002:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vclzv8qi ((int8x8_t) __a, 0);
5003:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5004:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5005:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
5006:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclz_u16 (uint16x4_t __a)
5007:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5008:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vclzv4hi ((int16x4_t) __a, 0);
5009:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5010:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5011:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
5012:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclz_u32 (uint32x2_t __a)
5013:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5014:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vclzv2si ((int32x2_t) __a, 0);
5015:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5016:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5017:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
5018:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclzq_s8 (int8x16_t __a)
5019:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5020:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vclzv16qi (__a, 1);
5021:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5022:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5023:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
5024:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclzq_s16 (int16x8_t __a)
5025:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5026:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vclzv8hi (__a, 1);
5027:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5028:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5029:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
5030:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclzq_s32 (int32x4_t __a)
5031:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5032:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vclzv4si (__a, 1);
5033:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5034:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5035:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
5036:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclzq_u8 (uint8x16_t __a)
5037:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5038:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vclzv16qi ((int8x16_t) __a, 0);
5039:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5040:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5041:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
5042:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclzq_u16 (uint16x8_t __a)
5043:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5044:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vclzv8hi ((int16x8_t) __a, 0);
5045:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5046:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5047:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
5048:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vclzq_u32 (uint32x4_t __a)
5049:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5050:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vclzv4si ((int32x4_t) __a, 0);
5051:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5052:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5053:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
5054:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcnt_s8 (int8x8_t __a)
5055:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5056:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vcntv8qi (__a, 1);
5057:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5058:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5059:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
5060:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcnt_u8 (uint8x8_t __a)
5061:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5062:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcntv8qi ((int8x8_t) __a, 0);
5063:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5064:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5065:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
5066:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcnt_p8 (poly8x8_t __a)
5067:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5068:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vcntv8qi ((int8x8_t) __a, 2);
5069:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5070:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5071:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
5072:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcntq_s8 (int8x16_t __a)
5073:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5074:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vcntv16qi (__a, 1);
5075:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5076:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5077:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
5078:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcntq_u8 (uint8x16_t __a)
5079:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5080:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcntv16qi ((int8x16_t) __a, 0);
5081:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5082:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5083:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
5084:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcntq_p8 (poly8x16_t __a)
5085:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5086:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vcntv16qi ((int8x16_t) __a, 2);
5087:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5088:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5089:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
5090:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrecpe_f32 (float32x2_t __a)
5091:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5092:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrecpev2sf (__a, 3);
5093:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5094:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5095:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
5096:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrecpe_u32 (uint32x2_t __a)
5097:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5098:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vrecpev2si ((int32x2_t) __a, 0);
5099:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
5102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrecpeq_f32 (float32x4_t __a)
5103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrecpev4sf (__a, 3);
5105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
5108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrecpeq_u32 (uint32x4_t __a)
5109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vrecpev4si ((int32x4_t) __a, 0);
5111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
5114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsqrte_f32 (float32x2_t __a)
5115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vrsqrtev2sf (__a, 3);
5117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
5120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsqrte_u32 (uint32x2_t __a)
5121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vrsqrtev2si ((int32x2_t) __a, 0);
5123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
5126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsqrteq_f32 (float32x4_t __a)
5127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vrsqrtev4sf (__a, 3);
5129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
5132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrsqrteq_u32 (uint32x4_t __a)
5133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vrsqrtev4si ((int32x4_t) __a, 0);
5135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8_t __attribute__ ((__always_inline__))
5138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_s8 (int8x8_t __a, const int __b)
5139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8_t)__builtin_neon_vget_lanev8qi (__a, __b, 1);
5141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16_t __attribute__ ((__always_inline__))
5144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_s16 (int16x4_t __a, const int __b)
5145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16_t)__builtin_neon_vget_lanev4hi (__a, __b, 1);
5147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32_t __attribute__ ((__always_inline__))
5150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_s32 (int32x2_t __a, const int __b)
5151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32_t)__builtin_neon_vget_lanev2si (__a, __b, 1);
5153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32_t __attribute__ ((__always_inline__))
5156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_f32 (float32x2_t __a, const int __b)
5157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32_t)__builtin_neon_vget_lanev2sf (__a, __b, 3);
  88              		.loc 2 5158 0
  89 0040 10EE103B 		vmov.32	r3, d0[0]
  90              	.LBE62:
  91              	.LBE61:
  92              		.loc 1 31 0
  93 0044 30B5     		push	{r4, r5, lr}
  94              		.cfi_def_cfa_offset 12
  95              		.cfi_offset 4, -12
  96              		.cfi_offset 5, -8
  97              		.cfi_offset 14, -4
  98 0046 85B0     		sub	sp, sp, #20
  99              		.cfi_def_cfa_offset 32
 100 0048 01AC     		add	r4, sp, #4
 101 004a 04AD     		add	r5, sp, #16
  32:main.c        ****   int i;
  33:main.c        ****   float v[4];
  34:main.c        ****   float32x2_t v2;
  35:main.c        **** 
  36:main.c        ****   v2 = vget_low_f32(v4);
  37:main.c        ****   v[0] = vget_lane_f32(v2, 0);
  38:main.c        ****   v[1] = vget_lane_f32(v2, 1);
 102              		.loc 1 38 0
 103 004c 84F98F08 		vst1.32	{d0[1]}, [r4]
 104              	.LBB64:
 105              	.LBB63:
 106              		.loc 2 5158 0
 107 0050 07EE903A 		fmsr	s15, r3
 108              	.LBE63:
 109              	.LBE64:
  39:main.c        ****   v2 = vget_high_f32(v4);
  40:main.c        ****   v[2] = vget_lane_f32(v2, 0);
 110              		.loc 1 40 0
 111 0054 02AB     		add	r3, sp, #8
  37:main.c        ****   v[1] = vget_lane_f32(v2, 1);
 112              		.loc 1 37 0
 113 0056 CDED007A 		fsts	s15, [sp]
 114              		.loc 1 40 0
 115 005a 83F90F18 		vst1.32	{d1[0]}, [r3]
 116              	.LVL5:
  41:main.c        ****   v[3] = vget_lane_f32(v2, 1);
 117              		.loc 1 41 0
 118 005e 03AB     		add	r3, sp, #12
 119 0060 83F98F18 		vst1.32	{d1[1]}, [r3]
 120              	.LVL6:
 121              	.L10:
  42:main.c        ****   
  43:main.c        ****   for (i=0; i<4; i++)
  44:main.c        ****     printf("%f \t", v[i]);
 122              		.loc 1 44 0 discriminator 3
 123 0064 40F20000 		movw	r0, #:lower16:.LC0
 124 0068 F7EEE70A 		fcvtds	d16, s15
 125 006c C0F20000 		movt	r0, #:upper16:.LC0
 126 0070 53EC302B 		fmrrd	r2, r3, d16
 127 0074 FFF7FEFF 		bl	printf
 128              	.LVL7:
  43:main.c        ****     printf("%f \t", v[i]);
 129              		.loc 1 43 0 discriminator 3
 130 0078 AC42     		cmp	r4, r5
 131 007a 02D0     		beq	.L8
 132 007c F4EC017A 		fldmias	r4!, {s15}
 133 0080 F0E7     		b	.L10
 134              	.L8:
  45:main.c        ****   
  46:main.c        **** }
 135              		.loc 1 46 0
 136 0082 05B0     		add	sp, sp, #20
 137              		.cfi_def_cfa_offset 12
 138              		@ sp needed
 139 0084 30BD     		pop	{r4, r5, pc}
 140              		.cfi_endproc
 141              	.LFE1913:
 143              		.section	.text.startup,"ax",%progbits
 144              		.align	2
 145              		.global	main
 146              		.thumb
 147              		.thumb_func
 149              	main:
 150              	.LFB1914:
  47:main.c        **** 
  48:main.c        **** int main (void) {
 151              		.loc 1 48 0
 152              		.cfi_startproc
 153              		@ args = 0, pretend = 0, frame = 32
 154              		@ frame_needed = 0, uses_anonymous_args = 0
 155              	.LVL8:
 156 0000 2DE9F04F 		push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
 157              		.cfi_def_cfa_offset 36
 158              		.cfi_offset 4, -36
 159              		.cfi_offset 5, -32
 160              		.cfi_offset 6, -28
 161              		.cfi_offset 7, -24
 162              		.cfi_offset 8, -20
 163              		.cfi_offset 9, -16
 164              		.cfi_offset 10, -12
 165              		.cfi_offset 11, -8
 166              		.cfi_offset 14, -4
 167 0004 8DB0     		sub	sp, sp, #52
 168              		.cfi_def_cfa_offset 88
  49:main.c        ****   struct timespec start, end;
  50:main.c        ****   unsigned long diff, total=0, min=1234567890;
 169              		.loc 1 50 0
 170 0006 40F2D225 		movw	r5, #722
 171              	.LBB65:
  51:main.c        ****   float sum_val = 0, min_val = 1e30, max_val = -1e30;
  52:main.c        ****   int n, i;
  53:main.c        **** 
  54:main.c        ****   float32x4_t v4_x, v4_min_val, v4_max_val, v4_sum_val;
  55:main.c        ****   
  56:main.c        ****   init_data();
  57:main.c        ****     
  58:main.c        ****   for (n=0; n<N_TESTS; n++) {
  59:main.c        ****     sum_val = 0;
  60:main.c        ****     min_val = 1e30;
  61:main.c        ****     max_val = -1e30;
  62:main.c        **** 
  63:main.c        ****     clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
  64:main.c        ****     
  65:main.c        **** #if USE_SIMD==0
  66:main.c        ****     for (i=0; i<N_POINTS; i++) {
  67:main.c        ****       if (x[i] < min_val)
  68:main.c        **** 	min_val = x[i];
  69:main.c        ****       if (x[i] > max_val)
  70:main.c        **** 	max_val = x[i];
  71:main.c        ****       sum_val += x[i];
  72:main.c        ****     }
  73:main.c        **** #if DEBUG
  74:main.c        ****     printf("Min: %f \tMax: %f \tSum: %f\n\n", min_val, max_val, sum_val);
  75:main.c        **** #endif
  76:main.c        **** 
  77:main.c        **** #else // USE_SIMD == 1
  78:main.c        ****     
  79:main.c        ****     v4_min_val = vld1q_dup_f32(&min_val);
  80:main.c        ****     v4_max_val = vld1q_dup_f32(&max_val);
  81:main.c        ****     v4_sum_val = vld1q_dup_f32(&sum_val);
  82:main.c        **** 
  83:main.c        ****     // process all elements through lanes
  84:main.c        ****     for (i=0; i<N_POINTS; i+=4) {
  85:main.c        ****       //     Can we prefetch here? Cache line size, data size
  86:main.c        ****       v4_x = vld1q_f32(&x[i]); // load vector of 4 x values
  87:main.c        ****       // find minima
  88:main.c        ****       v4_min_val = vminq_f32(v4_min_val, v4_x);
  89:main.c        ****       // find maxima
  90:main.c        ****       v4_max_val = vmaxq_f32(v4_max_val, v4_x);
  91:main.c        ****       // find sums
  92:main.c        ****       v4_sum_val = vaddq_f32(v4_sum_val, v4_x);
  93:main.c        ****     }
  94:main.c        ****     
  95:main.c        ****     // Debug info per lane
  96:main.c        **** #if DEBUG
  97:main.c        ****     printf("SIMD\n");
  98:main.c        ****     printf("\nMin: \t");
  99:main.c        ****     print_float32x4(v4_min_val);
 100:main.c        ****     printf("\nMax: \t");
 101:main.c        ****     print_float32x4(v4_max_val);
 102:main.c        ****     printf("\nSum: \t");
 103:main.c        ****     print_float32x4(v4_sum_val);
 104:main.c        ****     printf("\n");
 105:main.c        **** #endif
 106:main.c        **** 
 107:main.c        ****     // Reduce lane results to single values
 108:main.c        ****     // min
 109:main.c        ****     float32x2_t v2_u, v2_l;
 110:main.c        ****     float32x2_t v2_zero = vdup_n_f32(0.0);
 111:main.c        **** 
 112:main.c        ****     v2_u = vget_high_f32(v4_min_val);
 113:main.c        ****     v2_l = vget_low_f32(v4_min_val);
 114:main.c        ****     v2_u = vpmin_f32(v2_u, v2_l);
 115:main.c        ****     v2_u = vpmin_f32(v2_u, v2_u);
 116:main.c        ****     min_val = vget_lane_f32(v2_u, 0);
 117:main.c        **** 
 118:main.c        ****     // max
 119:main.c        ****     v2_u = vget_high_f32(v4_max_val);
 120:main.c        ****     v2_l = vget_low_f32(v4_max_val);
 121:main.c        ****     v2_u = vpmax_f32(v2_u, v2_l);
 122:main.c        ****     v2_u = vpmax_f32(v2_u, v2_zero);
 123:main.c        ****     max_val = vget_lane_f32(v2_u, 0);
 124:main.c        **** 
 125:main.c        ****     // sum
 126:main.c        ****     v2_u = vget_high_f32(v4_sum_val);
 127:main.c        ****     v2_l = vget_low_f32(v4_sum_val);
 128:main.c        ****     v2_u = vpadd_f32(v2_u, v2_l);
 129:main.c        ****     v2_u = vpadd_f32(v2_u, v2_zero);
 130:main.c        ****     sum_val = vget_lane_f32(v2_u, 0);
 131:main.c        **** 
 132:main.c        **** #if DEBUG
 133:main.c        ****     printf("Min: %f\n", min_val);
 134:main.c        ****     printf("Max: %f\n", max_val);
 135:main.c        ****     printf("Sum: %f\n", sum_val);
 136:main.c        **** #endif
 137:main.c        ****     
 138:main.c        **** #endif // USE_SIMD
 139:main.c        ****     
 140:main.c        ****     clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
 141:main.c        ****     
 142:main.c        ****     diff = 1000000000 * (end.tv_sec - start.tv_sec) +
 172              		.loc 1 142 0
 173 000a 4FF44A4A 		mov	r10, #51712
 174              	.LBE65:
  51:main.c        ****   float sum_val = 0, min_val = 1e30, max_val = -1e30;
 175              		.loc 1 51 0
 176 000e 4FF2CA28 		movw	r8, #62154
 177 0012 4FF2CA27 		movw	r7, #62154
 178 0016 4FF00009 		mov	r9, #0
 179 001a C7F24918 		movt	r8, 29001
 180 001e CFF24917 		movt	r7, 61769
 181 0022 DFF838B1 		ldr	fp, .L18+8
 182 0026 CDF81490 		str	r9, [sp, #20]	@ float
  50:main.c        ****   float sum_val = 0, min_val = 1e30, max_val = -1e30;
 183              		.loc 1 50 0
 184 002a C4F69615 		movt	r5, 18838
 185              	.LVL9:
 186              	.LBB98:
 187              		.loc 1 142 0
 188 002e C3F69A3A 		movt	r10, 15258
 189              	.LBE98:
  51:main.c        ****   float sum_val = 0, min_val = 1e30, max_val = -1e30;
 190              		.loc 1 51 0
 191 0032 CDF81880 		str	r8, [sp, #24]	@ float
  56:main.c        ****     
 192              		.loc 1 56 0
 193 0036 4FF47A74 		mov	r4, #1000
  50:main.c        ****   float sum_val = 0, min_val = 1e30, max_val = -1e30;
 194              		.loc 1 50 0
 195 003a 0026     		movs	r6, #0
  51:main.c        ****   float sum_val = 0, min_val = 1e30, max_val = -1e30;
 196              		.loc 1 51 0
 197 003c 0797     		str	r7, [sp, #28]	@ float
  56:main.c        ****     
 198              		.loc 1 56 0
 199 003e FFF7FEFF 		bl	init_data
 200              	.LVL10:
 201              	.L14:
 202              	.LBB99:
  63:main.c        ****     
 203              		.loc 1 63 0
 204 0042 0220     		movs	r0, #2
 205 0044 08A9     		add	r1, sp, #32
  59:main.c        ****     min_val = 1e30;
 206              		.loc 1 59 0
 207 0046 CDF81490 		str	r9, [sp, #20]	@ float
  60:main.c        ****     max_val = -1e30;
 208              		.loc 1 60 0
 209 004a CDF81880 		str	r8, [sp, #24]	@ float
  61:main.c        **** 
 210              		.loc 1 61 0
 211 004e 0797     		str	r7, [sp, #28]	@ float
  63:main.c        ****     
 212              		.loc 1 63 0
 213 0050 FFF7FEFF 		bl	clock_gettime
 214              	.LVL11:
 215              	.LBB66:
 216              	.LBB67:
5159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8_t __attribute__ ((__always_inline__))
5162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_u8 (uint8x8_t __a, const int __b)
5163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8_t)__builtin_neon_vget_lanev8qi ((int8x8_t) __a, __b, 0);
5165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16_t __attribute__ ((__always_inline__))
5168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_u16 (uint16x4_t __a, const int __b)
5169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16_t)__builtin_neon_vget_lanev4hi ((int16x4_t) __a, __b, 0);
5171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32_t __attribute__ ((__always_inline__))
5174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_u32 (uint32x2_t __a, const int __b)
5175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32_t)__builtin_neon_vget_lanev2si ((int32x2_t) __a, __b, 0);
5177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8_t __attribute__ ((__always_inline__))
5180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_p8 (poly8x8_t __a, const int __b)
5181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8_t)__builtin_neon_vget_lanev8qi ((int8x8_t) __a, __b, 2);
5183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16_t __attribute__ ((__always_inline__))
5186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_p16 (poly16x4_t __a, const int __b)
5187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16_t)__builtin_neon_vget_lanev4hi ((int16x4_t) __a, __b, 2);
5189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64_t __attribute__ ((__always_inline__))
5192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_s64 (int64x1_t __a, const int __b)
5193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64_t)__builtin_neon_vget_lanedi (__a, __b, 1);
5195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64_t __attribute__ ((__always_inline__))
5198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_lane_u64 (uint64x1_t __a, const int __b)
5199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64_t)__builtin_neon_vget_lanedi ((int64x1_t) __a, __b, 0);
5201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8_t __attribute__ ((__always_inline__))
5204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_s8 (int8x16_t __a, const int __b)
5205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8_t)__builtin_neon_vget_lanev16qi (__a, __b, 1);
5207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16_t __attribute__ ((__always_inline__))
5210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_s16 (int16x8_t __a, const int __b)
5211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16_t)__builtin_neon_vget_lanev8hi (__a, __b, 1);
5213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32_t __attribute__ ((__always_inline__))
5216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_s32 (int32x4_t __a, const int __b)
5217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32_t)__builtin_neon_vget_lanev4si (__a, __b, 1);
5219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32_t __attribute__ ((__always_inline__))
5222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_f32 (float32x4_t __a, const int __b)
5223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32_t)__builtin_neon_vget_lanev4sf (__a, __b, 3);
5225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8_t __attribute__ ((__always_inline__))
5228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_u8 (uint8x16_t __a, const int __b)
5229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8_t)__builtin_neon_vget_lanev16qi ((int8x16_t) __a, __b, 0);
5231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16_t __attribute__ ((__always_inline__))
5234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_u16 (uint16x8_t __a, const int __b)
5235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16_t)__builtin_neon_vget_lanev8hi ((int16x8_t) __a, __b, 0);
5237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32_t __attribute__ ((__always_inline__))
5240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_u32 (uint32x4_t __a, const int __b)
5241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32_t)__builtin_neon_vget_lanev4si ((int32x4_t) __a, __b, 0);
5243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8_t __attribute__ ((__always_inline__))
5246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_p8 (poly8x16_t __a, const int __b)
5247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8_t)__builtin_neon_vget_lanev16qi ((int8x16_t) __a, __b, 2);
5249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16_t __attribute__ ((__always_inline__))
5252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_p16 (poly16x8_t __a, const int __b)
5253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16_t)__builtin_neon_vget_lanev8hi ((int16x8_t) __a, __b, 2);
5255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64_t __attribute__ ((__always_inline__))
5258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_s64 (int64x2_t __a, const int __b)
5259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64_t)__builtin_neon_vget_lanev2di (__a, __b, 1);
5261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64_t __attribute__ ((__always_inline__))
5264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vgetq_lane_u64 (uint64x2_t __a, const int __b)
5265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64_t)__builtin_neon_vget_lanev2di ((int64x2_t) __a, __b, 0);
5267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
5270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_s8 (int8_t __a, int8x8_t __b, const int __c)
5271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vset_lanev8qi ((__builtin_neon_qi) __a, __b, __c);
5273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
5276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_s16 (int16_t __a, int16x4_t __b, const int __c)
5277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vset_lanev4hi ((__builtin_neon_hi) __a, __b, __c);
5279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
5282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_s32 (int32_t __a, int32x2_t __b, const int __c)
5283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vset_lanev2si ((__builtin_neon_si) __a, __b, __c);
5285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
5288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_f32 (float32_t __a, float32x2_t __b, const int __c)
5289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vset_lanev2sf ((__builtin_neon_sf) __a, __b, __c);
5291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
5294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_u8 (uint8_t __a, uint8x8_t __b, const int __c)
5295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vset_lanev8qi ((__builtin_neon_qi) __a, (int8x8_t) __b, __c);
5297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
5300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_u16 (uint16_t __a, uint16x4_t __b, const int __c)
5301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vset_lanev4hi ((__builtin_neon_hi) __a, (int16x4_t) __b, __c);
5303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
5306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_u32 (uint32_t __a, uint32x2_t __b, const int __c)
5307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vset_lanev2si ((__builtin_neon_si) __a, (int32x2_t) __b, __c);
5309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
5312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_p8 (poly8_t __a, poly8x8_t __b, const int __c)
5313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vset_lanev8qi ((__builtin_neon_qi) __a, (int8x8_t) __b, __c);
5315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
5318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_p16 (poly16_t __a, poly16x4_t __b, const int __c)
5319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vset_lanev4hi ((__builtin_neon_hi) __a, (int16x4_t) __b, __c);
5321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
5324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_s64 (int64_t __a, int64x1_t __b, const int __c)
5325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vset_lanedi ((__builtin_neon_di) __a, __b, __c);
5327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
5330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vset_lane_u64 (uint64_t __a, uint64x1_t __b, const int __c)
5331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vset_lanedi ((__builtin_neon_di) __a, (int64x1_t) __b, __c);
5333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
5336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_s8 (int8_t __a, int8x16_t __b, const int __c)
5337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vset_lanev16qi ((__builtin_neon_qi) __a, __b, __c);
5339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
5342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_s16 (int16_t __a, int16x8_t __b, const int __c)
5343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vset_lanev8hi ((__builtin_neon_hi) __a, __b, __c);
5345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
5348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_s32 (int32_t __a, int32x4_t __b, const int __c)
5349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vset_lanev4si ((__builtin_neon_si) __a, __b, __c);
5351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
5354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_f32 (float32_t __a, float32x4_t __b, const int __c)
5355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vset_lanev4sf ((__builtin_neon_sf) __a, __b, __c);
5357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
5360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_u8 (uint8_t __a, uint8x16_t __b, const int __c)
5361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vset_lanev16qi ((__builtin_neon_qi) __a, (int8x16_t) __b, __c);
5363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
5366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_u16 (uint16_t __a, uint16x8_t __b, const int __c)
5367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vset_lanev8hi ((__builtin_neon_hi) __a, (int16x8_t) __b, __c);
5369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
5372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_u32 (uint32_t __a, uint32x4_t __b, const int __c)
5373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vset_lanev4si ((__builtin_neon_si) __a, (int32x4_t) __b, __c);
5375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
5378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_p8 (poly8_t __a, poly8x16_t __b, const int __c)
5379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vset_lanev16qi ((__builtin_neon_qi) __a, (int8x16_t) __b, __c);
5381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
5384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_p16 (poly16_t __a, poly16x8_t __b, const int __c)
5385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vset_lanev8hi ((__builtin_neon_hi) __a, (int16x8_t) __b, __c);
5387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
5390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_s64 (int64_t __a, int64x2_t __b, const int __c)
5391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vset_lanev2di ((__builtin_neon_di) __a, __b, __c);
5393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
5396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vsetq_lane_u64 (uint64_t __a, uint64x2_t __b, const int __c)
5397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vset_lanev2di ((__builtin_neon_di) __a, (int64x2_t) __b, __c);
5399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
5402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
5403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_p64 (uint64_t __a)
5404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vcreatedi ((__builtin_neon_di) __a);
5406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
5409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
5410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_s8 (uint64_t __a)
5411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vcreatev8qi ((__builtin_neon_di) __a);
5413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
5416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_s16 (uint64_t __a)
5417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vcreatev4hi ((__builtin_neon_di) __a);
5419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
5422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_s32 (uint64_t __a)
5423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vcreatev2si ((__builtin_neon_di) __a);
5425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
5428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_s64 (uint64_t __a)
5429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vcreatedi ((__builtin_neon_di) __a);
5431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
5434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_f32 (uint64_t __a)
5435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vcreatev2sf ((__builtin_neon_di) __a);
5437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
5440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_u8 (uint64_t __a)
5441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vcreatev8qi ((__builtin_neon_di) __a);
5443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
5446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_u16 (uint64_t __a)
5447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vcreatev4hi ((__builtin_neon_di) __a);
5449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
5452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_u32 (uint64_t __a)
5453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcreatev2si ((__builtin_neon_di) __a);
5455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
5458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_u64 (uint64_t __a)
5459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vcreatedi ((__builtin_neon_di) __a);
5461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
5464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_p8 (uint64_t __a)
5465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vcreatev8qi ((__builtin_neon_di) __a);
5467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
5470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcreate_p16 (uint64_t __a)
5471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vcreatev4hi ((__builtin_neon_di) __a);
5473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
5476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_s8 (int8_t __a)
5477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vdup_nv8qi ((__builtin_neon_qi) __a);
5479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
5482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_s16 (int16_t __a)
5483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vdup_nv4hi ((__builtin_neon_hi) __a);
5485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
5488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_s32 (int32_t __a)
5489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vdup_nv2si ((__builtin_neon_si) __a);
5491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
5494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_f32 (float32_t __a)
5495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vdup_nv2sf ((__builtin_neon_sf) __a);
5497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
5500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_u8 (uint8_t __a)
5501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vdup_nv8qi ((__builtin_neon_qi) __a);
5503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
5506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_u16 (uint16_t __a)
5507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vdup_nv4hi ((__builtin_neon_hi) __a);
5509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
5512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_u32 (uint32_t __a)
5513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vdup_nv2si ((__builtin_neon_si) __a);
5515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
5518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_p8 (poly8_t __a)
5519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vdup_nv8qi ((__builtin_neon_qi) __a);
5521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
5524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_p16 (poly16_t __a)
5525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vdup_nv4hi ((__builtin_neon_hi) __a);
5527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
5530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
5531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_p64 (poly64_t __a)
5532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vdup_ndi ((__builtin_neon_di) __a);
5534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
5537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
5538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_s64 (int64_t __a)
5539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vdup_ndi ((__builtin_neon_di) __a);
5541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
5544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_n_u64 (uint64_t __a)
5545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vdup_ndi ((__builtin_neon_di) __a);
5547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
5550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
5551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_p64 (poly64_t __a)
5552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vdup_nv2di ((__builtin_neon_di) __a);
5554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
5557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
5558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_s8 (int8_t __a)
5559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vdup_nv16qi ((__builtin_neon_qi) __a);
5561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
5564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_s16 (int16_t __a)
5565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vdup_nv8hi ((__builtin_neon_hi) __a);
5567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
5570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_s32 (int32_t __a)
5571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vdup_nv4si ((__builtin_neon_si) __a);
5573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
5576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_f32 (float32_t __a)
5577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vdup_nv4sf ((__builtin_neon_sf) __a);
5579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
5582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_u8 (uint8_t __a)
5583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vdup_nv16qi ((__builtin_neon_qi) __a);
5585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
5588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_u16 (uint16_t __a)
5589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vdup_nv8hi ((__builtin_neon_hi) __a);
5591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
5594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_u32 (uint32_t __a)
5595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vdup_nv4si ((__builtin_neon_si) __a);
5597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
5600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_p8 (poly8_t __a)
5601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vdup_nv16qi ((__builtin_neon_qi) __a);
5603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
5606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_p16 (poly16_t __a)
5607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vdup_nv8hi ((__builtin_neon_hi) __a);
5609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
5612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_s64 (int64_t __a)
5613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vdup_nv2di ((__builtin_neon_di) __a);
5615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
5618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_n_u64 (uint64_t __a)
5619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vdup_nv2di ((__builtin_neon_di) __a);
5621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
5624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_s8 (int8_t __a)
5625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vdup_nv8qi ((__builtin_neon_qi) __a);
5627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
5630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_s16 (int16_t __a)
5631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vdup_nv4hi ((__builtin_neon_hi) __a);
5633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
5636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_s32 (int32_t __a)
5637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vdup_nv2si ((__builtin_neon_si) __a);
5639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
5642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_f32 (float32_t __a)
5643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vdup_nv2sf ((__builtin_neon_sf) __a);
5645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
5648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_u8 (uint8_t __a)
5649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vdup_nv8qi ((__builtin_neon_qi) __a);
5651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
5654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_u16 (uint16_t __a)
5655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vdup_nv4hi ((__builtin_neon_hi) __a);
5657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
5660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_u32 (uint32_t __a)
5661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vdup_nv2si ((__builtin_neon_si) __a);
5663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
5666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_p8 (poly8_t __a)
5667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vdup_nv8qi ((__builtin_neon_qi) __a);
5669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
5672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_p16 (poly16_t __a)
5673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vdup_nv4hi ((__builtin_neon_hi) __a);
5675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
5678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_s64 (int64_t __a)
5679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vdup_ndi ((__builtin_neon_di) __a);
5681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
5684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmov_n_u64 (uint64_t __a)
5685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vdup_ndi ((__builtin_neon_di) __a);
5687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
5690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_s8 (int8_t __a)
5691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vdup_nv16qi ((__builtin_neon_qi) __a);
5693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
5696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_s16 (int16_t __a)
5697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vdup_nv8hi ((__builtin_neon_hi) __a);
5699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
5702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_s32 (int32_t __a)
5703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vdup_nv4si ((__builtin_neon_si) __a);
5705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
5708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_f32 (float32_t __a)
5709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vdup_nv4sf ((__builtin_neon_sf) __a);
5711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
5714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_u8 (uint8_t __a)
5715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vdup_nv16qi ((__builtin_neon_qi) __a);
5717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
5720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_u16 (uint16_t __a)
5721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vdup_nv8hi ((__builtin_neon_hi) __a);
5723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
5726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_u32 (uint32_t __a)
5727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vdup_nv4si ((__builtin_neon_si) __a);
5729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
5732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_p8 (poly8_t __a)
5733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vdup_nv16qi ((__builtin_neon_qi) __a);
5735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
5738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_p16 (poly16_t __a)
5739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vdup_nv8hi ((__builtin_neon_hi) __a);
5741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
5744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_s64 (int64_t __a)
5745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vdup_nv2di ((__builtin_neon_di) __a);
5747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
5750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovq_n_u64 (uint64_t __a)
5751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vdup_nv2di ((__builtin_neon_di) __a);
5753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
5756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_s8 (int8x8_t __a, const int __b)
5757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vdup_lanev8qi (__a, __b);
5759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
5762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_s16 (int16x4_t __a, const int __b)
5763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vdup_lanev4hi (__a, __b);
5765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
5768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_s32 (int32x2_t __a, const int __b)
5769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vdup_lanev2si (__a, __b);
5771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
5774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_f32 (float32x2_t __a, const int __b)
5775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vdup_lanev2sf (__a, __b);
5777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
5780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_u8 (uint8x8_t __a, const int __b)
5781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vdup_lanev8qi ((int8x8_t) __a, __b);
5783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
5786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_u16 (uint16x4_t __a, const int __b)
5787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vdup_lanev4hi ((int16x4_t) __a, __b);
5789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
5792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_u32 (uint32x2_t __a, const int __b)
5793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vdup_lanev2si ((int32x2_t) __a, __b);
5795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
5798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_p8 (poly8x8_t __a, const int __b)
5799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vdup_lanev8qi ((int8x8_t) __a, __b);
5801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
5804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_p16 (poly16x4_t __a, const int __b)
5805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vdup_lanev4hi ((int16x4_t) __a, __b);
5807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
5810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
5811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_p64 (poly64x1_t __a, const int __b)
5812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vdup_lanedi (__a, __b);
5814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
5817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
5818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_s64 (int64x1_t __a, const int __b)
5819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vdup_lanedi (__a, __b);
5821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
5824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdup_lane_u64 (uint64x1_t __a, const int __b)
5825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vdup_lanedi ((int64x1_t) __a, __b);
5827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
5830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_s8 (int8x8_t __a, const int __b)
5831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vdup_lanev16qi (__a, __b);
5833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
5836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_s16 (int16x4_t __a, const int __b)
5837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vdup_lanev8hi (__a, __b);
5839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
5842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_s32 (int32x2_t __a, const int __b)
5843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vdup_lanev4si (__a, __b);
5845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
5848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_f32 (float32x2_t __a, const int __b)
5849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vdup_lanev4sf (__a, __b);
5851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
5854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_u8 (uint8x8_t __a, const int __b)
5855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vdup_lanev16qi ((int8x8_t) __a, __b);
5857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
5860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_u16 (uint16x4_t __a, const int __b)
5861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vdup_lanev8hi ((int16x4_t) __a, __b);
5863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
5866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_u32 (uint32x2_t __a, const int __b)
5867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vdup_lanev4si ((int32x2_t) __a, __b);
5869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
5872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_p8 (poly8x8_t __a, const int __b)
5873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vdup_lanev16qi ((int8x8_t) __a, __b);
5875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
5878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_p16 (poly16x4_t __a, const int __b)
5879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vdup_lanev8hi ((int16x4_t) __a, __b);
5881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
5884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
5885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_p64 (poly64x1_t __a, const int __b)
5886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vdup_lanev2di (__a, __b);
5888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
5891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
5892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_s64 (int64x1_t __a, const int __b)
5893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vdup_lanev2di (__a, __b);
5895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
5898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vdupq_lane_u64 (uint64x1_t __a, const int __b)
5899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vdup_lanev2di ((int64x1_t) __a, __b);
5901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
5904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
5905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_p64 (poly64x1_t __a, poly64x1_t __b)
5906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vcombinedi (__a, __b);
5908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
5911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
5912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_s8 (int8x8_t __a, int8x8_t __b)
5913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vcombinev8qi (__a, __b);
5915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
5918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_s16 (int16x4_t __a, int16x4_t __b)
5919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vcombinev4hi (__a, __b);
5921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
5924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_s32 (int32x2_t __a, int32x2_t __b)
5925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vcombinev2si (__a, __b);
5927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
5930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_s64 (int64x1_t __a, int64x1_t __b)
5931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vcombinedi (__a, __b);
5933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
5936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_f32 (float32x2_t __a, float32x2_t __b)
5937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vcombinev2sf (__a, __b);
5939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
5942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_u8 (uint8x8_t __a, uint8x8_t __b)
5943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vcombinev8qi ((int8x8_t) __a, (int8x8_t) __b);
5945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
5948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_u16 (uint16x4_t __a, uint16x4_t __b)
5949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vcombinev4hi ((int16x4_t) __a, (int16x4_t) __b);
5951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
5954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_u32 (uint32x2_t __a, uint32x2_t __b)
5955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcombinev2si ((int32x2_t) __a, (int32x2_t) __b);
5957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
5960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_u64 (uint64x1_t __a, uint64x1_t __b)
5961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vcombinedi ((int64x1_t) __a, (int64x1_t) __b);
5963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
5966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_p8 (poly8x8_t __a, poly8x8_t __b)
5967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vcombinev8qi ((int8x8_t) __a, (int8x8_t) __b);
5969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
5972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcombine_p16 (poly16x4_t __a, poly16x4_t __b)
5973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vcombinev4hi ((int16x4_t) __a, (int16x4_t) __b);
5975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5976:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5977:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
5978:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
5979:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_p64 (poly64x2_t __a)
5980:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5981:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vget_highv2di ((int64x2_t) __a);
5982:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5983:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5984:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
5985:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
5986:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_s8 (int8x16_t __a)
5987:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5988:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vget_highv16qi (__a);
5989:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5990:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5991:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
5992:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_s16 (int16x8_t __a)
5993:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
5994:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vget_highv8hi (__a);
5995:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
5996:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
5997:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
5998:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_s32 (int32x4_t __a)
5999:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6000:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vget_highv4si (__a);
6001:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6002:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6003:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
6004:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_s64 (int64x2_t __a)
6005:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6006:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vget_highv2di (__a);
6007:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6008:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6009:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6010:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_f32 (float32x4_t __a)
6011:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6012:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vget_highv4sf (__a);
6013:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6014:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6015:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6016:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_u8 (uint8x16_t __a)
6017:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6018:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vget_highv16qi ((int8x16_t) __a);
6019:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6020:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6021:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6022:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_u16 (uint16x8_t __a)
6023:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6024:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vget_highv8hi ((int16x8_t) __a);
6025:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6026:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6027:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6028:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_u32 (uint32x4_t __a)
6029:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6030:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vget_highv4si ((int32x4_t) __a);
6031:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6032:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6033:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
6034:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_u64 (uint64x2_t __a)
6035:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6036:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vget_highv2di ((int64x2_t) __a);
6037:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6038:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6039:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6040:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_p8 (poly8x16_t __a)
6041:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6042:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vget_highv16qi ((int8x16_t) __a);
6043:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6044:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6045:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
6046:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_high_p16 (poly16x8_t __a)
6047:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6048:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vget_highv8hi ((int16x8_t) __a);
6049:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6050:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6051:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6052:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_s8 (int8x16_t __a)
6053:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6054:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vget_lowv16qi (__a);
6055:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6056:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6057:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6058:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_s16 (int16x8_t __a)
6059:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6060:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vget_lowv8hi (__a);
6061:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6062:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6063:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6064:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_s32 (int32x4_t __a)
6065:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6066:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vget_lowv4si (__a);
6067:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6068:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6069:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6070:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_f32 (float32x4_t __a)
6071:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6072:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vget_lowv4sf (__a);
6073:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6074:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6075:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6076:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_u8 (uint8x16_t __a)
6077:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6078:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vget_lowv16qi ((int8x16_t) __a);
6079:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6080:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6081:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6082:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_u16 (uint16x8_t __a)
6083:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6084:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vget_lowv8hi ((int16x8_t) __a);
6085:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6086:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6087:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6088:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_u32 (uint32x4_t __a)
6089:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6090:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vget_lowv4si ((int32x4_t) __a);
6091:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6092:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6093:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6094:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_p8 (poly8x16_t __a)
6095:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6096:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vget_lowv16qi ((int8x16_t) __a);
6097:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6098:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6099:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
6100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_p16 (poly16x8_t __a)
6101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vget_lowv8hi ((int16x8_t) __a);
6103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
6106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
6107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_p64 (poly64x2_t __a)
6108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vget_lowv2di ((int64x2_t) __a);
6110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
6113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
6114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_s64 (int64x2_t __a)
6115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vget_lowv2di (__a);
6117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
6120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vget_low_u64 (uint64x2_t __a)
6121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vget_lowv2di ((int64x2_t) __a);
6123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_s32_f32 (float32x2_t __a)
6127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vcvtv2sf (__a, 1);
6129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_f32_s32 (int32x2_t __a)
6133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vcvtv2si (__a, 1);
6135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_f32_u32 (uint32x2_t __a)
6139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vcvtv2si ((int32x2_t) __a, 0);
6141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_u32_f32 (float32x2_t __a)
6145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcvtv2sf (__a, 0);
6147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvtq_s32_f32 (float32x4_t __a)
6151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vcvtv4sf (__a, 1);
6153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvtq_f32_s32 (int32x4_t __a)
6157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vcvtv4si (__a, 1);
6159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvtq_f32_u32 (uint32x4_t __a)
6163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vcvtv4si ((int32x4_t) __a, 0);
6165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvtq_u32_f32 (float32x4_t __a)
6169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcvtv4sf (__a, 0);
6171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if ((__ARM_FP & 0x2) != 0)
6174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float16x4_t __attribute__ ((__always_inline__))
6175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_f16_f32 (float32x4_t __a)
6176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float16x4_t)__builtin_neon_vcvtv4hfv4sf (__a);
6178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
6181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #if ((__ARM_FP & 0x2) != 0)
6182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_f32_f16 (float16x4_t __a)
6184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vcvtv4sfv4hf (__a);
6186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
6189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_n_s32_f32 (float32x2_t __a, const int __b)
6191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vcvt_nv2sf (__a, __b, 1);
6193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_n_f32_s32 (int32x2_t __a, const int __b)
6197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vcvt_nv2si (__a, __b, 1);
6199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_n_f32_u32 (uint32x2_t __a, const int __b)
6203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vcvt_nv2si ((int32x2_t) __a, __b, 0);
6205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvt_n_u32_f32 (float32x2_t __a, const int __b)
6209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vcvt_nv2sf (__a, __b, 0);
6211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvtq_n_s32_f32 (float32x4_t __a, const int __b)
6215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vcvt_nv4sf (__a, __b, 1);
6217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvtq_n_f32_s32 (int32x4_t __a, const int __b)
6221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vcvt_nv4si (__a, __b, 1);
6223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvtq_n_f32_u32 (uint32x4_t __a, const int __b)
6227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vcvt_nv4si ((int32x4_t) __a, __b, 0);
6229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vcvtq_n_u32_f32 (float32x4_t __a, const int __b)
6233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vcvt_nv4sf (__a, __b, 0);
6235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovn_s16 (int16x8_t __a)
6239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vmovnv8hi (__a, 1);
6241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovn_s32 (int32x4_t __a)
6245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmovnv4si (__a, 1);
6247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovn_s64 (int64x2_t __a)
6251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmovnv2di (__a, 1);
6253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovn_u16 (uint16x8_t __a)
6257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vmovnv8hi ((int16x8_t) __a, 0);
6259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovn_u32 (uint32x4_t __a)
6263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmovnv4si ((int32x4_t) __a, 0);
6265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovn_u64 (uint64x2_t __a)
6269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmovnv2di ((int64x2_t) __a, 0);
6271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovn_s16 (int16x8_t __a)
6275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vqmovnv8hi (__a, 1);
6277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovn_s32 (int32x4_t __a)
6281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqmovnv4si (__a, 1);
6283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovn_s64 (int64x2_t __a)
6287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqmovnv2di (__a, 1);
6289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovn_u16 (uint16x8_t __a)
6293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqmovnv8hi ((int16x8_t) __a, 0);
6295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovn_u32 (uint32x4_t __a)
6299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqmovnv4si ((int32x4_t) __a, 0);
6301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovn_u64 (uint64x2_t __a)
6305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqmovnv2di ((int64x2_t) __a, 0);
6307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovun_s16 (int16x8_t __a)
6311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vqmovunv8hi (__a, 1);
6313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovun_s32 (int32x4_t __a)
6317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vqmovunv4si (__a, 1);
6319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqmovun_s64 (int64x2_t __a)
6323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vqmovunv2di (__a, 1);
6325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovl_s8 (int8x8_t __a)
6329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmovlv8qi (__a, 1);
6331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovl_s16 (int16x4_t __a)
6335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmovlv4hi (__a, 1);
6337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovl_s32 (int32x2_t __a)
6341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmovlv2si (__a, 1);
6343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
6346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovl_u8 (uint8x8_t __a)
6347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmovlv8qi ((int8x8_t) __a, 0);
6349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovl_u16 (uint16x4_t __a)
6353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmovlv4hi ((int16x4_t) __a, 0);
6355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
6358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmovl_u32 (uint32x2_t __a)
6359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmovlv2si ((int32x2_t) __a, 0);
6361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl1_s8 (int8x8_t __a, int8x8_t __b)
6365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vtbl1v8qi (__a, __b);
6367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl1_u8 (uint8x8_t __a, uint8x8_t __b)
6371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtbl1v8qi ((int8x8_t) __a, (int8x8_t) __b);
6373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl1_p8 (poly8x8_t __a, uint8x8_t __b)
6377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vtbl1v8qi ((int8x8_t) __a, (int8x8_t) __b);
6379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl2_s8 (int8x8x2_t __a, int8x8_t __b)
6383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { int8x8x2_t __i; __builtin_neon_ti __o; } __au = { __a };
6385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vtbl2v8qi (__au.__o, __b);
6386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl2_u8 (uint8x8x2_t __a, uint8x8_t __b)
6390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { uint8x8x2_t __i; __builtin_neon_ti __o; } __au = { __a };
6392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtbl2v8qi (__au.__o, (int8x8_t) __b);
6393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl2_p8 (poly8x8x2_t __a, uint8x8_t __b)
6397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { poly8x8x2_t __i; __builtin_neon_ti __o; } __au = { __a };
6399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vtbl2v8qi (__au.__o, (int8x8_t) __b);
6400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl3_s8 (int8x8x3_t __a, int8x8_t __b)
6404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { int8x8x3_t __i; __builtin_neon_ei __o; } __au = { __a };
6406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vtbl3v8qi (__au.__o, __b);
6407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl3_u8 (uint8x8x3_t __a, uint8x8_t __b)
6411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { uint8x8x3_t __i; __builtin_neon_ei __o; } __au = { __a };
6413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtbl3v8qi (__au.__o, (int8x8_t) __b);
6414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl3_p8 (poly8x8x3_t __a, uint8x8_t __b)
6418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { poly8x8x3_t __i; __builtin_neon_ei __o; } __au = { __a };
6420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vtbl3v8qi (__au.__o, (int8x8_t) __b);
6421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl4_s8 (int8x8x4_t __a, int8x8_t __b)
6425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { int8x8x4_t __i; __builtin_neon_oi __o; } __au = { __a };
6427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vtbl4v8qi (__au.__o, __b);
6428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl4_u8 (uint8x8x4_t __a, uint8x8_t __b)
6432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { uint8x8x4_t __i; __builtin_neon_oi __o; } __au = { __a };
6434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtbl4v8qi (__au.__o, (int8x8_t) __b);
6435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbl4_p8 (poly8x8x4_t __a, uint8x8_t __b)
6439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { poly8x8x4_t __i; __builtin_neon_oi __o; } __au = { __a };
6441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vtbl4v8qi (__au.__o, (int8x8_t) __b);
6442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx1_s8 (int8x8_t __a, int8x8_t __b, int8x8_t __c)
6446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vtbx1v8qi (__a, __b, __c);
6448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx1_u8 (uint8x8_t __a, uint8x8_t __b, uint8x8_t __c)
6452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtbx1v8qi ((int8x8_t) __a, (int8x8_t) __b, (int8x8_t) __c);
6454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx1_p8 (poly8x8_t __a, poly8x8_t __b, uint8x8_t __c)
6458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vtbx1v8qi ((int8x8_t) __a, (int8x8_t) __b, (int8x8_t) __c);
6460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx2_s8 (int8x8_t __a, int8x8x2_t __b, int8x8_t __c)
6464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { int8x8x2_t __i; __builtin_neon_ti __o; } __bu = { __b };
6466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vtbx2v8qi (__a, __bu.__o, __c);
6467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx2_u8 (uint8x8_t __a, uint8x8x2_t __b, uint8x8_t __c)
6471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { uint8x8x2_t __i; __builtin_neon_ti __o; } __bu = { __b };
6473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtbx2v8qi ((int8x8_t) __a, __bu.__o, (int8x8_t) __c);
6474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx2_p8 (poly8x8_t __a, poly8x8x2_t __b, uint8x8_t __c)
6478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { poly8x8x2_t __i; __builtin_neon_ti __o; } __bu = { __b };
6480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vtbx2v8qi ((int8x8_t) __a, __bu.__o, (int8x8_t) __c);
6481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx3_s8 (int8x8_t __a, int8x8x3_t __b, int8x8_t __c)
6485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { int8x8x3_t __i; __builtin_neon_ei __o; } __bu = { __b };
6487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vtbx3v8qi (__a, __bu.__o, __c);
6488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx3_u8 (uint8x8_t __a, uint8x8x3_t __b, uint8x8_t __c)
6492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { uint8x8x3_t __i; __builtin_neon_ei __o; } __bu = { __b };
6494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtbx3v8qi ((int8x8_t) __a, __bu.__o, (int8x8_t) __c);
6495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx3_p8 (poly8x8_t __a, poly8x8x3_t __b, uint8x8_t __c)
6499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { poly8x8x3_t __i; __builtin_neon_ei __o; } __bu = { __b };
6501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vtbx3v8qi ((int8x8_t) __a, __bu.__o, (int8x8_t) __c);
6502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
6505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx4_s8 (int8x8_t __a, int8x8x4_t __b, int8x8_t __c)
6506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { int8x8x4_t __i; __builtin_neon_oi __o; } __bu = { __b };
6508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vtbx4v8qi (__a, __bu.__o, __c);
6509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
6512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx4_u8 (uint8x8_t __a, uint8x8x4_t __b, uint8x8_t __c)
6513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { uint8x8x4_t __i; __builtin_neon_oi __o; } __bu = { __b };
6515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vtbx4v8qi ((int8x8_t) __a, __bu.__o, (int8x8_t) __c);
6516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
6519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtbx4_p8 (poly8x8_t __a, poly8x8x4_t __b, uint8x8_t __c)
6520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   union { poly8x8x4_t __i; __builtin_neon_oi __o; } __bu = { __b };
6522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vtbx4v8qi ((int8x8_t) __a, __bu.__o, (int8x8_t) __c);
6523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_lane_s16 (int16x4_t __a, int16x4_t __b, const int __c)
6527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmul_lanev4hi (__a, __b, __c, 1);
6529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_lane_s32 (int32x2_t __a, int32x2_t __b, const int __c)
6533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmul_lanev2si (__a, __b, __c, 1);
6535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_lane_f32 (float32x2_t __a, float32x2_t __b, const int __c)
6539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmul_lanev2sf (__a, __b, __c, 3);
6541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_lane_u16 (uint16x4_t __a, uint16x4_t __b, const int __c)
6545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmul_lanev4hi ((int16x4_t) __a, (int16x4_t) __b, __c, 0);
6547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_lane_u32 (uint32x2_t __a, uint32x2_t __b, const int __c)
6551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmul_lanev2si ((int32x2_t) __a, (int32x2_t) __b, __c, 0);
6553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_lane_s16 (int16x8_t __a, int16x4_t __b, const int __c)
6557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmul_lanev8hi (__a, __b, __c, 1);
6559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_lane_s32 (int32x4_t __a, int32x2_t __b, const int __c)
6563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmul_lanev4si (__a, __b, __c, 1);
6565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_lane_f32 (float32x4_t __a, float32x2_t __b, const int __c)
6569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmul_lanev4sf (__a, __b, __c, 3);
6571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
6574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_lane_u16 (uint16x8_t __a, uint16x4_t __b, const int __c)
6575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmul_lanev8hi ((int16x8_t) __a, (int16x4_t) __b, __c, 0);
6577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_lane_u32 (uint32x4_t __a, uint32x2_t __b, const int __c)
6581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmul_lanev4si ((int32x4_t) __a, (int32x2_t) __b, __c, 0);
6583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_lane_s16 (int16x4_t __a, int16x4_t __b, int16x4_t __c, const int __d)
6587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmla_lanev4hi (__a, __b, __c, __d, 1);
6589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_lane_s32 (int32x2_t __a, int32x2_t __b, int32x2_t __c, const int __d)
6593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmla_lanev2si (__a, __b, __c, __d, 1);
6595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_lane_f32 (float32x2_t __a, float32x2_t __b, float32x2_t __c, const int __d)
6599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmla_lanev2sf (__a, __b, __c, __d, 3);
6601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_lane_u16 (uint16x4_t __a, uint16x4_t __b, uint16x4_t __c, const int __d)
6605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmla_lanev4hi ((int16x4_t) __a, (int16x4_t) __b, (int16x4_t) __
6607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_lane_u32 (uint32x2_t __a, uint32x2_t __b, uint32x2_t __c, const int __d)
6611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmla_lanev2si ((int32x2_t) __a, (int32x2_t) __b, (int32x2_t) __
6613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_lane_s16 (int16x8_t __a, int16x8_t __b, int16x4_t __c, const int __d)
6617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmla_lanev8hi (__a, __b, __c, __d, 1);
6619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_lane_s32 (int32x4_t __a, int32x4_t __b, int32x2_t __c, const int __d)
6623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmla_lanev4si (__a, __b, __c, __d, 1);
6625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_lane_f32 (float32x4_t __a, float32x4_t __b, float32x2_t __c, const int __d)
6629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmla_lanev4sf (__a, __b, __c, __d, 3);
6631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
6634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_lane_u16 (uint16x8_t __a, uint16x8_t __b, uint16x4_t __c, const int __d)
6635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmla_lanev8hi ((int16x8_t) __a, (int16x8_t) __b, (int16x4_t) __
6637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_lane_u32 (uint32x4_t __a, uint32x4_t __b, uint32x2_t __c, const int __d)
6641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmla_lanev4si ((int32x4_t) __a, (int32x4_t) __b, (int32x2_t) __
6643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_lane_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c, const int __d)
6647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmlal_lanev4hi (__a, __b, __c, __d, 1);
6649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_lane_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c, const int __d)
6653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmlal_lanev2si (__a, __b, __c, __d, 1);
6655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_lane_u16 (uint32x4_t __a, uint16x4_t __b, uint16x4_t __c, const int __d)
6659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmlal_lanev4hi ((int32x4_t) __a, (int16x4_t) __b, (int16x4_t) _
6661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
6664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_lane_u32 (uint64x2_t __a, uint32x2_t __b, uint32x2_t __c, const int __d)
6665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmlal_lanev2si ((int64x2_t) __a, (int32x2_t) __b, (int32x2_t) _
6667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlal_lane_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c, const int __d)
6671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmlal_lanev4hi (__a, __b, __c, __d, 1);
6673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlal_lane_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c, const int __d)
6677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmlal_lanev2si (__a, __b, __c, __d, 1);
6679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_lane_s16 (int16x4_t __a, int16x4_t __b, int16x4_t __c, const int __d)
6683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmls_lanev4hi (__a, __b, __c, __d, 1);
6685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_lane_s32 (int32x2_t __a, int32x2_t __b, int32x2_t __c, const int __d)
6689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmls_lanev2si (__a, __b, __c, __d, 1);
6691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_lane_f32 (float32x2_t __a, float32x2_t __b, float32x2_t __c, const int __d)
6695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmls_lanev2sf (__a, __b, __c, __d, 3);
6697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_lane_u16 (uint16x4_t __a, uint16x4_t __b, uint16x4_t __c, const int __d)
6701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmls_lanev4hi ((int16x4_t) __a, (int16x4_t) __b, (int16x4_t) __
6703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_lane_u32 (uint32x2_t __a, uint32x2_t __b, uint32x2_t __c, const int __d)
6707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmls_lanev2si ((int32x2_t) __a, (int32x2_t) __b, (int32x2_t) __
6709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_lane_s16 (int16x8_t __a, int16x8_t __b, int16x4_t __c, const int __d)
6713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmls_lanev8hi (__a, __b, __c, __d, 1);
6715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_lane_s32 (int32x4_t __a, int32x4_t __b, int32x2_t __c, const int __d)
6719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmls_lanev4si (__a, __b, __c, __d, 1);
6721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_lane_f32 (float32x4_t __a, float32x4_t __b, float32x2_t __c, const int __d)
6725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmls_lanev4sf (__a, __b, __c, __d, 3);
6727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
6730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_lane_u16 (uint16x8_t __a, uint16x8_t __b, uint16x4_t __c, const int __d)
6731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmls_lanev8hi ((int16x8_t) __a, (int16x8_t) __b, (int16x4_t) __
6733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_lane_u32 (uint32x4_t __a, uint32x4_t __b, uint32x2_t __c, const int __d)
6737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmls_lanev4si ((int32x4_t) __a, (int32x4_t) __b, (int32x2_t) __
6739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_lane_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c, const int __d)
6743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmlsl_lanev4hi (__a, __b, __c, __d, 1);
6745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_lane_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c, const int __d)
6749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmlsl_lanev2si (__a, __b, __c, __d, 1);
6751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_lane_u16 (uint32x4_t __a, uint16x4_t __b, uint16x4_t __c, const int __d)
6755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmlsl_lanev4hi ((int32x4_t) __a, (int16x4_t) __b, (int16x4_t) _
6757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
6760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_lane_u32 (uint64x2_t __a, uint32x2_t __b, uint32x2_t __c, const int __d)
6761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmlsl_lanev2si ((int64x2_t) __a, (int32x2_t) __b, (int32x2_t) _
6763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlsl_lane_s16 (int32x4_t __a, int16x4_t __b, int16x4_t __c, const int __d)
6767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmlsl_lanev4hi (__a, __b, __c, __d, 1);
6769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlsl_lane_s32 (int64x2_t __a, int32x2_t __b, int32x2_t __c, const int __d)
6773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmlsl_lanev2si (__a, __b, __c, __d, 1);
6775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_lane_s16 (int16x4_t __a, int16x4_t __b, const int __c)
6779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmull_lanev4hi (__a, __b, __c, 1);
6781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_lane_s32 (int32x2_t __a, int32x2_t __b, const int __c)
6785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmull_lanev2si (__a, __b, __c, 1);
6787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_lane_u16 (uint16x4_t __a, uint16x4_t __b, const int __c)
6791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmull_lanev4hi ((int16x4_t) __a, (int16x4_t) __b, __c, 0);
6793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
6796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_lane_u32 (uint32x2_t __a, uint32x2_t __b, const int __c)
6797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmull_lanev2si ((int32x2_t) __a, (int32x2_t) __b, __c, 0);
6799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmull_lane_s16 (int16x4_t __a, int16x4_t __b, const int __c)
6803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmull_lanev4hi (__a, __b, __c, 1);
6805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmull_lane_s32 (int32x2_t __a, int32x2_t __b, const int __c)
6809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmull_lanev2si (__a, __b, __c, 1);
6811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulhq_lane_s16 (int16x8_t __a, int16x4_t __b, const int __c)
6815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqdmulh_lanev8hi (__a, __b, __c, 1);
6817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulhq_lane_s32 (int32x4_t __a, int32x2_t __b, const int __c)
6821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmulh_lanev4si (__a, __b, __c, 1);
6823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulh_lane_s16 (int16x4_t __a, int16x4_t __b, const int __c)
6827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqdmulh_lanev4hi (__a, __b, __c, 1);
6829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulh_lane_s32 (int32x2_t __a, int32x2_t __b, const int __c)
6833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqdmulh_lanev2si (__a, __b, __c, 1);
6835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulhq_lane_s16 (int16x8_t __a, int16x4_t __b, const int __c)
6839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqdmulh_lanev8hi (__a, __b, __c, 5);
6841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulhq_lane_s32 (int32x4_t __a, int32x2_t __b, const int __c)
6845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmulh_lanev4si (__a, __b, __c, 5);
6847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulh_lane_s16 (int16x4_t __a, int16x4_t __b, const int __c)
6851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqdmulh_lanev4hi (__a, __b, __c, 5);
6853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulh_lane_s32 (int32x2_t __a, int32x2_t __b, const int __c)
6857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqdmulh_lanev2si (__a, __b, __c, 5);
6859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_n_s16 (int16x4_t __a, int16_t __b)
6863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmul_nv4hi (__a, (__builtin_neon_hi) __b, 1);
6865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_n_s32 (int32x2_t __a, int32_t __b)
6869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmul_nv2si (__a, (__builtin_neon_si) __b, 1);
6871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
6874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_n_f32 (float32x2_t __a, float32_t __b)
6875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmul_nv2sf (__a, (__builtin_neon_sf) __b, 3);
6877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
6880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_n_u16 (uint16x4_t __a, uint16_t __b)
6881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmul_nv4hi ((int16x4_t) __a, (__builtin_neon_hi) __b, 0);
6883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
6886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmul_n_u32 (uint32x2_t __a, uint32_t __b)
6887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmul_nv2si ((int32x2_t) __a, (__builtin_neon_si) __b, 0);
6889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_n_s16 (int16x8_t __a, int16_t __b)
6893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmul_nv8hi (__a, (__builtin_neon_hi) __b, 1);
6895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_n_s32 (int32x4_t __a, int32_t __b)
6899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmul_nv4si (__a, (__builtin_neon_si) __b, 1);
6901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
6904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_n_f32 (float32x4_t __a, float32_t __b)
6905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmul_nv4sf (__a, (__builtin_neon_sf) __b, 3);
6907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
6910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_n_u16 (uint16x8_t __a, uint16_t __b)
6911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmul_nv8hi ((int16x8_t) __a, (__builtin_neon_hi) __b, 0);
6913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmulq_n_u32 (uint32x4_t __a, uint32_t __b)
6917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmul_nv4si ((int32x4_t) __a, (__builtin_neon_si) __b, 0);
6919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_n_s16 (int16x4_t __a, int16_t __b)
6923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmull_nv4hi (__a, (__builtin_neon_hi) __b, 1);
6925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_n_s32 (int32x2_t __a, int32_t __b)
6929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmull_nv2si (__a, (__builtin_neon_si) __b, 1);
6931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
6934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_n_u16 (uint16x4_t __a, uint16_t __b)
6935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmull_nv4hi ((int16x4_t) __a, (__builtin_neon_hi) __b, 0);
6937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
6940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmull_n_u32 (uint32x2_t __a, uint32_t __b)
6941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmull_nv2si ((int32x2_t) __a, (__builtin_neon_si) __b, 0);
6943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmull_n_s16 (int16x4_t __a, int16_t __b)
6947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmull_nv4hi (__a, (__builtin_neon_hi) __b, 1);
6949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
6952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmull_n_s32 (int32x2_t __a, int32_t __b)
6953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmull_nv2si (__a, (__builtin_neon_si) __b, 1);
6955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulhq_n_s16 (int16x8_t __a, int16_t __b)
6959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqdmulh_nv8hi (__a, (__builtin_neon_hi) __b, 1);
6961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulhq_n_s32 (int32x4_t __a, int32_t __b)
6965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmulh_nv4si (__a, (__builtin_neon_si) __b, 1);
6967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulh_n_s16 (int16x4_t __a, int16_t __b)
6971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqdmulh_nv4hi (__a, (__builtin_neon_hi) __b, 1);
6973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
6976:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmulh_n_s32 (int32x2_t __a, int32_t __b)
6977:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6978:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqdmulh_nv2si (__a, (__builtin_neon_si) __b, 1);
6979:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6980:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6981:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
6982:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulhq_n_s16 (int16x8_t __a, int16_t __b)
6983:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6984:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vqdmulh_nv8hi (__a, (__builtin_neon_hi) __b, 5);
6985:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6986:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6987:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
6988:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulhq_n_s32 (int32x4_t __a, int32_t __b)
6989:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6990:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmulh_nv4si (__a, (__builtin_neon_si) __b, 5);
6991:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6992:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6993:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
6994:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulh_n_s16 (int16x4_t __a, int16_t __b)
6995:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
6996:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vqdmulh_nv4hi (__a, (__builtin_neon_hi) __b, 5);
6997:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
6998:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
6999:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
7000:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqrdmulh_n_s32 (int32x2_t __a, int32_t __b)
7001:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7002:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vqdmulh_nv2si (__a, (__builtin_neon_si) __b, 5);
7003:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7004:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7005:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
7006:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_n_s16 (int16x4_t __a, int16x4_t __b, int16_t __c)
7007:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7008:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmla_nv4hi (__a, __b, (__builtin_neon_hi) __c, 1);
7009:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7010:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7011:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
7012:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_n_s32 (int32x2_t __a, int32x2_t __b, int32_t __c)
7013:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7014:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmla_nv2si (__a, __b, (__builtin_neon_si) __c, 1);
7015:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7016:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7017:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
7018:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_n_f32 (float32x2_t __a, float32x2_t __b, float32_t __c)
7019:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7020:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmla_nv2sf (__a, __b, (__builtin_neon_sf) __c, 3);
7021:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7022:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7023:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
7024:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_n_u16 (uint16x4_t __a, uint16x4_t __b, uint16_t __c)
7025:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7026:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmla_nv4hi ((int16x4_t) __a, (int16x4_t) __b, (__builtin_neon_h
7027:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7028:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7029:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
7030:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmla_n_u32 (uint32x2_t __a, uint32x2_t __b, uint32_t __c)
7031:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7032:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmla_nv2si ((int32x2_t) __a, (int32x2_t) __b, (__builtin_neon_s
7033:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7034:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7035:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
7036:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_n_s16 (int16x8_t __a, int16x8_t __b, int16_t __c)
7037:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7038:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmla_nv8hi (__a, __b, (__builtin_neon_hi) __c, 1);
7039:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7040:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7041:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7042:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_n_s32 (int32x4_t __a, int32x4_t __b, int32_t __c)
7043:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7044:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmla_nv4si (__a, __b, (__builtin_neon_si) __c, 1);
7045:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7046:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7047:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
7048:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_n_f32 (float32x4_t __a, float32x4_t __b, float32_t __c)
7049:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7050:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmla_nv4sf (__a, __b, (__builtin_neon_sf) __c, 3);
7051:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7052:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7053:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
7054:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_n_u16 (uint16x8_t __a, uint16x8_t __b, uint16_t __c)
7055:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7056:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmla_nv8hi ((int16x8_t) __a, (int16x8_t) __b, (__builtin_neon_h
7057:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7058:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7059:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
7060:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlaq_n_u32 (uint32x4_t __a, uint32x4_t __b, uint32_t __c)
7061:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7062:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmla_nv4si ((int32x4_t) __a, (int32x4_t) __b, (__builtin_neon_s
7063:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7064:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7065:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7066:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_n_s16 (int32x4_t __a, int16x4_t __b, int16_t __c)
7067:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7068:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmlal_nv4hi (__a, __b, (__builtin_neon_hi) __c, 1);
7069:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7070:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7071:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
7072:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_n_s32 (int64x2_t __a, int32x2_t __b, int32_t __c)
7073:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7074:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmlal_nv2si (__a, __b, (__builtin_neon_si) __c, 1);
7075:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7076:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7077:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
7078:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_n_u16 (uint32x4_t __a, uint16x4_t __b, uint16_t __c)
7079:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7080:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmlal_nv4hi ((int32x4_t) __a, (int16x4_t) __b, (__builtin_neon_
7081:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7082:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7083:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
7084:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlal_n_u32 (uint64x2_t __a, uint32x2_t __b, uint32_t __c)
7085:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7086:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmlal_nv2si ((int64x2_t) __a, (int32x2_t) __b, (__builtin_neon_
7087:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7088:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7089:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7090:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlal_n_s16 (int32x4_t __a, int16x4_t __b, int16_t __c)
7091:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7092:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmlal_nv4hi (__a, __b, (__builtin_neon_hi) __c, 1);
7093:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7094:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7095:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
7096:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlal_n_s32 (int64x2_t __a, int32x2_t __b, int32_t __c)
7097:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7098:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmlal_nv2si (__a, __b, (__builtin_neon_si) __c, 1);
7099:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
7102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_n_s16 (int16x4_t __a, int16x4_t __b, int16_t __c)
7103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vmls_nv4hi (__a, __b, (__builtin_neon_hi) __c, 1);
7105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
7108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_n_s32 (int32x2_t __a, int32x2_t __b, int32_t __c)
7109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vmls_nv2si (__a, __b, (__builtin_neon_si) __c, 1);
7111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
7114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_n_f32 (float32x2_t __a, float32x2_t __b, float32_t __c)
7115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vmls_nv2sf (__a, __b, (__builtin_neon_sf) __c, 3);
7117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
7120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_n_u16 (uint16x4_t __a, uint16x4_t __b, uint16_t __c)
7121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vmls_nv4hi ((int16x4_t) __a, (int16x4_t) __b, (__builtin_neon_h
7123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
7126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmls_n_u32 (uint32x2_t __a, uint32x2_t __b, uint32_t __c)
7127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vmls_nv2si ((int32x2_t) __a, (int32x2_t) __b, (__builtin_neon_s
7129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
7132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_n_s16 (int16x8_t __a, int16x8_t __b, int16_t __c)
7133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vmls_nv8hi (__a, __b, (__builtin_neon_hi) __c, 1);
7135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_n_s32 (int32x4_t __a, int32x4_t __b, int32_t __c)
7139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmls_nv4si (__a, __b, (__builtin_neon_si) __c, 1);
7141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
7144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_n_f32 (float32x4_t __a, float32x4_t __b, float32_t __c)
7145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vmls_nv4sf (__a, __b, (__builtin_neon_sf) __c, 3);
7147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
7150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_n_u16 (uint16x8_t __a, uint16x8_t __b, uint16_t __c)
7151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vmls_nv8hi ((int16x8_t) __a, (int16x8_t) __b, (__builtin_neon_h
7153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
7156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsq_n_u32 (uint32x4_t __a, uint32x4_t __b, uint32_t __c)
7157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmls_nv4si ((int32x4_t) __a, (int32x4_t) __b, (__builtin_neon_s
7159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_n_s16 (int32x4_t __a, int16x4_t __b, int16_t __c)
7163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vmlsl_nv4hi (__a, __b, (__builtin_neon_hi) __c, 1);
7165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
7168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_n_s32 (int64x2_t __a, int32x2_t __b, int32_t __c)
7169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vmlsl_nv2si (__a, __b, (__builtin_neon_si) __c, 1);
7171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
7174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_n_u16 (uint32x4_t __a, uint16x4_t __b, uint16_t __c)
7175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vmlsl_nv4hi ((int32x4_t) __a, (int16x4_t) __b, (__builtin_neon_
7177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
7180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vmlsl_n_u32 (uint64x2_t __a, uint32x2_t __b, uint32_t __c)
7181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vmlsl_nv2si ((int64x2_t) __a, (int32x2_t) __b, (__builtin_neon_
7183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlsl_n_s16 (int32x4_t __a, int16x4_t __b, int16_t __c)
7187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vqdmlsl_nv4hi (__a, __b, (__builtin_neon_hi) __c, 1);
7189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
7192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vqdmlsl_n_s32 (int64x2_t __a, int32x2_t __b, int32_t __c)
7193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vqdmlsl_nv2si (__a, __b, (__builtin_neon_si) __c, 1);
7195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
7198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
7199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_p64 (poly64x1_t __a, poly64x1_t __b, const int __c)
7200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vextdi (__a, __b, __c);
7202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
7206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_s8 (int8x8_t __a, int8x8_t __b, const int __c)
7207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vextv8qi (__a, __b, __c);
7209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
7212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_s16 (int16x4_t __a, int16x4_t __b, const int __c)
7213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vextv4hi (__a, __b, __c);
7215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
7218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_s32 (int32x2_t __a, int32x2_t __b, const int __c)
7219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vextv2si (__a, __b, __c);
7221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
7224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_s64 (int64x1_t __a, int64x1_t __b, const int __c)
7225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vextdi (__a, __b, __c);
7227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
7230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_f32 (float32x2_t __a, float32x2_t __b, const int __c)
7231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vextv2sf (__a, __b, __c);
7233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
7236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_u8 (uint8x8_t __a, uint8x8_t __b, const int __c)
7237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vextv8qi ((int8x8_t) __a, (int8x8_t) __b, __c);
7239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
7242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_u16 (uint16x4_t __a, uint16x4_t __b, const int __c)
7243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vextv4hi ((int16x4_t) __a, (int16x4_t) __b, __c);
7245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
7248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_u32 (uint32x2_t __a, uint32x2_t __b, const int __c)
7249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vextv2si ((int32x2_t) __a, (int32x2_t) __b, __c);
7251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
7254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_u64 (uint64x1_t __a, uint64x1_t __b, const int __c)
7255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vextdi ((int64x1_t) __a, (int64x1_t) __b, __c);
7257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
7260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_p8 (poly8x8_t __a, poly8x8_t __b, const int __c)
7261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vextv8qi ((int8x8_t) __a, (int8x8_t) __b, __c);
7263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
7266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vext_p16 (poly16x4_t __a, poly16x4_t __b, const int __c)
7267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vextv4hi ((int16x4_t) __a, (int16x4_t) __b, __c);
7269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
7272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
7273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_p64 (poly64x2_t __a, poly64x2_t __b, const int __c)
7274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vextv2di ((int64x2_t) __a, (int64x2_t) __b, __c);
7276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
7280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_s8 (int8x16_t __a, int8x16_t __b, const int __c)
7281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vextv16qi (__a, __b, __c);
7283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
7286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_s16 (int16x8_t __a, int16x8_t __b, const int __c)
7287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vextv8hi (__a, __b, __c);
7289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_s32 (int32x4_t __a, int32x4_t __b, const int __c)
7293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vextv4si (__a, __b, __c);
7295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
7298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_s64 (int64x2_t __a, int64x2_t __b, const int __c)
7299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vextv2di (__a, __b, __c);
7301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
7304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_f32 (float32x4_t __a, float32x4_t __b, const int __c)
7305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vextv4sf (__a, __b, __c);
7307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
7310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_u8 (uint8x16_t __a, uint8x16_t __b, const int __c)
7311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vextv16qi ((int8x16_t) __a, (int8x16_t) __b, __c);
7313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
7316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_u16 (uint16x8_t __a, uint16x8_t __b, const int __c)
7317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vextv8hi ((int16x8_t) __a, (int16x8_t) __b, __c);
7319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
7322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_u32 (uint32x4_t __a, uint32x4_t __b, const int __c)
7323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vextv4si ((int32x4_t) __a, (int32x4_t) __b, __c);
7325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
7328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_u64 (uint64x2_t __a, uint64x2_t __b, const int __c)
7329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vextv2di ((int64x2_t) __a, (int64x2_t) __b, __c);
7331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
7334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_p8 (poly8x16_t __a, poly8x16_t __b, const int __c)
7335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vextv16qi ((int8x16_t) __a, (int8x16_t) __b, __c);
7337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
7340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vextq_p16 (poly16x8_t __a, poly16x8_t __b, const int __c)
7341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vextv8hi ((int16x8_t) __a, (int16x8_t) __b, __c);
7343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
7346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_s8 (int8x8_t __a)
7347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 7, 6, 5, 4, 3, 2, 1, 0 });
7349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
7352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_s16 (int16x4_t __a)
7353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t) __builtin_shuffle (__a, (uint16x4_t) { 3, 2, 1, 0 });
7355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
7358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_s32 (int32x2_t __a)
7359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t) __builtin_shuffle (__a, (uint32x2_t) { 1, 0 });
7361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
7364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_f32 (float32x2_t __a)
7365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t) __builtin_shuffle (__a, (uint32x2_t) { 1, 0 });
7367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
7370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_u8 (uint8x8_t __a)
7371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 7, 6, 5, 4, 3, 2, 1, 0 });
7373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
7376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_u16 (uint16x4_t __a)
7377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t) __builtin_shuffle (__a, (uint16x4_t) { 3, 2, 1, 0 });
7379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
7382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_u32 (uint32x2_t __a)
7383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t) __builtin_shuffle (__a, (uint32x2_t) { 1, 0 });
7385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
7388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_p8 (poly8x8_t __a)
7389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 7, 6, 5, 4, 3, 2, 1, 0 });
7391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
7394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64_p16 (poly16x4_t __a)
7395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t) __builtin_shuffle (__a, (uint16x4_t) { 3, 2, 1, 0 });
7397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
7400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_s8 (int8x16_t __a)
7401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12,
7403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
7406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_s16 (int16x8_t __a)
7407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t) __builtin_shuffle (__a, (uint16x8_t) { 3, 2, 1, 0, 7, 6, 5, 4 });
7409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_s32 (int32x4_t __a)
7413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t) __builtin_shuffle (__a, (uint32x4_t) { 1, 0, 3, 2 });
7415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
7418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_f32 (float32x4_t __a)
7419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t) __builtin_shuffle (__a, (uint32x4_t) { 1, 0, 3, 2 });
7421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
7424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_u8 (uint8x16_t __a)
7425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12
7427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
7430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_u16 (uint16x8_t __a)
7431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t) __builtin_shuffle (__a, (uint16x8_t) { 3, 2, 1, 0, 7, 6, 5, 4 });
7433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
7436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_u32 (uint32x4_t __a)
7437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t) __builtin_shuffle (__a, (uint32x4_t) { 1, 0, 3, 2 });
7439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
7442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_p8 (poly8x16_t __a)
7443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12
7445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
7448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev64q_p16 (poly16x8_t __a)
7449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t) __builtin_shuffle (__a, (uint16x8_t) { 3, 2, 1, 0, 7, 6, 5, 4 });
7451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
7454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32_s8 (int8x8_t __a)
7455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 3, 2, 1, 0, 7, 6, 5, 4 });
7457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
7460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32_s16 (int16x4_t __a)
7461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t) __builtin_shuffle (__a, (uint16x4_t) { 1, 0, 3, 2 });
7463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
7466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32_u8 (uint8x8_t __a)
7467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 3, 2, 1, 0, 7, 6, 5, 4 });
7469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
7472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32_u16 (uint16x4_t __a)
7473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t) __builtin_shuffle (__a, (uint16x4_t) { 1, 0, 3, 2 });
7475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
7478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32_p8 (poly8x8_t __a)
7479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 3, 2, 1, 0, 7, 6, 5, 4 });
7481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
7484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32_p16 (poly16x4_t __a)
7485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t) __builtin_shuffle (__a, (uint16x4_t) { 1, 0, 3, 2 });
7487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
7490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32q_s8 (int8x16_t __a)
7491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 1
7493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
7496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32q_s16 (int16x8_t __a)
7497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t) __builtin_shuffle (__a, (uint16x8_t) { 1, 0, 3, 2, 5, 4, 7, 6 });
7499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
7502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32q_u8 (uint8x16_t __a)
7503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 
7505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
7508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32q_u16 (uint16x8_t __a)
7509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t) __builtin_shuffle (__a, (uint16x8_t) { 1, 0, 3, 2, 5, 4, 7, 6 });
7511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
7514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32q_p8 (poly8x16_t __a)
7515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 
7517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
7520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev32q_p16 (poly16x8_t __a)
7521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t) __builtin_shuffle (__a, (uint16x8_t) { 1, 0, 3, 2, 5, 4, 7, 6 });
7523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
7526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev16_s8 (int8x8_t __a)
7527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 1, 0, 3, 2, 5, 4, 7, 6 });
7529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
7532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev16_u8 (uint8x8_t __a)
7533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 1, 0, 3, 2, 5, 4, 7, 6 });
7535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
7538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev16_p8 (poly8x8_t __a)
7539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t) __builtin_shuffle (__a, (uint8x8_t) { 1, 0, 3, 2, 5, 4, 7, 6 });
7541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
7544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev16q_s8 (int8x16_t __a)
7545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 1
7547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
7550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev16q_u8 (uint8x16_t __a)
7551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 
7553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
7556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vrev16q_p8 (poly8x16_t __a)
7557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t) __builtin_shuffle (__a, (uint8x16_t) { 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 
7559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
7562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
7563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_p64 (uint64x1_t __a, poly64x1_t __b, poly64x1_t __c)
7564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vbsldi ((int64x1_t) __a, __b, __c);
7566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
7570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_s8 (uint8x8_t __a, int8x8_t __b, int8x8_t __c)
7571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vbslv8qi ((int8x8_t) __a, __b, __c);
7573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
7576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_s16 (uint16x4_t __a, int16x4_t __b, int16x4_t __c)
7577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vbslv4hi ((int16x4_t) __a, __b, __c);
7579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
7582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_s32 (uint32x2_t __a, int32x2_t __b, int32x2_t __c)
7583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vbslv2si ((int32x2_t) __a, __b, __c);
7585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
7588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_s64 (uint64x1_t __a, int64x1_t __b, int64x1_t __c)
7589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vbsldi ((int64x1_t) __a, __b, __c);
7591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
7594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_f32 (uint32x2_t __a, float32x2_t __b, float32x2_t __c)
7595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vbslv2sf ((int32x2_t) __a, __b, __c);
7597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
7600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_u8 (uint8x8_t __a, uint8x8_t __b, uint8x8_t __c)
7601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vbslv8qi ((int8x8_t) __a, (int8x8_t) __b, (int8x8_t) __c);
7603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
7606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_u16 (uint16x4_t __a, uint16x4_t __b, uint16x4_t __c)
7607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vbslv4hi ((int16x4_t) __a, (int16x4_t) __b, (int16x4_t) __c);
7609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
7612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_u32 (uint32x2_t __a, uint32x2_t __b, uint32x2_t __c)
7613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vbslv2si ((int32x2_t) __a, (int32x2_t) __b, (int32x2_t) __c);
7615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
7618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_u64 (uint64x1_t __a, uint64x1_t __b, uint64x1_t __c)
7619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vbsldi ((int64x1_t) __a, (int64x1_t) __b, (int64x1_t) __c);
7621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
7624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_p8 (uint8x8_t __a, poly8x8_t __b, poly8x8_t __c)
7625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vbslv8qi ((int8x8_t) __a, (int8x8_t) __b, (int8x8_t) __c);
7627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
7630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbsl_p16 (uint16x4_t __a, poly16x4_t __b, poly16x4_t __c)
7631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vbslv4hi ((int16x4_t) __a, (int16x4_t) __b, (int16x4_t) __c);
7633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
7636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
7637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_p64 (uint64x2_t __a, poly64x2_t __b, poly64x2_t __c)
7638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vbslv2di ((int64x2_t) __a, (int64x2_t) __b, (int64x2_t) __c);
7640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
7644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_s8 (uint8x16_t __a, int8x16_t __b, int8x16_t __c)
7645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vbslv16qi ((int8x16_t) __a, __b, __c);
7647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
7650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_s16 (uint16x8_t __a, int16x8_t __b, int16x8_t __c)
7651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vbslv8hi ((int16x8_t) __a, __b, __c);
7653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
7656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_s32 (uint32x4_t __a, int32x4_t __b, int32x4_t __c)
7657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vbslv4si ((int32x4_t) __a, __b, __c);
7659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
7662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_s64 (uint64x2_t __a, int64x2_t __b, int64x2_t __c)
7663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vbslv2di ((int64x2_t) __a, __b, __c);
7665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
7668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_f32 (uint32x4_t __a, float32x4_t __b, float32x4_t __c)
7669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vbslv4sf ((int32x4_t) __a, __b, __c);
7671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
7674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_u8 (uint8x16_t __a, uint8x16_t __b, uint8x16_t __c)
7675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vbslv16qi ((int8x16_t) __a, (int8x16_t) __b, (int8x16_t) __c);
7677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
7680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_u16 (uint16x8_t __a, uint16x8_t __b, uint16x8_t __c)
7681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vbslv8hi ((int16x8_t) __a, (int16x8_t) __b, (int16x8_t) __c);
7683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
7686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_u32 (uint32x4_t __a, uint32x4_t __b, uint32x4_t __c)
7687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vbslv4si ((int32x4_t) __a, (int32x4_t) __b, (int32x4_t) __c);
7689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
7692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_u64 (uint64x2_t __a, uint64x2_t __b, uint64x2_t __c)
7693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vbslv2di ((int64x2_t) __a, (int64x2_t) __b, (int64x2_t) __c);
7695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
7698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_p8 (uint8x16_t __a, poly8x16_t __b, poly8x16_t __c)
7699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vbslv16qi ((int8x16_t) __a, (int8x16_t) __b, (int8x16_t) __c);
7701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
7704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vbslq_p16 (uint16x8_t __a, poly16x8_t __b, poly16x8_t __c)
7705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vbslv8hi ((int16x8_t) __a, (int16x8_t) __b, (int16x8_t) __c);
7707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** /* For big-endian, the shuffle masks for ZIP, UZP and TRN must be changed as
7710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    follows. (nelt = the number of elements within a vector.)
7711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    Firstly, a value of N within a mask, becomes (N ^ (nelt - 1)), as gcc vector
7713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    extension's indexing scheme is reversed *within each vector* (relative to the
7714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    neon intrinsics view), but without changing which of the two vectors.
7715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    Secondly, the elements within each mask are reversed, as the mask is itself a
7717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    vector, and will itself be loaded in reverse order (again, relative to the
7718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****    neon intrinsics view, i.e. that would result from a "vld1" instruction).  */
7719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8x2_t __attribute__ ((__always_inline__))
7721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_s8 (int8x8_t __a, int8x8_t __b)
7722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x8x2_t __rv;
7724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
7726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 1, 11, 3, 13, 5, 15, 7 });
7727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
7728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 10, 2, 12, 4, 14, 6 });
7729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
7731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 2, 10, 4, 12, 6, 14 });
7732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
7733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 9, 3, 11, 5, 13, 7, 15 });
7734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4x2_t __attribute__ ((__always_inline__))
7739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_s16 (int16x4_t __a, int16x4_t __b)
7740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x4x2_t __rv;
7742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 5, 1, 7, 3 });
7744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 0, 6, 2 });
7745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 4, 2, 6 });
7747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 1, 5, 3, 7 });
7748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8x2_t __attribute__ ((__always_inline__))
7753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_u8 (uint8x8_t __a, uint8x8_t __b)
7754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x8x2_t __rv;
7756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
7758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 1, 11, 3, 13, 5, 15, 7 });
7759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
7760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 10, 2, 12, 4, 14, 6 });
7761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
7763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 2, 10, 4, 12, 6, 14 });
7764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
7765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 9, 3, 11, 5, 13, 7, 15 });
7766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4x2_t __attribute__ ((__always_inline__))
7771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_u16 (uint16x4_t __a, uint16x4_t __b)
7772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x4x2_t __rv;
7774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 5, 1, 7, 3 });
7776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 0, 6, 2 });
7777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 4, 2, 6 });
7779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 1, 5, 3, 7 });
7780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8x2_t __attribute__ ((__always_inline__))
7785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_p8 (poly8x8_t __a, poly8x8_t __b)
7786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x8x2_t __rv;
7788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
7790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 1, 11, 3, 13, 5, 15, 7 });
7791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
7792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 10, 2, 12, 4, 14, 6 });
7793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
7795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 2, 10, 4, 12, 6, 14 });
7796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
7797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 9, 3, 11, 5, 13, 7, 15 });
7798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4x2_t __attribute__ ((__always_inline__))
7803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_p16 (poly16x4_t __a, poly16x4_t __b)
7804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x4x2_t __rv;
7806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 5, 1, 7, 3 });
7808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 0, 6, 2 });
7809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 4, 2, 6 });
7811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 1, 5, 3, 7 });
7812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2x2_t __attribute__ ((__always_inline__))
7817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_s32 (int32x2_t __a, int32x2_t __b)
7818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x2x2_t __rv;
7820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
7822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
7823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
7825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
7826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2x2_t __attribute__ ((__always_inline__))
7831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_f32 (float32x2_t __a, float32x2_t __b)
7832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x2x2_t __rv;
7834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
7836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
7837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
7839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
7840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2x2_t __attribute__ ((__always_inline__))
7845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrn_u32 (uint32x2_t __a, uint32x2_t __b)
7846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x2x2_t __rv;
7848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
7850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
7851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
7853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
7854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16x2_t __attribute__ ((__always_inline__))
7859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_s8 (int8x16_t __a, int8x16_t __b)
7860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x16x2_t __rv;
7862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
7864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 17, 1, 19, 3, 21, 5, 23, 7, 25, 9, 27, 11, 29, 13, 31, 15 });
7865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
7866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 0, 18, 2, 20, 4, 22, 6, 24, 8, 26, 10, 28, 12, 30, 14 });
7867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
7869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 16, 2, 18, 4, 20, 6, 22, 8, 24, 10, 26, 12, 28, 14, 30 });
7870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
7871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 17, 3, 19, 5, 21, 7, 23, 9, 25, 11, 27, 13, 29, 15, 31 });
7872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8x2_t __attribute__ ((__always_inline__))
7877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_s16 (int16x8_t __a, int16x8_t __b)
7878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x8x2_t __rv;
7880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
7882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 1, 11, 3, 13, 5, 15, 7 });
7883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
7884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 10, 2, 12, 4, 14, 6 });
7885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
7887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 2, 10, 4, 12, 6, 14 });
7888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
7889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 9, 3, 11, 5, 13, 7, 15 });
7890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4x2_t __attribute__ ((__always_inline__))
7895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_s32 (int32x4_t __a, int32x4_t __b)
7896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x4x2_t __rv;
7898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 5, 1, 7, 3 });
7900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 0, 6, 2 });
7901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 4, 2, 6 });
7903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 1, 5, 3, 7 });
7904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4x2_t __attribute__ ((__always_inline__))
7909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_f32 (float32x4_t __a, float32x4_t __b)
7910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x4x2_t __rv;
7912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 5, 1, 7, 3 });
7914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 0, 6, 2 });
7915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 4, 2, 6 });
7917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 1, 5, 3, 7 });
7918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16x2_t __attribute__ ((__always_inline__))
7923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_u8 (uint8x16_t __a, uint8x16_t __b)
7924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x16x2_t __rv;
7926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
7928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 17, 1, 19, 3, 21, 5, 23, 7, 25, 9, 27, 11, 29, 13, 31, 15 });
7929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
7930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 0, 18, 2, 20, 4, 22, 6, 24, 8, 26, 10, 28, 12, 30, 14 });
7931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
7933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 16, 2, 18, 4, 20, 6, 22, 8, 24, 10, 26, 12, 28, 14, 30 });
7934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
7935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 17, 3, 19, 5, 21, 7, 23, 9, 25, 11, 27, 13, 29, 15, 31 });
7936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8x2_t __attribute__ ((__always_inline__))
7941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_u16 (uint16x8_t __a, uint16x8_t __b)
7942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x8x2_t __rv;
7944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
7946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 1, 11, 3, 13, 5, 15, 7 });
7947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
7948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 10, 2, 12, 4, 14, 6 });
7949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
7951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 2, 10, 4, 12, 6, 14 });
7952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
7953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 9, 3, 11, 5, 13, 7, 15 });
7954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4x2_t __attribute__ ((__always_inline__))
7959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_u32 (uint32x4_t __a, uint32x4_t __b)
7960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x4x2_t __rv;
7962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 5, 1, 7, 3 });
7964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 0, 6, 2 });
7965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 4, 2, 6 });
7967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 1, 5, 3, 7 });
7968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16x2_t __attribute__ ((__always_inline__))
7973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_p8 (poly8x16_t __a, poly8x16_t __b)
7974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x16x2_t __rv;
7976:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7977:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
7978:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 17, 1, 19, 3, 21, 5, 23, 7, 25, 9, 27, 11, 29, 13, 31, 15 });
7979:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
7980:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 0, 18, 2, 20, 4, 22, 6, 24, 8, 26, 10, 28, 12, 30, 14 });
7981:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
7982:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
7983:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 16, 2, 18, 4, 20, 6, 22, 8, 24, 10, 26, 12, 28, 14, 30 });
7984:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
7985:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 17, 3, 19, 5, 21, 7, 23, 9, 25, 11, 27, 13, 29, 15, 31 });
7986:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
7987:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
7988:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
7989:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
7990:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8x2_t __attribute__ ((__always_inline__))
7991:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vtrnq_p16 (poly16x8_t __a, poly16x8_t __b)
7992:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
7993:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x8x2_t __rv;
7994:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
7995:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
7996:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 1, 11, 3, 13, 5, 15, 7 });
7997:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
7998:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 10, 2, 12, 4, 14, 6 });
7999:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8000:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8001:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 2, 10, 4, 12, 6, 14 });
8002:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8003:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 9, 3, 11, 5, 13, 7, 15 });
8004:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8005:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8006:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8007:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8008:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8x2_t __attribute__ ((__always_inline__))
8009:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_s8 (int8x8_t __a, int8x8_t __b)
8010:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8011:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x8x2_t __rv;
8012:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8013:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8014:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 12, 4, 13, 5, 14, 6, 15, 7 });
8015:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8016:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 9, 1, 10, 2, 11, 3 });
8017:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8018:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8019:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 1, 9, 2, 10, 3, 11 });
8020:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8021:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 4, 12, 5, 13, 6, 14, 7, 15 });
8022:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8023:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8024:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8025:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8026:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4x2_t __attribute__ ((__always_inline__))
8027:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_s16 (int16x4_t __a, int16x4_t __b)
8028:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8029:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x4x2_t __rv;
8030:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8031:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 6, 2, 7, 3 });
8032:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 0, 5, 1 });
8033:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8034:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 4, 1, 5 });
8035:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 2, 6, 3, 7 });
8036:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8037:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8038:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8039:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8040:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8x2_t __attribute__ ((__always_inline__))
8041:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_u8 (uint8x8_t __a, uint8x8_t __b)
8042:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8043:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x8x2_t __rv;
8044:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8045:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8046:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 12, 4, 13, 5, 14, 6, 15, 7 });
8047:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8048:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 9, 1, 10, 2, 11, 3 });
8049:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8050:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8051:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 1, 9, 2, 10, 3, 11 });
8052:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8053:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 4, 12, 5, 13, 6, 14, 7, 15 });
8054:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8055:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8056:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8057:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8058:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4x2_t __attribute__ ((__always_inline__))
8059:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_u16 (uint16x4_t __a, uint16x4_t __b)
8060:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8061:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x4x2_t __rv;
8062:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8063:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 6, 2, 7, 3 });
8064:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 0, 5, 1 });
8065:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8066:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 4, 1, 5 });
8067:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 2, 6, 3, 7 });
8068:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8069:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8070:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8071:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8072:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8x2_t __attribute__ ((__always_inline__))
8073:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_p8 (poly8x8_t __a, poly8x8_t __b)
8074:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8075:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x8x2_t __rv;
8076:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8077:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8078:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 12, 4, 13, 5, 14, 6, 15, 7 });
8079:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8080:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 9, 1, 10, 2, 11, 3 });
8081:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8082:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8083:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 1, 9, 2, 10, 3, 11 });
8084:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8085:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 4, 12, 5, 13, 6, 14, 7, 15 });
8086:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8087:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8088:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8089:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8090:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4x2_t __attribute__ ((__always_inline__))
8091:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_p16 (poly16x4_t __a, poly16x4_t __b)
8092:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8093:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x4x2_t __rv;
8094:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8095:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 6, 2, 7, 3 });
8096:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 0, 5, 1 });
8097:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8098:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 4, 1, 5 });
8099:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 2, 6, 3, 7 });
8100:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8101:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8102:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8103:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8104:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2x2_t __attribute__ ((__always_inline__))
8105:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_s32 (int32x2_t __a, int32x2_t __b)
8106:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8107:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x2x2_t __rv;
8108:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8109:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
8110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
8111:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8112:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
8113:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
8114:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8115:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8116:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8117:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8118:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2x2_t __attribute__ ((__always_inline__))
8119:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_f32 (float32x2_t __a, float32x2_t __b)
8120:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8121:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x2x2_t __rv;
8122:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8123:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
8124:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
8125:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8126:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
8127:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
8128:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8129:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8130:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8131:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8132:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2x2_t __attribute__ ((__always_inline__))
8133:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzip_u32 (uint32x2_t __a, uint32x2_t __b)
8134:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8135:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x2x2_t __rv;
8136:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8137:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
8138:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
8139:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8140:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
8141:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
8142:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8143:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8144:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8145:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8146:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16x2_t __attribute__ ((__always_inline__))
8147:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_s8 (int8x16_t __a, int8x16_t __b)
8148:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8149:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x16x2_t __rv;
8150:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8151:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 24, 8, 25, 9, 26, 10, 27, 11, 28, 12, 29, 13, 30, 14, 31, 15 });
8153:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8154:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 0, 17, 1, 18, 2, 19, 3, 20, 4, 21, 5, 22, 6, 23, 7 });
8155:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8156:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8157:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 16, 1, 17, 2, 18, 3, 19, 4, 20, 5, 21, 6, 22, 7, 23 });
8158:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8159:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 24, 9, 25, 10, 26, 11, 27, 12, 28, 13, 29, 14, 30, 15, 31 });
8160:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8161:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8162:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8163:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8164:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8x2_t __attribute__ ((__always_inline__))
8165:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_s16 (int16x8_t __a, int16x8_t __b)
8166:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8167:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x8x2_t __rv;
8168:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8169:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8170:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 12, 4, 13, 5, 14, 6, 15, 7 });
8171:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8172:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 9, 1, 10, 2, 11, 3 });
8173:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8174:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8175:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 1, 9, 2, 10, 3, 11 });
8176:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8177:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 4, 12, 5, 13, 6, 14, 7, 15 });
8178:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8179:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8180:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8181:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8182:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4x2_t __attribute__ ((__always_inline__))
8183:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_s32 (int32x4_t __a, int32x4_t __b)
8184:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8185:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x4x2_t __rv;
8186:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8187:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 6, 2, 7, 3 });
8188:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 0, 5, 1 });
8189:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8190:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 4, 1, 5 });
8191:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 2, 6, 3, 7 });
8192:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8193:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8194:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8195:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8196:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4x2_t __attribute__ ((__always_inline__))
8197:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_f32 (float32x4_t __a, float32x4_t __b)
8198:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8199:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x4x2_t __rv;
8200:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8201:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 6, 2, 7, 3 });
8202:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 0, 5, 1 });
8203:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8204:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 4, 1, 5 });
8205:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 2, 6, 3, 7 });
8206:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8207:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8208:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8209:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8210:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16x2_t __attribute__ ((__always_inline__))
8211:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_u8 (uint8x16_t __a, uint8x16_t __b)
8212:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8213:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x16x2_t __rv;
8214:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8215:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8216:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 24, 8, 25, 9, 26, 10, 27, 11, 28, 12, 29, 13, 30, 14, 31, 15 });
8217:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8218:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 0, 17, 1, 18, 2, 19, 3, 20, 4, 21, 5, 22, 6, 23, 7 });
8219:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8220:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8221:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 16, 1, 17, 2, 18, 3, 19, 4, 20, 5, 21, 6, 22, 7, 23 });
8222:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8223:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 24, 9, 25, 10, 26, 11, 27, 12, 28, 13, 29, 14, 30, 15, 31 });
8224:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8225:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8226:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8227:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8228:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8x2_t __attribute__ ((__always_inline__))
8229:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_u16 (uint16x8_t __a, uint16x8_t __b)
8230:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8231:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x8x2_t __rv;
8232:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8233:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8234:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 12, 4, 13, 5, 14, 6, 15, 7 });
8235:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8236:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 9, 1, 10, 2, 11, 3 });
8237:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8238:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8239:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 1, 9, 2, 10, 3, 11 });
8240:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8241:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 4, 12, 5, 13, 6, 14, 7, 15 });
8242:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8243:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8244:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8245:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8246:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4x2_t __attribute__ ((__always_inline__))
8247:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_u32 (uint32x4_t __a, uint32x4_t __b)
8248:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8249:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x4x2_t __rv;
8250:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8251:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 6, 2, 7, 3 });
8252:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 0, 5, 1 });
8253:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8254:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 4, 1, 5 });
8255:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 2, 6, 3, 7 });
8256:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8257:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8258:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8259:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8260:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16x2_t __attribute__ ((__always_inline__))
8261:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_p8 (poly8x16_t __a, poly8x16_t __b)
8262:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8263:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x16x2_t __rv;
8264:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8265:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8266:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 24, 8, 25, 9, 26, 10, 27, 11, 28, 12, 29, 13, 30, 14, 31, 15 });
8267:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8268:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 0, 17, 1, 18, 2, 19, 3, 20, 4, 21, 5, 22, 6, 23, 7 });
8269:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8270:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8271:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 16, 1, 17, 2, 18, 3, 19, 4, 20, 5, 21, 6, 22, 7, 23 });
8272:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8273:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 24, 9, 25, 10, 26, 11, 27, 12, 28, 13, 29, 14, 30, 15, 31 });
8274:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8275:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8276:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8277:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8278:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8x2_t __attribute__ ((__always_inline__))
8279:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vzipq_p16 (poly16x8_t __a, poly16x8_t __b)
8280:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8281:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x8x2_t __rv;
8282:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8283:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8284:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 12, 4, 13, 5, 14, 6, 15, 7 });
8285:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8286:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 0, 9, 1, 10, 2, 11, 3 });
8287:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8288:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8289:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 8, 1, 9, 2, 10, 3, 11 });
8290:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8291:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 4, 12, 5, 13, 6, 14, 7, 15 });
8292:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8293:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8294:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8295:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8296:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8x2_t __attribute__ ((__always_inline__))
8297:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_s8 (int8x8_t __a, int8x8_t __b)
8298:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8299:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x8x2_t __rv;
8300:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8301:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8302:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 11, 13, 15, 1, 3, 5, 7 });
8303:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8304:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 10, 12, 14, 0, 2, 4, 6 });
8305:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8306:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8307:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14 });
8308:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8309:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15 });
8310:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8311:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8312:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8313:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8314:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4x2_t __attribute__ ((__always_inline__))
8315:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_s16 (int16x4_t __a, int16x4_t __b)
8316:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8317:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x4x2_t __rv;
8318:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8319:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 5, 7, 1, 3 });
8320:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 6, 0, 2 });
8321:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8322:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 2, 4, 6 });
8323:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 1, 3, 5, 7 });
8324:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8325:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8326:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8327:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8328:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2x2_t __attribute__ ((__always_inline__))
8329:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_s32 (int32x2_t __a, int32x2_t __b)
8330:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8331:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x2x2_t __rv;
8332:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8333:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
8334:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
8335:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8336:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
8337:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
8338:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8339:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8340:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8341:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8342:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2x2_t __attribute__ ((__always_inline__))
8343:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_f32 (float32x2_t __a, float32x2_t __b)
8344:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8345:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x2x2_t __rv;
8346:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8347:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
8348:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
8349:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8350:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
8351:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
8352:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8353:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8354:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8355:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8356:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8x2_t __attribute__ ((__always_inline__))
8357:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_u8 (uint8x8_t __a, uint8x8_t __b)
8358:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8359:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x8x2_t __rv;
8360:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8361:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8362:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 11, 13, 15, 1, 3, 5, 7 });
8363:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8364:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 10, 12, 14, 0, 2, 4, 6 });
8365:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8366:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8367:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14 });
8368:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8369:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15 });
8370:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8371:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8372:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8373:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8374:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4x2_t __attribute__ ((__always_inline__))
8375:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_u16 (uint16x4_t __a, uint16x4_t __b)
8376:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8377:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x4x2_t __rv;
8378:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8379:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 5, 7, 1, 3 });
8380:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 6, 0, 2 });
8381:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8382:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 2, 4, 6 });
8383:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 1, 3, 5, 7 });
8384:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8385:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8386:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8387:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8388:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2x2_t __attribute__ ((__always_inline__))
8389:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_u32 (uint32x2_t __a, uint32x2_t __b)
8390:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8391:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x2x2_t __rv;
8392:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8393:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 3, 1 });
8394:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 2, 0 });
8395:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8396:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x2_t) { 0, 2 });
8397:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x2_t) { 1, 3 });
8398:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8399:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8400:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8401:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8402:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8x2_t __attribute__ ((__always_inline__))
8403:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_p8 (poly8x8_t __a, poly8x8_t __b)
8404:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8405:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x8x2_t __rv;
8406:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8407:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8408:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 11, 13, 15, 1, 3, 5, 7 });
8409:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8410:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 10, 12, 14, 0, 2, 4, 6 });
8411:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8412:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x8_t)
8413:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14 });
8414:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x8_t)
8415:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15 });
8416:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8417:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8418:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8419:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8420:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4x2_t __attribute__ ((__always_inline__))
8421:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzp_p16 (poly16x4_t __a, poly16x4_t __b)
8422:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8423:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x4x2_t __rv;
8424:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8425:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 5, 7, 1, 3 });
8426:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 4, 6, 0, 2 });
8427:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8428:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x4_t) { 0, 2, 4, 6 });
8429:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x4_t) { 1, 3, 5, 7 });
8430:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8431:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8432:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8433:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8434:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16x2_t __attribute__ ((__always_inline__))
8435:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_s8 (int8x16_t __a, int8x16_t __b)
8436:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8437:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int8x16x2_t __rv;
8438:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8439:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8440:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 17, 19, 21, 23, 25, 27, 29, 31, 1, 3, 5, 7, 9, 11, 13, 15 });
8441:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8442:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 18, 20, 22, 24, 26, 28, 30, 0, 2, 4, 6, 8, 10, 12, 14 });
8443:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8444:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8445:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 });
8446:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8447:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31 });
8448:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8449:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8450:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8451:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8452:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8x2_t __attribute__ ((__always_inline__))
8453:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_s16 (int16x8_t __a, int16x8_t __b)
8454:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8455:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int16x8x2_t __rv;
8456:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8457:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8458:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 11, 13, 15, 1, 3, 5, 7 });
8459:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8460:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 10, 12, 14, 0, 2, 4, 6 });
8461:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8462:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8463:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14 });
8464:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8465:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15 });
8466:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8467:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8468:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8469:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8470:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4x2_t __attribute__ ((__always_inline__))
8471:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_s32 (int32x4_t __a, int32x4_t __b)
8472:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8473:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   int32x4x2_t __rv;
8474:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8475:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 5, 7, 1, 3 });
8476:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 6, 0, 2 });
8477:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8478:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 2, 4, 6 });
8479:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 1, 3, 5, 7 });
8480:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8481:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8482:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8483:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8484:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4x2_t __attribute__ ((__always_inline__))
8485:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_f32 (float32x4_t __a, float32x4_t __b)
8486:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8487:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   float32x4x2_t __rv;
8488:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8489:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 5, 7, 1, 3 });
8490:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 6, 0, 2 });
8491:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8492:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 2, 4, 6 });
8493:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 1, 3, 5, 7 });
8494:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8495:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8497:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8498:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16x2_t __attribute__ ((__always_inline__))
8499:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_u8 (uint8x16_t __a, uint8x16_t __b)
8500:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8501:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint8x16x2_t __rv;
8502:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8503:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8504:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 17, 19, 21, 23, 25, 27, 29, 31, 1, 3, 5, 7, 9, 11, 13, 15 });
8505:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8506:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 18, 20, 22, 24, 26, 28, 30, 0, 2, 4, 6, 8, 10, 12, 14 });
8507:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8508:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8509:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 });
8510:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8511:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31 });
8512:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8513:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8514:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8515:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8516:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8x2_t __attribute__ ((__always_inline__))
8517:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_u16 (uint16x8_t __a, uint16x8_t __b)
8518:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8519:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint16x8x2_t __rv;
8520:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8521:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8522:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 11, 13, 15, 1, 3, 5, 7 });
8523:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8524:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 10, 12, 14, 0, 2, 4, 6 });
8525:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8526:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8527:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14 });
8528:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8529:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15 });
8530:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8531:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8532:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8533:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8534:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4x2_t __attribute__ ((__always_inline__))
8535:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_u32 (uint32x4_t __a, uint32x4_t __b)
8536:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8537:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   uint32x4x2_t __rv;
8538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8539:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 5, 7, 1, 3 });
8540:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 4, 6, 0, 2 });
8541:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8542:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint32x4_t) { 0, 2, 4, 6 });
8543:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint32x4_t) { 1, 3, 5, 7 });
8544:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8545:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8546:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8547:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8548:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16x2_t __attribute__ ((__always_inline__))
8549:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_p8 (poly8x16_t __a, poly8x16_t __b)
8550:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8551:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly8x16x2_t __rv;
8552:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8553:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8554:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 17, 19, 21, 23, 25, 27, 29, 31, 1, 3, 5, 7, 9, 11, 13, 15 });
8555:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8556:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 16, 18, 20, 22, 24, 26, 28, 30, 0, 2, 4, 6, 8, 10, 12, 14 });
8557:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8558:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint8x16_t)
8559:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 });
8560:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint8x16_t)
8561:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31 });
8562:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8563:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8564:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8565:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8566:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8x2_t __attribute__ ((__always_inline__))
8567:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vuzpq_p16 (poly16x8_t __a, poly16x8_t __b)
8568:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8569:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   poly16x8x2_t __rv;
8570:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_BIG_ENDIAN
8571:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8572:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 9, 11, 13, 15, 1, 3, 5, 7 });
8573:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8574:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 8, 10, 12, 14, 0, 2, 4, 6 });
8575:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #else
8576:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[0] = __builtin_shuffle (__a, __b, (uint16x8_t)
8577:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 0, 2, 4, 6, 8, 10, 12, 14 });
8578:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   __rv.val[1] = __builtin_shuffle (__a, __b, (uint16x8_t)
8579:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****       { 1, 3, 5, 7, 9, 11, 13, 15 });
8580:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8581:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return __rv;
8582:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8583:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8584:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
8585:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
8586:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_p64 (const poly64_t * __a)
8587:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8588:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vld1di ((const __builtin_neon_di *) __a);
8589:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8590:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8591:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8592:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
8593:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_s8 (const int8_t * __a)
8594:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8595:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vld1v8qi ((const __builtin_neon_qi *) __a);
8596:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8597:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8598:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
8599:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_s16 (const int16_t * __a)
8600:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8601:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vld1v4hi ((const __builtin_neon_hi *) __a);
8602:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8603:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8604:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
8605:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_s32 (const int32_t * __a)
8606:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8607:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vld1v2si ((const __builtin_neon_si *) __a);
8608:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8609:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8610:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
8611:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_s64 (const int64_t * __a)
8612:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8613:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vld1di ((const __builtin_neon_di *) __a);
8614:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8615:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8616:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
8617:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_f32 (const float32_t * __a)
8618:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8619:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vld1v2sf ((const __builtin_neon_sf *) __a);
8620:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8621:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8622:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
8623:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_u8 (const uint8_t * __a)
8624:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8625:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vld1v8qi ((const __builtin_neon_qi *) __a);
8626:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8627:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8628:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
8629:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_u16 (const uint16_t * __a)
8630:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8631:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vld1v4hi ((const __builtin_neon_hi *) __a);
8632:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8633:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8634:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
8635:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_u32 (const uint32_t * __a)
8636:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8637:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vld1v2si ((const __builtin_neon_si *) __a);
8638:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8639:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8640:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
8641:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_u64 (const uint64_t * __a)
8642:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8643:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vld1di ((const __builtin_neon_di *) __a);
8644:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8645:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8646:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
8647:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_p8 (const poly8_t * __a)
8648:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8649:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vld1v8qi ((const __builtin_neon_qi *) __a);
8650:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8651:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8652:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
8653:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_p16 (const poly16_t * __a)
8654:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8655:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vld1v4hi ((const __builtin_neon_hi *) __a);
8656:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8657:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8658:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
8659:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
8660:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_p64 (const poly64_t * __a)
8661:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8662:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vld1v2di ((const __builtin_neon_di *) __a);
8663:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8664:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8665:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8666:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
8667:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_s8 (const int8_t * __a)
8668:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8669:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vld1v16qi ((const __builtin_neon_qi *) __a);
8670:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8671:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8672:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
8673:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_s16 (const int16_t * __a)
8674:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8675:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
8676:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8677:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8678:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
8679:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_s32 (const int32_t * __a)
8680:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8681:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vld1v4si ((const __builtin_neon_si *) __a);
8682:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8683:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8684:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
8685:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_s64 (const int64_t * __a)
8686:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8687:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vld1v2di ((const __builtin_neon_di *) __a);
8688:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8689:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8690:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
8691:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_f32 (const float32_t * __a)
8692:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vld1v4sf ((const __builtin_neon_sf *) __a);
8694:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8695:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8696:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
8697:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_u8 (const uint8_t * __a)
8698:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8699:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vld1v16qi ((const __builtin_neon_qi *) __a);
8700:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8701:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8702:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
8703:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_u16 (const uint16_t * __a)
8704:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8705:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
8706:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8707:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8708:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
8709:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_u32 (const uint32_t * __a)
8710:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8711:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vld1v4si ((const __builtin_neon_si *) __a);
8712:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8713:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8714:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
8715:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_u64 (const uint64_t * __a)
8716:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8717:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vld1v2di ((const __builtin_neon_di *) __a);
8718:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8719:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8720:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
8721:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_p8 (const poly8_t * __a)
8722:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8723:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vld1v16qi ((const __builtin_neon_qi *) __a);
8724:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8725:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8726:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
8727:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_p16 (const poly16_t * __a)
8728:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8729:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vld1v8hi ((const __builtin_neon_hi *) __a);
8730:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8731:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8732:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
8733:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_s8 (const int8_t * __a, int8x8_t __b, const int __c)
8734:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8735:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vld1_lanev8qi ((const __builtin_neon_qi *) __a, __b, __c);
8736:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8737:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8738:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
8739:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_s16 (const int16_t * __a, int16x4_t __b, const int __c)
8740:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8741:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vld1_lanev4hi ((const __builtin_neon_hi *) __a, __b, __c);
8742:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8743:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8744:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
8745:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_s32 (const int32_t * __a, int32x2_t __b, const int __c)
8746:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8747:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vld1_lanev2si ((const __builtin_neon_si *) __a, __b, __c);
8748:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8749:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8750:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
8751:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_f32 (const float32_t * __a, float32x2_t __b, const int __c)
8752:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8753:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vld1_lanev2sf ((const __builtin_neon_sf *) __a, __b, __c);
8754:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8755:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8756:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
8757:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_u8 (const uint8_t * __a, uint8x8_t __b, const int __c)
8758:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8759:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vld1_lanev8qi ((const __builtin_neon_qi *) __a, (int8x8_t) __b, 
8760:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8761:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8762:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
8763:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_u16 (const uint16_t * __a, uint16x4_t __b, const int __c)
8764:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8765:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vld1_lanev4hi ((const __builtin_neon_hi *) __a, (int16x4_t) __b
8766:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8767:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8768:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
8769:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_u32 (const uint32_t * __a, uint32x2_t __b, const int __c)
8770:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8771:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vld1_lanev2si ((const __builtin_neon_si *) __a, (int32x2_t) __b
8772:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8773:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8774:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
8775:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_p8 (const poly8_t * __a, poly8x8_t __b, const int __c)
8776:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8777:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vld1_lanev8qi ((const __builtin_neon_qi *) __a, (int8x8_t) __b, 
8778:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8779:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8780:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
8781:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_p16 (const poly16_t * __a, poly16x4_t __b, const int __c)
8782:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8783:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vld1_lanev4hi ((const __builtin_neon_hi *) __a, (int16x4_t) __b
8784:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8785:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8786:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
8787:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
8788:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_p64 (const poly64_t * __a, poly64x1_t __b, const int __c)
8789:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8790:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vld1_lanedi ((const __builtin_neon_di *) __a, __b, __c);
8791:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8792:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8793:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8794:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
8795:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_s64 (const int64_t * __a, int64x1_t __b, const int __c)
8796:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8797:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vld1_lanedi ((const __builtin_neon_di *) __a, __b, __c);
8798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8799:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8800:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
8801:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_lane_u64 (const uint64_t * __a, uint64x1_t __b, const int __c)
8802:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8803:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vld1_lanedi ((const __builtin_neon_di *) __a, (int64x1_t) __b, 
8804:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8805:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8806:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
8807:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_s8 (const int8_t * __a, int8x16_t __b, const int __c)
8808:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8809:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vld1_lanev16qi ((const __builtin_neon_qi *) __a, __b, __c);
8810:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8811:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8812:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
8813:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_s16 (const int16_t * __a, int16x8_t __b, const int __c)
8814:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8815:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vld1_lanev8hi ((const __builtin_neon_hi *) __a, __b, __c);
8816:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8817:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8818:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
8819:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_s32 (const int32_t * __a, int32x4_t __b, const int __c)
8820:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8821:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vld1_lanev4si ((const __builtin_neon_si *) __a, __b, __c);
8822:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8823:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8824:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
8825:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_f32 (const float32_t * __a, float32x4_t __b, const int __c)
8826:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8827:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vld1_lanev4sf ((const __builtin_neon_sf *) __a, __b, __c);
8828:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8829:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8830:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x16_t __attribute__ ((__always_inline__))
8831:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_u8 (const uint8_t * __a, uint8x16_t __b, const int __c)
8832:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8833:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x16_t)__builtin_neon_vld1_lanev16qi ((const __builtin_neon_qi *) __a, (int8x16_t) __
8834:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8835:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8836:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x8_t __attribute__ ((__always_inline__))
8837:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_u16 (const uint16_t * __a, uint16x8_t __b, const int __c)
8838:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8839:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x8_t)__builtin_neon_vld1_lanev8hi ((const __builtin_neon_hi *) __a, (int16x8_t) __b
8840:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8841:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8842:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x4_t __attribute__ ((__always_inline__))
8843:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_u32 (const uint32_t * __a, uint32x4_t __b, const int __c)
8844:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8845:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x4_t)__builtin_neon_vld1_lanev4si ((const __builtin_neon_si *) __a, (int32x4_t) __b
8846:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8847:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8848:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x16_t __attribute__ ((__always_inline__))
8849:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_p8 (const poly8_t * __a, poly8x16_t __b, const int __c)
8850:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8851:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x16_t)__builtin_neon_vld1_lanev16qi ((const __builtin_neon_qi *) __a, (int8x16_t) __
8852:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8853:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8854:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x8_t __attribute__ ((__always_inline__))
8855:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_p16 (const poly16_t * __a, poly16x8_t __b, const int __c)
8856:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8857:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x8_t)__builtin_neon_vld1_lanev8hi ((const __builtin_neon_hi *) __a, (int16x8_t) __b
8858:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8859:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8860:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
8861:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x2_t __attribute__ ((__always_inline__))
8862:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_p64 (const poly64_t * __a, poly64x2_t __b, const int __c)
8863:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8864:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x2_t)__builtin_neon_vld1_lanev2di ((const __builtin_neon_di *) __a, (int64x2_t) __b
8865:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8866:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8867:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8868:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x2_t __attribute__ ((__always_inline__))
8869:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_s64 (const int64_t * __a, int64x2_t __b, const int __c)
8870:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8871:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x2_t)__builtin_neon_vld1_lanev2di ((const __builtin_neon_di *) __a, __b, __c);
8872:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8873:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8874:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x2_t __attribute__ ((__always_inline__))
8875:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_lane_u64 (const uint64_t * __a, uint64x2_t __b, const int __c)
8876:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8877:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x2_t)__builtin_neon_vld1_lanev2di ((const __builtin_neon_di *) __a, (int64x2_t) __b
8878:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8879:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8880:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x8_t __attribute__ ((__always_inline__))
8881:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_s8 (const int8_t * __a)
8882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8883:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x8_t)__builtin_neon_vld1_dupv8qi ((const __builtin_neon_qi *) __a);
8884:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8885:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8886:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x4_t __attribute__ ((__always_inline__))
8887:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_s16 (const int16_t * __a)
8888:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8889:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x4_t)__builtin_neon_vld1_dupv4hi ((const __builtin_neon_hi *) __a);
8890:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8891:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8892:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x2_t __attribute__ ((__always_inline__))
8893:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_s32 (const int32_t * __a)
8894:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8895:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x2_t)__builtin_neon_vld1_dupv2si ((const __builtin_neon_si *) __a);
8896:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8897:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8898:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x2_t __attribute__ ((__always_inline__))
8899:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_f32 (const float32_t * __a)
8900:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8901:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x2_t)__builtin_neon_vld1_dupv2sf ((const __builtin_neon_sf *) __a);
8902:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8903:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8904:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint8x8_t __attribute__ ((__always_inline__))
8905:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_u8 (const uint8_t * __a)
8906:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8907:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint8x8_t)__builtin_neon_vld1_dupv8qi ((const __builtin_neon_qi *) __a);
8908:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8909:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8910:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint16x4_t __attribute__ ((__always_inline__))
8911:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_u16 (const uint16_t * __a)
8912:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8913:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint16x4_t)__builtin_neon_vld1_dupv4hi ((const __builtin_neon_hi *) __a);
8914:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8915:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8916:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint32x2_t __attribute__ ((__always_inline__))
8917:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_u32 (const uint32_t * __a)
8918:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8919:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint32x2_t)__builtin_neon_vld1_dupv2si ((const __builtin_neon_si *) __a);
8920:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8921:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8922:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly8x8_t __attribute__ ((__always_inline__))
8923:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_p8 (const poly8_t * __a)
8924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8925:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly8x8_t)__builtin_neon_vld1_dupv8qi ((const __builtin_neon_qi *) __a);
8926:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8927:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8928:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly16x4_t __attribute__ ((__always_inline__))
8929:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_p16 (const poly16_t * __a)
8930:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8931:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly16x4_t)__builtin_neon_vld1_dupv4hi ((const __builtin_neon_hi *) __a);
8932:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8933:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8934:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #ifdef __ARM_FEATURE_CRYPTO
8935:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline poly64x1_t __attribute__ ((__always_inline__))
8936:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_p64 (const poly64_t * __a)
8937:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8938:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (poly64x1_t)__builtin_neon_vld1_dupdi ((const __builtin_neon_di *) __a);
8939:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8940:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8941:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** #endif
8942:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int64x1_t __attribute__ ((__always_inline__))
8943:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_s64 (const int64_t * __a)
8944:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8945:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int64x1_t)__builtin_neon_vld1_dupdi ((const __builtin_neon_di *) __a);
8946:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8947:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8948:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline uint64x1_t __attribute__ ((__always_inline__))
8949:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1_dup_u64 (const uint64_t * __a)
8950:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8951:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (uint64x1_t)__builtin_neon_vld1_dupdi ((const __builtin_neon_di *) __a);
8952:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8953:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8954:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int8x16_t __attribute__ ((__always_inline__))
8955:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_dup_s8 (const int8_t * __a)
8956:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8957:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int8x16_t)__builtin_neon_vld1_dupv16qi ((const __builtin_neon_qi *) __a);
8958:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8959:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8960:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int16x8_t __attribute__ ((__always_inline__))
8961:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_dup_s16 (const int16_t * __a)
8962:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8963:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int16x8_t)__builtin_neon_vld1_dupv8hi ((const __builtin_neon_hi *) __a);
8964:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8965:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8966:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline int32x4_t __attribute__ ((__always_inline__))
8967:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_dup_s32 (const int32_t * __a)
8968:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8969:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (int32x4_t)__builtin_neon_vld1_dupv4si ((const __builtin_neon_si *) __a);
8970:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
8971:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** 
8972:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** __extension__ static __inline float32x4_t __attribute__ ((__always_inline__))
8973:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** vld1q_dup_f32 (const float32_t * __a)
8974:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** {
8975:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h ****   return (float32x4_t)__builtin_neon_vld1_dupv4sf ((const __builtin_neon_sf *) __a);
 217              		.loc 2 8975 0
 218 0054 07AA     		add	r2, sp, #28
 219              	.LBE67:
 220              	.LBE66:
 221              	.LBB69:
 222              	.LBB70:
 223 0056 06AB     		add	r3, sp, #24
 224              	.LVL12:
 225              	.LBE70:
 226              	.LBE69:
 227              	.LBB72:
 228              	.LBB68:
 229 0058 E2F9AF6C 		vld1.32	{d22[], d23[]}, [r2]
 230              	.LBE68:
 231              	.LBE72:
 232              	.LBB73:
 233              	.LBB74:
 234 005c 05AA     		add	r2, sp, #20
 235 005e E2F9AF4C 		vld1.32	{d20[], d21[]}, [r2]
 236              	.LBE74:
 237              	.LBE73:
 238              	.LBB75:
 239              	.LBB71:
 240 0062 E3F9AF2C 		vld1.32	{d18[], d19[]}, [r3]
 241              	.LVL13:
 242 0066 40F20003 		movw	r3, #:lower16:x
 243              	.LVL14:
 244 006a C0F20003 		movt	r3, #:upper16:x
 245              	.LVL15:
 246              	.L13:
 247              	.LBE71:
 248              	.LBE75:
 249              	.LBB76:
 250              	.LBB77:
8693:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 251              		.loc 2 8693 0 discriminator 3
 252 006e 63F98F0A 		vld1.32	{d16-d17}, [r3]
 253              	.LVL16:
 254 0072 1033     		adds	r3, r3, #16
 255              	.LVL17:
 256              	.LBE77:
 257              	.LBE76:
  84:main.c        ****       //     Can we prefetch here? Cache line size, data size
 258              		.loc 1 84 0 discriminator 3
 259 0074 5B45     		cmp	r3, fp
 260              	.LBB78:
 261              	.LBB79:
2882:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 262              		.loc 2 2882 0 discriminator 3
 263 0076 62EFE02F 		vmin.f32	q9, q9, q8
 264              	.LVL18:
 265              	.LBE79:
 266              	.LBE78:
 267              	.LBB80:
 268              	.LBB81:
2798:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 269              		.loc 2 2798 0 discriminator 3
 270 007a 46EFE06F 		vmax.f32	q11, q11, q8
 271              	.LVL19:
 272              	.LBE81:
 273              	.LBE80:
 274              	.LBB82:
 275              	.LBB83:
 538:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 276              		.loc 2 538 0 discriminator 3
 277 007e 44EFE04D 		vadd.f32	q10, q10, q8
 278              	.LVL20:
 279              	.LBE83:
 280              	.LBE82:
  84:main.c        ****       //     Can we prefetch here? Cache line size, data size
 281              		.loc 1 84 0 discriminator 3
 282 0082 F4D1     		bne	.L13
 283              	.LVL21:
 284              	.LBB84:
 285              	.LBB85:
3152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 286              		.loc 2 3152 0
 287 0084 63FFA22F 		vpmin.f32	d18, d19, d18
 288              	.LVL22:
 289              	.LBE85:
 290              	.LBE84:
 116:main.c        **** 
 291              		.loc 1 116 0
 292 0088 06AB     		add	r3, sp, #24
 293              	.LVL23:
 294              	.LBB86:
 295              	.LBB87:
3110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 296              		.loc 2 3110 0
 297 008a 47FFA61F 		vpmax.f32	d17, d23, d22
 298              	.LBE87:
 299              	.LBE86:
 140:main.c        ****     
 300              		.loc 1 140 0
 301 008e 0AA9     		add	r1, sp, #40
 302              	.LBB88:
 303              	.LBB89:
2924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 304              		.loc 2 2924 0
 305 0090 45FFA44D 		vpadd.f32	d20, d21, d20
 306              	.LVL24:
 307              	.LBE89:
 308              	.LBE88:
 140:main.c        ****     
 309              		.loc 1 140 0
 310 0094 0220     		movs	r0, #2
 311              	.LBB90:
 312              	.LBB91:
5496:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 313              		.loc 2 5496 0
 314 0096 C0EF1000 		vmov.f32	d16, #0.0  @ v2sf
 315              	.LVL25:
 316              	.LBE91:
 317              	.LBE90:
 318              	.LBB92:
 319              	.LBB93:
3152:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 320              		.loc 2 3152 0
 321 009a 62FFA22F 		vpmin.f32	d18, d18, d18
 322              	.LVL26:
 323              	.LBE93:
 324              	.LBE92:
 325              	.LBB94:
 326              	.LBB95:
3110:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 327              		.loc 2 3110 0
 328 009e 41FFA01F 		vpmax.f32	d17, d17, d16
 329              	.LBE95:
 330              	.LBE94:
 331              	.LBB96:
 332              	.LBB97:
2924:/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/arm_neon.h **** }
 333              		.loc 2 2924 0
 334 00a2 44FFA00D 		vpadd.f32	d16, d20, d16
 335              	.LBE97:
 336              	.LBE96:
 116:main.c        **** 
 337              		.loc 1 116 0
 338 00a6 C3F90F28 		vst1.32	{d18[0]}, [r3]
 339              	.LVL27:
 123:main.c        **** 
 340              		.loc 1 123 0
 341 00aa 07AB     		add	r3, sp, #28
 342              	.LVL28:
 343 00ac C3F90F18 		vst1.32	{d17[0]}, [r3]
 344              	.LVL29:
 130:main.c        **** 
 345              		.loc 1 130 0
 346 00b0 05AB     		add	r3, sp, #20
 347              	.LVL30:
 348 00b2 C3F90F08 		vst1.32	{d16[0]}, [r3]
 140:main.c        ****     
 349              		.loc 1 140 0
 350 00b6 FFF7FEFF 		bl	clock_gettime
 351              	.LVL31:
 352              		.loc 1 142 0
 353 00ba 089A     		ldr	r2, [sp, #32]
 354 00bc 0A9B     		ldr	r3, [sp, #40]
 355 00be 0B99     		ldr	r1, [sp, #44]
 356 00c0 9B1A     		subs	r3, r3, r2
 143:main.c        ****       end.tv_nsec - start.tv_nsec;
 357              		.loc 1 143 0
 358 00c2 099A     		ldr	r2, [sp, #36]
 142:main.c        ****       end.tv_nsec - start.tv_nsec;
 359              		.loc 1 142 0
 360 00c4 0AFB0313 		mla	r3, r10, r3, r1
 361              		.loc 1 143 0
 362 00c8 9B1A     		subs	r3, r3, r2
 363              	.LVL32:
 364 00ca 9D42     		cmp	r5, r3
 144:main.c        ****     //	  printf("%2d: %8lu ns\n", n, diff);
 145:main.c        ****     total += diff;
 365              		.loc 1 145 0
 366 00cc 1E44     		add	r6, r6, r3
 367              	.LVL33:
 368 00ce 28BF     		it	cs
 369 00d0 1D46     		movcs	r5, r3
 370              	.LVL34:
 371              	.LBE99:
  58:main.c        ****     sum_val = 0;
 372              		.loc 1 58 0
 373 00d2 013C     		subs	r4, r4, #1
 374              	.LVL35:
 375 00d4 B5D1     		bne	.L14
 146:main.c        ****     if (diff < min)
 147:main.c        ****       min = diff;
 148:main.c        ****   }
 149:main.c        ****   printf("Min: %f\t Max: %f\t Sum: %f\n", min_val, max_val, sum_val);
 376              		.loc 1 149 0
 377 00d6 DDED057A 		flds	s15, [sp, #20]
 378 00da 40F20000 		movw	r0, #:lower16:.LC1
 379 00de C0F20000 		movt	r0, #:upper16:.LC1
 380 00e2 DDED066A 		flds	s13, [sp, #24]
 381 00e6 F7EEE70A 		fcvtds	d16, s15
 382 00ea 9DED077A 		flds	s14, [sp, #28]
 383 00ee CDED020B 		fstd	d16, [sp, #8]
 384 00f2 F7EEC71A 		fcvtds	d17, s14
 385 00f6 F7EEE60A 		fcvtds	d16, s13
 386 00fa CDED001B 		fstd	d17, [sp]
 387 00fe 53EC302B 		fmrrd	r2, r3, d16
 388 0102 FFF7FEFF 		bl	printf
 389              	.LVL36:
 150:main.c        ****   printf("Average %10.3f us\n", ((float) total)/(N_POINTS*N_TESTS));
 390              		.loc 1 150 0
 391 0106 40F20000 		movw	r0, #:lower16:.LC2
 392 010a 07EE906A 		fmsr	s15, r6	@ int
 393 010e C0F20000 		movt	r0, #:upper16:.LC2
 394 0112 9FED107A 		flds	s14, .L18
 395 0116 F8EE677A 		fuitos	s15, s15
 396 011a 67EE877A 		fmuls	s15, s15, s14
 397 011e F7EEE70A 		fcvtds	d16, s15
 398 0122 53EC302B 		fmrrd	r2, r3, d16
 399 0126 FFF7FEFF 		bl	printf
 400              	.LVL37:
 151:main.c        ****   printf("Minimum %10.3f us\n", ((float)  min)/N_POINTS);
 401              		.loc 1 151 0
 402 012a 40F20000 		movw	r0, #:lower16:.LC3
 403 012e 07EE905A 		fmsr	s15, r5	@ int
 404 0132 C0F20000 		movt	r0, #:upper16:.LC3
 405 0136 9FED087A 		flds	s14, .L18+4
 406 013a F8EEE77A 		fsitos	s15, s15
 407 013e 67EE877A 		fmuls	s15, s15, s14
 408 0142 F7EEE70A 		fcvtds	d16, s15
 409 0146 53EC302B 		fmrrd	r2, r3, d16
 410 014a FFF7FEFF 		bl	printf
 411              	.LVL38:
 152:main.c        ****   exit(0);
 412              		.loc 1 152 0
 413 014e 2046     		mov	r0, r4
 414 0150 FFF7FEFF 		bl	exit
 415              	.LVL39:
 416              	.L19:
 417              		.align	2
 418              	.L18:
 419 0154 95BFD633 		.word	869711765
 420 0158 17B7D138 		.word	953267991
 421 015c 409C0000 		.word	x+40000
 422              		.cfi_endproc
 423              	.LFE1914:
 425              		.comm	x,40000,4
 426              		.section	.rodata.str1.4,"aMS",%progbits,1
 427              		.align	2
 428              	.LC0:
 429 0000 25662009 		.ascii	"%f \011\000"
 429      00
 430 0005 000000   		.space	3
 431              	.LC1:
 432 0008 4D696E3A 		.ascii	"Min: %f\011 Max: %f\011 Sum: %f\012\000"
 432      20256609 
 432      204D6178 
 432      3A202566 
 432      09205375 
 433 0023 00       		.space	1
 434              	.LC2:
 435 0024 41766572 		.ascii	"Average %10.3f us\012\000"
 435      61676520 
 435      2531302E 
 435      33662075 
 435      730A00
 436 0037 00       		.space	1
 437              	.LC3:
 438 0038 4D696E69 		.ascii	"Minimum %10.3f us\012\000"
 438      6D756D20 
 438      2531302E 
 438      33662075 
 438      730A00
 439 004b 00       		.text
 440              	.Letext0:
 441              		.file 3 "/usr/lib/gcc/arm-linux-gnueabihf/4.9/include/stddef.h"
 442              		.file 4 "/usr/include/arm-linux-gnueabihf/bits/types.h"
 443              		.file 5 "/usr/include/libio.h"
 444              		.file 6 "/usr/include/time.h"
 445              		.file 7 "/usr/include/stdio.h"
 446              		.file 8 "/usr/include/stdlib.h"
