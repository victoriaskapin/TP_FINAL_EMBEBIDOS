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
 * @file   : task_system.c
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
#include "task_system_attribute.h"
#include "task_system_interface.h"

#include "task_actuator_attribute.h"
#include "task_actuator_interface.h"

#include "display.h"

#include "task_adc_interface.h"


/********************** macros and definitions *******************************/
#define G_TASK_SYS_CNT_INI			0ul
#define G_TASK_SYS_TICK_CNT_INI		0ul

#define DEL_SYS_XX_MIN				0ul
#define DEL_SYS_XX_MED				50ul
#define DEL_SYS_XX_MAX				500ul

////////////////////////// Estos son placeholders los tiene que levantar del set up menu ////////////////
#define MAX_TICK_ALARM				4000ul
#define MAX_TICK_SWITCH				10000ul
#define TEMP_MAX_USER				200


/********************** internal data declaration ****************************/
task_system_dta_t task_system_dta =
	{DEL_SYS_XX_MIN, ST_SYS_XX_IDLE, EV_SYS_BTN_ON_ACTIVE, false};

#define SYSTEM_DTA_QTY	(sizeof(task_system_dta)/sizeof(task_system_dta_t))

uint32_t counter_tick= 0;
uint32_t tempAmb = 0;
bool 	switch_motors_flag = false;
bool	aire_a_on = false;

uint32_t temp_amb_raw=0;
uint32_t temp_uC_raw=0;
uint32_t temp_amb=0;
uint32_t temp_uC=0;
extern TIM_HandleTypeDef htim3;
/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_system 		= "Task System (System Statechart)";
const char *p_task_system_ 		= "Non-Blocking & Update By Time Code";

/********************** external data declaration ****************************/
uint32_t g_task_system_cnt;
volatile uint32_t g_task_system_tick_cnt;

/********************** external functions definition ************************/
void task_system_init(void *parameters)
{
	task_system_dta_t 	*p_task_system_dta;
	task_system_st_t	state;
	task_system_ev_t	event;
	bool b_event;

	displayInit( DISPLAY_CONNECTION_GPIO_4BITS );

	/* Print out: Task Initialized */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_system_init), p_task_system);
	LOGGER_LOG("  %s is a %s\r\n", GET_NAME(task_system), p_task_system_);

	g_task_system_cnt = G_TASK_SYS_CNT_INI;

	/* Print out: Task execution counter */
	LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_system_cnt), g_task_system_cnt);

	init_queue_event_task_system();

	/* Update Task Actuator Configuration & Data Pointer */
	p_task_system_dta = &task_system_dta;

	/* Print out: Task execution FSM */
	state = p_task_system_dta->state;
	LOGGER_LOG("   %s = %lu", GET_NAME(state), (uint32_t)state);

	event = p_task_system_dta->event;
	LOGGER_LOG("   %s = %lu", GET_NAME(event), (uint32_t)event);

	b_event = p_task_system_dta->flag;
	LOGGER_LOG("   %s = %s\r\n", GET_NAME(b_event), (b_event ? "true" : "false"));

	g_task_system_tick_cnt = G_TASK_SYS_TICK_CNT_INI;
}

