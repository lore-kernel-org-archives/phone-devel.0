Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EECE3358CB
	for <phone-devel@vger.kernel.org>; Tue,  4 Nov 2025 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268314; cv=none; b=Zc7ux4FWFafv0pFP6asUmcXwH0Wdd0bkxePsHeBocgT2ifSUVaoqSUtp3Cy8/HBAbb9gT3HMEeUFSkKV4OPy+l+XAytr6RzKcqeQWmpBVQdH/TgCmRv9mTs8WOsJcYjtdiCVCULyceiE7Pt+5+U13M0KoxqJG58pbTgq1g1LZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268314; c=relaxed/simple;
	bh=hE1zsEoAYQeihS0jeK+MtnVz9GFFqyenFrwA14PktZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RsLuhWIO8xvj0J7Y8MRxs+fxX6PYgLznUSEwtKFEK2bXIxZqcX7P5K6wVZCjx4/9Y84ffFfrdYoaxmDR+qv6GRMaNS4AGcK2lgiVjmMijk7zxRWi9fV550gR0R5GfMyLYw7sXUAKDHw0k0ix0JkHp8AN02ORaurG0ApOdZ0Yit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGkHklNC; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGkHklNC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-641018845beso99841a12.3
        for <phone-devel@vger.kernel.org>; Tue, 04 Nov 2025 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268310; x=1762873110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4a5wcPALM8GOfKs0z25anJPOx5zdh7ANpA+yWaJ72oo=;
        b=EGkHklNCDiWa4ovIMqYixnB1ZOT73AMGH3FEl/QImQJ36zq82oTWo+OIDEcW4w2uFM
         5lpFgvYH/XTNxCgHDsq1sZTbNL+dls63NXATTO2B3IBXD5Fqj8Gl/vTQiAp4x/CmYwB+
         xvO9mYzs5fuV+ZF+q3v+GVWx2jFexBnTnHOnCBaYm2+2/znhq0zTXgStmmSS7mg8ZDc9
         06TpN2p4FaXAIjau96A0P8i77KdpwItsmqhyeMW9uUmCHsHHeew9HQB4xTmOpPEpWWoy
         dC30dIjm4Nxoe2W3MvSgyiF+uz98O/TeZVkQLTmILw7q3qs8NkLSNTuSq7ONyTBaXRZm
         v2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268310; x=1762873110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4a5wcPALM8GOfKs0z25anJPOx5zdh7ANpA+yWaJ72oo=;
        b=iTKRr7d+xULVMQLo8zQBpPFPn5ACx99YfzZvqLqU5iBIYekMtaAEPCtJudxtHWlVj+
         FQkiGHio27YTRZIK6JtnZqBnlygHlfCWM0b9s5SjrAMdzgJk+Vu1MCfyGcdk0E4HiltW
         Kn8x/yV0xLXWnp0nMkuJ+SSnVyoZb47n0jdosLER/tMQjt87BOZ8Dx/+3nKdlkfkk7cH
         Sv4ouatx5g4DkRXqOnOJ9j6r3SXGVgE1fPl0dDp+0RiktH/3SrvEqVcrQcYJ7xCcU6x0
         THsyCPWtouppyI1aOCT9LxC7W+Sv13ZspuljOeedF6uBV9kEOIKNuEn58hObrVh/BNAl
         mNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVXnKB+Kusyyez6NyWnPx5+L/pXtDM7o4fS3xcNR4ACMGQtslyC7qVI4JbCdTSRAv26KjUtxghh8jg/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZcpnBTAFnGfFXbdo/9Oauk9G37gdyFIedc7a9elJG9aF2c0jy
	QyTFTBt3BC5iI5LIWpnFMWZOTwETeBa4vmMTkFWkRWaA/Tl56vE9P1pQ
X-Gm-Gg: ASbGnctNSI+9J43EJJJt9jbvmBjl9hMyGfFDEDh9ho/d7SC3J6vLr04EMd4fOS2YuqS
	dJugtefZS0LBCMWkAkcCrwIWe46j8SYdc5FyJ4FBbPMEE8JJVBdRg2GOvtQN9DcCbvImpgo2CBg
	tejMIJxDDyHvxhuPKjjgeBFx2TGbJHbRXnYBabvMIFqF6k1kDEnA9zCWEQPYiFEm1xGvGbufJaa
	y/vzY/86x/Qjf9DT030/ijmJ/GnvAwrQfFI3TuhpFD+uF1X5+0gNn55pemMlpoHpy/dhWUfeAe8
	fP92/sEkR1dgYZQkh4WWvKvqvJVA10udOrdM5Yl10v58MzypOHUsnO3zFIwap3phunuyEsYZ/gD
	s6xivqMTDp8MQzZ2u6F83k8b4u6iPZbAsaGnDHRzMKxm/Vw4u0y6o3lEqFsgOV7MN5uo54w60na
	9JnpbOPhYtENOliQlcua9YEAIgPc5jsB9de03AWHjZ/0HjeQnl+Kg9AxpwBw==
