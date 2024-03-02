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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "K:/Studia/S05/VLSI/243168/LAB08/PWM.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_3620187407_sub_1742983514_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2525893486_2164645192_p_0(char *t0)
{
    char t18[16];
    char t29[16];
    char t30[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;

LAB0:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t11 = xsi_signal_has_event(t1);
    if (t11 == 1)
        goto LAB10;

LAB11:    t4 = (unsigned char)0;

LAB12:    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 7347);
    t21 = xsi_mem_cmp(t1, t2, 2U);
    if (t21 == 1)
        goto LAB26;

LAB29:    t6 = (t0 + 7349);
    t31 = xsi_mem_cmp(t6, t2, 2U);
    if (t31 == 1)
        goto LAB27;

LAB30:
LAB28:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t21 = (7 - 7);
    t22 = (t21 * -1);
    t33 = (1U * t22);
    t34 = (0 + t33);
    t1 = (t2 + t34);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 4784);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t3;
    xsi_driver_first_trans_fast(t5);

LAB25:
LAB3:    t1 = (t0 + 4608);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 7302);
    t6 = (t0 + 4720);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(32, ng0);
    t1 = (t0 + 4784);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(33, ng0);
    t1 = (t0 + 7310);
    t5 = (t0 + 4848);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 7318);
    t5 = (t0 + 4912);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t16 = *((unsigned char *)t7);
    t17 = (t16 == (unsigned char)2);
    if (t17 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB3;

LAB7:    t2 = (t0 + 1192U);
    t6 = *((char **)t2);
    t14 = *((unsigned char *)t6);
    t15 = (t14 == (unsigned char)3);
    t3 = t15;
    goto LAB9;

LAB10:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t12 = *((unsigned char *)t5);
    t13 = (t12 == (unsigned char)3);
    t4 = t13;
    goto LAB12;

LAB13:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1512U);
    t8 = *((char **)t2);
    t2 = (t0 + 7160U);
    t9 = (t0 + 7326);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 0;
    t20 = (t19 + 4U);
    *((int *)t20) = 1;
    t20 = (t19 + 8U);
    *((int *)t20) = 1;
    t21 = (1 - 0);
    t22 = (t21 * 1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t23 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t8, t2, t9, t18);
    if (t23 != 0)
        goto LAB16;

LAB18:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 7160U);
    t5 = (t0 + 7328);
    t7 = (t18 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t21 = (1 - 0);
    t22 = (t21 * 1);
    t22 = (t22 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t22;
    t3 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t18);
    if (t3 != 0)
        goto LAB19;

LAB20:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 7160U);
    t5 = (t0 + 7330);
    t7 = (t18 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t21 = (1 - 0);
    t22 = (t21 * 1);
    t22 = (t22 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t22;
    t3 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t18);
    if (t3 != 0)
        goto LAB21;

LAB22:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 7339);
    t5 = (t0 + 4720);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);

LAB17:    goto LAB14;

LAB16:    xsi_set_current_line(38, ng0);
    t20 = (t0 + 2312U);
    t24 = *((char **)t20);
    t20 = (t0 + 4720);
    t25 = (t20 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t24, 8U);
    xsi_driver_first_trans_fast_port(t20);
    goto LAB17;

