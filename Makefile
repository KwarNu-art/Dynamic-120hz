TARGET := iphone:clang:latest:15.0  
ARCHS = arm64 arm64e  
THEOS_PACKAGE_SCHEME = rootless  
  
INSTALL_TARGET_PROCESSES = SpringBoard  
  
include $(THEOS)/makefiles/common.mk  
  
TWEAK_NAME = Unlock120Hz  
  
Unlock120Hz_FILES = Tweak.x  
Unlock120Hz_CFLAGS = -fobjc-arc  
Unlock120Hz_FRAMEWORKS = UIKit QuartzCore  
  
include $(THEOS_MAKE_PATH)/tweak.mk 
