/*
 * Copyright (c) 2023 Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 *
 * @file   : task_menu.c
 * @date   : Set 26, 2023
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 * @version	v1.0.0
 */

/********************** inclusions *******************************************/
/* Project includes. */
#include "main.h"

/* Demo includes. */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes. */
#include "board.h"
#include "app.h"
#include "display.h"
#include "task_adc_interface.h"
#include "task_menu_attribute.h"
#include "task_menu_interface.h"

/********************** macros and definitions *******************************/
#define G_TASK_MEN_CNT_INI			0ul
#define G_TASK_MEN_TICK_CNT_INI		0ul

#define DEL_MEN_XX_MIN				0ul
#define DEL_MEN_XX_MED				50ul
#define DEL_MEN_XX_MAX				500ul

#define MENU_1_MAX      						2ul
#define MENU_2_TIEMPO_CONMUTA_FALLA_MAX  		9ul
#define MENU_2_TIEMPO_REPOTA_FALLA_MAX  		3ul
#define MENU_2_SET_POINT_TEMP_MAX  			    3ul
/********************** internal data declaration ****************************/
task_menu_dta_t task_menu_dta = {DEL_MEN_XX_MIN, ST_MEN_STANDBY, EV_MEN_ENT_IDLE, false};

task_menu_set_up_dta_t task_menu_set_up= {0,0,0};

task_sub_menu_dta_t task_sub_menu_dta ={0,0};


#define MENU_DTA_QTY	(sizeof(task_menu_dta)/sizeof(task_menu_dta_t))

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_menu 		= "Task Menu (Interactive Menu)";
const char *p_task_menu_ 		= "Non-Blocking & Update By Time Code";

/*
uint32_t temp_amb_raw=0;
uint32_t temp_uC_raw=0;
uint32_t temp_amb=0;
uint32_t temp_uC=0;
*/

/********************** external data declaration ****************************/
uint32_t g_task_menu_cnt;
volatile uint32_t g_task_menu_tick_cnt;
task_menu_set_up_dta_t   *p_task_menu_set_up_dta;


/********************** external functions definition ************************/
void task_menu_init(void *parameters)
{
	task_menu_dta_t   *p_task_menu_dta;
	task_menu_st_t	state;
	task_menu_ev_t	event;
	bool b_event;


	/* Print out: Task Initialized */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_menu_init), p_task_menu);
	LOGGER_LOG("  %s is a %s\r\n", GET_NAME(task_menu), p_task_menu_);

	g_task_menu_cnt = G_TASK_MEN_CNT_INI;

	/* Print out: Task execution counter */
	LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_menu_cnt), g_task_menu_cnt);

	init_queue_event_task_menu();

	/* Update Task Actuator Configuration & Data Pointer */
	p_task_menu_dta = & task_menu_dta;

	/* Print out: Task execution FSM */
	state = p_task_menu_dta->state;
	LOGGER_LOG("   %s = %lu", GET_NAME(state), (uint32_t)state);

	event = p_task_menu_dta->event;
	LOGGER_LOG("   %s = %lu", GET_NAME(event), (uint32_t)event);

	b_event = p_task_menu_dta->flag;
	LOGGER_LOG("   %s = %s\r\n", GET_NAME(b_event), (b_event ? "true" : "false"));

    displayInit( DISPLAY_CONNECTION_GPIO_4BITS );


	HAL_GPIO_WritePin(LED_A_PORT, LED_A_PIN, LED_A_ON);

	g_task_menu_tick_cnt = G_TASK_MEN_TICK_CNT_INI;
}

