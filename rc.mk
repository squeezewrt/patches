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

define KernelPackage/rc-imgtec
  TITLE:=ImgTec IR Decoder
  KCONFIG:=CONFIG_IR_IMG
  FILES:=$(LINUX_DIR)/drivers/media/rc/img-ir/img-ir.ko
  AUTOLOAD:=$(call AutoProbe,img-ir)
  $(call AddDepends/rc)
endef

define KernelPackage/rc-imgtec/description
  Say Y or M here if you want to use the ImgTec infrared decoder
  functionality found in SoCs such as TZ1090.
endef

$(eval $(call KernelPackage,rc-imgtec))

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

# -- Remote controller keymaps -------------------

define RcmapTemplate/rcmap
  TITLE:=$(1) keymap
  KCONFIG:=CONFIG_RC_MAP_$(1)
  FILES:=$(LINUX_DIR)/drivers/media/rc/keymaps/$(1).ko
  AUTOLOAD:=$(call AutoLoad,62,$(1))
  $(call AddDepends/rc)
endef

define KernelPackage/rcmap-adstech
  $(call RcmapTemplate/rcmap,rc-adstech-dvb-t-pci)
endef
$(eval $(call KernelPackage,rcmap-adstech))

define KernelPackage/rcmap-alink-dtu-m
  $(call RcmapTemplate/rcmap,rc-alink-dtu-m)
endef
$(eval $(call KernelPackage,rcmap-alink-dtu-m))

define KernelPackage/rcmap-anysee
  $(call RcmapTemplate/rcmap,rc-anysee)
endef
$(eval $(call KernelPackage,rcmap-anysee))

define KernelPackage/rcmap-apac-viewcomp
  $(call RcmapTemplate/rcmap,rc-apac-viewcomp)
endef
$(eval $(call KernelPackage,rcmap-apac-viewcomp))

define KernelPackage/rcmap-asus-pc39
  $(call RcmapTemplate/rcmap,rc-asus-pc39)
endef
$(eval $(call KernelPackage,rcmap-asus-pc39))

define KernelPackage/rcmap-asus-ps3-100
  $(call RcmapTemplate/rcmap,rc-asus-ps3-100)
endef
$(eval $(call KernelPackage,rcmap-asus-ps3-100))

define KernelPackage/rcmap-ati-tv-wonder
  $(call RcmapTemplate/rcmap,rc-ati-tv-wonder-hd-600)
endef
$(eval $(call KernelPackage,rcmap-ati-tv-wonder))

define KernelPackage/rcmap-ati-x10
  $(call RcmapTemplate/rcmap,rc-ati-x10)
endef
$(eval $(call KernelPackage,rcmap-ati-x10))

define KernelPackage/rcmap-avermedia-a16d
  $(call RcmapTemplate/rcmap,rc-avermedia-a16d)
endef
$(eval $(call KernelPackage,rcmap-avermedia-a16d))

define KernelPackage/rcmap-avermedia-cardbus
  $(call RcmapTemplate/rcmap,rc-avermedia-cardbus)
endef
$(eval $(call KernelPackage,rcmap-avermedia-cardbus))

define KernelPackage/rcmap-avermedia-dvbt
  $(call RcmapTemplate/rcmap,rc-avermedia-dvbt)
endef
$(eval $(call KernelPackage,rcmap-avermedia-dvbt))

define KernelPackage/rcmap-avermedia-m135a
  $(call RcmapTemplate/rcmap,rc-avermedia-m135a)
endef
$(eval $(call KernelPackage,rcmap-avermedia-m135a))

define KernelPackage/rcmap-avermedia-m733
  $(call RcmapTemplate/rcmap,rc-avermedia-m733a-rm-k6)
endef
$(eval $(call KernelPackage,rcmap-avermedia-m733))

define KernelPackage/rcmap-avermedia-rm
  $(call RcmapTemplate/rcmap,rc-avermedia-rm-ks)
endef
$(eval $(call KernelPackage,rcmap-avermedia-rm))

define KernelPackage/rcmap-avermedia
  $(call RcmapTemplate/rcmap,rc-avermedia)
endef
$(eval $(call KernelPackage,rcmap-avermedia))

define KernelPackage/rcmap-avertv-303
  $(call RcmapTemplate/rcmap,rc-avertv-303)
endef
$(eval $(call KernelPackage,rcmap-avertv-303))

define KernelPackage/rcmap-azurewave
  $(call RcmapTemplate/rcmap,rc-azurewave-ad-tu700)
endef
$(eval $(call KernelPackage,rcmap-azurewave))

define KernelPackage/rcmap-behold-columbus
  $(call RcmapTemplate/rcmap,rc-behold-columbus)
endef
$(eval $(call KernelPackage,rcmap-behold-columbus))

define KernelPackage/rcmap-behold
  $(call RcmapTemplate/rcmap,rc-behold)
endef
$(eval $(call KernelPackage,rcmap-behold))

define KernelPackage/rcmap-budget
  $(call RcmapTemplate/rcmap,rc-budget-ci-old)
endef
$(eval $(call KernelPackage,rcmap-budget))

define KernelPackage/rcmap-cinergy-1400
  $(call RcmapTemplate/rcmap,rc-cinergy-1400)
endef
$(eval $(call KernelPackage,rcmap-cinergy-1400))

define KernelPackage/rcmap-cinergy
  $(call RcmapTemplate/rcmap,rc-cinergy)
