#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

RC_MENU:=Remote control support

define KernelPackage/rc-core
  SUBMENU:=$(RC_MENU)
  HIDDEN:=1
  TITLE:=Remote control core driver
  KCONFIG:=CONFIG_RC_CORE
  FILES:=$(LINUX_DIR)/drivers/media/rc/rc-core.ko
  AUTOLOAD:=$(call AutoLoad,61,rc-core)
endef

$(eval $(call KernelPackage,rc-core))

define KernelPackage/ir-rc6-decoder
  SUBMENU:=$(RC_MENU)
  TITLE:=Enable IR raw decoder for the RC6 protocol
  KCONFIG:=CONFIG_IR_RC6_DECODER
  FILES:=$(LINUX_DIR)/drivers/media/rc/ir-rc6-decoder.ko
  AUTOLOAD:=$(call AutoLoad,61,ir-rc6-decoder)
endef

$(eval $(call KernelPackage,ir-rc6-decoder))

define KernelPackage/rc-rc6-mce
  SUBMENU:=$(RC_MENU)
  TITLE:=Keymap for RC6 protocol
  KCONFIG:=CONFIG_IR_IMG_RC6
  FILES:=$(LINUX_DIR)/drivers/media/rc/keymaps/rc-rc6-mce.ko
  AUTOLOAD:=$(call AutoLoad,61,rc-rc6-mce)
endef

$(eval $(call KernelPackage,rc-rc6-mce))

define KernelPackage/mceusb
  SUBMENU:=$(RC_MENU)
  TITLE:=Windows Media Center Ed. eHome Infrared Transceiver
  DEPENDS:=@USB_SUPPORT +kmod-usb-core +kmod-rc-core
  KCONFIG:=CONFIG_IR_MCEUSB
  FILES:=$(LINUX_DIR)/drivers/media/rc/mceusb.ko
  AUTOLOAD:=$(call AutoProbe,mceusb)
endef

define KernelPackage/mceusb/description
  This package contains driver for the Windows Media Center Ed. eHome Infrared Transceiver
endef

$(eval $(call KernelPackage,mceusb))
