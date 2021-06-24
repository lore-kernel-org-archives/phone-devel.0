Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08287C48BDF
	for <phone-devel@archiver.kernel.org>; Thu, 24 Jun 2021 09:12:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D48D8613F1
	for <phone-devel@archiver.kernel.org>; Thu, 24 Jun 2021 09:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhFXJOZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 24 Jun 2021 05:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbhFXJOY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 24 Jun 2021 05:14:24 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70043C061574
        for <phone-devel@vger.kernel.org>; Thu, 24 Jun 2021 02:12:05 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u20so6740356ljl.13
        for <phone-devel@vger.kernel.org>; Thu, 24 Jun 2021 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HIjjkrhJkKbWV7rhOWYOshAQwVbvtDhpqUYiKsC6Ot4=;
        b=p8x3ciy7hr/oeoQawxK+kSbo/ytJGGpK5agRuSrEjvg7FXyF53/uCEYr12qZUnhoJx
         evlg0HRH8UeOcgUD1OhPfreQoxWJYOgVBqV6R/n3euvt1rFMHMXXW7iCOuW3eHaY2cXT
         vo+8CYY3zbvVDksCje+JankXJ8LJuw8gDpHhGGOV/T7xf5zLMsglL/eVP4wN2N7FiorB
         p1wk8XpOnbkRufeRAUU2MHGmVFmCUhFI1icMigWyDqV3O7HY7jg9UA5V4GBKapObfZ9k
         szHevBnwVAtkk/7aLwDTBktQjjfBvT/kI8cSZ7VToauzdf07gIlPb80DodzwMFmfBZYi
         7skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HIjjkrhJkKbWV7rhOWYOshAQwVbvtDhpqUYiKsC6Ot4=;
        b=YkDXlAE4okIu/S58c6tJ8CyE/k92ewOcScR2BUPl6/E0DEN9H91L6i2N8Kgbj7q6tK
         I3IjCen21u9wBf71BFfmcvxwv+RfawmZPFyCZXHfSwHeyzSH/BZBjZN7YTYzDK9q/z2B
         0GliNETRm/I1ZE3mzAgcswt0eXvqnttuRHoTpH0XIYOEtV4A3Vf+zcDdtXCfbGJvLcL4
         JaF6odiRxtmRZZTs9OKtJMdC5KtZY/dMQEIC0IuT9W0CImdQpY+yPdgDSk0mdq090mxX
         D3f0adL30ruo5wtyrzq8ZPtwLCpD62PoNO+dFZ8Anbdtr/OlndB5EbMbPW0OXm3WNAfF
         zckQ==
X-Gm-Message-State: AOAM531A8iSbndBj92/dpsBJZtIHKozFkv0+4kCtXZ1r/HSqDsL8275f
        RThxX0Kb1XA4KbHJ5axsDttF7A==
X-Google-Smtp-Source: ABdhPJw8mKqij7opw+HfRWuPk/3V9zTnrasZ6jozJgrMTPradb2J+d9fJ59DZcm4jQGHQFNKXSwG0Q==
X-Received: by 2002:a2e:9788:: with SMTP id y8mr3107724lji.100.1624525922503;
        Thu, 24 Jun 2021 02:12:02 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m9sm182700lfb.30.2021.06.24.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 02:12:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Add device tree for Samsung Gavini
Date:   Thu, 24 Jun 2021 11:10:00 +0200
Message-Id: <20210624091000.2431695-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds a device tree for the Samsung Galaxy Beam GT-I8530
also known as Gavini.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/ste-dbx5x0-pinctrl.dtsi     |  18 +
 .../arm/boot/dts/ste-ux500-samsung-gavini.dts | 852 ++++++++++++++++++
 3 files changed, 871 insertions(+)
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f8f09c5066e7..8642dbd2d262 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1290,6 +1290,7 @@ dtb-$(CONFIG_ARCH_U8500) += \
 	ste-href520-tvk.dtb \
 	ste-ux500-samsung-golden.dtb \
 	ste-ux500-samsung-janice.dtb \
+	ste-ux500-samsung-gavini.dtb \
 	ste-ux500-samsung-skomer.dtb
 dtb-$(CONFIG_ARCH_UNIPHIER) += \
 	uniphier-ld4-ref.dtb \
