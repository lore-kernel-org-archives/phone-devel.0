Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D11AC433EF
	for <phone-devel@archiver.kernel.org>; Mon, 20 Jun 2022 17:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244885AbiFTR4u (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244907AbiFTR4g (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 20 Jun 2022 13:56:36 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDBE1FA48
        for <phone-devel@vger.kernel.org>; Mon, 20 Jun 2022 10:56:10 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id v1so22551822ejg.13
        for <phone-devel@vger.kernel.org>; Mon, 20 Jun 2022 10:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=resent-from:resent-to:resent-date:resent-message-id:from:to:cc
         :subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rKzakFWTWfXnseWFxBBYL7rUhvEO3Gskk+MqcotQ/qY=;
        b=UGtE04iVfMSwy4nEkdelFUoHfJV0WioWVfjd92Tu9uT1nmT+DgrTu2q2G4XXgzxUS5
         4dsymV0rpzI8myqN9dOYgO4hQ6A0q2vGKW9hCnJ7X7tqlDMn3EaXJzDTSVKq35Y9Ta64
         DAqjNIopv+KMxbwa9GK3hdIpBfazg93HDiwgDXVM7u4CI3T96JSVeTe9aks1Z2j9X02M
         Yi318WbMtP5him8vsqVhI65MkSUDzDbTrY+My5xrUhgdyxeRyg/YsN6L8GT6MXnDvt8S
         OgT8THW5YnaLI7+YcDnpoeBuD5wDpFUfa5T5iHfMWEuOclWLMItRUL6NIsym0CgQFijK
         yNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rKzakFWTWfXnseWFxBBYL7rUhvEO3Gskk+MqcotQ/qY=;
        b=dcteScLlgIK6qsi80MpwzqRIQVtR6Kr/MZmjyWJPaT/IP+evSUEdp2FKTXvtjwd9bt
         VlCHIFk6PIWD2QOYg2cj3afH26TG/3yk3L0g2qi4rxFPGhQzt0fb5/VO52cDfl/1twaB
         zQckmKk62MHkkkrDVvKTyswhrBic9d6N0kEcTRX0BeTAYjpdKELQE4hwF+t4BJqdW+St
         1XXgrbSt86ljwGwMIu5c0QPlro3QX0vmkuyQxc2OfNKYpNjSmIqnRH4nO2UZ7i2r8eSt
         o9c8EMcHGFocbF66w43k7oiTDX8bvZ5MO/MLz9N8WePxq2rUV4IQSvZTAdxFyBncEj6D
         rI2w==
X-Gm-Message-State: AJIora8Tcw4z7ppZ3/UfDkwkBMD+V+8CyCZuzGoEjolCi/2DOAuPPUHo
        16/hM/Wb3T/+W1HLeV/dAmjccQ==
X-Google-Smtp-Source: AGRyM1vT49YNVusbwAN2Vr2w0WvOJ7vt0SFVBsM2fCaRap8boUF67JjAgUQ+9g8smyMAjDXNrDCYXw==
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id r25-20020a170906a21900b006e486a344eamr22588700ejy.385.1655747769794;
        Mon, 20 Jun 2022 10:56:09 -0700 (PDT)
Received: from [192.168.0.211] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l1-20020a1709063d2100b006fe8bf56f53sm6354436ejf.43.2022.06.20.10.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 10:56:09 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] ARM: dts: exynos: add function and color to aat1290 flash LED node in Galaxy S3
Date:   Mon, 20 Jun 2022 19:50:33 +0200
Message-Id: <20220620175033.130468-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
References: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add common LED properties - the function and color - to aat1290 flash
LED node in Galaxy S3, so we can drop deprecated label property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 46640b490a8c..94122e9c6625 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -7,6 +7,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos4412-midas.dtsi"
 
 / {
@@ -26,7 +27,8 @@ led-controller {
 		pinctrl-2 = <&camera_flash_isp>;
 
 		led {
-			label = "flash";
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
 			led-max-microamp = <520833>;
 			flash-max-microamp = <1012500>;
 			flash-max-timeout-us = <1940000>;
-- 
2.34.1

