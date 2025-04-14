#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/I2C_Accel_Driver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/I2C_Accel_Driver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=i2cDriver/i2c1_driver.c oledDriver/oledC.c oledDriver/oledC_shapes.c spiDriver/spi1_driver.c System/clock.c System/delay.c System/system.c Accel_i2c.c DemoAccel.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/i2cDriver/i2c1_driver.o ${OBJECTDIR}/oledDriver/oledC.o ${OBJECTDIR}/oledDriver/oledC_shapes.o ${OBJECTDIR}/spiDriver/spi1_driver.o ${OBJECTDIR}/System/clock.o ${OBJECTDIR}/System/delay.o ${OBJECTDIR}/System/system.o ${OBJECTDIR}/Accel_i2c.o ${OBJECTDIR}/DemoAccel.o
POSSIBLE_DEPFILES=${OBJECTDIR}/i2cDriver/i2c1_driver.o.d ${OBJECTDIR}/oledDriver/oledC.o.d ${OBJECTDIR}/oledDriver/oledC_shapes.o.d ${OBJECTDIR}/spiDriver/spi1_driver.o.d ${OBJECTDIR}/System/clock.o.d ${OBJECTDIR}/System/delay.o.d ${OBJECTDIR}/System/system.o.d ${OBJECTDIR}/Accel_i2c.o.d ${OBJECTDIR}/DemoAccel.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/i2cDriver/i2c1_driver.o ${OBJECTDIR}/oledDriver/oledC.o ${OBJECTDIR}/oledDriver/oledC_shapes.o ${OBJECTDIR}/spiDriver/spi1_driver.o ${OBJECTDIR}/System/clock.o ${OBJECTDIR}/System/delay.o ${OBJECTDIR}/System/system.o ${OBJECTDIR}/Accel_i2c.o ${OBJECTDIR}/DemoAccel.o

