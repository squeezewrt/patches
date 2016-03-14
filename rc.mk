#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

RC_MENU:=Remote control support

define KernelPackage/mceusb
  SUBMENU:=$(RC_MENU)
  TITLE:=Windows Media Center Ed. eHome Infrared Transceiver
  DEPENDS:=@USB_SUPPORT
  KCONFIG:=CONFIG_IR_MCEUSB
  FILES:=$(LINUX_DIR)/drivers/media/rc/mceusb.ko
  AUTOLOAD:=$(call AutoProbe,mceusb)
endef

define KernelPackage/mceusb/description
  This package contains driver for the Windows Media Center Ed. eHome Infrared Transceiver
endef

$(eval $(call KernelPackage,mceusb))
