Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3DFC7618E
	for <phone-devel@archiver.kernel.org>; Fri, 21 Apr 2023 09:57:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjDUJ5p (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 21 Apr 2023 05:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjDUJ5k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 21 Apr 2023 05:57:40 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D657AD32
        for <phone-devel@vger.kernel.org>; Fri, 21 Apr 2023 02:57:39 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5069097bac7so2466578a12.0
        for <phone-devel@vger.kernel.org>; Fri, 21 Apr 2023 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682071057; x=1684663057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sdrGRE8+WnATFy0L39mQj79u+T6Dn1Nw+JFSzAY4wU=;
        b=CVBrM28NPE/4FV5I8Q4d2i8LYorPHJKLVZl/sUMlU3vjEDvlL7D5GYNcRNn+JYCbT2
         z6z1E+6ggtW3SLxAjWU48p/As3g7MTxAlCjRkyhYTAb8m7/kWzDbe8enUPriPedPkf1V
         nCtJglssbHKwl+OEP16gVt/GL7YC6BSRL14W+2FIDuo+N7hR1vXG/Dn+zZWQ5DT8u/9C
         2Jweltuc0sQ6uHCnh802+AKtUENkOWRomiIM3nqO8UU7oqrqg+V1DsFNWO61wNBUL3mj
         jx1LoIDqsDIxT9k1v074HB/fqB5uzxNCiaBT8UfeYDPwUko/cn6MSwsxCdzsj5VJrBaA
         ZWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682071057; x=1684663057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sdrGRE8+WnATFy0L39mQj79u+T6Dn1Nw+JFSzAY4wU=;
        b=TyssY9CXkRYmCsygb3m5pcwOE+tz8ViuD5Fr1s05X3Iq7Zi1hP3QA+NlSyTTazqTfW
         I7Uh+bp0wXil0e2FXM24bXhXOqxDMYsuef7JT0dGBz+gzt/wKMr0E0MzLh+9QFnjS3HJ
         is4VhvWnDmzquh38VK8Yzc+ubudu0TOu7ilIPeh/VOtHqDORieQ4djtIKcDf2u9hIkaY
         /bkwfR88OyQVPZBfbeL4AgdUqs+V5fB7ZPo7MBVdqTl37lwIzrta7dlWT9rQ7wayOAyT
         kSF3dWJMJb7XAwt+/CMbJwoDOYiY09Cc0OxoMu0Cr3Ou+pFWlObxkiczI8UMj1i1YCYt
         1NHA==
X-Gm-Message-State: AAQBX9dSbkpKLBGqpM8g+4XNHKdtUCxyEdonSpfNEjQPBDtLHD9/Q05r
        R2oUl+X7dPO5rMv9UgqTvnH00w==
X-Google-Smtp-Source: AKy350YmcWp8tFwu5qt9suYWIaYyG/1BqynUl7SFPoNpPmFfp+HCZlqmYb6I+HuLn0jEMi6EyLmSgw==
X-Received: by 2002:a05:6402:ca:b0:506:8884:7f5 with SMTP id i10-20020a05640200ca00b00506888407f5mr4132743edu.41.1682071057681;
        Fri, 21 Apr 2023 02:57:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
        by smtp.gmail.com with ESMTPSA id f7-20020a05640214c700b004fa380a14e7sm1686062edx.77.2023.04.21.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 02:57:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Jonathan Bakker <xc-racer2@live.ca>,
        Pawel Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ARM: dts: s5pv210: align USB node name with bindings
Date:   Fri, 21 Apr 2023 11:57:19 +0200
Message-Id: <20230421095721.31857-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421095721.31857-1-krzysztof.kozlowski@linaro.org>
References: <20230421095721.31857-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Bindings expect USB HSOTG controller node to be named "usb":

  s5pv210-torbreck.dtb: hsotg@ec000000: $nodename:0: 'hsotg@ec000000' does not match '^usb(@.*)?'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index cbc108217483..fbe7f3d17f41 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -401,7 +401,7 @@ sdhci3: mmc@eb300000 {
 			status = "disabled";
 		};
 
-		hsotg: hsotg@ec000000 {
+		hsotg: usb@ec000000 {
 			compatible = "samsung,s3c6400-hsotg";
 			reg = <0xec000000 0x20000>;
 			interrupt-parent = <&vic1>;
-- 
2.34.1