# Source Files
SOURCEFILES=i2cDriver/i2c1_driver.c oledDriver/oledC.c oledDriver/oledC_shapes.c spiDriver/spi1_driver.c System/clock.c System/delay.c System/system.c Accel_i2c.c DemoAccel.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/I2C_Accel_Driver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GA705
MP_LINKER_FILE_OPTION=,--script=p24FJ256GA705.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/i2cDriver/i2c1_driver.o: i2cDriver/i2c1_driver.c  .generated_files/flags/default/2c006daa8f23b849d566bc6384875372eb16b93c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/i2cDriver" 
	@${RM} ${OBJECTDIR}/i2cDriver/i2c1_driver.o.d 
	@${RM} ${OBJECTDIR}/i2cDriver/i2c1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2cDriver/i2c1_driver.c  -o ${OBJECTDIR}/i2cDriver/i2c1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2cDriver/i2c1_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDriver/oledC.o: oledDriver/oledC.c  .generated_files/flags/default/747fd0f380a602e6e7c3bc21a5bae7dfe8ff8cbc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC.c  -o ${OBJECTDIR}/oledDriver/oledC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDriver/oledC_shapes.o: oledDriver/oledC_shapes.c  .generated_files/flags/default/cfa8f8f13040f99077c34806fe1a62e037e339b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC_shapes.c  -o ${OBJECTDIR}/oledDriver/oledC_shapes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC_shapes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spiDriver/spi1_driver.o: spiDriver/spi1_driver.c  .generated_files/flags/default/fdf7a8f8ee009dd956d45474bb0fafef24690901 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/spiDriver" 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spiDriver/spi1_driver.c  -o ${OBJECTDIR}/spiDriver/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spiDriver/spi1_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/clock.o: System/clock.c  .generated_files/flags/default/d9ede9e9e496c371f3da60377f86406754987865 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/clock.o.d 
	@${RM} ${OBJECTDIR}/System/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/clock.c  -o ${OBJECTDIR}/System/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/delay.o: System/delay.c  .generated_files/flags/default/de42fddd5601218f8e326871c34daa3162842d4e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/delay.o.d 
	@${RM} ${OBJECTDIR}/System/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/delay.c  -o ${OBJECTDIR}/System/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/system.o: System/system.c  .generated_files/flags/default/7a97fc00af9912abc12b9d4d39973e63a9bb00b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/system.o.d 
	@${RM} ${OBJECTDIR}/System/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/system.c  -o ${OBJECTDIR}/System/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Accel_i2c.o: Accel_i2c.c  .generated_files/flags/default/c360a75b32342f53295760ddb42aef3b680579a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Accel_i2c.o.d 
	@${RM} ${OBJECTDIR}/Accel_i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Accel_i2c.c  -o ${OBJECTDIR}/Accel_i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Accel_i2c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/DemoAccel.o: DemoAccel.c  .generated_files/flags/default/68d479d4f3085ea822bf5cc169e8208cff616eec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DemoAccel.o.d 
	@${RM} ${OBJECTDIR}/DemoAccel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DemoAccel.c  -o ${OBJECTDIR}/DemoAccel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DemoAccel.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/i2cDriver/i2c1_driver.o: i2cDriver/i2c1_driver.c  .generated_files/flags/default/80ee22a7eb6d63b701cdbfb5b61f371db102d640 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/i2cDriver" 
	@${RM} ${OBJECTDIR}/i2cDriver/i2c1_driver.o.d 
	@${RM} ${OBJECTDIR}/i2cDriver/i2c1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2cDriver/i2c1_driver.c  -o ${OBJECTDIR}/i2cDriver/i2c1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2cDriver/i2c1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDriver/oledC.o: oledDriver/oledC.c  .generated_files/flags/default/c011f75aa497bea2c73235257d803efbbca58479 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC.c  -o ${OBJECTDIR}/oledDriver/oledC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDriver/oledC_shapes.o: oledDriver/oledC_shapes.c  .generated_files/flags/default/5c9704df8b78e14b78c03e908c945481c2e4134f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC_shapes.c  -o ${OBJECTDIR}/oledDriver/oledC_shapes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC_shapes.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spiDriver/spi1_driver.o: spiDriver/spi1_driver.c  .generated_files/flags/default/ce5c3902188bcc96206b631d9f8761b51cfa9a29 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/spiDriver" 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spiDriver/spi1_driver.c  -o ${OBJECTDIR}/spiDriver/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spiDriver/spi1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/clock.o: System/clock.c  .generated_files/flags/default/b08029b7609f9dad651a8cfc2910c7ba12da604f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/clock.o.d 
	@${RM} ${OBJECTDIR}/System/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/clock.c  -o ${OBJECTDIR}/System/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/delay.o: System/delay.c  .generated_files/flags/default/b00acd25cb5daf12f9ad6a64560f6e50267e0f66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/delay.o.d 
	@${RM} ${OBJECTDIR}/System/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/delay.c  -o ${OBJECTDIR}/System/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/system.o: System/system.c  .generated_files/flags/default/5634286214d432858e7b665f210c6827a9ce0a0c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/system.o.d 
	@${RM} ${OBJECTDIR}/System/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/system.c  -o ${OBJECTDIR}/System/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Accel_i2c.o: Accel_i2c.c  .generated_files/flags/default/528d9ae40345aea4dd7c542b08887d1e7426e73a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Accel_i2c.o.d 
	@${RM} ${OBJECTDIR}/Accel_i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Accel_i2c.c  -o ${OBJECTDIR}/Accel_i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Accel_i2c.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/DemoAccel.o: DemoAccel.c  .generated_files/flags/default/801429400fcad9a952828d4d2a73ffba7327bb6e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DemoAccel.o.d 
	@${RM} ${OBJECTDIR}/DemoAccel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  DemoAccel.c  -o ${OBJECTDIR}/DemoAccel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DemoAccel.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/I2C_Accel_Driver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/I2C_Accel_Driver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/I2C_Accel_Driver.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/I2C_Accel_Driver.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/I2C_Accel_Driver.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
