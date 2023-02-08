Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71526C05027
	for <phone-devel@archiver.kernel.org>; Wed,  8 Feb 2023 17:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjBHR1O (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjBHR1N (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 8 Feb 2023 12:27:13 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAD8A5DC
        for <phone-devel@vger.kernel.org>; Wed,  8 Feb 2023 09:26:48 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so2048526wms.1
        for <phone-devel@vger.kernel.org>; Wed, 08 Feb 2023 09:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTB+kn5OHzrK76DFGgifiq/bBOHjSff6c06ytq0LeG8=;
        b=PJQHQB6suTprZ+B5q6crGllreJnIOzwF6L1019hH/KbIaQN5LVKFUiQb34RosXdyIe
         rptvHTsnKteguT0OO4GwP2rRGYxxRrit1lSjPk1DkUo6RlEzdWcHORq8ukghwDKEdRBA
         gQBup0PxXlYGmyXrFynoZkmYkM8HResj1oW+QsgigDgz9pacJOw6Fu9EmT9XXynr4xqN
         otrH3E0RqTKtT7f7Iuhk6ZT4tM7GfhWi/Sm/03qC8zP5BeWVdAaxofCwLFCyhLqjr5+i
         RBJwHAzfXA5wZC/GFUY3Jkhy4N1sUmEd+WGmgy7ezv4fCmppUjfKTfcjdAZT/sSHP1Rz
         3fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTB+kn5OHzrK76DFGgifiq/bBOHjSff6c06ytq0LeG8=;
        b=pCG0qkTlP6zV1u2Mv4cMc08fC1maWHHvyNoF02hc4xoZTJV5F0tVEaMtkskPlooDgn
         zoTYPw1qwVfNCmYkaZHDNxgtgAqCqQRob0xYNYUF/4LZgQXFT6+obhAtBoPqi2fPBEFp
         Ho3FJCfPRcOUQ7zIn05X6cGHQNQFJ1expRdcWwjPJ+FCvElqkpYp1mboGZZuqpOHUvVs
         5kYxB8YW4G3Ew7T4JciTf4A8vkT2s60UXcUdTqRd9O9oOjQtznfiazlIvSPzBCBc+Lb4
         ngxkrQkUZtJiLDctSfqxFeX0Zwm6IepYpu3NgSLfBNeMl4eNZAnwwLLEeMy6OxrSD40r
         S69w==
X-Gm-Message-State: AO0yUKUVRbSj2XuwDZA7NT2InbWgAEtFbQDJg3SUF67HAwUa1Ri3fhQN
        PaETKFiElq47KcdIHouu3mhuYw==
X-Google-Smtp-Source: AK7set870vm3+lGW8S93Tx7ST0ROVr/EZF9AnP+//pii2ImLkyUNYR9v3kXSy0jlT23mL7LhhdcJIQ==
X-Received: by 2002:a05:600c:16c8:b0:3e0:185:e935 with SMTP id l8-20020a05600c16c800b003e00185e935mr7214991wmn.36.1675877204933;
        Wed, 08 Feb 2023 09:26:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c2ca100b003dc3f3d77e3sm2624502wmc.7.2023.02.08.09.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 09:26:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>
Subject: [RFT PATCH 1/3] ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Midas
Date:   Wed,  8 Feb 2023 18:26:32 +0100
Message-Id: <20230208172634.404452-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The GPIOs properties should end with "gpios" suffix and Linux gpiolib
already handles both names, so switch to preferred one.

While touching the lines, replace open-coded GPIO_ACTIVE_HIGH flag.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index d5074fa57142..525f945c4b91 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -653,8 +653,8 @@ wm1811: audio-codec@1a {
 		CPVDD-supply = <&vbatt_reg>;
 		SPKVDD1-supply = <&vbatt_reg>;
 		SPKVDD2-supply = <&vbatt_reg>;
-		wlf,ldo1ena = <&gpj0 4 0>;
-		wlf,ldo2ena = <&gpj0 4 0>;
+		wlf,ldo1ena-gpios = <&gpj0 4 GPIO_ACTIVE_HIGH>;
+		wlf,ldo2ena-gpios = <&gpj0 4 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.34.1