X-Google-Smtp-Source: AGHT+IE3SPYwKN2D9uouVnpgHkPM4iWY0NPIvFkNtkB9fhZTnfyYXljSUYSwO1JZKzF4K/C/EDmk6w==
X-Received: by 2002:a05:6402:1472:b0:63b:feb1:3288 with SMTP id 4fb4d7f45d1cf-6407704cd63mr15674893a12.25.1762268310007;
        Tue, 04 Nov 2025 06:58:30 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:29 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:21 +0100
Subject: [PATCH RESEND v7 3/7] dt-bindings: clock: brcm,kona-ccu: Add
 BCM21664 and BCM281xx bus clocks
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-3-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6812;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=hE1zsEoAYQeihS0jeK+MtnVz9GFFqyenFrwA14PktZ8=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSOpSnAIZ3Z6c0gR1tTT6mBe/3BrU8mRyH5M
 c63ilow95uJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjgAKCRCzu/ihE6BR
 aKYFEACXrIwrhw9pO3A/WWrRSvnhuf6JBILKSX3SzeK1xRhm7N0+qH1Gs6vS9kVhStn9inbkZft
 Nt4yK2mSw8F11y7XrT/tmNj+GNxh28q9WftqaOD9GY9jlBLiQug4iPIzi0+No5XCmgzQ55iBIvm
 RzSOPuIswtHfqdvV4M8gCuoMPbPr5Whd1eTL8wwd2ggh3WZWiJGEBJv82KLrIl2Otqe0shADgrx
 dvHmgqfGErgcfkC7ALlgyt+45pAAua5UMHBOojQQRJ34ldVKwhSZFrYR2w6V1e3giXo565BPqsS
 abZf0Sw0swA+eg5yiucRslPkurm+O1gDuYq5masacVlotWIbRAZu2YRksu+WqmIa2r/uKhltjd2
 u1rcClF9ZSmlyC2H/rX2z1+WzC4IbQEiPYHlzQuXBoj3JyA+t/npRFp18qXZ8JxJPAEapt6W1EQ
 QQ8DOS+6HatN9hb2visevAqqwQn+WgMI9HqamAivk8dd5Dp5XHyIRI1vcST+PGlfd/K8FfgVCb7
 KK+dFkLlTtCgnyamUCxXISxTfNsOP1GQIwJ6IWvzT6c6ryKPT6Lamc0ZdW3/5r3bjNj3Za+L1mh
 aVywvj8t8Bvw1e/caOSDzpWxeMaC6fFcDnd/Yi7ZyQc7N276zHG4yQGoM5VeUliSeIJSybs/PQ7
 MKdhblxIaN40rJg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Add bus clocks corresponding to peripheral clocks currently supported
by the BCM21664 and BCM281xx clock drivers and add the relevant clock
IDs to the dt-bindings headers (bcm21664.h, bcm281xx.h).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Squash BCM21664 and BCM281xx bus clock bindings commits
---
 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   | 49 ++++++++++++++++++++--
 include/dt-bindings/clock/bcm21664.h               | 13 ++++++
 include/dt-bindings/clock/bcm281xx.h               | 19 +++++++++
 3 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml b/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
index e5656950b3bd..d00dcf916b45 100644
--- a/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/brcm,kona-ccu.yaml
@@ -40,7 +40,7 @@ properties:
 
   clock-output-names:
     minItems: 1
-    maxItems: 10
+    maxItems: 20
 
 required:
   - compatible
@@ -61,6 +61,8 @@ allOf:
             - const: hub_timer
             - const: pmu_bsc
             - const: pmu_bsc_var
+            - const: hub_timer_apb
+            - const: pmu_bsc_apb
   - if:
       properties:
         compatible:
@@ -86,6 +88,13 @@ allOf:
             - const: usb_ic
             - const: hsic2_48m
             - const: hsic2_12m
+            - const: sdio1_ahb
+            - const: sdio2_ahb
+            - const: sdio3_ahb
+            - const: sdio4_ahb
+            - const: usb_ic_ahb
+            - const: hsic2_ahb
+            - const: usb_otg_ahb
   - if:
       properties:
         compatible:
@@ -116,6 +125,16 @@ allOf:
             - const: bsc2
             - const: bsc3
             - const: pwm
