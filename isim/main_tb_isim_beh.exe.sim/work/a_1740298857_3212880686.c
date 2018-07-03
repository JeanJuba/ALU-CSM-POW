/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Usuario/Desktop/ALU-CSM-POW/special_block.vhd";



static void work_a_1740298857_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned char t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (8 - 8);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (8 - 7);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 5166);
    t8 = 1;
    if (4U == 4U)
        goto LAB28;

LAB29:    t8 = 0;

LAB30:    if (t8 == 1)
        goto LAB25;

LAB26:    t18 = (t0 + 1192U);
    t19 = *((char **)t18);
    t12 = (8 - 3);
    t13 = (t12 * 1U);
    t17 = (0 + t13);
    t18 = (t19 + t17);
    t20 = (t0 + 5170);
    t16 = 1;
    if (4U == 4U)
        goto LAB34;

LAB35:    t16 = 0;

LAB36:    t7 = t16;

LAB27:    if (t7 != 0)
        goto LAB22;

LAB24:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (8 - 7);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 3232);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 4U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (8 - 3);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 3296);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 4U);
    xsi_driver_first_trans_fast_port(t9);

LAB23:
LAB3:    t1 = (t0 + 3152);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(47, ng0);
    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t11 = (8 - 7);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t9 = (t10 + t13);
    t14 = (t0 + 5142);
    t16 = 1;
    if (4U == 4U)
        goto LAB8;

LAB9:    t16 = 0;

LAB10:    if (t16 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (8 - 3);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 5154);
    t7 = 1;
    if (4U == 4U)
        goto LAB16;

LAB17:    t7 = 0;

LAB18:    if (t7 != 0)
        goto LAB14;

LAB15:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (8 - 7);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 3232);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 4U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = (8 - 3);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = (t0 + 3296);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 4U);
    xsi_driver_first_trans_fast_port(t9);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(48, ng0);
    t20 = (t0 + 5146);
    t22 = (t0 + 3232);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 4U);
    xsi_driver_first_trans_fast_port(t22);
    xsi_set_current_line(49, ng0);
    t1 = (t0 + 5150);
    t9 = (t0 + 3296);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 4U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB6;

LAB8:    t17 = 0;

LAB11:    if (t17 < 4U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t18 = (t9 + t17);
    t19 = (t14 + t17);
    if (*((unsigned char *)t18) != *((unsigned char *)t19))
        goto LAB9;

LAB13:    t17 = (t17 + 1);
    goto LAB11;

LAB14:    xsi_set_current_line(51, ng0);
    t18 = (t0 + 5158);
    t20 = (t0 + 3232);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t18, 4U);
    xsi_driver_first_trans_fast_port(t20);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 5162);
    t9 = (t0 + 3296);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 4U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB6;

LAB16:    t11 = 0;

LAB19:    if (t11 < 4U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t14 = (t1 + t11);
    t15 = (t9 + t11);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB17;

LAB21:    t11 = (t11 + 1);
    goto LAB19;

LAB22:    xsi_set_current_line(61, ng0);
    t24 = (t0 + 5174);
    t26 = (t0 + 3232);
    t28 = (t26 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t24, 4U);
    xsi_driver_first_trans_fast_port(t26);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 5178);
    t9 = (t0 + 3296);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t1, 4U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB23;

LAB25:    t7 = (unsigned char)1;
    goto LAB27;

LAB28:    t11 = 0;

LAB31:    if (t11 < 4U)
        goto LAB32;
    else
        goto LAB30;

LAB32:    t14 = (t1 + t11);
    t15 = (t9 + t11);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB29;

LAB33:    t11 = (t11 + 1);
    goto LAB31;

LAB34:    t27 = 0;

LAB37:    if (t27 < 4U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t22 = (t18 + t27);
    t23 = (t20 + t27);
    if (*((unsigned char *)t22) != *((unsigned char *)t23))
        goto LAB35;

LAB39:    t27 = (t27 + 1);
    goto LAB37;

}


extern void work_a_1740298857_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1740298857_3212880686_p_0};
	xsi_register_didat("work_a_1740298857_3212880686", "isim/main_tb_isim_beh.exe.sim/work/a_1740298857_3212880686.didat");
	xsi_register_executes(pe);
}