void task_system_update(void *parameters)
{
	task_system_dta_t *p_task_system_dta;
	bool b_time_update_required = false;

	char display_str[16];
	/* Update Task System Counter */
	g_task_system_cnt++;

	/* Protect shared resource (g_task_system_tick) */
	__asm("CPSID i");	/* disable interrupts*/
    if (G_TASK_SYS_TICK_CNT_INI < g_task_system_tick_cnt)
    {
    	g_task_system_tick_cnt--;
    	b_time_update_required = true;
    }
    __asm("CPSIE i");	/* enable interrupts*/

    while (b_time_update_required)
    {
		/* Protect shared resource (g_task_system_tick) */
		__asm("CPSID i");	/* disable interrupts*/
		if (G_TASK_SYS_TICK_CNT_INI < g_task_system_tick_cnt)
		{
			g_task_system_tick_cnt--;
			b_time_update_required = true;
		}
		else
		{
			b_time_update_required = false;
		}
		__asm("CPSIE i");	/* enable interrupts*/

    	/* Update Task System Data Pointer */
		p_task_system_dta = &task_system_dta;

		if (true == any_event_task_system())
		{
			p_task_system_dta->flag = true;
			p_task_system_dta->event = get_event_task_system();
		}

		//// ACA LEVANTAR EL ADC Y LIMITE DEL USUARIO -> PASAR A EV_SYS_FAILURE_ACTIVE SI PASA EL LIMITE DEL USUARIO
		if ( true == any_value_task_adc())
				{
					temp_uC_raw  = get_value_task_adc();
					temp_amb_raw = get_value_task_adc();

					temp_amb = (3.30 * 100 * temp_amb_raw)/(4096);
					temp_uC  = ((1750-temp_uC_raw)/4.3 )+25; // 1700

					if( temp_amb > user_set_up_data.set_point_temperatura ){
						//LOGGER_LOG("FALLA POR temp_amb :%lu\r\n",temp_amb);
						p_task_system_dta->event = EV_SYS_FAILURE_ACTIVE;
					}
				}
		/// verifico que el switch de off no este activado si lo esta overwrite de evento a off.

		 if(HAL_GPIO_ReadPin(SWITCH_OFF_PORT, SWITCH_OFF_PIN) == SWITCH_OFF_HOVER) //ACA CAMBIE EL BOARD
		 {
			 p_task_system_dta->flag = true;
		 }
		 else if(HAL_GPIO_ReadPin(SWITCH_OFF_PORT, SWITCH_OFF_PIN) == SWITCH_OFF_PRESSED)
		 {
			 // apago todo y event false;
			 p_task_system_dta->state = ST_SYS_XX_OFF;

		 }


		switch (p_task_system_dta->state)
				{
					case ST_SYS_XX_IDLE: // mi sistema se acaba de prender o se reinicio
						if(true == p_task_system_dta->flag)
						{
							p_task_system_dta->flag = false;
							if(EV_SYS_BTN_ON_ACTIVE == p_task_system_dta->event) //prende el aire A por default y pone el clock de switch a max
							{
								// leds testigo
								put_event_task_actuator(EV_LED_XX_OFF, ID_LED_USER_B);
								put_event_task_actuator(EV_LED_XX_ON, ID_LED_USER_A);

								// leds aires
								put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_B);
								put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_AIRE_A);

								TIM3->CCR3 = 3000;
								HAL_TIM_PWM_Stop(&htim3,TIM_CHANNEL_3); //buzzer off

								snprintf(display_str, sizeof(display_str)," Tamb:%lu TuC:%lu ",temp_amb,temp_uC);//temp_amb,p_task_menu_set_up_dta->set_point_temperatura);
	            	  			displayCharPositionWrite(0,0);
								displayStringWrite(display_str);

								displayCharPositionWrite(0, 1);
								snprintf(display_str, sizeof(display_str), "Tiempo Conm: %lu", (user_set_up_data.tiempo_conmuta_falla)/1000);
								displayStringWrite(display_str);

								aire_a_on = true;

								/////// DANTE CODE BEGINS ////////////////

								p_task_system_dta->tick = user_set_up_data.tiempo_conmuta_falla; // aca esta levantando el max tick de cambio de motores por default
								// podemos cargar ese dato en la estructura directamente por default y levantarlo siempre de la struct

								/////////// DANTE CODE ENDS ///////////////
								p_task_system_dta->state = ST_SYS_XX_ACTIVE;
								p_task_system_dta->event = EV_SYS_BTN_ON_IDLE;
							}

						}
						break;

					case ST_SYS_XX_ACTIVE: // estado de monitoreo

						if (true == p_task_system_dta->flag )
						{
							p_task_system_dta->flag = false;

							if(p_task_system_dta->tick/2 == p_task_system_dta->tick)
							{
								snprintf(display_str, sizeof(display_str),"Tamb:%lu TuC:%lu ",temp_amb,temp_uC);//temp_amb,p_task_menu_set_up_dta->set_point_temperatura);
								displayCharPositionWrite(0, 1);
								displayStringWrite(display_str);
							}


							if(p_task_system_dta->tick > 0){
								// lo que estaba parpadeando sigue parpadeando
								if( aire_a_on )
								{
									put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_AIRE_A);
								}
								else
								{
									put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_AIRE_B);
								}
								// Actualizo el clock de commutacion
								p_task_system_dta->tick --;
							}
							else
							{
								p_task_system_dta->state = ST_SYS_XX_SWITCH_MOTORS;
							}


							if(EV_SYS_BTN_ON_ACTIVE == p_task_system_dta->event)
							{
								put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_USER_B);
								put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_USER_A);
								put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_B);
								put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_A);
								p_task_system_dta->event = EV_SYS_BTN_ON_IDLE;
								p_task_system_dta->state = ST_SYS_XX_STANDBY;
							}

							if (EV_SYS_SWITCH_AIRE_ACTIVE == p_task_system_dta->event || EV_SYS_FAILURE_ACTIVE == p_task_system_dta->event)
							{
								LOGGER_LOG("temp_amb: %lu\r\n",temp_amb);

								LOGGER_LOG(" EVENTO DE FALLA, ESTADO ACTIVO \n");
								counter_tick = p_task_system_dta->tick;
								p_task_system_dta->tick = user_set_up_data.tiempo_reporta_falla;
								p_task_system_dta->state = ST_SYS_XX_FAILURE;
							}

						}
						break;

					case ST_SYS_XX_STANDBY:
						if (true == p_task_system_dta->flag )
						{
							p_task_system_dta->flag = false;
							//parpadeo los leds
							put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_USER_B);
							put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_USER_A);

							if(EV_SYS_BTN_ON_ACTIVE == p_task_system_dta->event)
							// si se vuelve a tocar btn ON vuelvo a reiniciar el sistema
							{
								snprintf(display_str, sizeof(display_str)," Tamb:%lu TuC:%lu ",temp_amb,temp_uC);//temp_amb,p_task_menu_set_up_dta->set_point_temperatura);
	            	  			displayCharPositionWrite(0,0);
								displayStringWrite(display_str);
								p_task_system_dta->state = ST_SYS_XX_IDLE;
							}
						}
						break;

					case ST_SYS_XX_SWITCH_MOTORS:
							if ( true == p_task_system_dta->flag ){
								p_task_system_dta->flag = false;

								// cambio de motores
								LOGGER_LOG(" CAMBIO DE MOTORES, ESTADO ACTIVO \n");
								if( aire_a_on)
								{
									put_event_task_actuator(EV_LED_XX_ON, ID_LED_USER_B);
									put_event_task_actuator(EV_LED_XX_OFF, ID_LED_USER_A);

									// leds aires
									put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_AIRE_B);
									put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_A);

									aire_a_on = false;
								}
								else {
									put_event_task_actuator(EV_LED_XX_OFF, ID_LED_USER_B);
									put_event_task_actuator(EV_LED_XX_ON, ID_LED_USER_A);

									// leds aires
									put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_B);
									put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_AIRE_A);

									aire_a_on = true;
								}

								p_task_system_dta->tick = user_set_up_data.tiempo_conmuta_falla;
								p_task_system_dta->state = ST_SYS_XX_ACTIVE;

							}
						break;

					case ST_SYS_XX_OFF:

						put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_B);
						put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_A);
						put_event_task_actuator(EV_LED_XX_OFF, ID_LED_USER_B);
						put_event_task_actuator(EV_LED_XX_OFF, ID_LED_USER_A);

						TIM3->CCR3 = 3000;
						HAL_TIM_PWM_Stop(&htim3,TIM_CHANNEL_3);
						p_task_system_dta->event = EV_SYS_BTN_ON_ACTIVE; // si quiero que se prenda ni bien se levanta el boton
						p_task_system_dta->state = ST_SYS_XX_IDLE;

						break;
					default:
						if (true == p_task_system_dta->flag )
						{
							p_task_system_dta->flag = false;
							if(EV_SYS_BTN_ON_ACTIVE == p_task_system_dta->event)
							{
								put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_USER_B);
								put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_USER_A);

								put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_B);
								put_event_task_actuator(EV_LED_XX_OFF, ID_LED_AIRE_A);

								p_task_system_dta->event = EV_SYS_BTN_ON_IDLE;
								p_task_system_dta->state = ST_SYS_XX_STANDBY;
							}

							if (p_task_system_dta->tick > 0)
							{
								p_task_system_dta->tick--;
								//lo que estaba andando continua andando en el periodo de falso positivo
								if( aire_a_on )
								{
									put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_AIRE_A);
								}
								else
								{
									put_event_task_actuator(EV_LED_XX_BLINK, ID_LED_AIRE_B);
								}

							}
							// si se termino el tiempo de rebote
							else {
								if (EV_SYS_FAILURE_ACTIVE == p_task_system_dta->event || EV_SYS_SWITCH_AIRE_ACTIVE == p_task_system_dta->event)
								{
									TIM3->CCR3 = 3000;
									HAL_TIM_PWM_Start(&htim3,TIM_CHANNEL_3);// prendo el buzzer

									LOGGER_LOG(" CAMBIO DE MOTORES, ESTADO FALLA con buzzer \n");
									p_task_system_dta->state = ST_SYS_XX_SWITCH_MOTORS; // cambio motores
								}
								else
								{
									counter_tick -= user_set_up_data.tiempo_reporta_falla;
									p_task_system_dta->tick = counter_tick;

									if (p_task_system_dta->tick > user_set_up_data.tiempo_conmuta_falla){ // si durante el tiempo de falla se termino el tiempo de conmutacion cambio de motores
										p_task_system_dta->state = ST_SYS_XX_SWITCH_MOTORS;
									}
									p_task_system_dta->state = ST_SYS_XX_ACTIVE; // continuo con normalidad
								}
							}
						}

						break;
				}
		}// MAIN WHILE
    }// END OF FUNCTION



/********************** end of file ******************************************/
