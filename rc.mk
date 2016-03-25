#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

RC_MENU:=Remote control support

# !!! Autoload # !!!!

# -- Remote control devices ----------------------

define KernelPackage/rc-core
  SUBMENU:=$(RC_MENU)
  TITLE:=Remote control support
  KCONFIG:=CONFIG_RC_CORE
  FILES:=$(LINUX_DIR)/drivers/media/rc/rc-core.ko
  AUTOLOAD:=$(call AutoLoad,61,rc-core)
endef

define KernelPackage/rc-core/description
  Kernel modules for remote control support
endef

define AddDepends/rc
  SUBMENU:=$(RC_MENU)
  DEPENDS+= kmod-rc-core
endef

define AddDepends/rc-usb
  $(call AddDepends/rc)
  DEPENDS+= @USB_SUPPORT +kmod-usb-core
endef

$(eval $(call KernelPackage,rc-core))

define KernelPackage/rc-ati
  TITLE:=ATI / X10 based USB RF remote controls
  KCONFIG:=CONFIG_RC_ATI_REMOTE
  FILES:=$(LINUX_DIR)/drivers/media/rc/ati_remote.ko
  AUTOLOAD:=$(call AutoProbe,ati_remote)
  $(call AddDepends/rc-usb)
endef

define KernelPackage/rc-ati/description
  Say Y here if you want to use an X10 based USB remote control.
  These are RF remotes with USB receivers.

  Such devices include the ATI remote that comes with many of ATI's
  All-In-Wonder video cards, the X10 "Lola" remote, NVIDIA RF remote,
  Medion RF remote, and SnapStream FireFly remote.

  This driver provides mouse pointer, left and right mouse buttons,
  and maps all the other remote buttons to keypress events.

  To compile this driver as a module, choose M here: the module will be
  called ati_remote.
endef

$(eval $(call KernelPackage,rc-ati))

define KernelPackage/rc-gpio
  TITLE:=GPIO IR remote control
  KCONFIG:=CONFIG_IR_GPIO_CIR
  FILES:=$(LINUX_DIR)/drivers/media/rc/gpio-ir-recv.ko
  AUTOLOAD:=$(call AutoLoad,62,gpio-ir-recv)
  $(call AddDepends/rc)
endef

define KernelPackage/rc-gpio/description
  Say Y if you want to use GPIO based IR Receiver.

  To compile this driver as a module, choose M here: the module will
  be called gpio-ir-recv.
endef

$(eval $(call KernelPackage,rc-gpio))

define KernelPackage/rc-igorplug
  TITLE:=IgorPlug-USB IR Receiver
  KCONFIG:=CONFIG_IR_IGORPLUGUSB
  FILES:=$(LINUX_DIR)/drivers/media/rc/igorplugusb.ko
  AUTOLOAD:=$(call AutoProbe,igorplugusb)
  $(call AddDepends/rc-usb)
endef

define KernelPackage/rc-igorplug/description
  Say Y here if you want to use the IgorPlug-USB IR Receiver by
  Igor Cesko. This device is included on the Fit-PC2.

  Note that this device can only record bursts of 36 IR pulses and
  spaces, which is not enough for the NEC, Sanyo and RC-6 protocol.

  To compile this driver as a module, choose M here: the module will
  be called igorplugusb.
endef

$(eval $(call KernelPackage,rc-igorplug))

define KernelPackage/rc-iguana
  TITLE:=IguanaWorks USB IR Transceiver
  KCONFIG:=CONFIG_IR_IGUANA
  FILES:=$(LINUX_DIR)/drivers/media/rc/iguanair.ko
  AUTOLOAD:=$(call AutoProbe,iguanair)
  $(call AddDepends/rc-usb)
endef

define KernelPackage/rc-iguana/description
  Say Y here if you want to use the IguanaWorks USB IR Transceiver.
  Both infrared receive and send are supported. If you want to
  change the ID or the pin config, use the user space driver from
  IguanaWorks.

  Only firmware 0x0205 and later is supported.

  To compile this driver as a module, choose M here: the module will
  be called iguanair.
endef

$(eval $(call KernelPackage,rc-iguana))

define KernelPackage/rc-imon
  TITLE:=SoundGraph iMON Receiver and Display
  KCONFIG:=CONFIG_IR_IMON
  FILES:=$(LINUX_DIR)/drivers/media/rc/imon.ko
  AUTOLOAD:=$(call AutoProbe,imon)
  $(call AddDepends/rc-usb)
endef

