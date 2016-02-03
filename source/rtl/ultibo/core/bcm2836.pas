{
Ultibo Definitions specific to the Broadcom 2836 System on chip.

Copyright (C) 2015 - SoftOz Pty Ltd.

Arch
====

 ARMv7 (Cortex A7)

Boards
======

 Raspberry Pi 2 - Model B

Licence
=======

 LGPLv2.1 with static linking exception (See COPYING.modifiedLGPL.txt)
 
Credits
=======

 Information for this unit was obtained from:

 Linux - bcm2836.h - Copyright (C) Broadcom
 Linux - \arch\arm\mach-bcm2709\include\mach\platform.h - Copyright (C) Broadcom
 Linux - \arch\arm\mach-bcm2709\include\mach\irqs.h - Copyright (C) Broadcom
 
 
References
==========

 BCM2835 ARM Peripherals
 QA7 Rev3.4

 
Broadcom BCM2836
================

Note that most of this information is directly from the BCM2835 documentation as there is no complete technical reference yet available for the BCM2836

}
              
{$mode delphi} {Default to Delphi compatible syntax}
{$H+}          {Default to AnsiString}
{$inline on}   {Allow use of Inline procedures}

unit BCM2836; 
                               
interface

uses GlobalConfig,GlobalConst,GlobalTypes;
              
{==============================================================================}
{Global definitions}
{$INCLUDE GlobalDefines.inc}
 
{==============================================================================}
const
 {BCM2836 specific constants}
 BCM2836_CPU_COUNT = 4;
 
 {ARM Physical to VC IO Mapping (See: BCM2835-ARM-Peripherals.pdf)}
 BCM2836_VCIO_ALIAS    = $7E000000;
 
 {ARM Physical to VC Bus Mapping (See: BCM2835-ARM-Peripherals.pdf)}
 BCM2836_VCBUS_0_ALIAS = $00000000; {0 Alias - L1 and L2 cached}
 BCM2836_VCBUS_4_ALIAS = $40000000; {4 Alias - L2 cache coherent (non allocating)}
 BCM2836_VCBUS_8_ALIAS = $80000000; {8 Alias - L2 cached (only)}
 BCM2836_VCBUS_C_ALIAS = $C0000000; {C Alias - Direct uncached} {Suitable for RPi 2 Model B}
 
 {Physical memory addresses of BCM2836 peripherals  (See: BCM2835-ARM-Peripherals.pdf)}
 BCM2836_PERIPHERALS_BASE = $3F000000;  {Mapped to VC address 7E000000}
 BCM2836_PERIPHERALS_SIZE = $00FFFFFF;
 
 {Interrupt Controller 0}
 BCM2836_IC0_REGS_BASE          = BCM2836_PERIPHERALS_BASE + $2000;
 
 {System Timer (See Section 12)}
 BCM2836_SYSTEM_TIMER_REGS_BASE = BCM2836_PERIPHERALS_BASE + $3000;

 {Message based Parallel Host Interface}
 BCM2836_MPHI_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $6000;
 
 {DMA controller (Channels 0 to 14) (See Section 4)}
 BCM2836_DMA0_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7000;
 BCM2836_DMA1_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7100;
 BCM2836_DMA2_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7200;
 BCM2836_DMA3_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7300;
 BCM2836_DMA4_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7400;
 BCM2836_DMA5_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7500;
 BCM2836_DMA6_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7600;
 BCM2836_DMA7_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7700;
 BCM2836_DMA8_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7800;
 BCM2836_DMA9_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $7900;
 BCM2836_DMA10_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $7A00;
 BCM2836_DMA11_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $7B00;
 BCM2836_DMA12_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $7C00;
 BCM2836_DMA13_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $7D00;
 BCM2836_DMA14_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $7E00;
 
 BCM2836_DMA_INT_STATUS_BASE    = BCM2836_PERIPHERALS_BASE + $7FE0;
 BCM2836_DMA_ENABLE_BASE        = BCM2836_PERIPHERALS_BASE + $7FF0;
 
 {ARM Interrupt Controller (See Section 7)}
 BCM2836_INTERRUPT_REGS_BASE    = BCM2836_PERIPHERALS_BASE + $B200; {Note: Broadcom states 0xB000 but the offsets begin at 0x200 so 0xB200 will be correct} 

 {ARM Timer (See Section 14)}
 BCM2836_TIMER_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $B400; {Note: Broadcom states 0xB000 but the offsets begin at 0x400 so 0xB400 will be correct} 
 
 {ARM Mailbox 0}
 BCM2836_MAILBOX0_REGS_BASE     = BCM2836_PERIPHERALS_BASE + $B880;
 
 {ARM Mailbox 1}
 {BCM2836_MAILBOX1_REGS_BASE} {Currently unknown} 

 {Power Management, Reset controller and Watchdog}
 BCM2836_PM_REGS_BASE           = BCM2836_PERIPHERALS_BASE + $100000;

 {Clock Management}
 BCM2836_CM_REGS_BASE           = BCM2836_PERIPHERALS_BASE + $101000;
 
 {PCM Clock}
 BCM2836_PCM_CLOCK_BASE         = BCM2836_PERIPHERALS_BASE + $101098;
 
 {Random Number Generator}
 BCM2836_RNG_REGS_BASE          = BCM2836_PERIPHERALS_BASE + $104000;
 
 {GPIO (See Section 6)}
 BCM2836_GPIO_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $200000;
 
 {UART0 (PL011) (See Section 13)}
 BCM2836_PL011_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $201000;

 {MMCI0}
 BCM2836_MMCI0_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $202000;
 
 {PCM / I2S Audio (See Section 8)}
 BCM2836_PCM_REGS_BASE          = BCM2836_PERIPHERALS_BASE + $203000;
 
 {SPI0 (See Section 10)}
 BCM2836_SPI0_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $204000;
  
 {BSC0 (I2C) (Broadcom Serial Controller)(See Section 3)}
 BCM2836_BSC0_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $205000;
 
 {PWM (Pulse Width Modulator)(See Section 9)}
 BCM2836_PWM_REGS_BASE          = BCM2836_PERIPHERALS_BASE + $20C000;
 
 {I2C/SPI Slave (See Section 11)}
 BCM2836_I2CSPI_REGS_BASE       = BCM2836_PERIPHERALS_BASE + $214000;
 
 {AUX (UART1, SPI1 and SPI2) (See Section 2)}
 BCM2836_AUX_REGS_BASE          = BCM2836_PERIPHERALS_BASE + $215000;
 
 {SD host controller (EMMC - External Mass Media Controller)(See Section 5)}
 BCM2836_SDHCI_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $300000;

 {SMI}
 BCM2836_SMI_REGS_BASE          = BCM2836_PERIPHERALS_BASE + $600000;
 
 {BSC1 (I2C) (Broadcom Serial Controller)(See Section 3)}
 BCM2836_BSC1_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $804000;
 
 {BSC2 (I2C) (Broadcom Serial Controller)(See Section 3)} {Note: BSC2 master is used dedicated with the HDMI interface and should not be used}
 BCM2836_BSC2_REGS_BASE         = BCM2836_PERIPHERALS_BASE + $805000;
 
 {USB (Synopsys DesignWare Hi-Speed USB 2.0 On-The-Go Controller)(See Section 15)}
 BCM2836_USB_REGS_BASE          = BCM2836_PERIPHERALS_BASE + $980000;

 {DMA controller (Channel 15 (See Section 4))}
 BCM2836_DMA15_REGS_BASE        = BCM2836_PERIPHERALS_BASE + $E05000;
 