diff --git a/arch/arm/boot/dts/ste-dbx5x0-pinctrl.dtsi b/arch/arm/boot/dts/ste-dbx5x0-pinctrl.dtsi
index 7bf7a2d34cbc..31a86606beda 100644
--- a/arch/arm/boot/dts/ste-dbx5x0-pinctrl.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0-pinctrl.dtsi
@@ -163,6 +163,24 @@ sleep_cfg1 {
 	};
 
 	i2c2 {
+		i2c2_b_1_default: i2c2_b_1_default {
+			default_mux {
+				function = "i2c2";
+				groups = "i2c2_b_1";
+			};
+			default_cfg1 {
+				pins = "GPIO8_AD5", "GPIO9_AE4"; /* SDA/SCL */
+				ste,config = <&in_nopull>;
+			};
+		};
+
+		i2c2_b_1_sleep: i2c2_b_1_sleep {
+			sleep_cfg1 {
+				pins = "GPIO8_AD5", "GPIO9_AE4"; /* SDA/SCL */
+				ste,config = <&slpm_in_wkup_pdis>;
+			};
+		};
+
 		i2c2_b_2_default: i2c2_b_2_default {
 			default_mux {
 				function = "i2c2";
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
new file mode 100644
index 000000000000..251a393f8528
--- /dev/null
+++ b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
@@ -0,0 +1,852 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Devicetree for the Samsung Galaxy Beam GT-I8530 also known as Gavini.
+ */
+
+/dts-v1/;
+#include "ste-db8500.dtsi"
+#include "ste-ab8500.dtsi"
+#include "ste-dbx5x0-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy Beam (GT-I8530)";
+	compatible = "samsung,gavini", "st-ericsson,u8500";
+
+	chosen {
+		stdout-path = &serial2;
+	};
+
+	/* TI TXS0206 level translator for 2.9 V */
+	sd_level_translator: regulator-gpio {
+		compatible = "regulator-fixed";
+
+		/* GPIO193 EN */
+		gpios = <&gpio6 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-name = "sd-level-translator";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-type = "voltage";
+
+		startup-delay-us = <200>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd_level_translator_default>;
+	};
+
+	/* External LDO for eMMC LDO VMEM_3V3 controlled by GPIO6 */
+	ldo_3v3_reg: regulator-gpio-ldo-3v3 {
+		compatible = "regulator-fixed";
+		/* Supplied in turn by VBAT */
+		regulator-name = "VMEM_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <5000>; // FIXME
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&emmc_ldo_en_default_mode>;
+	};
+
+	/*
+	 * External Ricoh "TSP" regulator for the touchscreen.
+	 * One GPIO line controls two voltages of 3.3V and 1.8V
+	 * this line is known as "TSP_LDO_ON1" in the schematics.
+	 */
+	ldo_tsp_3v3_reg: regulator-gpio-tsp-ldo-3v3 {
+		compatible = "regulator-fixed";
+		/* Supplied in turn by VBAT */
+		regulator-name = "LDO_TSP_A3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		/* GPIO94 controls this regulator */
+		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		/* 70 ms power-on delay */
+		startup-delay-us = <70000>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tsp_ldo_en_default_mode>;
+	};
+	ldo_tsp_1v8_reg: regulator-gpio-tsp-ldo-1v8 {
+		compatible = "regulator-fixed";
+		/* Supplied in turn by VBAT */
+		regulator-name = "VREG_TSP_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		/* GPIO94 controls this regulator */
+		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		/* 70 ms power-on delay */
+		startup-delay-us = <70000>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tsp_ldo_en_default_mode>;
+	};
+
+	/*
+	 * External Ricoh RP152L010B-TR LCD LDO regulator for the display.
+	 * LCD_PWR_EN controls both a 3.0V and 1.8V output.
+	 */
+	lcd_3v0_reg: regulator-gpio-lcd-3v0 {
+		compatible = "regulator-fixed";
+		/* Supplied in turn by VBAT */
+		regulator-name = "VREG_LCD_3V0";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		/* GPIO219 controls this regulator */
+		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_pwr_en_default_mode>;
+	};
+	lcd_1v8_reg: regulator-gpio-lcd-1v8 {
+		compatible = "regulator-fixed";
+		/* Supplied in turn by VBAT */
+		regulator-name = "VREG_LCD_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		/* GPIO219 controls this regulator too */
+		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_pwr_en_default_mode>;
+	};
+
+	/*
+	 * This regulator is a GPIO line that drives the Broadcom WLAN
+	 * line WL_REG_ON high and enables the internal regulators
+	 * inside the chip. Unfortunatley it is erroneously named
+	 * WLAN_RST_N on the schematic but it is not a reset line.
+	 *
+	 * The voltage specified here is only used to determine the OCR mask,
+	 * the for the SDIO connector, the chip is actually connected
+	 * directly to VBAT.
+	 */
+	wl_reg: regulator-gpio-wlan {
+		compatible = "regulator-fixed";
+		regulator-name = "WL_REG_ON";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		startup-delay-us = <100000>;
+		/* GPIO215 (WLAN_RST_N to WL_REG_ON) */
+		gpio = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_ldo_en_default>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_default_mode>;
+
+		button-projector {
+			linux,code = <KEY_SWITCHVIDEOMODE>;
+			label = "Projector";
+			/* GPIO32 "Projector On HotKey" */
+			gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+		};
+		button-home {
+			linux,code = <KEY_HOME>;
+			label = "HOME";
+			/* GPIO91 */
+			gpios = <&gpio2 27 GPIO_ACTIVE_LOW>;
+		};
+		button-volup {
+			linux,code = <KEY_VOLUMEUP>;
+			label = "VOL+";
+			/* GPIO67 */
+			gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
+		};
+		button-voldown {
+			linux,code = <KEY_VOLUMEDOWN>;
+			label = "VOL-";
+			/* GPIO92 */
+			gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	/* Richtek RT8515GQW Flash LED Driver IC */
+	flash {
+		compatible = "richtek,rt8515";
+		/* GPIO 140 */
+		enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		/* GPIO 141 */
+		ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		/*
+		 * RFS is 16 kOhm and RTS is 100 kOhm giving
+		 * the flash max current 343mA and torch max
+		 * current 55 mA.
+		 */
+		richtek,rfs-ohms = <16000>;
+		richtek,rts-ohms = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_flash_default_mode>;
+
+		led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+			flash-max-microamp = <343750>;
+			led-max-microamp = <55000>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_leds_default_mode>;
+		used-led {
+			label = "touchkeys";
+			/* GPIO68 */
+			gpios = <&gpio2 4 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	ktd259: backlight {
+		compatible = "kinetic,ktd259";
+		/* GPIO20 */
+		enable-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+		/* Default to 13/32 brightness */
+		default-brightness = <13>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ktd259_backlight_default_mode>;
+	};
+
+	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
+	i2c-gpio-0 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_gpio_0_default>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* TODO: Memsic MMC328 magnetometer */
+		magnetometer@30 {
+			compatible = "memsic,mmc328";
+			reg = <0x30>;
+			/* TODO: if you have the schematic, check if both voltages come from AUX2 */
+			/* VDA 1.8 V */
+			vda-supply = <&ab8500_ldo_aux2_reg>;
+			/* VDD 1.8V */
+			vdd-supply = <&ab8500_ldo_aux2_reg>;
+			/* GPIO204 */
+			reset-gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc328_default>;
+		};
+		/* TODO: this should also be used by the NCP6914 Camera power management unit */
+	};
+
+	/*
+	 * TODO: See if we can use the PL023 for this instead.
+	 */
+	spi-gpio-0 {
+		compatible = "spi-gpio";
+		/* Clock on GPIO220, pin SCL */
+		sck-gpios = <&gpio6 28 GPIO_ACTIVE_HIGH>;
+		/* MOSI on GPIO224, pin SDI "slave data in" */
+		mosi-gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
+		/* MISO on GPIO225, pin SDO "slave data out" */
+		miso-gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
+		/* Chip select on GPIO223 */
+		cs-gpios = <&gpio6 31 GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&spi_gpio_0_default>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		panel@0 {
+			compatible = "samsung,lms397kf04";
+			/* 300 ns at read cycle -> 3 MHz max speed */
+			//spi-max-frequency = <3000000>;
+			spi-max-frequency = <1200000>;
+			/* TYPE 3: inverse clock polarity and phase */
+			spi-cpha;
+			spi-cpol;
+
+			reg = <0>;
+			vci-supply = <&lcd_3v0_reg>;
+			vccio-supply = <&lcd_1v8_reg>;
+			/* Reset on GPIO139 */
+			reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&panel_default_mode>;
+			backlight = <&ktd259>;
+
+			port {
+				panel_in: endpoint {
+					remote-endpoint = <&display_out>;
+				};
+			};
+		};
+	};
+
+	/* Bit-banged I2C on GPIO201 and GPIO202 also called "MOT_I2C" */
+	i2c-gpio-2 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio6 10 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio6 9 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_gpio_2_default>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* TODO: add the Immersion ISA1200 I2C device here */
+	};
+
+	/* Bit-banged I2C on GPIO196 and GPIO197 also called "MPR_I2C" */
+	i2c-gpio-3 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio6 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio6 4 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_gpio_3_default>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* TODO: add the DPP2601 projector I2C device 0x1b here */
+	};
+
+	soc {
+		/* External Micro SD slot */
+		mmc@80126000 {
+			arm,primecell-periphid = <0x10480180>;
+			max-frequency = <50000000>;
+			bus-width = <4>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			st,sig-pin-fbclk;
+			full-pwr-cycle;
+			/* MMC is powered by AUX3 1.2V .. 2.91V */
+			vmmc-supply = <&ab8500_ldo_aux3_reg>;
+			/* 2.9 V level translator */
+			vqmmc-supply = <&sd_level_translator>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&mc0_a_2_default>;
+			pinctrl-1 = <&mc0_a_2_sleep>;
+			/* "flash detect" actually card detect */
+			cd-gpios  = <&gpio6 25 GPIO_ACTIVE_LOW>;
+			status = "okay";
+		};
+
+		/* WLAN SDIO channel */
+		mmc@80118000 {
+			arm,primecell-periphid = <0x10480180>;
+			max-frequency = <50000000>;
+			bus-width = <4>;
+			non-removable;
+			cap-sd-highspeed;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&mc1_a_2_default>;
+			pinctrl-1 = <&mc1_a_2_sleep>;
+			/*
+			 * GPIO-controlled voltage enablement: this drives
+			 * the WL_REG_ON line high when we use this device.
+			 * Represented as regulator to fill OCR mask.
+			 */
+			vmmc-supply = <&wl_reg>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+
+			wifi@1 {
+				compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
+				reg = <1>;
+				/* GPIO216 WL_HOST_WAKE */
+				interrupt-parent = <&gpio6>;
+				interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+				interrupt-names = "host-wake";
+				pinctrl-names = "default";
+				pinctrl-0 = <&wlan_default_mode>;
+			};
+		};
+
+		/* eMMC */
+		mmc@80005000 {
+			arm,primecell-periphid = <0x10480180>;
+		        max-frequency = <50000000>;
+			bus-width = <8>;
+			non-removable;
+			cap-mmc-highspeed;
+			mmc-ddr-1_8v;
+			vmmc-supply = <&ldo_3v3_reg>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&mc2_a_1_default>;
+			pinctrl-1 = <&mc2_a_1_sleep>;
+			status = "okay";
+		};
+
+		/* GBF (Bluetooth) UART */
+		uart@80120000 {
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&u0_a_1_default>;
+			pinctrl-1 = <&u0_a_1_sleep>;
+			status = "okay";
+
+			bluetooth {
+				compatible = "brcm,bcm4330-bt";
+				/* GPIO222 rail BT_VREG_EN to BT_REG_ON */
+				shutdown-gpios = <&gpio6 30 GPIO_ACTIVE_HIGH>;
+				/* BT_WAKE on GPIO199 */
+				device-wakeup-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
+				/* BT_HOST_WAKE on GPIO97 */
+				host-wakeup-gpios = <&gpio3 1 GPIO_ACTIVE_HIGH>;
+				/* BT_RST_N on GPIO209 */
+				reset-gpios = <&gpio6 17 GPIO_ACTIVE_LOW>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&bluetooth_default_mode>;
+			};
+		};
+
+		/* GPS UART */
+		uart@80121000 {
+			status = "okay";
+			pinctrl-names = "default", "sleep";
+			/* CTS/RTS is not used, CTS is repurposed as GPIO */
+			pinctrl-0 = <&u1rxtx_a_1_default>;
+			pinctrl-1 = <&u1rxtx_a_1_sleep>;
+			/* FIXME: add a device for the GPS here */
+		};
+
+		/* Debugging console UART connected to TSU6111RSVR (FSA880) */
+		uart@80007000 {
+			status = "okay";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&u2rxtx_c_1_default>;
+			pinctrl-1 = <&u2rxtx_c_1_sleep>;
+		};
+
+		prcmu@80157000 {
+			ab8500 {
+				ab8500_usb {
+					pinctrl-names = "default", "sleep";
+					pinctrl-0 = <&usb_a_1_default>;
+					pinctrl-1 = <&usb_a_1_sleep>;
+				};
+
+				ab8500-regulators {
+					ab8500_ldo_aux1 {
+						/* Used for VDD for sensors */
+						regulator-name = "V-SENSORS-VDD";
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3000000>;
+					};
+
+					ab8500_ldo_aux2 {
+						/* Used for VIO for sensors */
+						regulator-name = "V-SENSORS-VIO";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					ab8500_ldo_aux3 {
+						/* Used for voltage for external MMC/SD card */
+						regulator-name = "V-MMC-SD";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <2910000>;
+					};
+				};
+			};
+		};
+
+		/* I2C0 */
+		i2c@80004000 {
+			status = "okay";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c0_a_1_default>;
+			pinctrl-1 = <&i2c0_a_1_sleep>;
+
+			/* FIXME: fix the proximity sensor bindings and driver */
+			proximity@39 {
+				/* Gavini has the GP2A030S00F proximity sensor */
+				compatible = "sharp,gp2a030s00f";
+				clock-frequency = <400000>;
+				reg = <0x39>;
+				/* FIXME: GPIO146 provides power on, IR LED? */
+			};
+
+			gyroscope@68 {
+				compatible = "invensense,mpu3050";
+				reg = <0x68>;
+				/* GPIO226 interrupt */
+				interrupt-parent = <&gpio7>;
+				interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+				mount-matrix = "0", "1", "0",
+					       "1", "0", "0",
+					       "0", "0", "1";
+				vlogic-supply = <&ab8500_ldo_aux2_reg>; // 1.8V
+				vdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
+				pinctrl-names = "default";
+				pinctrl-0 = <&mpu3050_default>;
+
+				/*
+				 * The MPU-3050 acts as a hub for the
+				 * accelerometer.
+				 */
+				i2c-gate {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* Bosch BMA222E accelerometer */
+					accelerometer@18 {
+						compatible = "bosch,bma222e";
+						reg = <0x18>;
+						mount-matrix = "0", "1", "0",
+							       "-1", "0", "0",
+							       "0", "0", "1";
+						vddio-supply = <&ab8500_ldo_aux2_reg>; // 1.8V
+						vdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
+					};
+				};
+			};
+		};
+
+		/* I2C2 "AGC I2C" */
+		i2c@80128000 {
+			status = "okay";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c2_b_1_default>;
+			pinctrl-1 = <&i2c2_b_1_sleep>;
+
+			/* Texas Instruments TSU6111 micro USB switch */
+			usb-switch@25 {
+				compatible = "ti,tsu6111";
+				reg = <0x25>;
+				/* Interrupt JACK_INT_N on GPIO95 */
+				interrupt-parent = <&gpio2>;
+				interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&tsu6111_default>;
+			};
+		};
+
+		/* I2C3 */
+		i2c@80110000 {
+			status = "okay";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c3_c_2_default>;
+			pinctrl-1 = <&i2c3_c_2_sleep>;
+
+			/* Melfas MMS136 touchscreen */
+			touchscreen@48 {
+				compatible = "melfas,mms136";
+				reg = <0x48>;
+				/* GPIO218 (TSP_INT_1V8) */
+				interrupt-parent = <&gpio6>;
+				interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+				/* AVDD is "analog supply", 2.57-3.47 V */
+				avdd-supply = <&ldo_tsp_3v3_reg>;
+				/* VDD is "digital supply" 1.71-3.47V */
+				vdd-supply = <&ldo_tsp_1v8_reg>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&tsp_default>;
+				touchscreen-size-x = <480>;
+				touchscreen-size-y = <800>;
+			};
+		};
+
+		mcde@a0350000 {
+			status = "okay";
+			pinctrl-names = "default";
+			pinctrl-0 = <&dpi_default_mode>;
+
+			port {
+				display_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	/*
+	 * This extends the MC0_A_2 default config to include
+	 * the card detect GPIO217 line.
+	 */
+	sdi0 {
+		mc0_a_2_default {
+			default_cfg4 {
+				pins = "GPIO217_AH12"; /* card detect */
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+	};
+	mcde {
+		dpi_default_mode: dpi_default {
+			default_mux1 {
+				/* Mux in all the data lines */
+				function = "lcd";
+				groups =
+					/* Data lines D0-D7 GPIO70..GPIO77 */
+					"lcd_d0_d7_a_1",
+					/* Data lines D8-D11 GPIO78..GPIO81 */
+					"lcd_d8_d11_a_1",
+					/* Data lines D12-D15 GPIO82..GPIO85 */
+					"lcd_d12_d15_a_1",
+					/* Data lines D16-D23 GPIO161..GPIO168 */
+					"lcd_d16_d23_b_1";
+			};
+			default_mux2 {
+				function = "lcda";
+				/* Clock line on GPIO150, DE, VSO, HSO on GPIO169..GPIO171 */
+				groups = "lcdaclk_b_1", "lcda_b_1";
+			};
+			/* Input, no pull-up is the default state for pins used for an alt function */
+			default_cfg1 {
+				pins = "GPIO150_C14", "GPIO169_D22", "GPIO170_C23", "GPIO171_D23";
+				ste,config = <&in_nopull>;
+			};
+		};
+	};
+	/* GPIO for panel reset control */
+	panel {
+		panel_default_mode: panel_default {
+			gavini_cfg1 {
+				/* Reset line */
+				pins = "GPIO139_C9";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
+	/* GPIO that enables the LDO regulator for the eMMC */
+	emmc-ldo {
+		emmc_ldo_en_default_mode: emmc_ldo_default {
+			/* LDO enable on GPIO6 */
+			gavini_cfg1 {
+				pins = "GPIO6_AF6";
+				ste,config = <&gpio_out_hi>;
+			};
+		};
+	};
+	/* GPIO that enables the LDO regulator for the touchscreen */
+	tsp-ldo {
+		tsp_ldo_en_default_mode: tsp_ldo_default {
+			/* LDO enable on GPIO94 */
+			gavini_cfg1 {
+				pins = "GPIO94_D7";
+				ste,config = <&gpio_out_hi>;
+			};
+		};
+	};
+	/* Flash and torch */
+	flash {
+		gpio_flash_default_mode: flash_default {
+			janice_cfg1 {
+				pins = "GPIO140_B11", "GPIO141_C12";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
+	/* GPIO that enables the LDO regulator for the key LED */
+	gpio-leds {
+		gpio_leds_default_mode: gpio_leds_default {
+			/* EN_LED_LDO on GPIO68 */
+			gavini_cfg1 {
+				pins = "GPIO68_E1";
+				ste,config = <&gpio_out_hi>;
+			};
+		};
+	};
+	backlight {
+		ktd259_backlight_default_mode: backlight_default {
+			skomer_cfg1 {
+				pins = "GPIO20_AB4"; /* LCD_BL_EN */
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
+	/* GPIO that enables the LDO regulator for the touchkeys */
+	touchkey-ldo {
+		tsp_ldo_on2_default_mode: tsp_ldo_on2_default {
+			/* TSP_LDO_ON2 on GPIO89 */
+			gavini_cfg1 {
+				pins = "GPIO89_E6";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
+	touchkey {
+		touchkey_default_mode: touchkey_default {
+			gavini_cfg1 {
+				/* Interrupt */
+				pins = "GPIO198_AG25";
+				ste,config = <&gpio_in_nopull>;
+			};
+			gavini_cfg2 {
+				/* Reset, actually completely unused (not routed) */
+				pins = "GPIO205_AG23";
+				ste,config = <&gpio_in_pd>;
+			};
+		};
+	};
+	/* GPIO that enables the LDO regulator for the LCD display */
+	lcd-ldo {
+		lcd_pwr_en_default_mode: lcd_pwr_en_default {
+			/* LCD_PWR_EN on GPIO219 */
+			gavini_cfg1 {
+				pins = "GPIO219_AG10";
+				ste,config = <&gpio_out_hi>;
+			};
+		};
+	};
+	/* GPIO that enables the WLAN internal LDO regulators */
+	wlan-ldo {
+		wlan_ldo_en_default: wlan_ldo_default {
+			/* GPIO215 named WLAN_RST_N */
+			gavini_cfg1 {
+				pins = "GPIO215_AH13";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
+	/* GPIO that enables the 2.9V SD card level translator */
+	sd-level-translator {
+		sd_level_translator_default: sd_level_translator_default {
+			/* level shifter on GPIO193 */
+			skomer_cfg1 {
+				pins = "GPIO193_AH27";
+				ste,config = <&gpio_out_hi>;
+			};
+		};
+	};
+	/* GPIO keys */
+	gpio-keys {
+		gpio_keys_default_mode: gpio_keys_default {
+			skomer_cfg1 {
+				pins = "GPIO32_V2", /* Projector On HotKey */
+				       "GPIO67_G2", /* VOL UP */
+				       "GPIO91_B6", /* HOME */
+				       "GPIO92_D6"; /* VOL DOWN */
+				ste,config = <&gpio_in_pu>;
+			};
+		};
+	};
+	/* Interrupt line for the Atmel MXT228 touchscreen */
+	tsp {
+		tsp_default: tsp_default {
+			gavini_cfg1 {
+				pins = "GPIO218_AH11";	/* TSP_INT_1V8 */
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+	};
+	/* Reset line for the Memsic MMC328 magnetometer */
+	mmc328 {
+		mmc328_default: mmc328_gavini {
+			gavini_cfg1 {
+				pins = "GPIO204_AF23";
+				ste,config = <&gpio_out_hi>;
+			};
+		};
+	};
+	/* Interrupt line for Invensense MPU3050 gyroscope */
+	mpu3050 {
+		mpu3050_default: mpu3050 {
+			gavini_cfg1 {
+				/* GPIO226 used for IRQ */
+				pins = "GPIO226_AF8";
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+	};
+	/* GPIO-based I2C bus for magnetometer and NCP6914 */
+	i2c-gpio-0 {
+		i2c_gpio_0_default: i2c_gpio_0 {
+			gavini_cfg1 {
+				pins = "GPIO143_D12", "GPIO144_B13";
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+	};
+	/* GPIO-based I2C bus for the Immersion ISA1200 */
+	i2c-gpio-2 {
+		i2c_gpio_2_default: i2c_gpio_2 {
+			gavini_cfg1 {
+				pins = "GPIO201_AF24", "GPIO202_AF25";
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+	};
+	/* GPIO-based I2C bus for the TI DPP2601 */
+	i2c-gpio-3 {
+		i2c_gpio_3_default: i2c_gpio_3 {
+			gavini_cfg1 {
+				pins = "GPIO196_AG26", "GPIO197_AH24";
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+	};
+	/* GPIO-based SPI bus for the display */
+	spi-gpio-0 {
+		spi_gpio_0_default: spi_gpio_0_d {
+			gavini_cfg1 {
+				pins = "GPIO220_AH10", "GPIO223_AH9", "GPIO224_AG9";
+				ste,config = <&gpio_out_hi>;
+			};
+			gavini_cfg2 {
+				pins = "GPIO225_AG8";
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+		spi_gpio_0_sleep: spi_gpio_0_s {
+			gavini_cfg1 {
+				pins = "GPIO220_AH10", "GPIO223_AH9",
+				     "GPIO224_AG9", "GPIO225_AG8";
+				ste,config = <&gpio_out_hi>;
+			};
+			gavini_cfg2 {
+				pins = "GPIO225_AG8";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
+	wlan {
+		wlan_default_mode: wlan_default {
+			/* GPIO216 for WL_HOST_WAKE */
+			gavini_cfg2 {
+				pins = "GPIO216_AG12";
+				ste,config = <&gpio_in_pd>;
+			};
+		};
+	};
+	bluetooth {
+		bluetooth_default_mode: bluetooth_default {
+			/* GPIO199 BT_WAKE and GPIO222 BT_VREG_ON */
+			gavini_cfg1 {
+				pins = "GPIO199_AH23", "GPIO222_AJ9";
+				ste,config = <&gpio_out_lo>;
+			};
+			/* GPIO97 BT_HOST_WAKE */
+			gavini_cfg2 {
+				pins = "GPIO97_D9";
+				ste,config = <&gpio_in_nopull>;
+			};
+			/* GPIO209 BT_RST_N */
+			gavini_cfg3 {
+				pins = "GPIO209_AG15";
+				ste,config = <&gpio_out_hi>;
+			};
+		};
+	};
+	/* Interrupt line for TI TSU6111 Micro USB switch */
+	tsu6111 {
+		tsu6111_default: tsu6111 {
+			gavini_cfg1 {
+				/* GPIO95 used for IRQ */
+				pins = "GPIO95_E8";
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+	};
+};
-- 
2.31.1