define KernelPackage/rc-imon/description
  Say Y here if you want to use a SoundGraph iMON (aka Antec Veris)
  IR Receiver and/or LCD/VFD/VGA display.

  To compile this driver as a module, choose M here: the
  module will be called imon.
endef

$(eval $(call KernelPackage,rc-imon))

define KernelPackage/rc-hix5hd2
  TITLE:=Hisilicon hix5hd2 IR remote control
  KCONFIG:=CONFIG_IR_HIX5HD2
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-hix5hd2.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-hix5hd2)
  $(call AddDepends/rc)
endef

define KernelPackage/rc-hix5hd2/description
  Say Y here if you want to use hisilicon hix5hd2 remote control.
  To compile this driver as a module, choose M here: the module will be
  called ir-hix5hd2.

  If you're not sure, select N here
endef

$(eval $(call KernelPackage,rc-hix5hd2))

define KernelPackage/rc-mceusb
  TITLE:=Windows Media Center Ed. eHome Infrared Transceiver
  KCONFIG:=CONFIG_IR_MCEUSB
  FILES:=$(LINUX_DIR)/drivers/media/rc/mceusb.ko
  AUTOLOAD:=$(call AutoProbe,mceusb)
  $(call AddDepends/rc-usb)
endef

define KernelPackage/rc-mceusb/description
  Say Y here if you want to use a Windows Media Center Edition
  eHome Infrared Transceiver.

  To compile this driver as a module, choose M here: the
  module will be called mceusb.
endef

$(eval $(call KernelPackage,rc-mceusb))

define KernelPackage/rc-loopback
  TITLE:=Remote Control Loopback Driver
  KCONFIG:=CONFIG_RC_LOOPBACK
  FILES:=$(LINUX_DIR)/drivers/media/rc/rc-loopback.ko
  AUTOLOAD:=$(call AutoLoad,62,rc-loopback)
  $(call AddDepends/rc)
endef

define KernelPackage/rc-loopback/description
  Say Y here if you want support for the remote control loopback
  driver which allows TX data to be sent back as RX data.
  This is mostly useful for debugging purposes.

  If you're not sure, select N here.

  To compile this driver as a module, choose M here: the module will
  be called rc-loopback.
endef

$(eval $(call KernelPackage,rc-loopback))

define KernelPackage/rc-redrat3
  TITLE:=RedRat3 IR Transceiver
  KCONFIG:=CONFIG_IR_REDRAT3
  FILES:=$(LINUX_DIR)/drivers/media/rc/redrat3.ko
  AUTOLOAD:=$(call AutoProbe,redrat3)
  $(call AddDepends/rc-usb)
endef

define KernelPackage/rc-redrat3/description
  Say Y here if you want to use a RedRat3 Infrared Transceiver.

  To compile this driver as a module, choose M here: the
  module will be called redrat3.
endef

$(eval $(call KernelPackage,rc-redrat3))

define KernelPackage/rc-streamzap
  TITLE:=Streamzap PC Remote IR Receiver
  KCONFIG:=CONFIG_IR_STREAMZAP
  FILES:=$(LINUX_DIR)/drivers/media/rc/streamzap.ko
  AUTOLOAD:=$(call AutoProbe,streamzap)
  $(call AddDepends/rc-usb)
endef

define KernelPackage/rc-streamzap/description
  Say Y here if you want to use a Streamzap PC Remote
  Infrared Receiver.

  To compile this driver as a module, choose M here: the
  module will be called streamzap.
endef

$(eval $(call KernelPackage,rc-streamzap))

define KernelPackage/rc-ttusbir
  TITLE:=TechnoTrend USB IR Receiver
  KCONFIG:=CONFIG_IR_TTUSBIR
  FILES:=$(LINUX_DIR)/drivers/media/rc/ttusbir.ko
  AUTOLOAD:=$(call AutoProbe,ttusbir)
  $(call AddDepends/rc-usb)
endef

define KernelPackage/rc-ttusbir/description
  Say Y here if you want to use the TechnoTrend USB IR Receiver. The
  driver can control the led.

  To compile this driver as a module, choose M here: the module will
  be called ttusbir.
endef

$(eval $(call KernelPackage,rc-ttusbir))

# -- Remote controller decoders ------------------

define KernelPackage/rcdec-jvc
  TITLE:=Enable IR raw decoder for the JVC protocol
  KCONFIG:=CONFIG_IR_JVC_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-jvc-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-jvc-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-jvc/description
  Enable this option if you have an infrared remote control which
  uses the JVC protocol, and you need software decoding support.
endef

$(eval $(call KernelPackage,rcdec-jvc))

