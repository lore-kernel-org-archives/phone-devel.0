Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32B3064B7
	for <phone-devel@vger.kernel.org>; Mon, 13 Oct 2025 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760362925; cv=none; b=qCHd107Fhx1HOWaf01J8ntzhyYDB0EWu/DICatbu+NlV8BLPHFGxyUsujhojh+ZJnGaFi3Yq154uXhU9v+kWCj798dFA9jL42jdPf76xeHF0tiJw1N6MGDJh7BWFGaBt/6kydlV7BLRzd9FJyABBxat0ran6Zrd6wmRN6Z0ZE3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760362925; c=relaxed/simple;
	bh=4p8s91lohiM8ZgIIJ7dsaunBWhjFWuVcW0lxcrxGmtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIRC3pF4LengHOzga6/wuWAC518vFmiSkZ8f/JXWLJOsv1KDuzs49WESUvlMmon5msQydAmIv3JmgV/dCnxgQqaqxKWSHZkRqirfsgj3aBBsxQg45X72tM+Gv81mDwY1uyLdlTOnzJQUt4rBiOCYPtr3NBC3/id4fvMdY6q1JGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jocA3oRr; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jocA3oRr"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso1056957a12.1
        for <phone-devel@vger.kernel.org>; Mon, 13 Oct 2025 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362922; x=1760967722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SklZkzYSGJHyu+AszEE/sx59nay18edLyXvvsUykUXQ=;
        b=jocA3oRrSH3w1OG45vBII7dLoFaVYTAoXNbinlaWVCgkt40LniMShhdu8MNQU/ZFCM
         XPRTIq2mUVxfAg+bUHVa8k4Zdl43xk/Qy+Fy6YhAUp/m4UbPMvbrEomdFlyB9vX42qzi
         M1gt2GeoxgWSv/Br6iXSguHF+DqXUDZPpCzJDC0DHK0rUINKmzzkjmLXZVTKJw4ANrd3
         S89miV02riWVSiExBtthWKUUD1IgxLuWvCBj54eVNVH8QPK8XwqdD5lObRv2nYG33KR5
         VI0ZvLVlbmaa7lFU0EOL4QwYsDlrDPk0M0idgSGplMk5dGBx7qJTHfSbzH6R+HuRXPMC
         mlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362922; x=1760967722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SklZkzYSGJHyu+AszEE/sx59nay18edLyXvvsUykUXQ=;
        b=Bk9SepvIPBnUeaqz2D5L84OLK20Mh6PKgv/xuIBNLith+1AsimHIyVh1lpa1ibzvLz
         oJAmOC1L1axWCIjsFA80Ul8hi5c1lMKrQ+gsZKveuXJGlqAslA5S54Xz28oG4XhWHI4G
         4luOWrjPtCutqNrSN7wlK0QHuKTW/5Bn4I35BwXx+7DDNa5pIJsOkjG/BS1Teo+d75Bu
         qRkfXLwMSbwSZY5IGSV12AQJjzwGuhiw4tykf7PyHFZHHup7dMG5wu6s+IYJDVsYJ/G6
         PF89Rw0m14BMYXkOLTOGb6n4KGZWMjzFwEgnYXor7K+Ez9XRLGvN+wQWn8REaClEktmG
         4FTA==
X-Forwarded-Encrypted: i=1; AJvYcCUkE1Jp+A2w6cYJM4YtRxWIBneoEzBYbUglKA/yUgSqWvi5T5Hr7RkjLWOWDVlBgr9snQvA990fJEXu+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypr0JWqp5/zbf3WAnoKqS4S7qi1jQ+vI+45ERVodEkDHYPaDhE
	+tg0weH1w4PHtsQxPQdqE4pK57mOLdBdM9fQPgDY5hbqIcytnJ4KJrZhh0NQdXOd
X-Gm-Gg: ASbGncschGrs3gjQMZSXs1CnVLIi0bSTzRZlc4HuGYbA6JYkolO0avz4Mi4Q+cNM035
	YErmSzRwxaWjQ1PlctavWd0Ij3kNkcJv6Sx8oP4AREBqKTEK9Mz9wne1U8ilBwj4YApneGw/ikr
	thMNmhfL2T91QbFxutZvka6qZU6FCNGY3h5vTSZe2DcMMs7PegtaT090vatu/CJjFm45dH6lnrr
	JznPHfTNNRY++gCJF7te0oqRQdZTKiocBjSrSM3nd4fiJCJ5/0iJREPlRr3LE1fCtGp45tdBJxy
	SUQtLWnNuv+JXIQFw5Wkb2dHnSpj+XAwmZTXvWMHwCbOGay8GQEsP0SvM6z5E/E3U4hpWu3IL7f
	Kb6Ugjrwcib5el4hCFsq33s1HR125MMcPEPO596fYjk+cavA/wBY4Q6My0rUl0mO6D9lVHgJcCZ
	IXvOYU65OHWiZNhseqFvOz6z0=
X-Google-Smtp-Source: AGHT+IEAl4lODxRfcbp3525fwpCtZ3+kSf1osD53rmt93aTkxrS5bnvg/FQbso42m1ypQ2i6KL+7nA==
X-Received: by 2002:a05:6402:1cc1:b0:633:ddd4:4e37 with SMTP id 4fb4d7f45d1cf-639d615bf92mr20090946a12.13.1760362920499;
        Mon, 13 Oct 2025 06:42:00 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:42:00 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 13 Oct 2025 15:41:50 +0200
Subject: [PATCH v7 3/7] dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and
 BCM281xx bus clocks
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kona-bus-clock-v7-3-8f473d99ae19@gmail.com>
References: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
In-Reply-To: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
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
 bh=4p8s91lohiM8ZgIIJ7dsaunBWhjFWuVcW0lxcrxGmtg=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGf2WFrBlI+tY0anQ/zrVCCp9ue4xc1mg5Zv
 UoEVmUJsgOJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BnwAKCRCzu/ihE6BR
 aDibD/41P8rrgVeBNe6eyQ6F4ErzG2f5/1mvvy3y+dK4vhljIQbKVfRumuhgQnB7ar1snww5wry
 XNQVj9wiTz+UVEhp8PLGKdhfQsO1bJzBNAXPDZP0AwnG4FXepocE2K4uObg7l09MIBmfLuIr41r
 Wc3gOdCEO7s6l01sBpf5pDJbGZEiNrOkyOIGXclSZQF5TYB3T9nPIacXfiCPGjt7ZhLowqDAocT
 3VMr60FAdlR2wavMbkiVUUm+ZqfWJFZqgjUsz+r18Bpdtq4wz7jIzEnYRy2kcJEKqAniVU4mM4s
 Wwv98+RpDx3E3ir5GYzqT+2dXaK+KVctQQ6my8wVRUGTkwMNzwl+J/2ywVcLd1SEyM/Aw3W3cOy
 knMWVKBW3czJCy+9ZL6clqJUjT1xo0G5XJ260YyUOf9Y15xDxoHisNji+bj8lgiAGBjZTLJT2j0
 zWtH9zncoTHBcp8ZRPh1ORtPb2E34wrSQwr+1K+qLbEe/f03qjcIalEMYPqzPeRM8ez72IHyV1+
 ooCaQC/nSQfEGtjL9IORP3ezZ864l2+Y4fCiDxa3bEMBRCYVHMpkV71HoGllVdoSkErAVe6xriH
 QAz/siJYGlJQcxR8j88sV405nNCTOsYx5yDkrPUafBoGOO8KHrx60+pPKNNGRDMvvNmpdXOIfJ5
 4YbJW1j05vGQVyw==
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
2.51.0

