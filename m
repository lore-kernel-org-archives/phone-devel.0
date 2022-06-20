Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A71C433EF
	for <phone-devel@archiver.kernel.org>; Mon, 20 Jun 2022 17:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244756AbiFTR4n (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244867AbiFTR4f (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 20 Jun 2022 13:56:35 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EABC1F60F
        for <phone-devel@vger.kernel.org>; Mon, 20 Jun 2022 10:56:04 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id v1so22551822ejg.13
        for <phone-devel@vger.kernel.org>; Mon, 20 Jun 2022 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=resent-from:resent-to:resent-date:resent-message-id:from:to:cc
         :subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vawR+AKsr/69UkXXi73qth6MiAdc5ZxxVTAr6kwXEOY=;
        b=jyaRsJ1bw1w+KYSK/PZjCBn7+129hf32hajHyijQW+quT9/ZlU/TPUVs5W6nl83aW/
         mWKDQ0JpIztFyeofA67Fv8ywt7Yp4vQF3SoO3bNZvwkuaayc1CNfD1I09vSHI2Xx5USQ
         K8fDnjgweB+u1qQ7NJA369I4RK+oXSZbatAs4jCx0m7Qsh0z86aje+hnKywg4Tvhtgu3
         v9qgsCi7Qoz7McIhLD7aFdg0+whcpKkRj3+FZpYDG38NW/3oyWtL70vHELl67HGwX5XG
         iKE+P1884Apjm/gLAL8KtV3tr3yHPMMbmMmS/MnuEys43+MOI8gbAz9jFYfPAyA0QHKn
         gn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vawR+AKsr/69UkXXi73qth6MiAdc5ZxxVTAr6kwXEOY=;
        b=5Vyev9EVyULAX/1eJrmpekVPgE4EReX0zRhpMxMw5QUeqe9uPyEX41c+EdNM9Hy05w
         ZbySF73gGsVoSVfhPOdI//HP71PFcYnIvKfJE7vnGqSbOfVhOmitStVD5DNiRrkOY3Jv
         4JHFsG3pc9tOX0NUXF9+cWmsIeQC7RXruxp2JTXWNhTHgIz/+TzVJ99DbU61K2c72OwR
         /39nXExsH7ghZC2qDRdcdCIRVP1RxtvGXxh6jUWRHFEBzgNRWvuKNcvk620+lKRWCwv1
         nj8XupITTXJbG0WfzCJZYwo6B4ThGwSeYVI0BmCFTxbBBClFVKUZnzqH3UPQLBndQHHr
         bVnA==
X-Gm-Message-State: AJIora+moj7VzOD2C/hc1z+qHtktGDl/gS+Tt4dwAOnR9WcDWJdITACC
        FkzrLhlI3XQ7NfID5L9K+Z1+CGHJ64YXnw==
X-Google-Smtp-Source: AGRyM1sVz7OzNeAtOloUUzEUdlQpShA0bfb1y9vD18tGUfOyY6q/mck2BeOSEtQd9kI7XDHYcs5LoA==
X-Received: by 2002:a17:907:7241:b0:711:d911:2691 with SMTP id ds1-20020a170907724100b00711d9112691mr21728036ejc.626.1655747763201;
        Mon, 20 Jun 2022 10:56:03 -0700 (PDT)
Received: from [192.168.0.211] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o26-20020a1709061b1a00b0070c4abe4706sm6247500ejg.158.2022.06.20.10.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 10:56:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy S3
Date:   Mon, 20 Jun 2022 19:50:32 +0200
Message-Id: <20220620175033.130468-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
References: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The bindings expect aat1290 flash LED child node to be named "led".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index aa7de6de8e19..46640b490a8c 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -25,7 +25,7 @@ led-controller {
 		pinctrl-1 = <&camera_flash_host>;
 		pinctrl-2 = <&camera_flash_isp>;
 
-		flash-led {
+		led {
 			label = "flash";
 			led-max-microamp = <520833>;
 			flash-max-microamp = <1012500>;
-- 
2.34.1