endef
$(eval $(call KernelPackage,rcmap-cinergy))

define KernelPackage/rcmap-delock
  $(call RcmapTemplate/rcmap,rc-delock-61959)
endef
$(eval $(call KernelPackage,rcmap-delock))

define KernelPackage/rcmap-dib0700-nec
  $(call RcmapTemplate/rcmap,rc-dib0700-nec)
endef
$(eval $(call KernelPackage,rcmap-dib0700-nec))

define KernelPackage/rcmap-dib0700-rc5
  $(call RcmapTemplate/rcmap,rc-dib0700-rc5)
endef
$(eval $(call KernelPackage,rcmap-dib0700-rc5))

define KernelPackage/rcmap-digitalnow
  $(call RcmapTemplate/rcmap,rc-digitalnow-tinytwin)
endef
$(eval $(call KernelPackage,rcmap-digitalnow))

define KernelPackage/rcmap-digittrade
  $(call RcmapTemplate/rcmap,rc-digittrade)
endef
$(eval $(call KernelPackage,rcmap-digittrade))

define KernelPackage/rcmap-dm1105-nec
  $(call RcmapTemplate/rcmap,rc-dm1105-nec)
endef
$(eval $(call KernelPackage,rcmap-dm1105-nec))

define KernelPackage/rcmap-dntv
  $(call RcmapTemplate/rcmap,rc-dntv-live-dvb-t)
endef
$(eval $(call KernelPackage,rcmap-dntv))

define KernelPackage/rcmap-dntv-pro
  $(call RcmapTemplate/rcmap,rc-dntv-live-dvbt-pro)
endef
$(eval $(call KernelPackage,rcmap-dntv-pro))

define KernelPackage/rcmap-dvbsky
  $(call RcmapTemplate/rcmap,rc-dvbsky)
endef
$(eval $(call KernelPackage,rcmap-dvbsky))

#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-em-terratec.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-encore-enltv-fm53.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-encore-enltv.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-encore-enltv2.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-evga-indtube.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-eztv.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-flydvb.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-flyvideo.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-fusionhdtv-mce.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-gadmei-rm008z.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-gotview7135.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-hauppauge.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-imon-mce.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-imon-pad.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-iodata-bctv7e.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-it913x-v1.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-it913x-v2.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-kaiomy.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-kworld-315u.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-kworld-pc150u.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-leadtek-y04g0051.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-lirc.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-lme2510.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-manli.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-medion-x10-digitainer.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-medion-x10-or2x.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-medion-x10.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-msi-digivox-ii.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-msi-digivox-iii.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-msi-tvanywhere.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-nebula.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-norwood.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-npgtech.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pctv-sedna.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pinnacle-color.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pinnacle-grey.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pixelview-002t.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pixelview-mk12.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pixelview-new.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pixelview.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-powercolor-real-angel.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-proteus-2309.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-purpletv.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pv951.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-rc6-mce.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-reddo.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-snapstream-firefly.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-streamzap.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-su3000.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-tbs-nec.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-technisat-usb2.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-terratec-slim-2.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-terratec-slim.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-tevii-nec.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-tivo.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-total-media-in-hand-02.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-total-media-in-hand.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-trekstor.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-tt-1500.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-twinhan1027.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-videomate-m1f.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-videomate-s350.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-videomate-tv-pvr.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-winfast.ko

#----------------------------
  
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-alink-dtu-m.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-anysee.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-apac-viewcomp.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-asus-pc39.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-asus-ps3-100.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-ati-x10.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-avermedia-a16d.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-avermedia-cardbus.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-avermedia-dvbt.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-avermedia-m135a.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-avermedia-rm-ks.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-avermedia.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-avertv-303.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-behold-columbus.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-behold.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-budget-ci-old.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-cinergy-1400.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-cinergy.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-delock-61959.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-dib0700-nec.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-dib0700-rc5.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-digittrade.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-dm1105-nec.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-dvbsky.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-em-terratec.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-encore-enltv-fm53.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-encore-enltv.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-encore-enltv2.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-evga-indtube.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-eztv.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-flydvb.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-flyvideo.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-fusionhdtv-mce.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-gadmei-rm008z.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-gotview7135.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-hauppauge.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-imon-mce.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-imon-pad.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-iodata-bctv7e.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-it913x-v1.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-it913x-v2.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-kaiomy.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-kworld-315u.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-kworld-pc150u.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-leadtek-y04g0051.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-lirc.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-lme2510.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-manli.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-medion-x10-digitainer.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-medion-x10-or2x.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-medion-x10.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-msi-digivox-ii.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-msi-digivox-iii.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-msi-tvanywhere.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-nebula.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-norwood.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-npgtech.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pctv-sedna.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pinnacle-color.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pinnacle-grey.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pixelview-002t.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pixelview-mk12.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pixelview-new.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pixelview.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-powercolor-real-angel.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-proteus-2309.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-purpletv.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-pv951.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-rc6-mce.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-reddo.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-snapstream-firefly.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-streamzap.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-su3000.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-tbs-nec.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-technisat-usb2.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-terratec-slim-2.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-terratec-slim.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-tevii-nec.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-tivo.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-total-media-in-hand-02.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-total-media-in-hand.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-trekstor.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-tt-1500.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-twinhan1027.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-videomate-m1f.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-videomate-s350.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-videomate-tv-pvr.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.ko
#$(LINUX_DIR)/drivers/media/rc/keymaps/rc-winfast.ko
