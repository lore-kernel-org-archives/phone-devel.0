Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A26C61D9D
	for <phone-devel@archiver.kernel.org>; Wed, 25 Jan 2023 09:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbjAYJpw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:45:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbjAYJpv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 25 Jan 2023 04:45:51 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A01056196
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 01:45:25 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id m15so13279208wms.4
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 01:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztfbDoxGkDtDmGmBYfiBuBdnAIcB0uPVrA/v1nCpTCQ=;
        b=FsdNwkstyvELDGvtDJLlGrYXxXaw+Yd/rnWhJQdaClPX/6nI30z3KrEYdR1blg0yas
         HnJqJNdicB2Y8z/DDK7cVk2GiT1P7gjMOafnUgCU0NdWgPooizBy+2uA1TaqDKFCkYQ4
         irODL2cF7vLmfyvfA9kfkYlL5hsV7FQVZXfrMZZXT6qtD+IiBn/Rpi/dmW/ITImzx5FV
         7X34wUvBf1FSmcmnHVYSOCK+yAE4jsrYCXGyXWeyVCaWpPs3BMk/qPl05Y12+5WnXY0h
         khowzHbFZk9pHgh4AwlV3zTopNMsDH6el5kMsATONevRApwi4JSZVR7MKxQ4GRf1+AXf
         zN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztfbDoxGkDtDmGmBYfiBuBdnAIcB0uPVrA/v1nCpTCQ=;
        b=R6qmCp5sltlVW6MGVOvBipVrSTFfrMZ9F3xFSkyL/Di3jSHRAl5i9Z58sHZAUK/tWP
         7Mmt+MfSdjjns1C6Z/O1PyOth2v1zlRqgDyZSwxO86v8QCFJEPQrY92F5IvHGMeDyjFF
         5jS9sWL3BN7lnrVdcR4HHkuTWiQmvVf0Jkd/0zaDiVpmU/zDyuV1qjYxDcMto5+OUq8y
         KuMryNWqPJ3qEAwAP84Khrffw70nGfQJqoEv25Te/fPTvXonh3M8+yOOYykHTFOR4gLD
         8689HPsJsnaF7ms2RN7lj9chA5Pbwm+LOa2fiL4LY8Wu/SPCA39hhfjiiGRonHIrTMTm
         2V7w==
X-Gm-Message-State: AFqh2koxmleH1oVhWH9p6DwgjA4y+hGp3XQ/BwjGwmUOBZ7l4fbT5dWx
        Cgski62JXMzKEuVhRkNj7ybGlQ==
X-Google-Smtp-Source: AMrXdXsh2igFfleXr30Bewy8M0jQBLxP7I9V02wCXUXTYQcHNQM6+J0AOl+0hWI7jdNJPkdu81Wrsg==
X-Received: by 2002:a05:600c:4e05:b0:3c6:e61e:ae71 with SMTP id b5-20020a05600c4e0500b003c6e61eae71mr32485060wmq.1.1674639922588;
        Wed, 25 Jan 2023 01:45:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fl22-20020a05600c0b9600b003d1e3b1624dsm1419238wmb.2.2023.01.25.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:45:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 1/9] ARM: dts: exynos: correct HDMI phy compatible in Exynos4
Date:   Wed, 25 Jan 2023 10:45:05 +0100
Message-Id: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The HDMI phy compatible was missing vendor prefix.

Fixes: ed80d4cab772 ("ARM: dts: add hdmi related nodes for exynos4 SoCs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 55afe9972460..d1adaee2af58 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -605,7 +605,7 @@ i2c_8: i2c@138e0000 {
 			status = "disabled";
 
 			hdmi_i2c_phy: hdmiphy@38 {
-				compatible = "exynos4210-hdmiphy";
+				compatible = "samsung,exynos4210-hdmiphy";
 				reg = <0x38>;
 			};
 		};
-- 
2.34.1