void task_menu_update(void *parameters)
{
	task_menu_dta_t         *p_task_menu_dta;
	task_sub_menu_dta_t     *p_task_sub_menu_dta;

	bool b_time_update_required = false;
    char menu_str[16];

	p_task_sub_menu_dta = &task_sub_menu_dta;

	g_task_menu_cnt++;

	/* Protect shared resource (g_task_menu_tick) */
	__asm("CPSID i");	/* disable interrupts*/
    if (G_TASK_MEN_TICK_CNT_INI < g_task_menu_tick_cnt)
    {
    	g_task_menu_tick_cnt--;
    	b_time_update_required = true;
    }
    __asm("CPSIE i");	/* enable interrupts*/

    while (b_time_update_required)
    {
		/* Protect shared resource (g_task_menu_tick) */
		__asm("CPSID i");	/* disable interrupts*/
		if (G_TASK_MEN_TICK_CNT_INI < g_task_menu_tick_cnt)
		{
			g_task_menu_tick_cnt--;
			b_time_update_required = true;
		}
		else
		{
			b_time_update_required = false;
		}
		__asm("CPSIE i");	/* enable interrupts*/

    	/* Update Task Menu Data Pointer */
		p_task_menu_dta = &task_menu_dta;

    	if (DEL_MEN_XX_MIN < p_task_menu_dta->tick)
		{
			p_task_menu_dta->tick--;
		}
		else
		{

			p_task_menu_dta->tick = DEL_MEN_XX_MAX;

			if (true == any_event_task_menu())
			{
				p_task_menu_dta->flag = true;
				p_task_menu_dta->event = get_event_task_menu();
			}

			switch (p_task_menu_dta->state)
			{
				case ST_MAIN_MENU:
	            	  	  	      p_task_menu_set_up_dta = & task_menu_set_up;

	            	  	  	      //snprintf(menu_str, sizeof(menu_str),"Ent/Nxt Tset:%lu ",_task_menu_set_up_dta->set_point_temperatura);
	            	  	  	      displayCharPositionWrite(0,0);
	            	  	  	      displayStringWrite("Ent/Nxt Tset:26 ");

	            	  			 // displayCharPositionWrite(0,1);
	            	  			 // snprintf(menu_str, sizeof(menu_str),"Tamb:%lu Tset:%lu ",temp_amb,p_task_menu_set_up_dta->set_point_temperatura);
	            	  			 // displayStringWrite(menu_str);

	            	  	  	      	  	  ///// VUELVO A ESTADO DE MONITOREO AUTOMATICO ////
	            	  	  	      if ((true == p_task_menu_dta->flag) && ( EV_MEN_ON_ACTIVE == p_task_menu_dta->event)){
	            	  	  	    	  //send struct
									  p_task_menu_dta->event = EV_MEN_ON_IDLE;
	            	  	  	    	  p_task_menu_dta->state = ST_MEN_STANDBY;
	            	  	  	      }

	            	    	  	  if ((true == p_task_menu_dta->flag) && (EV_MEN_ENT_ACTIVE == p_task_menu_dta->event)){
	            	   	  	  		  p_task_menu_dta->flag = false;
	            	   	  	  	      p_task_menu_dta->flag_1=true;
	            	  	  	  		  p_task_menu_dta->state = ST_01_MENU;
	            	  	  	  	     }
	            	  	  	  	  break;

				case ST_01_MENU:
										///// VUELVO A ESTADO DE MONITOREO AUTOMATICO ////
								  if ((true == p_task_menu_dta->flag) && ( EV_MEN_ON_ACTIVE == p_task_menu_dta->event)){

									  //send struct
									  p_task_menu_dta->event = EV_MEN_ON_IDLE;
									  p_task_menu_dta->state = ST_MEN_STANDBY;
								  }
					             p_task_menu_set_up_dta = & task_menu_set_up;

					 	 	 	 displayCharPositionWrite(0, 0);
					 	 	 	 displayStringWrite("   Enter/Next    ");
					 	 	 	displayStringWrite(menu_str);

					 	 	 	 if(p_task_sub_menu_dta->sub_menu_1 == SET_UP_TIEMPO_CONMUTA_FALLA_MEN_1){

					 	 	 		displayCharPositionWrite(0,1);
					 	 	 		displayStringWrite("  Tiempo Conm   ");
						 	 		displayStringWrite(menu_str);

						 	 		p_task_sub_menu_dta->sub_menu_2=SET_UP_TIEMPO_CONMUTA_FALLA_MEN_2;}


					 	 	 	 if(p_task_sub_menu_dta->sub_menu_1 == SET_UP_TIEMPO_REPORTA_FALLA_MEN_1){

					 	 	 		displayCharPositionWrite(0,1);
						 	 	 		displayStringWrite("  Tiempo Falla  ");
							 	 		displayStringWrite(menu_str);

								 	p_task_sub_menu_dta->sub_menu_2=SET_UP_TIEMPO_REPORTA_FALLA_MEN_2;}


						 	 	 if(p_task_sub_menu_dta->sub_menu_1 == SET_UP_SET_POINT_TEMPERATURA_MEN_1){

								    displayCharPositionWrite(0,1);
								    displayStringWrite(" Set Point Temp");
									displayStringWrite(menu_str);

									p_task_sub_menu_dta->sub_menu_2=SET_UP_SET_POINT_TEMPERATURA_MEN_2;}
					 	 	 	/*-------------------------------------------------------------------------------------------*/
					 	 	 	 if ((true == p_task_menu_dta->flag) && (EV_MEN_NEX_ACTIVE == p_task_menu_dta->event)){
					 	 	 		p_task_sub_menu_dta->sub_menu_1++;
					 	 	 		p_task_menu_dta->flag_1=1; }

					 	 	 	 if (p_task_sub_menu_dta->sub_menu_1> MENU_1_MAX ){
					 	 	 		p_task_sub_menu_dta->sub_menu_1=0;}

								 if ((true == p_task_menu_dta->flag) && (EV_MEN_ENT_ACTIVE == p_task_menu_dta->event)&&(p_task_menu_dta->flag_1==true) ){
									p_task_menu_dta->flag = false;
									p_task_menu_dta->state = ST_02_MENU;}

								 if ((true == p_task_menu_dta->flag) && (EV_MEN_ENT_ACTIVE == p_task_menu_dta->event)&& (p_task_menu_dta->flag_1==false)){
									p_task_menu_dta->flag = false;
									p_task_menu_dta->state = ST_MAIN_MENU;
									p_task_menu_dta->flag_1=true;}
								 break;

				     case ST_02_MENU:
					     	 	 displayCharPositionWrite(0, 0);
					     	 	 displayStringWrite("   Enter/Next   ");
					     	 	 displayStringWrite(menu_str);


					 switch (p_task_sub_menu_dta->sub_menu_1)	{

								 	 	 case SET_UP_TIEMPO_CONMUTA_FALLA_MEN_2 :

								 				if (p_task_sub_menu_dta->sub_menu_2 > MENU_2_TIEMPO_CONMUTA_FALLA_MAX){
								 	 		 		p_task_sub_menu_dta->sub_menu_2=0;}

								 				p_task_menu_set_up_dta->tiempo_conmuta_falla=p_task_sub_menu_dta->sub_menu_2;

								 			    displayCharPositionWrite(0, 1);
								 			    snprintf(menu_str, sizeof(menu_str), "Tiempo Conm: %lu", (p_task_menu_set_up_dta->tiempo_conmuta_falla));
								 				displayStringWrite(menu_str);
								 	 	  break;

								 	 	 case SET_UP_TIEMPO_REPORTA_FALLA_MEN_2 :

												  if (p_task_sub_menu_dta->sub_menu_2 > MENU_2_TIEMPO_REPOTA_FALLA_MAX){
													 p_task_sub_menu_dta->sub_menu_2=0;}

												  p_task_menu_set_up_dta->tiempo_reporta_falla= p_task_sub_menu_dta->sub_menu_2;

												  displayCharPositionWrite(0, 1);
												  snprintf(menu_str, sizeof(menu_str), "Tiempo Falla: %lu",p_task_menu_set_up_dta->tiempo_reporta_falla);
									     		  displayStringWrite(menu_str);
									     break;

								 	 	 case SET_UP_SET_POINT_TEMPERATURA_MEN_2 :

								 	 		 	 if (p_task_sub_menu_dta->sub_menu_2 > MENU_2_SET_POINT_TEMP_MAX){
								 	 		 		 p_task_sub_menu_dta->sub_menu_2=0;}

								 	 		 	p_task_menu_set_up_dta->set_point_temperatura=p_task_sub_menu_dta->sub_menu_2;

								 	 		 	displayCharPositionWrite(0, 1);
								 	 		 	snprintf(menu_str, sizeof(menu_str), "SetPointTemp: %lu",p_task_menu_set_up_dta->set_point_temperatura);
								 	 		 	displayStringWrite(menu_str);
								 	     break;
					                     default:break;}
					 /*-------------------------------------------------------------------------------------------*/
	 	 	 	 	 	 	 if ((true == p_task_menu_dta->flag) && (EV_MEN_NEX_ACTIVE == p_task_menu_dta->event)){
	 	 	 	 	 	 		p_task_sub_menu_dta->sub_menu_2++;
	 	 	 	 	 	 	 	 	 	 	 	 }
							  if ((true == p_task_menu_dta->flag) && (EV_MEN_ENT_ACTIVE == p_task_menu_dta->event)){
								  p_task_menu_dta->flag = false;
								  p_task_menu_dta->flag_1=false;
								  p_task_menu_dta->state = ST_01_MENU;
								   }

			    	 	 	 	///// VUELVO A ESTADO DE MONITOREO AUTOMATICO ////
							  if ((true == p_task_menu_dta->flag) && ( EV_MEN_ON_ACTIVE == p_task_menu_dta->event)){
								  //send struct
								  //clean display

								  p_task_menu_dta->event = EV_MEN_ON_IDLE;
								  p_task_menu_dta->state = ST_MEN_STANDBY;
							  }
							   break;
				default:
					if ((true == p_task_menu_dta->flag) && ( EV_MEN_ON_ACTIVE == p_task_menu_dta->event)){
						  //clean display
						displayCharPositionWrite(0,0);
						displayStringWrite("                ");
						displayCharPositionWrite(0,1);
						displayStringWrite("                ");

						p_task_menu_dta->event = EV_MEN_ON_IDLE;
						p_task_menu_dta->state = ST_MAIN_MENU;
					}
					break;
			}
		}
	}
}

/********************** end of file ******************************************/
