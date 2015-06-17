## Common ZMoD Config ##

# zmod init.rc
PRODUCT_COPY_FILES += \
	vendor/zmod/prebuilt/common/etc/init.zmod.rc:root/init.zmod.rc

# Proprietary latinime lib needed for Keyboard swyping
PRODUCT_COPY_FILES += \
    vendor/zmod/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_unbundled_latinimegoogle.so

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.setupwizard.enterprise_mode=1

# init.d support
PRODUCT_COPY_FILES += \
	vendor/zmod/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/zmod/prebuilt/common/etc/init.d/00zmod:system/etc/init.d/00zmod

PRODUCT_PACKAGE_OVERLAYS += vendor/zmod/overlay/common
