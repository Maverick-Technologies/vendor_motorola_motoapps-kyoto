#
# Motorola apps for kyoto (see Android.bp). FM Radio drives the MT6631 directly through
# /dev/fm via libfmxjni (init.kyoto.rc opens its mode); FMRadioService is signed with Motorola's
# platform key, which the stock vendor maps to platform_app, allowed to use fm_device.
#

MOTOAPPS_PATH := vendor/motorola/motoapps-kyoto

PRODUCT_SOONG_NAMESPACES += $(MOTOAPPS_PATH)

PRODUCT_PACKAGES += \
    FMPlayer \
    MotoMultiVolume \
    GameMode \
    MotoFaceUnlockArcSoft \
    MotoScreenshotEditor \
    MotoSpaces \
    AudioFx \
    AudioRecorder \
    TimeWeather \
    FMRadioService \
    MotoBtAptxMode \
    MotoLiveWallpaper3 \
    moto-checkin \
    mmiequalizer \
    motoaudioeffectsdk \
    qcom.fmradio

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(MOTOAPPS_PATH)/proprietary/product/etc,$(TARGET_COPY_OUT_PRODUCT)/etc) \
    $(call find-copy-subdir-files,*,$(MOTOAPPS_PATH)/proprietary/system_ext/etc,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc) \
    $(call find-copy-subdir-files,*,$(MOTOAPPS_PATH)/proprietary/etc/permissions,$(TARGET_COPY_OUT_SYSTEM)/etc/permissions) \
    $(MOTOAPPS_PATH)/proprietary/system_ext/lib64/libfmxjni.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libfmxjni.so \
    $(MOTOAPPS_PATH)/proprietary/lib64/motorola.hardware.mtk.fm-V1-ndk.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/motorola.hardware.mtk.fm-V1-ndk.so \
    $(call find-copy-subdir-files,*.so,$(MOTOAPPS_PATH)/proprietary/product/priv-app/MotoFaceUnlockArcSoft/lib/arm64,$(TARGET_COPY_OUT_PRODUCT)/priv-app/MotoFaceUnlockArcSoft/lib/arm64)