LAB19:    xsi_set_current_line(40, ng0);
    t8 = (t0 + 2152U);
    t9 = *((char **)t8);
    t8 = (t0 + 4720);
    t10 = (t8 + 56U);
    t19 = *((char **)t10);
    t20 = (t19 + 56U);
    t24 = *((char **)t20);
    memcpy(t24, t9, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB17;

LAB21:    xsi_set_current_line(42, ng0);
    t8 = (t0 + 2472U);
    t9 = *((char **)t8);
    t4 = *((unsigned char *)t9);
    t8 = (t0 + 7332);
    t20 = ((IEEE_P_2592010699) + 4024);
    t24 = (t30 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 0;
    t25 = (t24 + 4U);
    *((int *)t25) = 6;
    t25 = (t24 + 8U);
    *((int *)t25) = 1;
    t31 = (6 - 0);
    t22 = (t31 * 1);
    t22 = (t22 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t22;
    t19 = xsi_base_array_concat(t19, t29, t20, (char)99, t4, (char)97, t8, t30, (char)101);
    t22 = (1U + 7U);
    t11 = (8U != t22);
    if (t11 == 1)
        goto LAB23;

LAB24:    t25 = (t0 + 4720);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t32 = *((char **)t28);
    memcpy(t32, t19, 8U);
    xsi_driver_first_trans_fast_port(t25);
    goto LAB17;

LAB23:    xsi_size_not_matching(8U, t22, 0);
    goto LAB24;

LAB26:    xsi_set_current_line(50, ng0);
    t8 = (t0 + 1672U);
    t9 = *((char **)t8);
    t8 = (t0 + 4848);
    t10 = (t8 + 56U);
    t19 = *((char **)t10);
    t20 = (t19 + 56U);
    t24 = *((char **)t20);
    memcpy(t24, t9, 8U);
    xsi_driver_first_trans_fast(t8);
    goto LAB25;

LAB27:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 4912);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB25;

LAB31:;
}

static void work_a_2525893486_2164645192_p_1(char *t0)
{
    char t15[16];
    char t17[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t16;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned char t22;
    char *t23;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;

LAB0:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4624);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 7351);
    t6 = (t0 + 4976);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2472U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 7371);
    t5 = (t0 + 4976);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2632U);
    t7 = *((char **)t2);
    t2 = (t0 + 7240U);
    t8 = (t0 + 2152U);
    t9 = *((char **)t8);
    t8 = (t0 + 7208U);
    t10 = (t0 + 7359);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 0;
    t19 = (t18 + 4U);
    *((int *)t19) = 1;
    t19 = (t18 + 8U);
    *((int *)t19) = 1;
    t20 = (1 - 0);
    t21 = (t20 * 1);
    t21 = (t21 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t21;
    t19 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t15, t9, t8, t10, t17);
    t22 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t7, t2, t19, t15);
    if (t22 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 7240U);
    t5 = (t0 + 7369);
    t7 = (t17 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t20 = (1 - 0);
    t21 = (t20 * 1);
    t21 = (t21 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t21;
    t8 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t15, t2, t1, t5, t17);
    t9 = (t15 + 12U);
    t21 = *((unsigned int *)t9);
    t30 = (1U * t21);
    t3 = (8U != t30);
    if (t3 == 1)
        goto LAB16;

LAB17:    t10 = (t0 + 4976);
    t16 = (t10 + 56U);
    t18 = *((char **)t16);
    t19 = (t18 + 56U);
    t23 = *((char **)t19);
    memcpy(t23, t8, 8U);
    xsi_driver_first_trans_fast(t10);

LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(66, ng0);
    t23 = (t0 + 7361);
    t25 = (t0 + 4976);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t23, 8U);
    xsi_driver_first_trans_fast(t25);
    goto LAB14;

LAB16:    xsi_size_not_matching(8U, t30, 0);
    goto LAB17;

}

static void work_a_2525893486_2164645192_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t9 = (t4 == (unsigned char)3);
    if (t9 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 5040);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB6:
LAB3:    t1 = (t0 + 4640);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 5040);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(82, ng0);
    t8 = (t0 + 5040);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB6;

LAB8:    t1 = (t0 + 2632U);
    t5 = *((char **)t1);
    t1 = (t0 + 7240U);
    t6 = (t0 + 2312U);
    t7 = *((char **)t6);
    t6 = (t0 + 7224U);
    t10 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t5, t1, t7, t6);
    t3 = t10;
    goto LAB10;

}


extern void work_a_2525893486_2164645192_init()
{
	static char *pe[] = {(void *)work_a_2525893486_2164645192_p_0,(void *)work_a_2525893486_2164645192_p_1,(void *)work_a_2525893486_2164645192_p_2};
	xsi_register_didat("work_a_2525893486_2164645192", "isim/PWM_tb_isim_beh.exe.sim/work/a_2525893486_2164645192.didat");
	xsi_register_executes(pe);
}
