/**
 * @file    svc_mcu_ver.c
 * @brief   OS svc_mcus version module.
 *
 * @addtogroup SERVICES
 */

/*****************************************************************************
   includes
*****************************************************************************/

#include "macros.h"
#include "svc_ver.h"

/*****************************************************************************
   external declarations
*****************************************************************************/

/*****************************************************************************
   defines and macros (scope: module-local)
*****************************************************************************/

#define SVCLIB_VERSION_STRING "2.4.0"

/*****************************************************************************
   typedefs and structures (scope: module-local)
*****************************************************************************/

/*****************************************************************************
   global variable definitions  (scope: module-exported)
*****************************************************************************/

const tChar *svc_ver         = MCR_VERSION_STRING( "SVCLIB", SVCLIB_VERSION_STRING);
const tChar *svc_supplier_id = "(C)2011-2016 ST Microelectronics";

/*****************************************************************************
   global variable definitions (scope: module-local)
*****************************************************************************/

/*****************************************************************************
   function prototypes (scope: module-local)
*****************************************************************************/

/*****************************************************************************
   function implementations (scope: module-local)
*****************************************************************************/

/*****************************************************************************
   function implementations (scope: module-exported)
*****************************************************************************/

/********************************************//**
 * \brief   Return pointer to version string
 *
 * \return  Pointer to svc_mcus version string
 *
 ***********************************************/
const tChar *svc_version( void)
{
  return svc_ver;
}