define KernelPackage/rcdec-mcekbd
  TITLE:=Enable IR raw decoder for MCE keyboard protocol
  KCONFIG:=CONFIG_IR_MCE_KBD_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-mce_kbd-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-mce_kbd-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-mcekbd/description
  Enable this option if you have a Microsoft Remote Keyboard for
  Windows Media Center Edition, which you would like to use with
  a raw IR receiver in your system.
endef

$(eval $(call KernelPackage,rcdec-mcekbd))

define KernelPackage/rcdec-nec
  TITLE:=Enable IR raw decoder for the NEC protocol
  KCONFIG:=CONFIG_IR_NEC_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-nec-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-nec-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-nec/description
  Enable this option if you have IR with NEC protocol, and
  if the IR is decoded in software
endef

$(eval $(call KernelPackage,rcdec-nec))

define KernelPackage/rcdec-rc5
  TITLE:=Enable IR raw decoder for the RC-5 protocol
  KCONFIG:=CONFIG_IR_RC5_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-rc5-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-rc5-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-rc5/description
  Enable this option if you have IR with RC-5 protocol, and
  if the IR is decoded in software
endef

$(eval $(call KernelPackage,rcdec-rc5))

define KernelPackage/rcdec-rc6
  TITLE:=Enable IR raw decoder for the RC-6 protocol
  KCONFIG:=CONFIG_IR_RC6_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-rc6-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-rc6-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-rc6/description
  Enable this option if you have IR with RC-6 protocol, and
  if the IR is decoded in software
endef

$(eval $(call KernelPackage,rcdec-rc6))

define KernelPackage/rcdec-sanyo
  TITLE:=Enable IR raw decoder for the Sanyo protocol
  KCONFIG:=CONFIG_IR_SANYO_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-sanyo-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-sanyo-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-sanyo/description
  Enable this option if you have an infrared remote control which
  uses the Sanyo protocol (Sanyo, Aiwa, Chinon remotes),
  and you need software decoding support.
endef

$(eval $(call KernelPackage,rcdec-sanyo))

define KernelPackage/rcdec-sharp
  TITLE:=Enable IR raw decoder for the Sharp protocol
  KCONFIG:=CONFIG_IR_SHARP_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-sharp-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-sharp-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-sharp/description
  Enable this option if you have an infrared remote control which
  uses the Sharp protocol, and you need software decoding support.
endef

$(eval $(call KernelPackage,rcdec-sharp))

define KernelPackage/rcdec-sony
  TITLE:=Enable IR raw decoder for the Sony protocol
  KCONFIG:=CONFIG_IR_SONY_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-sony-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-sony-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-sony/description
  Enable this option if you have an infrared remote control which
  uses the Sony protocol, and you need software decoding support.
endef

$(eval $(call KernelPackage,rcdec-sony))

define KernelPackage/rcdec-xmp
  TITLE:=Enable IR raw decoder for the XMP protocol
  KCONFIG:=CONFIG_IR_XMP_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-xmp-decoder.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-xmp-decoder)
  $(call AddDepends/rc)
endef

define KernelPackage/rcdec-xmp/description
  Enable this option if you have IR with XMP protocol, and
  if the IR is decoded in software
endef

$(eval $(call KernelPackage,rcdec-xmp))

# -- LIRC staff --------------------------------

define KernelPackage/lirc-dev
  TITLE:=LIRC interface driver
  KCONFIG:=CONFIG_LIRC
  FILES:=$(LINUX_DIR)/drivers/media/rc/lirc_dev.ko
  AUTOLOAD:=$(call AutoLoad,62,lirc_dev)
  $(call AddDepends/rc)
endef

define KernelPackage/lirc-dev/description
  Enable this option to build the Linux Infrared Remote
  Control (LIRC) core device interface driver. The LIRC
  interface passes raw IR to and from userspace, where the
  LIRC daemon handles protocol decoding for IR reception and
  encoding for IR transmitting (aka "blasting").
endef

$(eval $(call KernelPackage,lirc-dev))

define KernelPackage/lirc-codec
  TITLE:=Enable IR to LIRC bridge
  KCONFIG:=CONFIG_IR_LIRC_CODEC
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-lirc-codec.ko
  AUTOLOAD:=$(call AutoLoad,62,ir-lirc-codec)
  $(call AddDepends/rc)
endef

define KernelPackage/lirc-codec/description
  Enable this option to pass raw IR to and from userspace via
  the LIRC interface.
endef

$(eval $(call KernelPackage,lirc-codec))
