Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065FDC43217
	for <phone-devel@archiver.kernel.org>; Thu, 10 Nov 2022 15:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiKJPQW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 10 Nov 2022 10:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbiKJPQU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 10 Nov 2022 10:16:20 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626BE1F603
        for <phone-devel@vger.kernel.org>; Thu, 10 Nov 2022 07:16:18 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id u24so3520206edd.13
        for <phone-devel@vger.kernel.org>; Thu, 10 Nov 2022 07:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LN1U4mZ9BKy9b/d0FsMWTlpOd6p+7htqRFgfQaki7RI=;
        b=gRWU428TNi2n+0fvmKxE0ljpqDmUdJ29tdGhpAKJTAydrkj99Di90lS5wcP3ErtJmz
         FYkX4pi9lJGqafLqIbnZVzCaIRfzvPk1DEBz1PIGZkOBiDZv9u4gvoLd+WU554TKALQE
         YDZBXYb3c6M7tq1JQakbMFWkuf8+D2Do/HpDQm7oHrDUsizebhjCUBN+wosiXTQPBBNb
         mnvc8Op4MQ5GeE25catj8eF+bv32SLiujkFjOIjusH4L41uAgXQUAnmGfPNYZ9Oyaj/P
         D8Z0q078Q0dXPa/hf6Qp7Ou150b/WDWQ+H3m8lyQdO1/jEfdPMTNgEHjpIC10XQu5pCT
         vtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LN1U4mZ9BKy9b/d0FsMWTlpOd6p+7htqRFgfQaki7RI=;
        b=p84tUs5D4OcrF/Qkgcwwltk8Qh3RctfhmGLegO1ncZtLDSSoe9Loae3sg/WcDacJ9E
         mmfTXOy0CU/f5kHu4YKBeh9y7ioD9LwaKhThKrvFTerCeoSfGbh5hyaZoKej0y1r6p7b
         vPBf8At0iHSNtsEgfajqzDMDdWCXQYIk4vYBcIEo34P5uMXkw670YTuLv4Uw7zUBrsc9
         stP6xu/SnfNdloOx1VkUNlJOjR9ebMEPCrI+BVdAJVL6iaqMh3wRZ+b7YjaTJWiVjlTu
         iileSDI72mMRcmTCBf/q2D1mgOaqmiX9byE2s2UG6m7rSSccbd+7JxvWaI446W1x4MRx
         u8dw==
X-Gm-Message-State: ACrzQf0q2LiyNqCGLzkxTRTUagkBkKaYzqf1IUxCreeGmapui0ygBKsQ
        JaiWcE9V2FeBIyY80WfjIqJVog==
X-Google-Smtp-Source: AMsMyM53BtruN4SCEnT9Nc3yDWsSXfDnIZYcHSTnxYtwkSHTXX83ywwsZ8L+xXo00l++diKjj0GekA==
X-Received: by 2002:a05:6402:22e8:b0:461:e598:e0bb with SMTP id dn8-20020a05640222e800b00461e598e0bbmr2484239edb.21.1668093376881;
        Thu, 10 Nov 2022 07:16:16 -0800 (PST)
Received: from otso.. ([46.183.103.8])
        by smtp.gmail.com with ESMTPSA id fd25-20020a056402389900b0045b910b0542sm8555466edb.15.2022.11.10.07.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 07:16:16 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Enable SD card
Date:   Thu, 10 Nov 2022 16:15:06 +0100
Message-Id: <20221110151507.53650-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Fairphone 4 uses sdhc_2 for the SD card, configure the pins for it and
enable it.

The regulators which are exclusively used for SDHCI have their maximum
voltage decreased to what downstream sets on the consumer side, like on
many other platforms and allowed to set the load.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 30c94fd4fe61..1cb14051ab1b 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -279,8 +279,12 @@ vreg_l5e: ldo5 {
 
 		vreg_l6e: ldo6 {
 			regulator-min-microvolt = <1700000>;
-			regulator-max-microvolt = <3544000>;
+			regulator-max-microvolt = <2950000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes =
+				<RPMH_REGULATOR_MODE_LPM
+				 RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7e: ldo7 {
@@ -297,8 +301,12 @@ vreg_l8e: ldo8 {
 
 		vreg_l9e: ldo9 {
 			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3544000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes =
+				<RPMH_REGULATOR_MODE_LPM
+				 RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l10e: ldo10 {
@@ -424,6 +432,33 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdc2_off_state {
+	sd-cd-pins {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&sdc2_on_state {
+	sd-cd-pins {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9e>;
+	vqmmc-supply = <&vreg_l6e>;
+
+	cd-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <13 4>, <56 2>;
 };
-- 
2.38.1

