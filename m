Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E08C25B4E
	for <phone-devel@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbjATPyk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbjATPye (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:34 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB54BE050E
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 07:54:24 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so6130075wml.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf56U2LGshYysSaYGXGyuaHdAe5MD09p7C8iwc4aNG0=;
        b=QzTA4olLg602r7XbSEqu+dK0TZbgsKC0kwuRblFy/3k8TEC/nIz0JRDRt16AzuXeDt
         OPBtbD5lWaprDghMV51poGr4At9LlM7PMiVMAKswvbzu6Og2te0jRNbwIlfEM/iNxITn
         kuMqlIR1jCNJL1uCtK3WFBXLsVE6RsaSbPApyuWn3+w4+QxGx+zuvzyEZSl9xomET1Kp
         OgNVohmhW+uuBhl3+lBJJsInykFTk9LWuIhsdpZRznJiJqLO1x1YBiLj4vFUzyT3wv0c
         kVxXdzzt6cBKTiW4GqIb/V3Ts5rxQyO4iaJyMPGo+XE1S651zazx8vcP44tyPGxc4MfK
         lYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mf56U2LGshYysSaYGXGyuaHdAe5MD09p7C8iwc4aNG0=;
        b=bVygWiJDjwI0Dwbqcs5X7BLSJ93JNacPo9npNitWYRuFF7Xxc4rkgDfIGpyfoNazO/
         pWCM1vWRF0gq6NsSSDwF1vdptC/ENv9tFRJCTDwvQUcS68D6xd7LrF7m5T9sFEG2PfSZ
         dqfXReR/RuWuYX7Jy0aDY8eHdJkXaUaEaqBLnjgEPdA8rk/rZU/SIsWRwB0DMVaY2uSB
         J612lh/npav0qBh8uLiT3MwgaNdeBOVWCFsK7/8TETA6fjrxNjkJ+tU2WLQNCW8GQTNq
         2wd1cFhzOGBL99vydksH088yQw28wTVXn/t5DMes4zv65j3iKHsQliaegWGF+PvXyigz
         9Z4w==
X-Gm-Message-State: AFqh2koXtvBTXXD90MYCfmWxmckgqZRTQTRglgPPRGgPk8DquOVnkVMS
        R74B9rUGgNGzJddJLC/SdyszXw==
X-Google-Smtp-Source: AMrXdXt+ccFyvzLeQyxgjPTA8izbIYjjfeUKk9n/XpRzdZK6BQdudDHtaXza1bJ2ix/cwd7Q89fzUg==
X-Received: by 2002:a05:600c:35c1:b0:3db:1424:e781 with SMTP id r1-20020a05600c35c100b003db1424e781mr9837689wmq.23.1674230063183;
        Fri, 20 Jan 2023 07:54:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/11] ARM: dts: exynos: add backlight supply in P4 Note
Date:   Fri, 20 Jan 2023 16:54:00 +0100
Message-Id: <20230120155404.323386-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The LCD backlight  should have a supply.  Use same regulator as LCD, to
silence warning:

  exynos4412-p4note-n8010.dtb: backlight: 'power-supply' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-p4note.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index e41cf3ed362d..201c38edd48f 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -245,6 +245,7 @@ backlight: backlight {
 		pinctrl-0 = <&led_bl_reset>;
 		pinctrl-names = "default";
 		enable-gpios = <&gpm0 1 GPIO_ACTIVE_HIGH>;
+		power-supply = <&panel_vdd>;
 		pwms = <&pwm 1 78770 0>;
 		brightness-levels = <0 48 128 255>;
 		num-interpolated-steps = <8>;
-- 
2.34.1

