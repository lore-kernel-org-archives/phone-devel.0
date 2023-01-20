Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2CBC05027
	for <phone-devel@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjATPyf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjATPyZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:25 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B62CDF971
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 07:54:21 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id l8so4431481wms.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 07:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BOZzGkzYofIjRH5wSmH3Wx6pmMCQFDR6yFiN3AmUA4=;
        b=I4/TwKIqbnFoGjxUHbgYa6l+mCPpUztsUkDpqnKlHjuxkrEi7CK2V3B+F+xkF9wzTG
         Z6TGnN66HpL6VvrOzR8GKOA/QICVFbtxS6k3/68wdjX97mg3OKUkSKWPFPFr84tRR1hR
         UBbPXHY5uqq/bJT4ZULTvTHnUmNeh+kKdEwvfeadEKTOt7rkAs6MSYzztaigZYM5eyC0
         fsQjbGY0ApKFQ9n60SDQXcnNuiLEKtDx9gmajbPJX8ogxOmqb8Qu9rKFIe5lbWY0oS36
         Y/xKbNSPEqoy/PDW4j98QmEoLsd6JOAPrvlyg0qO/60xwb4j8J4GqM7rRfDh5KOX850p
         gx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BOZzGkzYofIjRH5wSmH3Wx6pmMCQFDR6yFiN3AmUA4=;
        b=cfSjUXWaGt+wYe1m9PfY8pQ0h6GBHx0uoHH3357NKFRz3G1isHmDfwOETWst5vbPiU
         jn6j9wOpIyx7gsD3vRyU2AQE4j2FQ/Ulb+mRL8I1rr6fmlIkvlDJIGHlUvWNiqf+GSy0
         NftONwMInkQS6xnrwvO+7efVhk8Kys2Ldv0rAcf3s4vHKL2miyMcLkGCwyZSvyjTyMTs
         L4SdpFWmliRo0Fk3jbtSzwN55nQm6lHg+ajdBpzVW8NIHtm55HkHBfqE44l8goy5zvO3
         GS+x2YDSodoBbm6OPl5b5PMo5c+GiXXvjfZLf294R7KtGN2XN9WTnt+qPSohllsee824
         pRAg==
X-Gm-Message-State: AFqh2kqsTocyXgC/KFF4qsyWSQWQxiPxA1YCpxZvdDe2DK0iHSIl+A1u
        wrFRGllAjZfLSz5/KoXwzt2mHQ==
X-Google-Smtp-Source: AMrXdXuyB9rJNrg5s4KZ0KRYaA+HIHG+VPlnM5HY7K+Mj9OOfIve5tQVNtZFdWXcWp+O2+eQXS+m+w==
X-Received: by 2002:a05:600c:1d8a:b0:3db:f0a:cfa1 with SMTP id p10-20020a05600c1d8a00b003db0f0acfa1mr11317502wms.9.1674230060091;
        Fri, 20 Jan 2023 07:54:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:19 -0800 (PST)
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
Subject: [RFT 05/11] ARM: dts: exynos: add ports in HDMI bridge in Exynos4412 Midas
Date:   Fri, 20 Jan 2023 16:53:58 +0100
Message-Id: <20230120155404.323386-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The SII9234 HDMI bridge expects ports property:

  exynos4412-i9305.dtb: hdmi-bridge@39: 'ports' is a required property
  exynos4412-i9305.dtb: hdmi-bridge@39: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 8e1c19a8ad06..a626d33d1330 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -273,9 +273,16 @@ sii9234: hdmi-bridge@39 {
 			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0x39>;
 
-			port {
-				mhl_to_hdmi: endpoint {
-					remote-endpoint = <&hdmi_to_mhl>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					mhl_to_hdmi: endpoint {
+						remote-endpoint = <&hdmi_to_mhl>;
+					};
 				};
 			};
 		};
-- 
2.34.1