const
 {IRQ lines of BCM2836 peripherals (IRQs 0-63 are those shared between the GPU and CPU, IRQs 64-95 are CPU-specific)}
 {IRQs 0 to 31 appear in the IRQ_pending_1 register}
 {System Timer}
 BCM2836_IRQ_SYSTEM_TIMER_0 = 0; {Already used by the VideoCore GPU (Do not use)}
 BCM2836_IRQ_SYSTEM_TIMER_1 = 1;
 BCM2836_IRQ_SYSTEM_TIMER_2 = 2; {Already used by the VideoCore GPU (Do not use)}
 BCM2836_IRQ_SYSTEM_TIMER_3 = 3;

 {Codec}
 BCM2836_IRQ_CODEC0         = 4;
 BCM2836_IRQ_CODEC1         = 5;
 BCM2836_IRQ_CODEC2         = 6;
 
 {JPEG}
 BCM2836_IRQ_JPEG           = 7;  {Also available as IRQ 74 in the IRQ_basic_pending register}
 
 {ISP}
 BCM2836_IRQ_ISP            = 8;
 
 {USB (Synopsys DesignWare Hi-Speed USB 2.0 On-The-Go Controller)} 
 BCM2836_IRQ_USB            = 9;  {Also available as IRQ 75 in the IRQ_basic_pending register}

 {3D}
 BCM2836_IRQ_3D             = 10; {Also available as IRQ 76 in the IRQ_basic_pending register} 
 
 {Transposer}
 BCM2836_IRQ_TRANSPOSER     = 11;
 
 {Multicore Sync}
 BCM2836_IRQ_MULTICORESYNC0 = 12;
 BCM2836_IRQ_MULTICORESYNC1 = 13;
 BCM2836_IRQ_MULTICORESYNC2 = 14;
 BCM2836_IRQ_MULTICORESYNC3 = 15;
  
 {DMA}
 BCM2836_IRQ_DMA0           = 16;
 BCM2836_IRQ_DMA1           = 17;
 BCM2836_IRQ_DMA2           = 18; {Also available as IRQ 77 in the IRQ_basic_pending register} 
 BCM2836_IRQ_DMA3           = 19; {Also available as IRQ 78 in the IRQ_basic_pending register} 
 BCM2836_IRQ_DMA4           = 20;
 BCM2836_IRQ_DMA5           = 21;
 BCM2836_IRQ_DMA6           = 22;
 BCM2836_IRQ_DMA7           = 23;
 BCM2836_IRQ_DMA8           = 24;
 BCM2836_IRQ_DMA9           = 25;
 BCM2836_IRQ_DMA10          = 26;
 BCM2836_IRQ_DMA11          = 27;
 BCM2836_IRQ_DMA12          = 28;
 
 {AUX (UART1, SPI1 and SPI2)}
 BCM2836_IRQ_AUX            = 29;
 
 {ARM}
 BCM2836_IRQ_ARM            = 30;
 
 {GPUDMA}
 BCM2836_IRQ_GPUDMA         = 31;
 
 {IRQs 32 to 63 appear in the IRQ_pending_2 register}
 {Hostport}
 BCM2836_IRQ_HOSTPORT       = 32;
 
 {Videoscaler}
 BCM2836_IRQ_VIDEOSCALER    = 33;
 
 {CCP2TX}
 BCM2836_IRQ_CCP2TX         = 34;
 
 {SDC}
 BCM2836_IRQ_SDC            = 35;
 
 {DSI0}
 BCM2836_IRQ_DSI0           = 36;
 
 {AVE}
 BCM2836_IRQ_AVE            = 37;
 
 {CAM}
 BCM2836_IRQ_CAM0           = 38;
 BCM2836_IRQ_CAM1           = 39;
 
 {HDMI}
 BCM2836_IRQ_HDMI0          = 40;
 BCM2836_IRQ_HDMI1          = 41;
 
 {Pixelvalve}
 BCM2836_IRQ_PIXELVALVE1    = 42;
 
 {I2C / SPI}
 BCM2836_IRQ_I2CSPI         = 43;
 
 {DSI1}
 BCM2836_IRQ_DSI1           = 44;
 
 {PWA}
 BCM2836_IRQ_PWA0           = 45;
 BCM2836_IRQ_PWA1           = 46;
 
 {CPR}
 BCM2836_IRQ_CPR            = 47;
 
 {SMI}
 BCM2836_IRQ_SMI            = 48;
 
 {GPIO}
 BCM2836_IRQ_GPIO_0         = 49;
 BCM2836_IRQ_GPIO_1         = 50;
 BCM2836_IRQ_GPIO_2         = 51;
 BCM2836_IRQ_GPIO_3         = 52;
 
 {I2C}
 BCM2836_IRQ_I2C            = 53; {Also available as IRQ 79 in the IRQ_basic_pending register} 
 
 {SPI}
 BCM2836_IRQ_SPI            = 54; {Also available as IRQ 80 in the IRQ_basic_pending register} 
 
 {I2S PCM sound} 
 BCM2836_IRQ_I2SPCM         = 55; {Also available as IRQ 81 in the IRQ_basic_pending register} 

 {SDIO}
 BCM2836_IRQ_SDIO           = 56; {Also available as IRQ 82 in the IRQ_basic_pending register} 
 
 {PL011 UART} 
 BCM2836_IRQ_PL011          = 57; {Also available as IRQ 83 in the IRQ_basic_pending register} 

 {Slimbus}
 BCM2836_IRQ_SLIMBUS        = 58;
 
 {VEC}
 BCM2836_IRQ_VEC            = 59;
 
 {CPG}
 BCM2836_IRQ_CPG            = 60;
 
 {RNG}
 BCM2836_IRQ_RNG            = 61;
 
 {SD card host controller (EMMC)} 
 BCM2836_IRQ_SDHCI          = 62; {Also available as IRQ 84 in the IRQ_basic_pending register} 
 
 {AVSPMON}
 BCM2836_IRQ_AVSPMON        = 63;
 
 {IRQs 64 to 95 appear in the IRQ_basic_pending register}
 {ARM Timer}
 BCM2836_IRQ_ARM_TIMER        = 64;  {ARM IRQ 0}
 
 {ARM Mailbox}
 BCM2836_IRQ_ARM_MAILBOX      = 65;  {ARM IRQ 1}
 
 {ARM Doorbell}
 BCM2836_IRQ_ARM_DOORBELL0    = 66;  {ARM IRQ 2}
 BCM2836_IRQ_ARM_DOORBELL1    = 67;  {ARM IRQ 3}
 
 {ARM GPU Halted}
 BCM2836_IRQ_ARM_GPU0HALTED   = 68;  {ARM IRQ 4}
 BCM2836_IRQ_ARM_GPU1HALTED   = 69;  {ARM IRQ 5}
 
 {ARM Illegal Access}
 BCM2836_IRQ_ARM_ILLEGALTYPE0 = 70;  {ARM IRQ 6}
 BCM2836_IRQ_ARM_ILLEGALTYPE1 = 71;  {ARM IRQ 7}
 
 {ARM Pending}
 BCM2836_IRQ_ARM_PENDING0     = 72;  {ARM IRQ 8}
 BCM2836_IRQ_ARM_PENDING1     = 73;  {ARM IRQ 9}
 
 {ARM JPEG}
 BCM2836_IRQ_ARM_JPEG         = 74;  {ARM IRQ 10}
 
 {ARM USB}
 BCM2836_IRQ_ARM_USB          = 75;  {ARM IRQ 11}
 
 {ARM 3D}
 BCM2836_IRQ_ARM_3D           = 76;  {ARM IRQ 12}
 
 {ARM DMA}
 BCM2836_IRQ_ARM_DMA2         = 77;  {ARM IRQ 13}
 BCM2836_IRQ_ARM_DMA3         = 78;  {ARM IRQ 14}
 
 {ARM I2C}
 BCM2836_IRQ_ARM_I2C          = 79;  {ARM IRQ 15}
 
 {ARM SPI}
 BCM2836_IRQ_ARM_SPI          = 80;  {ARM IRQ 16}
 
 {ARM I2SPCM}
 BCM2836_IRQ_ARM_I2SPCM       = 81;  {ARM IRQ 17}
 
 {ARM SDIO}
 BCM2836_IRQ_ARM_SDIO         = 82;  {ARM IRQ 18}
 
 {ARM PL011 UART}
 BCM2836_IRQ_ARM_PL011        = 83;  {ARM IRQ 19}
 
 {ARM SDHCI}
 BCM2836_IRQ_ARM_SDHCI        = 84;  {ARM IRQ 20}
 
 {IRQs 85 to 95 (ARM IRQs 21 to 31) are not assigned}
 
 {Number of IRQs shared between the GPU and ARM (These correspond to the IRQs that show up in the IRQ_pending_1 and IRQ_pending_2 registers)}
 BCM2836_GPU_IRQ_COUNT   = 64;

 {Number of ARM specific IRQs (These correspond to IRQs that show up in the first 8 bits of the IRQ_basic_pending register)}
 BCM2836_ARM_IRQ_COUNT = 32; 

 {Number of ARM local IRQs (These correspond to the IRQs that show up in the IRQPending register of the ARM Local registers}
 BCM2836_ARM_LOCAL_IRQ_COUNT = 32;
 
 {Total number of IRQs available}
 BCM2836_IRQ_COUNT = BCM2836_GPU_IRQ_COUNT + BCM2836_ARM_IRQ_COUNT + BCM2836_ARM_LOCAL_IRQ_COUNT; {128}

 {Total number of FIQs available}
 BCM2836_FIQ_COUNT = 1; {This relates only to the shared FIQs, there are more ARM Local FIQs available}

const
 {System Timer frequencies}
 BCM2836_SYSTEM_TIMER_FREQUENCY = 1000000; {Default clock frequency of the BCM2836 System Timer (1MHz)}

 {System Timer Control/Status register bits (See Section 12)} 
 BCM2836_SYSTEM_TIMER_CS_0 = (1 shl 0); {Already used by the VideoCore GPU (Do not use)}
 BCM2836_SYSTEM_TIMER_CS_1 = (1 shl 1);
 BCM2836_SYSTEM_TIMER_CS_2 = (1 shl 2); {Already used by the VideoCore GPU (Do not use)}
 BCM2836_SYSTEM_TIMER_CS_3 = (1 shl 3);

const
 {DMA Engine Interrupt Status register bits (See Section 4)} 
 BCM2836_DMA_INT_STATUS_0  = (1 shl 0);
 BCM2836_DMA_INT_STATUS_1  = (1 shl 1); 
 BCM2836_DMA_INT_STATUS_2  = (1 shl 2);
 BCM2836_DMA_INT_STATUS_3  = (1 shl 3); 
 BCM2836_DMA_INT_STATUS_4  = (1 shl 4); 
 BCM2836_DMA_INT_STATUS_5  = (1 shl 5); 
 BCM2836_DMA_INT_STATUS_6  = (1 shl 6); 
 BCM2836_DMA_INT_STATUS_7  = (1 shl 7); 
 BCM2836_DMA_INT_STATUS_8  = (1 shl 8); 
 BCM2836_DMA_INT_STATUS_9  = (1 shl 9); 
 BCM2836_DMA_INT_STATUS_10 = (1 shl 10); 
 BCM2836_DMA_INT_STATUS_11 = (1 shl 11); 
 BCM2836_DMA_INT_STATUS_12 = (1 shl 12); 
 BCM2836_DMA_INT_STATUS_13 = (1 shl 13); 
 BCM2836_DMA_INT_STATUS_14 = (1 shl 14); 
 BCM2836_DMA_INT_STATUS_15 = (1 shl 15); 
 
 {DMA Engine Enable register bits (See Section 4)} 
 BCM2836_DMA_ENABLE_0  = (1 shl 0);
 BCM2836_DMA_ENABLE_1  = (1 shl 1);
 BCM2836_DMA_ENABLE_2  = (1 shl 2);
 BCM2836_DMA_ENABLE_3  = (1 shl 3);
 BCM2836_DMA_ENABLE_4  = (1 shl 4);
 BCM2836_DMA_ENABLE_5  = (1 shl 5);
 BCM2836_DMA_ENABLE_6  = (1 shl 6);
 BCM2836_DMA_ENABLE_7  = (1 shl 7);
 BCM2836_DMA_ENABLE_8  = (1 shl 8);
 BCM2836_DMA_ENABLE_9  = (1 shl 9);
 BCM2836_DMA_ENABLE_10 = (1 shl 10);
 BCM2836_DMA_ENABLE_11 = (1 shl 11);
 BCM2836_DMA_ENABLE_12 = (1 shl 12);
 BCM2836_DMA_ENABLE_13 = (1 shl 13);
 BCM2836_DMA_ENABLE_14 = (1 shl 14);
 
 {DMA Engine DREQ Peripherals (See Section 4)}
 BCM2836_DMA_DREQ_NONE         = 0;
 BCM2836_DMA_DREQ_DSI0         = 1;
 BCM2836_DMA_DREQ_PCMTX        = 2;
 BCM2836_DMA_DREQ_PCMRX        = 3;
 BCM2836_DMA_DREQ_SMI          = 4;
 BCM2836_DMA_DREQ_PWM          = 5;
 BCM2836_DMA_DREQ_SPITX        = 6;
 BCM2836_DMA_DREQ_SPIRX        = 7;
 BCM2836_DMA_DREQ_BSCSPITX     = 8;
 BCM2836_DMA_DREQ_BSCSPIRX     = 9;
 BCM2836_DMA_DREQ_RESERVED1    = 10;
 BCM2836_DMA_DREQ_EMMC         = 11;
 BCM2836_DMA_DREQ_UARTTX       = 12;
 BCM2836_DMA_DREQ_SDHOST       = 13;
 BCM2836_DMA_DREQ_UARTRX       = 14;
 BCM2836_DMA_DREQ_DSI1         = 15;
 BCM2836_DMA_DREQ_SLIMBUS_MCTX = 16;
 BCM2836_DMA_DREQ_HDMI         = 17;
 BCM2836_DMA_DREQ_SLIMBUS_MCRX = 18;
 BCM2836_DMA_DREQ_SLIMBUS_DC0  = 19;
 BCM2836_DMA_DREQ_SLIMBUS_DC1  = 20;
 BCM2836_DMA_DREQ_SLIMBUS_DC2  = 21;
 BCM2836_DMA_DREQ_SLIMBUS_DC3  = 22;
 BCM2836_DMA_DREQ_SLIMBUS_DC4  = 23;
 BCM2836_DMA_DREQ_SCALER_FIFO0 = 24;
 BCM2836_DMA_DREQ_SCALER_FIFO1 = 25;
 BCM2836_DMA_DREQ_SCALER_FIFO2 = 26;
 BCM2836_DMA_DREQ_SLIMBUS_DC5  = 27;
 BCM2836_DMA_DREQ_SLIMBUS_DC6  = 28;
 BCM2836_DMA_DREQ_SLIMBUS_DC7  = 29;
 BCM2836_DMA_DREQ_SLIMBUS_DC8  = 30;
 BCM2836_DMA_DREQ_SLIMBUS_DC9  = 31;
 
 //To Do //More
 
const
 {Power Management, Reset controller and Watchdog}
 BCM2836_PM_PASSWORD               = $5A000000;
 
 BCM2836_PM_RSTC_WRCFG_CLR         = $FFFFFFCF;
 BCM2836_PM_RSTC_WRCFG_SET		   = $00000030;
 BCM2836_PM_RSTC_WRCFG_FULL_RESET  = $00000020;
 BCM2836_PM_RSTC_RESET		       = $00000102;

 BCM2836_PM_RSTS_HADPOR_SET        = $00001000;
 BCM2836_PM_RSTS_HADSRH_SET        = $00000400;
 BCM2836_PM_RSTS_HADSRF_SET        = $00000200;
 BCM2836_PM_RSTS_HADSRQ_SET        = $00000100;
 BCM2836_PM_RSTS_HADWRH_SET        = $00000040;
 BCM2836_PM_RSTS_HADWRF_SET        = $00000020;
 BCM2836_PM_RSTS_HADWRQ_SET        = $00000010;
 BCM2836_PM_RSTS_HADDRH_SET        = $00000004;
 BCM2836_PM_RSTS_HADDRF_SET        = $00000002;
 BCM2836_PM_RSTS_HADDRQ_SET        = $00000001;
 
 BCM2836_PM_WDOG_RESET	     	   = $00000000;
 BCM2836_PM_WDOG_TIME_MASK		   = $000FFFFF;
 
 BCM2836_PM_WDOG_TICKS_PER_SECOND      = (1 shl 16);
 BCM2836_PM_WDOG_TICKS_PER_MILLISECOND = (BCM2836_PM_WDOG_TICKS_PER_SECOND div 1000);
 
const
 {Clock Management} 
 BCM2836_CM_PASSWORD               = $5A000000;
 
 //To Do //More 
 
const 
 {Random Number Generator}
 BCM2836_RANDOM_DISABLE       = $00000000; {Disable Random Number Generator}
 BCM2836_RANDOM_ENABLE        = $00000001; {Enable Random Number Generator}
 BCM2836_RANDOM_DOUBLE_SPEED  = $00000002; {Double Speed Mode (Less Random)}
 
 //To Do //More //PCM/PWM/SPI/I2C/PL011 etc etc
 //To Do //More //Timer
 
const
 {BCM2836 Mailboxes}
 BCM2836_MAILBOX_0  = 0;
 BCM2836_MAILBOX_1  = 1;
 
 {BCM2836 Mailbox 0 channels (See https://github.com/raspberrypi/firmware/wiki/Mailboxes)}
 BCM2836_MAILBOX0_CHANNEL_POWER_MGMT         = 0;
 BCM2836_MAILBOX0_CHANNEL_FRAMEBUFFER        = 1;
 BCM2836_MAILBOX0_CHANNEL_UART               = 2;
 BCM2836_MAILBOX0_CHANNEL_VCHIQ              = 3;
 BCM2836_MAILBOX0_CHANNEL_LEDS               = 4;
 BCM2836_MAILBOX0_CHANNEL_BUTTONS            = 5;
 BCM2836_MAILBOX0_CHANNEL_TOUCHSCREEN        = 6;
 BCM2836_MAILBOX0_CHANNEL_UNKNOWN            = 7;
 BCM2836_MAILBOX0_CHANNEL_PROPERTYTAGS_ARMVC = 8;
 BCM2836_MAILBOX0_CHANNEL_PROPERTYTAGS_VCARM = 9;
 
 {BCM2836 Mailbox 1 channels (See https://github.com/raspberrypi/firmware/wiki/Mailboxes)}
  {Currently unknown} 
  
 {The BCM2836 mailboxes pass 28-bit messages (The low 4 bits of the 32-bit value are used to specify the channel)}
 BCM2836_MAILBOX_CHANNEL_MASK = $0000000F;  
 BCM2836_MAILBOX_DATA_MASK    = $FFFFFFF0;  
 
 {BCM2836 mailbox status flags}
 BCM2836_MAILBOX_STATUS_FULL  = $80000000;
 BCM2836_MAILBOX_STATUS_EMPTY = $40000000;
 
 {BCM2836 mailbox property tags (See https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface)}
 {VideoCore}
 BCM2836_MBOX_TAG_GET_FIRMWARE_REV  = $00000001;
 {Hardware}
 BCM2836_MBOX_TAG_GET_BOARD_MODEL   = $00010001;
 BCM2836_MBOX_TAG_GET_BOARD_REV	    = $00010002;

 BCM2836_MBOX_TAG_GET_MAC_ADDRESS	= $00010003;

 BCM2836_MBOX_TAG_GET_BOARD_SERIAL  = $00010004;
 
 BCM2836_MBOX_TAG_GET_ARM_MEMORY	= $00010005;
 BCM2836_MBOX_TAG_GET_VC_MEMORY	    = $00010006;

 BCM2836_MBOX_TAG_GET_CLOCKS        = $00010007;
 {Shared Resource Management}  
 BCM2836_MBOX_TAG_GET_POWER_STATE	= $00020001; {Response indicates current state}
 BCM2836_MBOX_TAG_GET_TIMING        = $00020002; {Response indicates wait time required after turning a device on before power is stable}
 BCM2836_MBOX_TAG_SET_POWER_STATE	= $00028001; {Response indicates new state, with/without waiting for the power to become stable}

 BCM2836_MBOX_TAG_GET_CLOCK_STATE   = $00030001;
 BCM2836_MBOX_TAG_SET_CLOCK_STATE   = $00038001;

 BCM2836_MBOX_TAG_GET_CLOCK_RATE	= $00030002;
 BCM2836_MBOX_TAG_SET_CLOCK_RATE	= $00038002;
 
 BCM2836_MBOX_TAG_GET_CLOCK_MAX_RATE = $00030004; {Return the maximum supported clock rate for the given clock. Clocks should not be set higher than this}
 BCM2836_MBOX_TAG_GET_CLOCK_MIN_RATE = $00030007; {Return the minimum supported clock rate for the given clock. This may be used when idle}
 
 BCM2836_MBOX_TAG_GET_TURBO         = $00030009; {Get the turbo state for index id. id should be 0. level will be zero for non-turbo and one for turbo}
 BCM2836_MBOX_TAG_SET_TURBO         = $00038009; {Set the turbo state for index id. id should be zero. level will be zero for non-turbo and one for turbo. This will cause GPU clocks to be set to maximum when enabled and minimum when disabled}
 
 BCM2836_MBOX_TAG_GET_STC           = $0003000b; {}
 {Voltage}
 BCM2836_MBOX_TAG_GET_VOLTAGE       = $00030003; {The voltage value may be clamped to the supported range. A value of 0x80000000 means the id was not valid}
 BCM2836_MBOX_TAG_SET_VOLTAGE       = $00038003; {The voltage value may be clamped to the supported range. A value of 0x80000000 means the id was not valid}
 
 BCM2836_MBOX_TAG_GET_MAX_VOLTAGE   = $00030005; {Return the maximum supported voltage rate for the given id. Voltages should not be set higher than this}
 BCM2836_MBOX_TAG_GET_MIN_VOLTAGE   = $00030008; {Return the minimum supported voltage rate for the given id. This may be used when idle}

 BCM2836_MBOX_TAG_GET_TEMP          = $00030006; {Return the temperature of the SoC in thousandths of a degree C. id should be zero}
 BCM2836_MBOX_TAG_GET_MAX_TEMP      = $0003000a; {Return the maximum safe temperature of the SoC in thousandths of a degree C. id should be zero. Overclock may be disabled above this temperature}
 
 BCM2836_MBOX_TAG_ALLOCATE_MEMORY   = $0003000c; {Allocates contiguous memory on the GPU. size and alignment are in bytes}
 BCM2836_MBOX_TAG_LOCK_MEMORY       = $0003000d; {Lock buffer in place, and return a bus address. Must be done before memory can be accessed}
 BCM2836_MBOX_TAG_UNLOCK_MEMORY     = $0003000e; {Unlock buffer. It retains contents, but may move. Needs to be locked before next use. status=0 is success}
 BCM2836_MBOX_TAG_RELEASE_MEMORY    = $0003000f; {Free the memory buffer. status=0 is success}
 
 BCM2836_MBOX_TAG_EXECUTE_CODE      = $00030010; {Calls the function at given (bus) address and with arguments given. E.g. r0 = fn(r0, r1, r2, r3, r4, r5); It blocks until call completes}
 BCM2836_MBOX_TAG_EXECUTE_QPU       = $00030011; {}
 BCM2836_MBOX_TAG_ENABLE_QPU        = $00030012; {}
 
 BCM2836_MBOX_TAG_GET_DISPMANX_HANDLE = $00030014; {Gets the mem_handle associated with a created dispmanx resource. This can be locked and the memory directly written from the arm to avoid having to copy the image data to GPU}
 BCM2836_MBOX_TAG_GET_EDID_BLOCK    = $00030020; {This reads the specified EDID block from attached HDMI/DVI device. There will always be at least one block of 128 bytes, but there may be additional blocks. You should keep requesting blocks (starting from 0) until the status returned is non-zero}
 
 BCM2836_MBOX_TAG_GET_CUSTOMER_OTP  = $00030021;
 BCM2836_MBOX_TAG_SET_CUSTOMER_OTP  = $00038021;
 {Frame Buffer}
 BCM2836_MBOX_TAG_ALLOCATE_BUFFER	= $00040001; {If the requested alignment is unsupported then the current base and size (which may be 0 if not allocated) is returned and no change occurs}
 BCM2836_MBOX_TAG_RELEASE_BUFFER	= $00048001; {Releases and disables the frame buffer}

 BCM2836_MBOX_TAG_SET_BLANK_SCREEN  = $00040002;
 BCM2836_MBOX_TAG_TST_BLANK_SCREEN  = $00044002;

 BCM2836_MBOX_TAG_GET_PHYSICAL_W_H	= $00040003; {Note that the "physical (display)" size is the size of the allocated buffer in memory, not the resolution of the video signal sent to the display device}
 BCM2836_MBOX_TAG_TEST_PHYSICAL_W_H	= $00044003;
 BCM2836_MBOX_TAG_SET_PHYSICAL_W_H	= $00048003;

 BCM2836_MBOX_TAG_GET_VIRTUAL_W_H	= $00040004; {Note that the "virtual (buffer)" size is the portion of buffer that is sent to the display device, not the resolution the buffer itself. This may be smaller than the allocated buffer size in order to implement panning}
 BCM2836_MBOX_TAG_TEST_VIRTUAL_W_H	= $00044004;
 BCM2836_MBOX_TAG_SET_VIRTUAL_W_H	= $00048004;

 BCM2836_MBOX_TAG_GET_DEPTH		    = $00040005;
 BCM2836_MBOX_TAG_TEST_DEPTH		= $00044005;
 BCM2836_MBOX_TAG_SET_DEPTH		    = $00048005;

 BCM2836_MBOX_TAG_GET_PIXEL_ORDER	= $00040006;
 BCM2836_MBOX_TAG_TEST_PIXEL_ORDER	= $00044005;
 BCM2836_MBOX_TAG_SET_PIXEL_ORDER	= $00048006;

 BCM2836_MBOX_TAG_GET_ALPHA_MODE	= $00040007;
 BCM2836_MBOX_TAG_TEST_ALPHA_MODE	= $00044007;
 BCM2836_MBOX_TAG_SET_ALPHA_MODE	= $00048007;

 BCM2836_MBOX_TAG_GET_PITCH		    = $00040008;
 BCM2836_MBOX_TAG_TST_PITCH         = $00044008;
 BCM2836_MBOX_TAG_SET_PITCH         = $00048008;
 
 BCM2836_MBOX_TAG_GET_VIRTUAL_OFFSET	= $00040009;  {Offset of display window within buffer}
 BCM2836_MBOX_TAG_TEST_VIRTUAL_OFFSET	= $00044009;
 BCM2836_MBOX_TAG_SET_VIRTUAL_OFFSET	= $00048009;

 BCM2836_MBOX_TAG_GET_OVERSCAN		= $0004000a;
 BCM2836_MBOX_TAG_TEST_OVERSCAN		= $0004400a;
 BCM2836_MBOX_TAG_SET_OVERSCAN		= $0004800a;

 BCM2836_MBOX_TAG_GET_PALETTE		= $0004000b;
 BCM2836_MBOX_TAG_TEST_PALETTE		= $0004400b;
 BCM2836_MBOX_TAG_SET_PALETTE		= $0004800b;

 BCM2836_MBOX_TAG_GET_LAYER         = $0004000c;
 BCM2836_MBOX_TAG_TST_LAYER         = $0004400c;
 BCM2836_MBOX_TAG_SET_LAYER         = $0004800c;
 
 BCM2836_MBOX_TAG_GET_TRANSFORM     = $0004000d;
 BCM2836_MBOX_TAG_TST_TRANSFORM     = $0004400d;
 BCM2836_MBOX_TAG_SET_TRANSFORM     = $0004800d;
 
 BCM2836_MBOX_TAG_TST_VSYNC         = $0004400e;
 BCM2836_MBOX_TAG_SET_VSYNC         = $0004800e;
 
 BCM2836_MBOX_TAG_SET_CURSOR_INFO   = $00008011;
 BCM2836_MBOX_TAG_SET_CURSOR_STATE  = $00008010;
 {Config}
 BCM2836_MBOX_TAG_GET_COMMAND_LINE  = $00050001;
 {Shared Resource Management} 
 BCM2836_MBOX_TAG_GET_DMA_CHANNELS  = $00060001; {Caller assumes that the VC has enabled all the usable DMA channels}
 {End}
 BCM2836_MBOX_TAG_END               = $00000000;
 
 {BCM2836 mailbox tag Get Board Revision values (See: http://elinux.org/RPi_HardwareHistory)}
 BCM2836_BOARD_REV_2B_1	    = $00A01041;
 BCM2836_BOARD_REV_2B_2	    = $00A21041;
 
 BCM2836_BOARD_REV_MASK     = $00FFFFFF; {Mask off the warranty bit}
 
 {BCM2836 mailbox tag Get Board Revision bit fields (See: https://github.com/AndrewFromMelbourne/raspberry_pi_revision)}
 BCM2836_BOARD_REVISION_PCB_MASK             = ($F shl 0);  {PCB Revision Number}
                                             
 BCM2836_BOARD_REVISION_MODEL_MASK           = ($FF shl 4); {Model Number}
 BCM2836_BOARD_REVISION_MODEL_A              = (0 shl 4);   {Model A (Cannot occur on BCM2836)}
 BCM2836_BOARD_REVISION_MODEL_B              = (1 shl 4);   {Model B (Cannot occur on BCM2836)}
 BCM2836_BOARD_REVISION_MODEL_APLUS          = (2 shl 4);   {Model A+ (Cannot occur on BCM2836)}
 BCM2836_BOARD_REVISION_MODEL_BPLUS          = (3 shl 4);   {Model B+ (Cannot occur on BCM2836)}
 BCM2836_BOARD_REVISION_MODEL_2B             = (4 shl 4);   {Model 2B}
 BCM2836_BOARD_REVISION_MODEL_ALPHA          = (5 shl 4);   {Unknown}
 BCM2836_BOARD_REVISION_MODEL_COMPUTE        = (6 shl 4);   {Compute Module (Cannot occur on BCM2836)}
 BCM2836_BOARD_REVISION_MODEL_UNKNOWN        = (7 shl 4);   {Unknown}
 BCM2836_BOARD_REVISION_MODEL_UNKNOWN2       = (8 shl 4);   {Unknown}
 BCM2836_BOARD_REVISION_MODEL_ZERO           = (9 shl 4);   {Model Zero (Cannot occur on BCM2836)}
                                             
 BCM2836_BOARD_REVISION_PROCESSOR_MASK       = ($F shl 12); {Processor Type}
 BCM2836_BOARD_REVISION_PROCESSOR_BCM2835    = (0 shl 12);  {BCM2835 (Cannot occur on BCM2836)}
 BCM2836_BOARD_REVISION_PROCESSOR_BCM2836    = (1 shl 12);  {BCM2836}
 
 BCM2836_BOARD_REVISION_MANUFACTURER_MASK    = ($F shl 16); {Manufacturer}
 BCM2836_BOARD_REVISION_MANUFACTURER_SONY    = (0 shl 16);  {Sony}
 BCM2836_BOARD_REVISION_MANUFACTURER_EGOMAN  = (1 shl 16);  {Egoman}
 BCM2836_BOARD_REVISION_MANUFACTURER_EMBEST  = (2 shl 16);  {Embest}
 BCM2836_BOARD_REVISION_MANUFACTURER_UNKNOWN = (3 shl 16);  {Unknown}
 BCM2836_BOARD_REVISION_MANUFACTURER_EMBEST2 = (4 shl 16);  {Embest}
 
 BCM2836_BOARD_REVISION_MEMORY_MASK          = ($7 shl 20); {Memory Size}
 BCM2836_BOARD_REVISION_MEMORY_256M          = (0 shl 20);  {256M}
 BCM2836_BOARD_REVISION_MEMORY_512M          = (1 shl 20);  {512M}
 BCM2836_BOARD_REVISION_MEMORY_1024M         = (2 shl 20);  {1024M}
                                             
 BCM2836_BOARD_REVISION_ENCODED_FLAG         = (1 shl 23);  {Endcoded Flag, if set then revision uses this encoding}
                                             
 BCM2836_BOARD_REVISION_MASK                 = $00FFFFFF;   {Mask off the warranty bits}
 
 {BCM2836 mailbox tag Power State devices}
 BCM2836_MBOX_POWER_DEVID_SDHCI		= 0;
 BCM2836_MBOX_POWER_DEVID_UART0		= 1;
 BCM2836_MBOX_POWER_DEVID_UART1		= 2;
 BCM2836_MBOX_POWER_DEVID_USB_HCD	= 3;
 BCM2836_MBOX_POWER_DEVID_I2C0		= 4;
 BCM2836_MBOX_POWER_DEVID_I2C1		= 5;
 BCM2836_MBOX_POWER_DEVID_I2C2		= 6;
 BCM2836_MBOX_POWER_DEVID_SPI		= 7;
 BCM2836_MBOX_POWER_DEVID_CCP2TX	= 8;

 {BCM2836 mailbox tag Power State requests}
 BCM2836_MBOX_SET_POWER_STATE_REQ_OFF	= (0 shl 0);
 BCM2836_MBOX_SET_POWER_STATE_REQ_ON	= (1 shl 0);
 BCM2836_MBOX_SET_POWER_STATE_REQ_WAIT	= (1 shl 1);

 {BCM2836 mailbox tag Power State values}
 BCM2836_MBOX_POWER_STATE_RESP_OFF	    = (0 shl 0);
 BCM2836_MBOX_POWER_STATE_RESP_ON	    = (1 shl 0);
 BCM2836_MBOX_POWER_STATE_RESP_NODEV	= (1 shl 1);  {Device doesn't exist}
 
 {BCM2836 mailbox tag Clock State/Rate ids}
 BCM2836_MBOX_CLOCK_ID_RESERVED = 0;
 BCM2836_MBOX_CLOCK_ID_EMMC	= 1;
 BCM2836_MBOX_CLOCK_ID_UART	= 2;
 BCM2836_MBOX_CLOCK_ID_ARM	= 3;
 BCM2836_MBOX_CLOCK_ID_CORE	= 4;
 BCM2836_MBOX_CLOCK_ID_V3D	= 5;
 BCM2836_MBOX_CLOCK_ID_H264	= 6;
 BCM2836_MBOX_CLOCK_ID_ISP	= 7;
 BCM2836_MBOX_CLOCK_ID_SDRAM = 8;
 BCM2836_MBOX_CLOCK_ID_PIXEL = 9;
 BCM2836_MBOX_CLOCK_ID_PWM	= 10;

 {BCM2836 mailbox tag Clock State requests}
 BCM2836_MBOX_SET_CLOCK_STATE_REQ_OFF	  = (0 shl 0);
 BCM2836_MBOX_SET_CLOCK_STATE_REQ_ON	  = (1 shl 0);
 BCM2836_MBOX_SET_CLOCK_STATE_REQ_NOCLOCK = (1 shl 1);  {Clock doesn't exist}

 {BCM2836 mailbox tag Clock State values}
 BCM2836_MBOX_CLOCK_STATE_RESP_OFF	      = (0 shl 0);
 BCM2836_MBOX_CLOCK_STATE_RESP_ON	      = (1 shl 0);
 BCM2836_MBOX_CLOCK_STATE_RESP_NOCLOCK	  = (1 shl 1);  {Clock doesn't exist}
 
 {BCM2836 mailbox tag Clock Rate turbo}
 BCM2836_MBOX_CLOCK_RATE_REQ_SKIP_TURBO  = (1 shl 0);
 
 {BCM2836 mailbox tag Voltage ids}
 BCM2836_MBOX_VOLTAGE_ID_RESERVED = $00000000;
 BCM2836_MBOX_VOLTAGE_ID_CORE     = $00000001;
 BCM2836_MBOX_VOLTAGE_ID_SDRAM_C  = $00000002;
 BCM2836_MBOX_VOLTAGE_ID_SDRAM_P  = $00000003;
 BCM2836_MBOX_VOLTAGE_ID_SDRAM_I  = $00000004;

 {BCM2836 mailbox tag Voltage values}
 BCM2836_MBOX_VOLTAGE_INVALID = $80000000;  {A value of 0x80000000 means the id was not valid}
 
 {BCM2836 mailbox tag Temperature ids}
 BCM2836_MBOX_TEMP_ID_SOC = 0;
 
 {BCM2836 mailbox tag Memory flags}
 BCM2836_MBOX_MEM_FLAG_DISCARDABLE      = (1 shl 0); {Can be resized to 0 at any time. Use for cached data}
 BCM2836_MBOX_MEM_FLAG_NORMAL           = (0 shl 2); {Normal allocating alias. Don't use from ARM}
 BCM2836_MBOX_MEM_FLAG_DIRECT           = (1 shl 2); {0xC alias uncached}
 BCM2836_MBOX_MEM_FLAG_COHERENT         = (2 shl 2); {0x8 alias. Non-allocating in L2 but coherent}
 BCM2836_MBOX_MEM_FLAG_L1_NONALLOCATING = (BCM2836_MBOX_MEM_FLAG_DIRECT or BCM2836_MBOX_MEM_FLAG_COHERENT); {Allocating in L2}
 BCM2836_MBOX_MEM_FLAG_ZERO             = (1 shl 4); {Initialise buffer to all zeros}
 BCM2836_MBOX_MEM_FLAG_NO_INIT          = (1 shl 5); {Don't initialise (default is initialise to all ones}
 BCM2836_MBOX_MEM_FLAG_HINT_PERMALOCK   = (1 shl 6); {Likely to be locked for long periods of time}

 {BCM2836 mailbox tag Blank Screen values}
 BCM2836_MBOX_BLANK_SCREEN_REQ_ON	  = (1 shl 0);
 
 {BCM2836 mailbox tag Pixel Order values}
 BCM2836_MBOX_PIXEL_ORDER_BGR		= 0;
 BCM2836_MBOX_PIXEL_ORDER_RGB		= 1;

 {BCM2836 mailbox tag Alpha Mode values}
 BCM2836_MBOX_ALPHA_MODE_0_OPAQUE	    = 0;
 BCM2836_MBOX_ALPHA_MODE_0_TRANSPARENT	= 1;
 BCM2836_MBOX_ALPHA_MODE_IGNORED		= 2;

 {BCM2836 mailbox tag Palette values}
 BCM2836_MBOX_PALETTE_INVALID = $00000001;

 {BCM2836 mailbox tag Cursor State values}
 BCM2836_MBOX_CURSOR_INVISIBLE = 0;
 BCM2836_MBOX_CURSOR_VISIBLE   = 1;
 
 {BCM2836 mailbox tag Cursor State flags}
 BCM2836_MBOX_CURSOR_STATE_DISPLAY_COORDS     = (0 shl 0);
 BCM2836_MBOX_CURSOR_STATE_FRAMEBUFFER_COORDS = (1 shl 0);

 {BCM2836 mailbox tag Cursor values}
 BCM2836_MBOX_CURSOR_INVALID = $00000001;
 
 {BCM2836 mailbox request / response codes}
 BCM2836_MBOX_REQUEST_CODE          = $00000000;
 BCM2836_MBOX_RESPONSE_CODE_SUCCESS	= $80000000;
 BCM2836_MBOX_RESPONSE_CODE_ERROR	= $80000001;

 {BCM2836 mailbox tag request / response codes}
 BCM2836_MBOX_TAG_REQUEST_CODE  = $00000000;
 BCM2836_MBOX_TAG_RESPONSE_CODE = $80000000;
 
const
 {BCM2836 GPIO constants}
 BCM2836_GPIO_PIN_COUNT = 54;

 {Function Select Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 BCM2836_GPFSEL0 = $00000000; {GPIO Function Select 0}
 BCM2836_GPFSEL1 = $00000004; {GPIO Function Select 1}
 BCM2836_GPFSEL2 = $00000008; {GPIO Function Select 2}
 BCM2836_GPFSEL3 = $0000000C; {GPIO Function Select 3}
 BCM2836_GPFSEL4 = $00000010; {GPIO Function Select 4}
 BCM2836_GPFSEL5 = $00000014; {GPIO Function Select 5}
 
 {Pin Output Set Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 BCM2836_GPSET0 = $0000001C; {GPIO Pin Output Set 0}
 BCM2836_GPSET1 = $00000020; {GPIO Pin Output Set 1}
 
 {Pin Output Clear Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 BCM2836_GPCLR0 = $00000028; {GPIO Pin Output Clear 0}
 BCM2836_GPCLR1 = $0000002C; {GPIO Pin Output Clear 1}
 
 {Pin Level Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Event Detect Status Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //To Do //See: BCM2835-ARM-Peripherals.pdf

 {Pin Rising Edge Detect Enable Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Falling Edge Detect Enable Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin High Detect Enable Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Low Detect Enable Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Async. Rising Edge Detect Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Async. Falling Edge Detect Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Pull-up/down Enable Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //BCM2836_GPPUD = 
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Pull-up/down Enable Clock Registers} //To Do  //these are not needed, see PBCM2836GPIORegisters
 //BCM2836_GPPUDCLK0 = 
 //BCM2836_GPPUDCLK1 = 
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Function Select Mask}
 BCM2836_GPFSEL_MASK = 7;     {Shift left by the appropriate value for each pin}
 
 {Function Select Values}
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Function Select Shifts}
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Output Set Mask}
 BCM2836_GPSET_MASK = 1;     {Shift left by the appropriate value for each pin}
 
 {Pin Output Set Values}
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 {Pin Output Clear Mask}
 BCM2836_GPCLR_MASK = 1;     {Shift left by the appropriate value for each pin}
 
 {Pin Output Clear Values}
 //To Do //See: BCM2835-ARM-Peripherals.pdf
 
 //To Do //Event detect/Rising/Falling/High/Low/Pullup/Pulldown etc etc
 
 //To Do //See Also: \u-boot-master\arch\arm\include\asm\arch-bcm2835\gpio.h
 
{==============================================================================}
const
 {BCM2836 ARM local constants (See: QA7 Rev3.4.pdf)}
 BCM2836_ARM_LOCAL_BASE  =  $40000000;
 BCM2836_ARM_LOCAL_SIZE  =  $0003FFFF;
 
 {Physical memory addresses of BCM2836 ARM local peripherals  (See: QA7 Rev3.4.pdf)}
 BCM2836_ARM_LOCAL_REGS_BASE     =  (BCM2836_ARM_LOCAL_BASE + $0000);
 
const
 {IRQ lines of BCM2836 ARM local peripherals (See: QA7 Rev3.4.pdf)}
 {IRQs 96 to 127 appear in the IRQPending register}
 {ARM Generic Timers}
 BCM2836_IRQ_LOCAL_ARM_CNTPSIRQ     = 96;   {ARM Local IRQ 0}
 BCM2836_IRQ_LOCAL_ARM_CNTPNSIRQ    = 97;   {ARM Local IRQ 1}
 BCM2836_IRQ_LOCAL_ARM_CNTHPIRQ     = 98;   {ARM Local IRQ 2}
 BCM2836_IRQ_LOCAL_ARM_CNTVIRQ      = 99;   {ARM Local IRQ 3} 
 
 {ARM Malboxes0-3}
 BCM2836_IRQ_LOCAL_ARM_MAILBOX0     = 100;  {ARM Local IRQ 4} 
 BCM2836_IRQ_LOCAL_ARM_MAILBOX1     = 101;  {ARM Local IRQ 5} 
 BCM2836_IRQ_LOCAL_ARM_MAILBOX2     = 102;  {ARM Local IRQ 6} 
 BCM2836_IRQ_LOCAL_ARM_MAILBOX3     = 103;  {ARM Local IRQ 7} 
 
 {GPU Int Routing}
 BCM2836_IRQ_LOCAL_ARM_GPU          = 104;  {ARM Local IRQ 8}
 
 {ARM Performance Monitoring}
 BCM2836_IRQ_LOCAL_ARM_PMU          = 105;  {ARM Local IRQ 9}
 
 {AXI Outstanding}
 BCM2836_IRQ_LOCAL_ARM_AXI          = 106;  {ARM Local IRQ 10}
 
 {ARM Local Timer}
 BCM2836_IRQ_LOCAL_ARM_TIMER        = 107;  {ARM Local IRQ 11}
 
 {ARM Local Peripherals 1-15 (Not Used)}
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL1  = 108;  {ARM Local IRQ 12}
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL2  = 109;  {ARM Local IRQ 13} 
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL3  = 110;  {ARM Local IRQ 14} 
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL4  = 111;  {ARM Local IRQ 15}  
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL5  = 112;  {ARM Local IRQ 16}  
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL6  = 113;  {ARM Local IRQ 17}  
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL7  = 114;  {ARM Local IRQ 18}  
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL8  = 115;  {ARM Local IRQ 19}  
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL9  = 116;  {ARM Local IRQ 20}  
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL10 = 117;  {ARM Local IRQ 21} 
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL11 = 118;  {ARM Local IRQ 22} 
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL12 = 119;  {ARM Local IRQ 23} 
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL13 = 120;  {ARM Local IRQ 24} 
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL14 = 121;  {ARM Local IRQ 25} 
 BCM2836_IRQ_LOCAL_ARM_PERIPHERAL15 = 122;  {ARM Local IRQ 26}
 
 {IRQs 123 to 127 (ARM Local IRQs 27 to 31) are not assigned}
 
const
 {ARM local Control register bits (See 4.2 Control register)} 
 BCM2836_ARM_LOCAL_CONTROL_APB_CLOCK     = (1 shl 8); {64-bit Core timer runs from the APB clock}
 BCM2836_ARM_LOCAL_CONTROL_CRYSTAL_CLOCK = (0 shl 8); {64-bit Core timer runs from the Crystal clock}
 BCM2836_ARM_LOCAL_CONTROL_INCREMENT_2   = (1 shl 9); {64-bit Core timer increments by 2}
 BCM2836_ARM_LOCAL_CONTROL_INCREMENT_1   = (0 shl 9); {64-bit Core timer increments by 1}
 
 {ARM local Core Timer Prescaler register bits (See 4.3 Core timer register)} 
  {Nothing}

 {ARM local GPU Interrupt Routing register bits (See 4.4 GPU interrupts routing)} 
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_IRQ0 = (0 shl 0); {GPU IRQ goes to IRQ input of core 0}
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_IRQ1 = (1 shl 0); {GPU IRQ goes to IRQ input of core 1}
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_IRQ2 = (2 shl 0); {GPU IRQ goes to IRQ input of core 2}
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_IRQ3 = (3 shl 0); {GPU IRQ goes to IRQ input of core 3}
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_FIQ0 = (0 shl 2); {GPU FIQ goes to FIQ input of core 0}
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_FIQ1 = (1 shl 2); {GPU FIQ goes to FIQ input of core 1}
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_FIQ2 = (2 shl 2); {GPU FIQ goes to FIQ input of core 2}
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_FIQ3 = (3 shl 2); {GPU FIQ goes to FIQ input of core 3}

 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_IRQ_MASK = (3 shl 0);
 BCM2836_ARM_LOCAL_GPU_INT_ROUTING_FIQ_MASK = (3 shl 2);
 
 {ARM local PM Interrupt Routing Set/Clear register bits (See 4.5 Performance monitors interrupts)} 
 BCM2836_ARM_LOCAL_PM_INT_ROUTING_IRQ0 = (1 shl 0); {Core 0 PM IRQ Enable (This bit is only valid if bit 4 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_PM_INT_ROUTING_IRQ1 = (1 shl 1); {Core 1 PM IRQ Enable (This bit is only valid if bit 5 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_PM_INT_ROUTING_IRQ2 = (1 shl 2); {Core 2 PM IRQ Enable (This bit is only valid if bit 6 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_PM_INT_ROUTING_IRQ3 = (1 shl 3); {Core 3 PM IRQ Enable (This bit is only valid if bit 7 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_PM_INT_ROUTING_FIQ0 = (1 shl 4); {Core 0 PM FIQ Enable (If set, this bit overrides the IRQ bit 0)}
 BCM2836_ARM_LOCAL_PM_INT_ROUTING_FIQ1 = (1 shl 5); {Core 1 PM FIQ Enable (If set, this bit overrides the IRQ bit 1)}
 BCM2836_ARM_LOCAL_PM_INT_ROUTING_FIQ2 = (1 shl 6); {Core 2 PM FIQ Enable (If set, this bit overrides the IRQ bit 2)}
 BCM2836_ARM_LOCAL_PM_INT_ROUTING_FIQ3 = (1 shl 7); {Core 3 PM FIQ Enable (If set, this bit overrides the IRQ bit 3)}

 {ARM local Core Timer Low register bits (See 4.3 Core timer register)} 
  {Nothing}
  
 {ARM local Core Timer High register bits (See 4.3 Core timer register)} 
  {Nothing}
 
 {ARM local Local Interrupt Routing0 (0-7) register bits (See 4.11 Local timer)} 
 BCM2836_ARM_LOCAL_INT_ROUTING0_TIMER_IRQ0 = (0 shl 0); {Local timer interrupt goes to Core 0 IRQ}
 BCM2836_ARM_LOCAL_INT_ROUTING0_TIMER_IRQ1 = (1 shl 0); {Local timer interrupt goes to Core 1 IRQ}
 BCM2836_ARM_LOCAL_INT_ROUTING0_TIMER_IRQ2 = (2 shl 0); {Local timer interrupt goes to Core 2 IRQ}
 BCM2836_ARM_LOCAL_INT_ROUTING0_TIMER_IRQ3 = (3 shl 0); {Local timer interrupt goes to Core 3 IRQ}
 BCM2836_ARM_LOCAL_INT_ROUTING0_TIMER_FIQ0 = (4 shl 0); {Local timer interrupt goes to Core 0 FIQ}
 BCM2836_ARM_LOCAL_INT_ROUTING0_TIMER_FIQ1 = (5 shl 0); {Local timer interrupt goes to Core 1 FIQ}
 BCM2836_ARM_LOCAL_INT_ROUTING0_TIMER_FIQ2 = (6 shl 0); {Local timer interrupt goes to Core 2 FIQ}
 BCM2836_ARM_LOCAL_INT_ROUTING0_TIMER_FIQ3 = (7 shl 0); {Local timer interrupt goes to Core 3 FIQ}
 
 {ARM local Local Interrupt Routing1 (8-15) register bits (See 4.11 Local timer)} 
  {Nothing}
  
 {ARM local AXI Outstanding Count register bits (See 4.9 Axi outstanding)} 
 BCM2836_ARM_LOCAL_AXI_COUNT_READ_MASK  = ($3FF shl 0); {Outstanding reads counter}
 BCM2836_ARM_LOCAL_AXI_COUNT_WRITE_MASK = ($3FF shl 16); {Outstanding writes counter}
 
 {ARM local AXI Outstanding IRQ register bits (Core 0 Only)(See 4.9 Axi outstanding)} 
 BCM2836_ARM_LOCAL_AXI_IRQ_ENABLE  = (1 shl 20);
 BCM2836_ARM_LOCAL_AXI_IRQ_TIMEOUT = ($FFFFF shl 0);

 {ARM local Local Timer Control register bits (See 4.11 Local timer)} 
 BCM2836_ARM_LOCAL_TIMER_CONTROL_INT_STATUS  = (1 shl 31);       {Interrupt flag (Read Only)}
 BCM2836_ARM_LOCAL_TIMER_CONTROL_INT_ENABLE  = (1 shl 29);       {Interrupt enable (1= enabled)}
 BCM2836_ARM_LOCAL_TIMER_CONTROL_ENABLE      = (1 shl 28);       {Timer enable (1 = enabled)}
 BCM2836_ARM_LOCAL_TIMER_CONTROL_VALUE_MASK = ($0FFFFFFF shl 0); {Re-load value}
 
 {ARM local Local Timer Clear Reload register bits (Write Only)(See 4.11 Local timer)} 
 BCM2836_ARM_LOCAL_TIMER_CLEAR_INT    = (1 shl 31); {Interrupt flag clear when written as 1 (Write Only)}
 BCM2836_ARM_LOCAL_TIMER_CLEAR_RELOAD = (1 shl 30); {Local timer reloaded when written as 1 (Write Only)}
 
 {ARM local Timer Interrupt Control register bits (See 4.6 Core Timers interrupts)}
 {Note: These are the ARM Generic Timers (See ARM Architecture Reference Manual)}
 BCM2836_ARM_LOCAL_TIMER_INT_CONTROL_CNTPSIRQ   = (1 shl 0); {Physical Secure Timer IRQ Enable (This bit is only valid if bit 4 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_TIMER_INT_CONTROL_CNTPNSIRQ  = (1 shl 1); {Physical Non Secure Timer IRQ Enable (This bit is only valid if bit 5 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_TIMER_INT_CONTROL_CNTHPIRQ   = (1 shl 2); {Hypervisor Timer IRQ Enable (This bit is only valid if bit 6 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_TIMER_INT_CONTROL_CNTVIRQ    = (1 shl 3); {Virtual Timer IRQ Enable (This bit is only valid if bit 7 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_TIMER_INT_CONTROL_CNTPSFIQ   = (1 shl 4); {Physical Secure Timer FIQ Enable (If set, this bit overrides the IRQ bit 0)} 
 BCM2836_ARM_LOCAL_TIMER_INT_CONTROL_CNTPNSFIQ  = (1 shl 5); {Physical Non Secure Timer FIQ Enable (If set, this bit overrides the IRQ bit 1)} 
 BCM2836_ARM_LOCAL_TIMER_INT_CONTROL_CNTHPFIQ   = (1 shl 6); {Hypervisor Timer FIQ Enable (If set, this bit overrides the IRQ bit 2)} 
 BCM2836_ARM_LOCAL_TIMER_INT_CONTROL_CNTVFIQ    = (1 shl 7); {Virtual Timer FIQ Enable (If set, this bit overrides the IRQ bit 3)} 
 
 {ARM local Mailbox Interrupt Control register bits (See 4.7 Core Mailboxes interrupts)}
 BCM2836_ARM_LOCAL_MAILBOX_INT_CONTROL_MAILBOX0IRQ = (1 shl 0); {Mailbox-0 IRQ Enable (This bit is only valid if bit 4 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_MAILBOX_INT_CONTROL_MAILBOX1IRQ = (1 shl 1); {Mailbox-1 IRQ Enable (This bit is only valid if bit 5 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_MAILBOX_INT_CONTROL_MAILBOX2IRQ = (1 shl 2); {Mailbox-2 IRQ Enable (This bit is only valid if bit 6 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_MAILBOX_INT_CONTROL_MAILBOX3IRQ = (1 shl 3); {Mailbox-3 IRQ Enable (This bit is only valid if bit 7 is clear otherwise it is ignored)}
 BCM2836_ARM_LOCAL_MAILBOX_INT_CONTROL_MAILBOX0FIQ = (1 shl 0); {Mailbox-0 FIQ Enable (If set, this bit overrides the IRQ bit 0)}
 BCM2836_ARM_LOCAL_MAILBOX_INT_CONTROL_MAILBOX1FIQ = (1 shl 0); {Mailbox-1 FIQ Enable (If set, this bit overrides the IRQ bit 1)}
 BCM2836_ARM_LOCAL_MAILBOX_INT_CONTROL_MAILBOX2FIQ = (1 shl 0); {Mailbox-2 FIQ Enable (If set, this bit overrides the IRQ bit 2)}
 BCM2836_ARM_LOCAL_MAILBOX_INT_CONTROL_MAILBOX3FIQ = (1 shl 0); {Mailbox-3 FIQ Enable (If set, this bit overrides the IRQ bit 3)}
 
 {ARM local IRQ Pending register bits (See 4.10 Core interrupt sources)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_CNTPSIRQ      = (1 shl 0);  {Physical Secure Timer Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_CNTPNSIRQ     = (1 shl 1);  {Physical Non Secure Timer Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_CNTHPIRQ      = (1 shl 2);  {Hypervisor Timer Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_CNTVIRQ       = (1 shl 3);  {Virtual Timer Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_MAILBOX0      = (1 shl 4);  {Mailbox 0 Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_MAILBOX1      = (1 shl 5);  {Mailbox 1 Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_MAILBOX2      = (1 shl 6);  {Mailbox 2 Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_MAILBOX3      = (1 shl 7);  {Mailbox 3 Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_GPU           = (1 shl 8);  {GPU Routed Interrupt (Can only be assigned to one core)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PMU           = (1 shl 9);  {Performance Monitor Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_AXI           = (1 shl 10); {AXI Outstanding Interrupt (Core 0 Only)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_TIMER         = (1 shl 11); {Local Timer Interrupt}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL1   = (1 shl 12); {Local Peripheral 1 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL2   = (1 shl 13); {Local Peripheral 2 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL3   = (1 shl 14); {Local Peripheral 3 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL4   = (1 shl 15); {Local Peripheral 4 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL5   = (1 shl 16); {Local Peripheral 5 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL6   = (1 shl 17); {Local Peripheral 6 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL7   = (1 shl 18); {Local Peripheral 7 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL8   = (1 shl 19); {Local Peripheral 8 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL9   = (1 shl 20); {Local Peripheral 9 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL10  = (1 shl 21); {Local Peripheral 10 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL11  = (1 shl 22); {Local Peripheral 11 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL12  = (1 shl 23); {Local Peripheral 12 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL13  = (1 shl 24); {Local Peripheral 13 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL14  = (1 shl 25); {Local Peripheral 14 Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_IRQ_PENDING_PERIPHERAL15  = (1 shl 26); {Local Peripheral 15 Interrupt (Not Used)}
 
 {ARM local FIQ Pending register bits (See 4.10 Core interrupt sources)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_CNTPSIRQ      = (1 shl 0);  {Physical Secure Timer Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_CNTPNSIRQ     = (1 shl 1);  {Physical Non Secure Timer Fast Interrupt}   
 BCM2836_ARM_LOCAL_FIQ_PENDING_CNTHPIRQ      = (1 shl 2);  {Hypervisor Timer Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_CNTVIRQ       = (1 shl 3);  {Virtual Timer Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_MAILBOX0      = (1 shl 4);  {Mailbox 0 Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_MAILBOX1      = (1 shl 5);  {Mailbox 1 Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_MAILBOX2      = (1 shl 6);  {Mailbox 2 Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_MAILBOX3      = (1 shl 7);  {Mailbox 3 Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_GPU           = (1 shl 8);  {GPU Routed Fast Interrupt (Can only be assigned to one core)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PMU           = (1 shl 9);  {Performance Monitor Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_TIMER         = (1 shl 11); {Local Timer Fast Interrupt}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL1   = (1 shl 12); {Local Peripheral 1 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL2   = (1 shl 13); {Local Peripheral 2 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL3   = (1 shl 14); {Local Peripheral 3 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL4   = (1 shl 15); {Local Peripheral 4 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL5   = (1 shl 16); {Local Peripheral 5 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL6   = (1 shl 17); {Local Peripheral 6 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL7   = (1 shl 18); {Local Peripheral 7 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL8   = (1 shl 19); {Local Peripheral 8 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL9   = (1 shl 20); {Local Peripheral 9 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL10  = (1 shl 21); {Local Peripheral 10 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL11  = (1 shl 22); {Local Peripheral 11 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL12  = (1 shl 23); {Local Peripheral 12 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL13  = (1 shl 24); {Local Peripheral 13 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL14  = (1 shl 25); {Local Peripheral 14 Fast Interrupt (Not Used)}
 BCM2836_ARM_LOCAL_FIQ_PENDING_PERIPHERAL15  = (1 shl 26); {Local Peripheral 15 Fast Interrupt (Not Used)}
 
{==============================================================================}
type 
 {BCM2836 specific structures}
 
 {Layout of the BCM2836 Interrupt Controller registers (See 7.5)}
 PBCM2836InterruptRegisters = ^TBCM2836InterruptRegisters;
 TBCM2836InterruptRegisters = record
  IRQ_basic_pending:LongWord;
  IRQ_pending_1:LongWord;
  IRQ_pending_2:LongWord;
  FIQ_control:LongWord;
  Enable_IRQs_1:LongWord;
  Enable_IRQs_2:LongWord;
  Enable_Basic_IRQs:LongWord;
  Disable_IRQs_1:LongWord;
  Disable_IRQs_2:LongWord;
  Disable_Basic_IRQs:LongWord;
 end;

type
 {Layout of the BCM2836 System Timer registers (See 12.1)}
 PBCM2836SystemTimerRegisters = ^TBCM2836SystemTimerRegisters;
 TBCM2836SystemTimerRegisters = record
  CS:LongWord;  {System Timer Control/Status}
  CLO:LongWord; {System Timer Counter Lower 32 bits}
  CHI:LongWord; {System Timer Counter Higher 32 bits}
  C0:LongWord;  {System Timer Compare 0. Already used by the VideoCore GPU (Do not use)}
  C1:LongWord;  {System Timer Compare 1}
  C2:LongWord;  {System Timer Compare 2. Already used by the VideoCore GPU (Do not use)}
  C3:LongWord;  {System Timer Compare 3}
 end;
 
type
 {Layout of the BCM2836 DMA Channel registers (See 4.2.1.2)}
 PBCM2836DMARegisters = ^TBCM2836DMARegisters;
 TBCM2836DMARegisters = record
  CS:LongWord;         {DMA Channel Control and Status}
  CONBLK_AD:LongWord;  {DMA Channel Control Block Address}
  TI:LongWord;         {DMA Channel CB Word 0 (Transfer Information)}
  SOURCE_AD:LongWord;  {DMA Channel CB Word 1 (Source Address)}
  DEST_AD:LongWord;    {DMA Channel CB Word 2 (Destination Address)}
  TXFR_LEN:LongWord;   {DMA Channel CB Word 3 (Transfer Length)}
  STRIDE:LongWord;     {DMA Channel CB Word 4 (2D Stride)}
  NEXTCONBK:LongWord;  {DMA Channel CB Word 5 (Next CB Address)}
  DEBUG:LongWord;      {DMA Channel Debug}
 end;
 
type
 {Layout of BCM2836 DMA Control Block structure (See 4.2.1.1)} {Must be 32byte (256bit) aligned}
 PBCM2836DMAControlBlock = ^TBCM2836DMAControlBlock;
 TBCM2836DMAControlBlock = record
  TransferInformation:LongWord;
  SourceAddress:LongWord;
  DestinationAddress:LongWord;
  TransferLength:LongWord;
  ModeStide:LongWord;
  NextControlBlockAddress:LongWord;
  Reserved1:LongWord;
  Reserved2:LongWord;
 end;
 
type
 {Layout of the BCM2836 BSC (I2C) registers (See 3.2)}
 PBCM2836BSCRegisters = ^TBCM2836BSCRegisters;
 TBCM2836BSCRegisters = record
  C:LongWord;    {Control}
  S:LongWord;    {Status}
  DLEN:LongWord; {Data Length}
  A:LongWord;    {Slave Address}
  FIFO:LongWord; {Data FIFO}
  CDIV:LongWord; {Clock Divider}
  DEL:LongWord;  {Data Delay}
 end;
 
type
 {Layout of the BCM2836 SPI0 registers (See 10.5)}
 PBCM2836SPI0Registers = ^TBCM2836SPI0Registers;
 TBCM2836SPI0Registers = record
  CS:LongWord;    {SPI Master Control and Status}
  FIFO:LongWord;  {SPI Master TX and RX FIFOs}
  CLK:LongWord;   {SPI Master Clock Divider}
  DLEN:LongWord;  {SPI Master Data Length}
  LTOH:LongWord;  {SPI LOSSI mode TOH}
  DC:LongWord;    {SPI DMA DREQ Controls}
 end;
 
type
 {Layout of the BCM2836 I2C / SPI Slave registers (See 11.2)}
 PBCM2836I2CSPIRegisters = ^TBCM2836I2CSPIRegisters;
 TBCM2836I2CSPIRegisters = record
  DR:LongWord;         {Data Register}
  RSR:LongWord;        {Operation status register and error clear register}
  SLV:LongWord;        {I2C SPI Address Register holds the I2C slave address value}
  CR:LongWord;         {Control register is used to configure the I2C or SPI operation}
  FR:LongWord;         {Flag register}
  IFLS:LongWord;       {Interrupt fifo level select register}
  IMSC:LongWord;       {Interupt Mask Set Clear Register}
  RIS:LongWord;        {Raw Interupt Status Register}
  MIS:LongWord;        {Masked Interupt Status Register}
  ICR:LongWord;        {Interupt Clear Register}
  DMACR:LongWord;      {DMA Control Register}
  TDR:LongWord;        {FIFO Test Data Register}
  GPUSTAT:LongWord;    {GPU Status Register}
  HCTRL:LongWord;      {Host Control Register}
  DEBUG1:LongWord;     {I2C Debug Register}
  DEBUG2:LongWord;     {SPI Debug Register}
 end;
 
type
 {Layout of the BCM2836 AUX (UART1, SPI1 and SPI2) registers (See 2.1)}
 PBCM2836AUXRegisters = ^TBCM2836AUXRegisters;
 TBCM2836AUXRegisters = record
  AUX_IRQ:LongWord;        {Auxiliary Interrupt status}
  AUX_ENABLE:LongWord;     {Auxiliary enables}
  Reserved01:LongWord;
  Reserved02:LongWord;
  Reserved03:LongWord;
  Reserved04:LongWord;
  Reserved05:LongWord;
  Reserved06:LongWord;
  Reserved07:LongWord;
  Reserved08:LongWord;
  Reserved09:LongWord;
  Reserved0A:LongWord;
  Reserved0B:LongWord;
  Reserved0C:LongWord;
  Reserved0D:LongWord;
  Reserved0E:LongWord;
  AUX_MU_IO:LongWord;      {Mini Uart I/O Data}
  AUX_MU_IER:LongWord;     {Mini Uart Interrupt Enable}
  AUX_MU_IIR:LongWord;     {Mini Uart Interrupt Identify}
  AUX_MU_LCR:LongWord;     {Mini Uart Line Control}
  AUX_MU_MCR:LongWord;     {Mini Uart Modem Control}
  AUX_MU_LSR:LongWord;     {Mini Uart Line Status}
  AUX_MU_MSR:LongWord;     {Mini Uart Modem Status}
  AUX_MU_SCRATCH:LongWord; {Mini Uart Scratch}
  AUX_MU_CNTL:LongWord;    {Mini Uart Extra Control}
  AUX_MU_STAT:LongWord;    {Mini Uart Extra Status}
  AUX_MU_BAUD:LongWord;    {Mini Uart Baudrate}
  Reserved11:LongWord;
  Reserved12:LongWord;
  Reserved13:LongWord;
  Reserved14:LongWord;
  Reserved15:LongWord;
  AUX_SPI1_CNTL0:LongWord; {SPI 1 Control register 0}
  AUX_SPI1_CNTL1:LongWord; {SPI 1 Control register 1}
  AUX_SPI1_STAT:LongWord;  {SPI 1 Status}
  Reserved21:LongWord;
  AUX_SPI1_IO:LongWord;    {SPI 1 Data}
  AUX_SPI1_PEEK:LongWord;  {SPI 1 Peek}
  Reserved31:LongWord;
  Reserved32:LongWord;
  Reserved33:LongWord;
  Reserved34:LongWord;
  Reserved35:LongWord;
  Reserved36:LongWord;
  Reserved37:LongWord;
  Reserved38:LongWord;
  Reserved39:LongWord;
  Reserved3A:LongWord;
  AUX_SPI2_CNTL0:LongWord; {SPI 2 Control register 0}
  AUX_SPI2_CNTL1:LongWord; {SPI 2 Control register 1}
  AUX_SPI2_STAT:LongWord;  {SPI 2 Status}
  Reserved40:LongWord;
  AUX_SPI2_IO:LongWord;    {SPI 2 Data}
  AUX_SPI2_PEEK:LongWord;  {SPI 2 Peek}
 end;
 
type
 {Layout of the BCM2836 PCM / I2S registers (See 8.8)}
 PBCM2836PCMRegisters = ^TBCM2836PCMRegisters; 
 TBCM2836PCMRegisters = record
  CS_A:LongWord;     {PCM Control and Status}
  FIFO_A:LongWord;   {PCM FIFO Data}
  MODE_A:LongWord;   {PCM Mode}
  RXC_A:LongWord;    {PCM Receive Configuration}
  TXC_A:LongWord;    {PCM Transmit Configuration}
  DREQ_A:LongWord;   {PCM DMA Request Level}
  INTEN_A:LongWord;  {PCM Interrupt Enables}
  INTSTC_A:LongWord; {PCM Interrupt Status & Clear}
  GRAY:LongWord;     {PCM Gray Mode Control}
 end;
 
type
 {Layout of the BCM2836 Pulse Width Modulator (PWM) registers (See 9.6)}
 PBCM2836PWMRegisters = ^TBCM2836PWMRegisters; 
 TBCM2836PWMRegisters = record
  CTL:LongWord;         {PWM Control}
  STA:LongWord;         {PWM Status}
  DMAC:LongWord;        {PWM DMA Configuration}
  Reserved1:LongWord;   
  RNG1:LongWord;        {PWM Channel 1 Range}
  DAT1:LongWord;        {PWM Channel 1 Data}
  FIF1:LongWord;        {PWM FIFO Input}
  Reserved2:LongWord;   
  RNG2:LongWord;        {PWM Channel 2 Range}
  DAT2:LongWord;        {PWM Channel 2 Data}
 end;
 
type
 {Layout of the BCM2836 PL011 UART registers (See 13.4)}
 PBCM2836PL011Registers = ^TBCM2836PL011Registers; 
 TBCM2836PL011Registers = record
  DR:LongWord;       {Data Register}
  RSRECR:LongWord;   {Receive Status Register / Error Clear Register}
  Reserved01:LongWord;
  Reserved02:LongWord;
  Reserved03:LongWord;
  Reserved04:LongWord;
  FR:LongWord;       {Flag register}
  ILPR:LongWord;     {Not in use}
  IBRD:LongWord;     {Integer Baud rate divisor}
  FBRD:LongWord;     {Fractional Baud rate divisor}
  LCRH:LongWord;     {Line Control register}
  CR:LongWord;       {Control register}
  IFLS:LongWord;     {Interupt FIFO Level Select Register}
  IMSC:LongWord;     {Interupt Mask Set Clear Register}
  RIS:LongWord;      {Raw Interupt Status Register}
  MIS:LongWord;      {Masked Interupt Status Register}
  ICR:LongWord;      {Interupt Clear Register}
  DMACR:LongWord;    {DMA Control Register}
  Reserved11:LongWord;
  Reserved12:LongWord;
  Reserved13:LongWord;
  Reserved14:LongWord;
  Reserved15:LongWord;
  Reserved16:LongWord;
  Reserved17:LongWord;
  Reserved18:LongWord;
  Reserved19:LongWord;
  Reserved1A:LongWord;
  Reserved1B:LongWord;
  Reserved1C:LongWord;
  Reserved1D:LongWord;
  ITCR:LongWord;     {Test Control Register}
  ITIP:LongWord;     {Integration Test Input Register}
  ITOP:LongWord;     {Integration Test Output Register}
  TDR:LongWord;      {Test Data Register}
 end;
 
type
 {Layout of the BCM2836 ARM Timer registers (See 14.2)}
 PBCM2836ARMTimerRegisters = ^TBCM2836ARMTimerRegisters;
 TBCM2836ARMTimerRegisters = record
  Load:LongWord;        {Timer Load register}
  Value:LongWord;       {Timer Value register}
  Control:LongWord;     {Timer control register}
  IRQClear:LongWord;    {Timer IRQ clear register}
  RawIRQ:LongWord;      {Timer Raw IRQ register}
  MaskedIRQ:LongWord;   {Timer Masked IRQ register}
  Reload:LongWord;      {Timer Reload register}
  Predivider:LongWord;  {The timer pre-divider register}
  Counter:LongWord;     {Free running counter}
 end;
 
type
 {Layout of the BCM2836 Power Management Watchdog registers}
 PBCM2836PMWatchdogRegisters = ^TBCM2836PMWatchdogRegisters; 
 TBCM2836PMWatchdogRegisters = record 
  Reserved1:LongWord;
  Reserved2:LongWord;
  Reserved3:LongWord;
  Reserved4:LongWord;
  Reserved5:LongWord;
  Reserved6:LongWord;
  Reserved7:LongWord;
  RSTC:LongWord;
  RSTS:LongWord;
  WDOG:LongWord;
 end;
 
type
 {Layout of the BCM2836 Random Number Generator registers}
 PBCM2836RNGRegisters = ^TBCM2836RNGRegisters;
 TBCM2836RNGRegisters = record
  Control:LongWord;
  Status:LongWord;
  Data:LongWord;
  FFThreshold:LongWord;
 end;
 
type
 {Layout of the BCM2836 GPIO registers (See 6.1)} 
 PBCM2836GPIORegisters = ^TBCM2836GPIORegisters;
 TBCM2836GPIORegisters = record
  GPFSEL0:LongWord;     {GPIO Function Select 0}
  GPFSEL1:LongWord;     {GPIO Function Select 1}
  GPFSEL2:LongWord;     {GPIO Function Select 2}
  GPFSEL3:LongWord;     {GPIO Function Select 3}
  GPFSEL4:LongWord;     {GPIO Function Select 4}
  GPFSEL5:LongWord;     {GPIO Function Select 5}
  Reserved1:LongWord;
  GPSET0:LongWord;      {GPIO Pin Output Set 0}
  GPSET1:LongWord;      {GPIO Pin Output Set 1}
  Reserved2:LongWord;
  GPCLR0:LongWord;      {GPIO Pin Output Clear 0}
  GPCLR1:LongWord;      {GPIO Pin Output Clear 1}
  Reserved3:LongWord;
  GPLEV0:LongWord;      {GPIO Pin Level 0}
  GPLEV1:LongWord;      {GPIO Pin Level 1}
  Reserved4:LongWord;
  GPEDS0:LongWord;      {GPIO Pin Event Detect Status 0}
  GPEDS1:LongWord;      {GPIO Pin Event Detect Status 1}
  Reserved5:LongWord;
  GPREN0:LongWord;      {GPIO Pin Rising Edge Detect Enable 0}
  GPREN1:LongWord;      {GPIO Pin Rising Edge Detect Enable 1}
  Reserved6:LongWord;
  GPFEN0:LongWord;      {GPIO Pin Falling Edge Detect Enable 0}
  GPFEN1:LongWord;      {GPIO Pin Falling Edge Detect Enable 1}
  Reserved7:LongWord;
  GPHEN0:LongWord;      {GPIO Pin High Detect Enable 0}
  GPHEN1:LongWord;      {GPIO Pin High Detect Enable 1}
  Reserved8:LongWord;
  GPLEN0:LongWord;      {GPIO Pin Low Detect Enable 0}
  GPLEN1:LongWord;      {GPIO Pin Low Detect Enable 1}
  Reserved9:LongWord;
  GPAREN0:LongWord;     {GPIO Pin Async. Rising Edge Detect 0}
  GPAREN1:LongWord;     {GPIO Pin Async. Rising Edge Detect 1}
  Reserved10:LongWord;
  GPAFEN0:LongWord;     {GPIO Pin Async. Falling Edge Detect 0}
  GPAFEN1:LongWord;     {GPIO Pin Async. Falling Edge Detect 1}
  Reserved11:LongWord;
  GPPUD:LongWord;       {GPIO Pin Pull-up/down Enable}
  GPPUDCLK0:LongWord;   {GPIO Pin Pull-up/down Enable Clock 0}
  GPPUDCLK1:LongWord;   {GPIO Pin Pull-up/down Enable Clock 1}
  Reserved12:LongWord;
  {Test:LongWord;}      {Test}
 end;
 
type
 {Layout of the BCM2836 Mailbox0 registers (See https://github.com/raspberrypi/firmware/wiki/Mailboxes)}
 PBCM2836Mailbox0Registers = ^TBCM2836Mailbox0Registers;
 TBCM2836Mailbox0Registers = record
  Read:LongWord;      {Offset 0x00}{The read register for mailbox 0}
  Reserved1:LongWord; {Offset 0x04}
  Reserved2:LongWord; {Offset 0x08}
  Reserved3:LongWord; {Offset 0x0C}
  Peek:LongWord;      {Offset 0x10}{Read from the mailbox without removing data from it}
  Sender:LongWord;    {Offset 0x14}{Sender ID (bottom 2 bits only)}
  Status:LongWord;    {Offset 0x18}{The status register for mailbox 0}
  Config:LongWord;    {Offset 0x1C}{The configuration register for mailbox 0 }
  Write:LongWord;     {Offset 0x20}{The write register for mailbox 0 (This is actually the read register for Mailbox 1)}
 end;
 
 {Layout of the BCM2836 Mailbox1 registers (See https://github.com/raspberrypi/firmware/wiki/Mailboxes)}
  {Currently Unknown}

type
 {Layout of the BCM2836 Mailbox Framebuffer request} {This structure must be 16 byte aligned when passed to the GPU}
 PBCM2836MailboxFramebuffer = ^TBCM2836MailboxFramebuffer;
 TBCM2836MailboxFramebuffer = record 
  PhysicalWidth:LongWord;  {Requested width of Physical Framebuffer}
  PhysicalHeight:LongWord; {Requested height of Physical Framebuffer}
  VirtualWidth:LongWord;   {Requested width of Virtual Display} 
  VirtualHeight:LongWord;  {Requested height of Virtual Display}
  Pitch:LongWord;	       {Zero on request, Number of Bytes per Row in response}
  Depth:LongWord;	       {Requested Colour Depth in Bits per Pixel}
  OffsetX:LongWord;	       {Requested X offset of Virtual Framebuffer}
  OffsetY:LongWord;	       {Requested Y offset of Virtual Framebuffer}
  Address:LongWord;	       {Framebuffer address (Zero on request, Failure if zero in response)}
  Size:LongWord;	       {Framebuffer size (Zero on request, Size in bytes in response)}
 end;
 
type
 {Layout of the BCM2836 Mailbox Property tags} {These structures must be 16 byte aligned when passed to the GPU}
 {Header}
 PBCM2836MailboxHeader = ^TBCM2836MailboxHeader;
 TBCM2836MailboxHeader = record
  Size:LongWord;  {Total buffer size in bytes (including the header values, the end tag and padding)}
  Code:LongWord;  {Request/response code }
 end;
 
 {Footer}
 PBCM2836MailboxFooter = ^TBCM2836MailboxFooter;
 TBCM2836MailboxFooter = record
  Tag:LongWord;   {BCM2836_MBOX_TAG_END}
 end;
 
 {Tag Header} 
 PBCM2836MailboxTagHeader = ^TBCM2836MailboxTagHeader;
 TBCM2836MailboxTagHeader = record
  Tag:LongWord;     {Tag identifier}
  Size:LongWord;    {Value buffer size in bytes}
  Length:LongWord;  {1 bit (MSB) request/response indicator (0=request, 1=response), 31 bits (LSB) value length in bytes}
 end;

 {Tag No Request}
 PBCM2836MailboxTagNoRequest = ^TBCM2836MailboxTagNoRequest;
 TBCM2836MailboxTagNoRequest = record
  {Nothing}
 end;
 
 {Tag No Response}
 PBCM2836MailboxTagNoResponse = ^TBCM2836MailboxTagNoResponse;
 TBCM2836MailboxTagNoResponse = record
  {Nothing}
 end;
 
 {Get Firmware Revision}
 TBCM2836MailboxTagFirmwareRevisionResponse = record
  Revision:LongWord;
 end;
 
 PBCM2836MailboxTagGetFirmwareRevision = ^TBCM2836MailboxTagGetFirmwareRevision;
 TBCM2836MailboxTagGetFirmwareRevision = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagFirmwareRevisionResponse);
 end;
 
 {Get Board Model}
 TBCM2836MailboxTagBoardModelResponse = record
  Model:LongWord;
 end;
 
 PBCM2836MailboxTagGetBoardModel = ^TBCM2836MailboxTagGetBoardModel;
 TBCM2836MailboxTagGetBoardModel = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagBoardModelResponse);
 end;

 {Get Board Revision}
 TBCM2836MailboxTagBoardRevisionResponse = record
  Revision:LongWord;
 end;
 
 PBCM2836MailboxTagGetBoardRevision = ^TBCM2836MailboxTagGetBoardRevision;
 TBCM2836MailboxTagGetBoardRevision = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagBoardRevisionResponse);
 end;
 
 {Get MAC Address}
 TBCM2836MailboxTagMACAddressResponse = record
  MAC:array[0..5] of Byte; {MAC address in network byte order}
  Padding:Word;
 end;
 
 PBCM2836MailboxTagGetMACAddress = ^TBCM2836MailboxTagGetMACAddress;
 TBCM2836MailboxTagGetMACAddress = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagMACAddressResponse);
 end;
 
 {Get Board Serial}
 TBCM2836MailboxTagBoardSerialResponse = record
  Serial:Int64;
 end;
 
 PBCM2836MailboxTagGetBoardSerial = ^TBCM2836MailboxTagGetBoardSerial;
 TBCM2836MailboxTagGetBoardSerial = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagBoardSerialResponse);
 end;
 
 {Get ARM Memory}
 TBCM2836MailboxTagARMMemoryResponse = record
  Address:LongWord; {Base address in bytes}
  Size:LongWord;    {Size in bytes}
 end;
 
 PBCM2836MailboxTagGetARMMemory = ^TBCM2836MailboxTagGetARMMemory;
 TBCM2836MailboxTagGetARMMemory = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagARMMemoryResponse);
 end;
 
 {Get VC Memory}
 TBCM2836MailboxTagVCMemoryResponse = record
  Address:LongWord; {Base address in bytes}
  Size:LongWord;    {Size in bytes}
 end;
 
 PBCM2836MailboxTagGetVCMemory = ^TBCM2836MailboxTagGetVCMemory;
 TBCM2836MailboxTagGetVCMemory = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagVCMemoryResponse);
 end;
 
 {Get Clocks}
 TBCM2836MailboxTagClockResponse = record
  ParentId:LongWord;
  ClockId:LongWord;
 end;
 
 TBCM2836MailboxTagClocksResponse = record
  Clocks:array[0..255] of TBCM2836MailboxTagClockResponse;
 end;
 
 PBCM2836MailboxTagGetClocks = ^TBCM2836MailboxTagGetClocks;
 TBCM2836MailboxTagGetClocks = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagClocksResponse);
 end;
 
 {Get Power State}
 TBCM2836MailboxTagGetPowerStateRequest = record
  DeviceId:LongWord; 
 end;
 
 TBCM2836MailboxTagPowerStateResponse = record
  DeviceId:LongWord; 
  State:LongWord;    
 end;
 
 PBCM2836MailboxTagGetPowerState = ^TBCM2836MailboxTagGetPowerState;
 TBCM2836MailboxTagGetPowerState = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetPowerStateRequest);
  1:(Response:TBCM2836MailboxTagPowerStateResponse);
 end;

 {Get Timing}
 TBCM2836MailboxTagTimingRequest = record
  DeviceId:LongWord; 
 end;
 
 TBCM2836MailboxTagTimingResponse = record
  DeviceId:LongWord; 
  Wait:LongWord;      {Enable wait time in microseconds}
 end;

 PBCM2836MailboxTagGetTiming = ^TBCM2836MailboxTagGetTiming;
 TBCM2836MailboxTagGetTiming = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagTimingRequest);
  1:(Response:TBCM2836MailboxTagTimingResponse);
 end;

 {Set Power State}
 TBCM2836MailboxTagSetPowerStateRequest = record
  DeviceId:LongWord; 
  State:LongWord;    
 end;

 PBCM2836MailboxTagSetPowerState = ^TBCM2836MailboxTagSetPowerState;
 TBCM2836MailboxTagSetPowerState = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagSetPowerStateRequest);
  1:(Response:TBCM2836MailboxTagPowerStateResponse);
 end;
 
 {Get Clock State}
 TBCM2836MailboxTagGetClockStateRequest = record
  ClockId:LongWord; 
 end;

 TBCM2836MailboxTagClockStateResponse = record
  ClockId:LongWord; 
  State:LongWord;
 end;

 PBCM2836MailboxTagGetClockState = ^TBCM2836MailboxTagGetClockState;
 TBCM2836MailboxTagGetClockState = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetClockStateRequest);
  1:(Response:TBCM2836MailboxTagClockStateResponse);
 end;

 {Set Clock State}
 TBCM2836MailboxTagSetClockStateRequest = record
  ClockId:LongWord; 
  State:LongWord;
 end;

 PBCM2836MailboxTagSetClockState = ^TBCM2836MailboxTagSetClockState;
 TBCM2836MailboxTagSetClockState = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagSetClockStateRequest);
  1:(Response:TBCM2836MailboxTagClockStateResponse);
 end;

 {Get Clock Rate}
 TBCM2836MailboxTagGetClockRateRequest = record
  ClockId:LongWord; 
 end;

 TBCM2836MailboxTagClockRateResponse = record
  ClockId:LongWord; 
  Rate:LongWord; {In Hz}
 end;
 
 PBCM2836MailboxTagGetClockRate = ^TBCM2836MailboxTagGetClockRate;
 TBCM2836MailboxTagGetClockRate = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetClockRateRequest);
  1:(Response:TBCM2836MailboxTagClockRateResponse);
 end;
 
 {Set Clock Rate}
 TBCM2836MailboxTagSetClockRateRequest = record
  ClockId:LongWord; 
  Rate:LongWord; {In Hz}
  SkipTurbo:LongWord;
 end;
 
 PBCM2836MailboxTagSetClockRate = ^TBCM2836MailboxTagSetClockRate;
 TBCM2836MailboxTagSetClockRate = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagSetClockRateRequest);
  1:(Response:TBCM2836MailboxTagClockRateResponse);
 end;

 {Get Clock Max Rate}
 TBCM2836MailboxTagGetClockMaxRateRequest = record
  ClockId:LongWord; 
 end;

 TBCM2836MailboxTagGetClockMaxRateResponse = record
  ClockId:LongWord; 
  Rate:LongWord; {In Hz}
 end;

 PBCM2836MailboxTagGetClockMaxRate = ^TBCM2836MailboxTagGetClockMaxRate;
 TBCM2836MailboxTagGetClockMaxRate = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetClockMaxRateRequest);
  1:(Response:TBCM2836MailboxTagGetClockMaxRateResponse);
 end;

 {Get Clock Min Rate}
 PBCM2836MailboxTagGetClockMinRate = ^TBCM2836MailboxTagGetClockMinRate;
 TBCM2836MailboxTagGetClockMinRate = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetClockMaxRateRequest);
  1:(Response:TBCM2836MailboxTagGetClockMaxRateResponse);
 end;
 
 {Get Turbo}
 TBCM2836MailboxTagGetTurboRequest = record
  Id:LongWord; 
 end;
 
 TBCM2836MailboxTagTurboResponse = record
  Id:LongWord; 
  Level:LongWord; 
 end;
 
 PBCM2836MailboxTagGetTurbo = ^TBCM2836MailboxTagGetTurbo;
 TBCM2836MailboxTagGetTurbo = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetTurboRequest);
  1:(Response:TBCM2836MailboxTagTurboResponse);
 end;
 
 {Set Turbo}
 TBCM2836MailboxTagSetTurboRequest = record
  Id:LongWord; 
  Level:LongWord; 
 end;
 
 PBCM2836MailboxTagSetTurbo = ^TBCM2836MailboxTagSetTurbo;
 TBCM2836MailboxTagSetTurbo = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagSetTurboRequest);
  1:(Response:TBCM2836MailboxTagTurboResponse);
 end;
 
 {Get Voltage}
 TBCM2836MailboxTagGetVoltageRequest = record
  VoltageId:LongWord; 
 end;
 
 TBCM2836MailboxTagVoltageResponse = record
  VoltageId:LongWord; 
  Value:LongWord;     {Offset from 1.2V in units of 0.025V}
 end;
 
 PBCM2836MailboxTagGetVoltage = ^TBCM2836MailboxTagGetVoltage;
 TBCM2836MailboxTagGetVoltage = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetVoltageRequest);
  1:(Response:TBCM2836MailboxTagVoltageResponse);
 end;
 
 {Set Voltage}
 TBCM2836MailboxTagSetVoltageRequest = record
  VoltageId:LongWord; 
  Value:LongWord;     {Offset from 1.2V in units of 0.025V}
 end;

 PBCM2836MailboxTagSetVoltage = ^TBCM2836MailboxTagSetVoltage;
 TBCM2836MailboxTagSetVoltage = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagSetVoltageRequest);
  1:(Response:TBCM2836MailboxTagVoltageResponse);
 end;
 
 {Get Max Voltage}
 PBCM2836MailboxTagGetMaxVoltage = ^TBCM2836MailboxTagGetMaxVoltage;
 TBCM2836MailboxTagGetMaxVoltage = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetVoltageRequest);
  1:(Response:TBCM2836MailboxTagVoltageResponse);
 end;

 {Get Min Voltage}
 PBCM2836MailboxTagGetMinVoltage = ^TBCM2836MailboxTagGetMinVoltage;
 TBCM2836MailboxTagGetMinVoltage = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetVoltageRequest);
  1:(Response:TBCM2836MailboxTagVoltageResponse);
 end;
 
 {Get Temperature}
 TBCM2836MailboxTagTemperatureRequest = record
  TemperatureId:LongWord; 
 end;

 TBCM2836MailboxTagTemperatureResponse = record
  TemperatureId:LongWord; {Should be zero}
  Temperature:LongWord;   {Return the temperature of the SoC in thousandths of a degree C} 
 end;
 
 PBCM2836MailboxTagGetTemperature = ^TBCM2836MailboxTagGetTemperature;
 TBCM2836MailboxTagGetTemperature = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagTemperatureRequest);
  1:(Response:TBCM2836MailboxTagTemperatureResponse);
 end;
 
 {Get Max Temp}
 PBCM2836MailboxTagGetMaxTemperature = ^TBCM2836MailboxTagGetMaxTemperature;
 TBCM2836MailboxTagGetMaxTemperature = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagTemperatureRequest);
  1:(Response:TBCM2836MailboxTagTemperatureResponse);
 end;
 
 {Allocate Memory}
 TBCM2836MailboxTagAllocateMemoryRequest = record
  Size:LongWord; 
  Alignment:LongWord; 
  Flags:LongWord; 
 end;
 
 TBCM2836MailboxTagAllocateMemoryResponse = record
  Handle:THandle;
 end;
 
 PBCM2836MailboxTagAllocateMemory = ^TBCM2836MailboxTagAllocateMemory;
 TBCM2836MailboxTagAllocateMemory = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagAllocateMemoryRequest);
  1:(Response:TBCM2836MailboxTagAllocateMemoryResponse);
 end;
 
 {Lock Memory}
 TBCM2836MailboxTagLockMemoryRequest = record
  Handle:THandle; 
 end;
 
 TBCM2836MailboxTagLockMemoryResponse = record
  Address:LongWord; {Bus Address}
 end;
 
 PBCM2836MailboxTagLockMemory = ^TBCM2836MailboxTagLockMemory;
 TBCM2836MailboxTagLockMemory = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagLockMemoryRequest);
  1:(Response:TBCM2836MailboxTagLockMemoryResponse);
 end;
 
 {Unlock Memory}
 TBCM2836MailboxTagUnlockMemoryResponse = record
  Status:LongWord; {0 is Success}
 end;
 
 PBCM2836MailboxTagUnlockMemory = ^TBCM2836MailboxTagUnlockMemory;
 TBCM2836MailboxTagUnlockMemory = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagLockMemoryRequest);
  1:(Response:TBCM2836MailboxTagUnlockMemoryResponse);
 end;
 
 {Release Memory}
 PBCM2836MailboxTagReleaseMemory = ^TBCM2836MailboxTagReleaseMemory;
 TBCM2836MailboxTagReleaseMemory = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagLockMemoryRequest);
  1:(Response:TBCM2836MailboxTagUnlockMemoryResponse);
 end;
 
 {Execute Code}
 TBCM2836MailboxTagExecuteCodeRequest = record
  Address:Pointer; {Bus Address}
  R0:LongWord;
  R1:LongWord;
  R2:LongWord;
  R3:LongWord;
  R4:LongWord;
  R5:LongWord;
 end;
 
 TBCM2836MailboxTagExecuteCodeResponse = record
  R0:LongWord;
 end;
 
 PBCM2836MailboxTagExecuteCode = ^TBCM2836MailboxTagExecuteCode;
 TBCM2836MailboxTagExecuteCode = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagExecuteCodeRequest);
  1:(Response:TBCM2836MailboxTagExecuteCodeResponse);
 end;
 
 {Get Dispmanx Handle}
 TBCM2836MailboxTagGetDispmanxHandleRequest = record
  Resource:THandle;
 end;
 
 TBCM2836MailboxTagGetDispmanxHandleResponse = record
  Status:LongWord; {0 is Success}
  Memory:THandle;
 end;
 
 PBCM2836MailboxTagGetDispmanxHandle = ^TBCM2836MailboxTagGetDispmanxHandle;
 TBCM2836MailboxTagGetDispmanxHandle = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetDispmanxHandleRequest);
  1:(Response:TBCM2836MailboxTagGetDispmanxHandleResponse);
 end;
 
 {Get EDID Block}
 TBCM2836MailboxTagGetEDIDBlockRequest = record
  Block:LongWord; {Starting from 0}
 end;
 
 TBCM2836MailboxTagGetEDIDBlockResponse = record
  Block:LongWord; {Starting from 0}
  Status:LongWord; {0 is Success}
  EDID:array[0..127] of Byte;
 end;
 
 PBCM2836MailboxTagGetEDIDBlock = ^TBCM2836MailboxTagGetEDIDBlock;
 TBCM2836MailboxTagGetEDIDBlock = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagGetEDIDBlockRequest);
  1:(Response:TBCM2836MailboxTagGetEDIDBlockResponse);
 end;
 
 {Allocate Buffer}
 TBCM2836MailboxTagAllocateBufferRequest = record
  Alignment:LongWord; {Bytes}
 end;
 
 TBCM2836MailboxTagAllocateBufferResponse = record
  Address:LongWord; {Base Address in Bytes}
  Size:LongWord;    {Size in Bytes}
 end;
 
 PBCM2836MailboxTagAllocateBuffer = ^TBCM2836MailboxTagAllocateBuffer;
 TBCM2836MailboxTagAllocateBuffer = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagAllocateBufferRequest);
  1:(Response:TBCM2836MailboxTagAllocateBufferResponse);
 end;
 
 {Release Buffer}
 PBCM2836MailboxTagReleaseBuffer = ^TBCM2836MailboxTagReleaseBuffer;
 TBCM2836MailboxTagReleaseBuffer = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagNoResponse);
 end;
 

 {Blank Screen}
 TBCM2836MailboxTagBlankScreenRequest = record
  State:LongWord;
 end;
 
 TBCM2836MailboxTagBlankScreenResponse = record
  State:LongWord;
 end;
 
 PBCM2836MailboxTagBlankScreen = ^TBCM2836MailboxTagBlankScreen;
 TBCM2836MailboxTagBlankScreen = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagBlankScreenRequest);
  1:(Response:TBCM2836MailboxTagBlankScreenResponse);
 end;
 
 {Get Physical}
 TBCM2836MailboxTagPhysicalRequest = record
  Width:LongWord;   {Pixels}
  Height:Longword;  {Pixels}
 end;

 TBCM2836MailboxTagPhysicalResponse = record
  Width:LongWord;   {Pixels}
  Height:Longword;  {Pixels}
 end;
 
 PBCM2836MailboxTagGetPhysical = ^TBCM2836MailboxTagGetPhysical;
 TBCM2836MailboxTagGetPhysical = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagPhysicalResponse);
 end;
 
 {Test Physical}
 PBCM2836MailboxTagTestPhysical = ^TBCM2836MailboxTagTestPhysical;
 TBCM2836MailboxTagTestPhysical = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagPhysicalRequest);
  1:(Response:TBCM2836MailboxTagPhysicalResponse);
 end;
 
 {Set Physical}
 PBCM2836MailboxTagSetPhysical = ^TBCM2836MailboxTagSetPhysical;
 TBCM2836MailboxTagSetPhysical = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagPhysicalRequest);
  1:(Response:TBCM2836MailboxTagPhysicalResponse);
 end;
 
 {Get Virtual}
 TBCM2836MailboxTagVirtualRequest = record
  Width:LongWord;   {Pixels}
  Height:Longword;  {Pixels}
 end;

 TBCM2836MailboxTagVirtualResponse = record
  Width:LongWord;   {Pixels}
  Height:Longword;  {Pixels}
 end;

 PBCM2836MailboxTagGetVirtual = ^TBCM2836MailboxTagGetVirtual;
 TBCM2836MailboxTagGetVirtual = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagVirtualResponse);
 end;
 
 {Test Virtual}
 PBCM2836MailboxTagTestVirtual = ^TBCM2836MailboxTagTestVirtual;
 TBCM2836MailboxTagTestVirtual = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagVirtualRequest);
  1:(Response:TBCM2836MailboxTagVirtualResponse);
 end;
 
 {Set Virtual}
 PBCM2836MailboxTagSetVirtual = ^TBCM2836MailboxTagSetVirtual;
 TBCM2836MailboxTagSetVirtual = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagVirtualRequest);
  1:(Response:TBCM2836MailboxTagVirtualResponse);
 end;
 
 {Get Depth}
 TBCM2836MailboxTagDepthRequest = record
  Depth:LongWord;   {Bits per pixel}
 end;

 TBCM2836MailboxTagDepthResponse = record
  Depth:LongWord;   {Bits per pixel}
 end;

 PBCM2836MailboxTagGetDepth = ^TBCM2836MailboxTagGetDepth;
 TBCM2836MailboxTagGetDepth = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagDepthResponse);
 end;
 
 {Test Depth}
 PBCM2836MailboxTagTestDepth = ^TBCM2836MailboxTagTestDepth;
 TBCM2836MailboxTagTestDepth = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagDepthRequest);
  1:(Response:TBCM2836MailboxTagDepthResponse);
 end;
 
 {Set Depth}
 PBCM2836MailboxTagSetDepth = ^TBCM2836MailboxTagSetDepth;
 TBCM2836MailboxTagSetDepth = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagDepthRequest);
  1:(Response:TBCM2836MailboxTagDepthResponse);
 end;
 
 {Get Pixel Order}
 TBCM2836MailboxTagPixelOrderRequest = record
  Order:LongWord;
 end;

 TBCM2836MailboxTagPixelOrderResponse = record
  Order:LongWord; 
 end;

 PBCM2836MailboxTagGetPixelOrder = ^TBCM2836MailboxTagGetPixelOrder;
 TBCM2836MailboxTagGetPixelOrder = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagPixelOrderResponse);
 end;
 
 {Test Pixel Order}
 PBCM2836MailboxTagTestPixelOrder = ^TBCM2836MailboxTagTestPixelOrder;
 TBCM2836MailboxTagTestPixelOrder = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagPixelOrderRequest);
  1:(Response:TBCM2836MailboxTagPixelOrderResponse);
 end;
 
 {Set Pixel Order}
 PBCM2836MailboxTagSetPixelOrder = ^TBCM2836MailboxTagSetPixelOrder;
 TBCM2836MailboxTagSetPixelOrder = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagPixelOrderRequest);
  1:(Response:TBCM2836MailboxTagPixelOrderResponse);
 end;
 
 {Get Alpha Mode}
 TBCM2836MailboxTagAlphaModeRequest = record
  Mode:LongWord;
 end;

 TBCM2836MailboxTagAlphaModeResponse = record
  Mode:LongWord; 
 end;

 PBCM2836MailboxTagGetAlphaMode = ^TBCM2836MailboxTagGetAlphaMode;
 TBCM2836MailboxTagGetAlphaMode = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagAlphaModeResponse);
 end;
 
 {Test Alpha Mode}
 PBCM2836MailboxTagTestAlphaMode = ^TBCM2836MailboxTagTestAlphaMode;
 TBCM2836MailboxTagTestAlphaMode = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagAlphaModeRequest);
  1:(Response:TBCM2836MailboxTagAlphaModeResponse);
 end;
 
 {Set Alpha Mode}
 PBCM2836MailboxTagSetAlphaMode = ^TBCM2836MailboxTagSetAlphaMode;
 TBCM2836MailboxTagSetAlphaMode = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagAlphaModeRequest);
  1:(Response:TBCM2836MailboxTagAlphaModeResponse);
 end;
 
 {Get Pitch}
 TBCM2836MailboxTagPitchResponse = record
  Pitch:LongWord;  {Bytes per line}
 end;

 PBCM2836MailboxTagGetPitch = ^TBCM2836MailboxTagGetPitch;
 TBCM2836MailboxTagGetPitch = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagPitchResponse);
 end;
 
 {Get Virtual Offset}
 TBCM2836MailboxTagVirtualOffsetRequest = record
  X:LongWord; {Pixels}
  Y:LongWord; {Pixels}
 end;

 TBCM2836MailboxTagVirtualOffsetResponse = record
  X:LongWord; {Pixels}
  Y:LongWord; {Pixels}
 end;

 PBCM2836MailboxTagGetVirtualOffset = ^TBCM2836MailboxTagGetVirtualOffset;
 TBCM2836MailboxTagGetVirtualOffset = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagVirtualOffsetResponse);
 end;
 
 {Test Virtual Offset}
 PBCM2836MailboxTagTestVirtualOffset = ^TBCM2836MailboxTagTestVirtualOffset;
 TBCM2836MailboxTagTestVirtualOffset = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagVirtualOffsetRequest);
  1:(Response:TBCM2836MailboxTagVirtualOffsetResponse);
 end;
 
 {Set Virtual Offset}
 PBCM2836MailboxTagSetVirtualOffset = ^TBCM2836MailboxTagSetVirtualOffset;
 TBCM2836MailboxTagSetVirtualOffset = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagVirtualOffsetRequest);
  1:(Response:TBCM2836MailboxTagVirtualOffsetResponse);
 end;

 {Get Overscan}
 TBCM2836MailboxTagOverscanRequest = record
  Top:LongWord;    {Pixels}
  Bottom:LongWord; {Pixels}
  Left:LongWord;   {Pixels}
  Right:LongWord;  {Pixels}
 end;

 TBCM2836MailboxTagOverscanResponse = record
  Top:LongWord;    {Pixels}
  Bottom:LongWord; {Pixels}
  Left:LongWord;   {Pixels}
  Right:LongWord;  {Pixels}
 end;

 PBCM2836MailboxTagGetOverscan = ^TBCM2836MailboxTagGetOverscan;
 TBCM2836MailboxTagGetOverscan = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagOverscanResponse);
 end;
 
 {Test Overscan}
 PBCM2836MailboxTagTestOverscan = ^TBCM2836MailboxTagTestOverscan;
 TBCM2836MailboxTagTestOverscan = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagOverscanRequest);
  1:(Response:TBCM2836MailboxTagOverscanResponse);
 end;
 
 {Set Overscan}
 PBCM2836MailboxTagSetOverscan = ^TBCM2836MailboxTagSetOverscan;
 TBCM2836MailboxTagSetOverscan = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagOverscanRequest);
  1:(Response:TBCM2836MailboxTagOverscanResponse);
 end;
 
 {Get Palette}
 TBCM2836MailboxTagGetPaletteResponse = record
  Values:array[0..255] of LongWord;    {RGBA Palette Values}
 end;
 
 PBCM2836MailboxTagGetPalette = ^TBCM2836MailboxTagGetPalette;
 TBCM2836MailboxTagGetPalette = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagGetPaletteResponse);
 end;
 
 {Test Palette}
 TBCM2836MailboxTagPaletteRequest = record
  Offset:LongWord; {First palette index to set (0-255)}
  Length:LongWord; {Number of palette entries to set (1-256)}
  Values:array[0..255] of LongWord;    {RGBA Palette Values}
 end;
 
 TBCM2836MailboxTagPaletteResponse = record
  Status:LongWord; 
 end;
 
 PBCM2836MailboxTagTestPalette = ^TBCM2836MailboxTagTestPalette;
 TBCM2836MailboxTagTestPalette = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagPaletteRequest);
  1:(Response:TBCM2836MailboxTagPaletteResponse);
 end;
 
 {Set Palette}
 PBCM2836MailboxTagSetPalette = ^TBCM2836MailboxTagSetPalette;
 TBCM2836MailboxTagSetPalette = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagPaletteRequest);
  1:(Response:TBCM2836MailboxTagPaletteResponse);
 end;
 
 {Set Cursor Info}
 TBCM2836MailboxTagSetCursorInfoRequest = record
  Width:LongWord;    {Pixels}
  Height:LongWord;   {Pixels}
  Reserved:LongWord;
  Pixels:Pointer;    {Format is 32bpp (ARGB) (Width and Height should be >= 16 and (Width * Height) <= 64)}
  HotspotX:LongWord;
  HotspotY:LongWord;
 end;
 
 TBCM2836MailboxTagCursorResponse = record
  Status:LongWord; 
 end;
 
 PBCM2836MailboxTagSetCursorInfo = ^TBCM2836MailboxTagSetCursorInfo;
 TBCM2836MailboxTagSetCursorInfo = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagSetCursorInfoRequest);
  1:(Response:TBCM2836MailboxTagCursorResponse);
 end;
 
 {Set Cursor State}
 TBCM2836MailboxTagSetCursorStateRequest = record
  Enable:LongWord;  
  X:LongWord;        {Pixels}
  Y:LongWord;        {Pixels}
  Flags:LongWord;
 end;
 
 PBCM2836MailboxTagSetCursorState = ^TBCM2836MailboxTagSetCursorState;
 TBCM2836MailboxTagSetCursorState = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagSetCursorStateRequest);
  1:(Response:TBCM2836MailboxTagCursorResponse);
 end;
 
 {Get Command Line}
 TBCM2836MailboxTagCommandLineResponse = record
  CommandLine:array[0..1023] of Char;
 end;
 
 PBCM2836MailboxTagGetCommandLine = ^TBCM2836MailboxTagGetCommandLine;
 TBCM2836MailboxTagGetCommandLine = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagCommandLineResponse);
 end;

 {Get DMA Channels}
 TBCM2836MailboxTagDMAChannelsResponse = record
  Channels:LongWord;
 end;
 
 PBCM2836MailboxTagGetDMAChannels = ^TBCM2836MailboxTagGetDMAChannels;
 TBCM2836MailboxTagGetDMAChannels = record
  Header:TBCM2836MailboxTagHeader;
  case Integer of
  0:(Request:TBCM2836MailboxTagNoRequest);
  1:(Response:TBCM2836MailboxTagDMAChannelsResponse);
 end;
 
 {Create Buffer (A combination tag to allocate and configure a framebuffer in one request)}
 PBCM2836MailboxTagCreateBuffer = ^TBCM2836MailboxTagCreateBuffer;
 TBCM2836MailboxTagCreateBuffer = record
  Physical:TBCM2836MailboxTagSetPhysical;
  Vertual:TBCM2836MailboxTagSetVirtual;
  Depth:TBCM2836MailboxTagSetDepth;
  Order:TBCM2836MailboxTagSetPixelOrder;
  Mode:TBCM2836MailboxTagSetAlphaMode;
  Offset:TBCM2836MailboxTagSetVirtualOffset;
  Overscan:TBCM2836MailboxTagSetOverscan;
  Allocate:TBCM2836MailboxTagAllocateBuffer;
  Pitch:TBCM2836MailboxTagGetPitch;
 end;
 
 {Query Buffer (A combination tag to query all framebuffer properties in one request)}
 PBCM2836MailboxTagQueryBuffer = ^TBCM2836MailboxTagQueryBuffer;
 TBCM2836MailboxTagQueryBuffer = record
  Physical:TBCM2836MailboxTagGetPhysical;
  Vertual:TBCM2836MailboxTagGetVirtual;
  Depth:TBCM2836MailboxTagGetDepth;
  Order:TBCM2836MailboxTagGetPixelOrder;
  Mode:TBCM2836MailboxTagGetAlphaMode;
  Offset:TBCM2836MailboxTagGetVirtualOffset;
  Overscan:TBCM2836MailboxTagGetOverscan;
  Pitch:TBCM2836MailboxTagGetPitch;
 end;
 
{==============================================================================}
type
 {BCM2836 ARM local structures (See: QA7 Rev3.4.pdf)}
 PBCM2836ARMLocalMailboxWriteRegisters = ^TBCM2836ARMLocalMailboxWriteRegisters;
 TBCM2836ARMLocalMailboxWriteRegisters = record
  Mailbox0Write:LongWord; {Mailbox 0 write-set (WO)}
  Mailbox1Write:LongWord; {Mailbox 1 write-set (WO)}
  Mailbox2Write:LongWord; {Mailbox 2 write-set (WO)}
  Mailbox3Write:LongWord; {Mailbox 3 write-set (WO)}
 end;

 PBCM2836ARMLocalMailboxReadClearRegisters = ^TBCM2836ARMLocalMailboxReadClearRegisters;
 TBCM2836ARMLocalMailboxReadClearRegisters = record
  Mailbox0ReadClear:LongWord; {Mailbox 0 read & write-high-to-clear}
  Mailbox1ReadClear:LongWord; {Mailbox 1 read & write-high-to-clear}
  Mailbox2ReadClear:LongWord; {Mailbox 2 read & write-high-to-clear}
  Mailbox3ReadClear:LongWord; {Mailbox 3 read & write-high-to-clear}
 end;
 
 PBCM2836ARMLocalRegisters = ^TBCM2836ARMLocalRegisters;
 TBCM2836ARMLocalRegisters = record
  Control:LongWord;                                                {Control register $0000}
  Reserved1:LongWord;                                              {Unused $0004}
  CoreTimerPrescaler:LongWord;                                     {Core timer prescaler $0008}
  GPUInterruptRouting:LongWord;                                    {GPU interrupts routing $000C}
  PMInterruptRoutingSet:LongWord;                                  {Performance Monitor Interrupts routing-set $0010}
  PMInterruptRoutingClear:LongWord;                                {Performance Monitor Interrupts routing-clear $0014}
  Reserved2:LongWord;                                              {Unused $0018}
  CoreTimerLow:LongWord;                                           {Core timer access LS 32 bits $001C}
  CoreTimerHigh:LongWord;                                          {Core timer access MS 32 bits $0020}
  LocalIntRouting0:LongWord;                                       {Local Interrupts 0-7 routing (1 to 7 Unused) $0024}
  LocalIntRouting1:LongWord;                                       {Local Interrupts 8-15 routing (Unused) $0028}
  AXIOutstandingCount:LongWord;                                    {AXI outstanding counters $002C}
  AXIOutstandingIRQ:LongWord;                                      {AXI outstanding IRQ $0030}
  LocalTimerControl:LongWord;                                      {Local timer control & status $0034}
  LocalTimerClearReload:LongWord;                                  {Local timer IRQ clear & reload $0038}
  Reserved3:LongWord;                                              {Unused $003C}
  TimersIntControl:array[0..BCM2836_CPU_COUNT - 1] of LongWord;    {Core0-3 Timers Interrupt control $0040-004C}
  MailboxIntControl:array[0..BCM2836_CPU_COUNT - 1] of LongWord;   {Core0-3 Mailboxes Interrupt control $0050-005C}
  IRQPending:array[0..BCM2836_CPU_COUNT - 1] of LongWord;          {Core0-3 IRQ Source $0060-006C}
  FIQPending:array[0..BCM2836_CPU_COUNT - 1] of LongWord;          {Core0-3 FIQ Source $0070-007C}
  MailboxWrite:array[0..BCM2836_CPU_COUNT - 1] of TBCM2836ARMLocalMailboxWriteRegisters;          {Core0-3 Mailbox 0-3 write-set (WO) $0080-00BC}
  MailboxReadClear:array[0..BCM2836_CPU_COUNT - 1] of TBCM2836ARMLocalMailboxReadClearRegisters;  {Core0-3 Mailbox 0-3 read & write-high-to-clear $00C0-00FC}
 end;
 
{==============================================================================}
{==============================================================================}

implementation

{==============================================================================}
{==============================================================================}

end.
 