+            - const: uartb_apb
+            - const: uartb2_apb
+            - const: uartb3_apb
+            - const: uartb4_apb
+            - const: ssp0_apb
+            - const: ssp2_apb
+            - const: bsc1_apb
+            - const: bsc2_apb
+            - const: bsc3_apb
+            - const: pwm_apb
   - if:
       properties:
         compatible:
@@ -124,7 +143,9 @@ allOf:
     then:
       properties:
         clock-output-names:
-          const: hub_timer
+          items:
+            - const: hub_timer
+            - const: hub_timer_apb
   - if:
       properties:
         compatible:
@@ -142,6 +163,11 @@ allOf:
             - const: sdio2_sleep
             - const: sdio3_sleep
             - const: sdio4_sleep
+            - const: sdio1_ahb
+            - const: sdio2_ahb
+            - const: sdio3_ahb
+            - const: sdio4_ahb
+            - const: usb_otg_ahb
   - if:
       properties:
         compatible:
@@ -158,6 +184,13 @@ allOf:
             - const: bsc2
             - const: bsc3
             - const: bsc4
+            - const: uartb_apb
+            - const: uartb2_apb
+            - const: uartb3_apb
+            - const: bsc1_apb
+            - const: bsc2_apb
+            - const: bsc3_apb
+            - const: bsc4_apb
 
 additionalProperties: false
 
@@ -176,6 +209,16 @@ examples:
                            "bsc1",
                            "bsc2",
                            "bsc3",
-                           "pwm";
+                           "pwm",
+                           "uartb_apb",
+                           "uartb2_apb",
+                           "uartb3_apb",
+                           "uartb4_apb",
+                           "ssp0_apb",
+                           "ssp2_apb",
+                           "bsc1_apb",
+                           "bsc2_apb",
+                           "bsc3_apb",
+                           "pwm_apb";
     };
 ...
diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7a380a51848c..9f3614eb9036 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -25,6 +25,7 @@
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
+#define BCM21664_AON_CCU_HUB_TIMER_APB		1
 
 /* master CCU clock ids */
 
@@ -36,6 +37,11 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
+#define BCM21664_MASTER_CCU_SDIO1_AHB		8
+#define BCM21664_MASTER_CCU_SDIO2_AHB		9
+#define BCM21664_MASTER_CCU_SDIO3_AHB		10
+#define BCM21664_MASTER_CCU_SDIO4_AHB		11
+#define BCM21664_MASTER_CCU_USB_OTG_AHB		12
 
 /* slave CCU clock ids */
 
@@ -46,5 +52,12 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
+#define BCM21664_SLAVE_CCU_UARTB_APB		7
+#define BCM21664_SLAVE_CCU_UARTB2_APB		8
+#define BCM21664_SLAVE_CCU_UARTB3_APB		9
+#define BCM21664_SLAVE_CCU_BSC1_APB		10
+#define BCM21664_SLAVE_CCU_BSC2_APB		11
+#define BCM21664_SLAVE_CCU_BSC3_APB		12
+#define BCM21664_SLAVE_CCU_BSC4_APB		13
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index 0c7a7e10cb42..8e3ac4ab3e16 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -33,6 +33,8 @@
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
+#define BCM281XX_AON_CCU_HUB_TIMER_APB		3
+#define BCM281XX_AON_CCU_PMU_BSC_APB		4
 
 /* hub CCU clock ids */
 
@@ -47,6 +49,13 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
+#define BCM281XX_MASTER_CCU_SDIO1_AHB		7
+#define BCM281XX_MASTER_CCU_SDIO2_AHB		8
+#define BCM281XX_MASTER_CCU_SDIO3_AHB		9
+#define BCM281XX_MASTER_CCU_SDIO4_AHB		10
+#define BCM281XX_MASTER_CCU_USB_IC_AHB		11
+#define BCM281XX_MASTER_CCU_HSIC2_AHB		12
+#define BCM281XX_MASTER_CCU_USB_OTG_AHB		13
 
 /* slave CCU clock ids */
 
@@ -60,5 +69,15 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
+#define BCM281XX_SLAVE_CCU_UARTB_APB		10
+#define BCM281XX_SLAVE_CCU_UARTB2_APB		11
+#define BCM281XX_SLAVE_CCU_UARTB3_APB		12
+#define BCM281XX_SLAVE_CCU_UARTB4_APB		13
+#define BCM281XX_SLAVE_CCU_SSP0_APB		14
+#define BCM281XX_SLAVE_CCU_SSP2_APB		15
+#define BCM281XX_SLAVE_CCU_BSC1_APB		16
+#define BCM281XX_SLAVE_CCU_BSC2_APB		17
+#define BCM281XX_SLAVE_CCU_BSC3_APB		18
+#define BCM281XX_SLAVE_CCU_PWM_APB		19
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.51.1

