Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3766E748F7
	for <phone-devel@archiver.kernel.org>; Sun,  1 Oct 2023 17:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235230AbjJARTL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 1 Oct 2023 13:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235184AbjJARTL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 1 Oct 2023 13:19:11 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F9DE0
        for <phone-devel@vger.kernel.org>; Sun,  1 Oct 2023 10:19:08 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32799639a2aso848540f8f.3
        for <phone-devel@vger.kernel.org>; Sun, 01 Oct 2023 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696180746; x=1696785546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHH2omA1s8Yg4jj5Xktf/NmIdGT8UW7+Aak9UE+FTBI=;
        b=j5cN/Z1mok7o8siqeWG+WD7COhBsh1EfF1IK3wWOlp1Pq5K1Hx+kXf8TSjtpLaQg3C
         07Zz95enVn9p9Z6OzfVcJuSh6hXRHoQZSvPeenwNgulPsCMHNWk9iaNWIAyRkxNuJZg4
         ENW7J5xiMIZZ0+BZNX9eicPU1Gx1/thuIZ3pmXuidh4FcbbgTBnr9z/U+KnH24l8zZQy
         RqFi1WGIcaA+xaRImZBmHGOvQOJX5slVCOEFK1i2JLVdjlmlo9vi91eqRhbSmEJf1ObK
         6wNmMDUN2AFs9Gw4gSLaCR2b5f1gB+iFdF3Si3tGE+viLvGZNv5X89Uo9nwUI6zNG+nB
         EQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696180746; x=1696785546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHH2omA1s8Yg4jj5Xktf/NmIdGT8UW7+Aak9UE+FTBI=;
        b=ZAh50dNOduh60Iox456dk6WNdgo0uyIO2r5h8TLe4eAIJWIh7DrQp/fOHtxWc35Bpl
         MC+stMlzb4QYFoLyQX4BNqAcw+DqzzdGo4h8M4rA4fSMgSYX9Me46INcMoiLWnZm39++
         d+gboRn9jS577NchmytSyPuhuGtMxpI+BmIwjDqZjN10dp7QDArsJ1ZreHwWfIuRWlij
         XG6LVmHVxkoTH4eTLpg8XSyTYc+rUAz3Kq5raFAFbPaF8Lw6+pEMio8WANCJbFDVUYHP
         ctSym14sYpFMuxbbDnDrmGL5Qy85uj2YJCPkZxt3X1MI1ICJ3FsFpNe2HPFfYJWL6kMY
         aW4A==
X-Gm-Message-State: AOJu0YzTKPMPkAeyADJgHsHcKlYo6f2nGP7bAPh6oEeJyfnSV6dFoY9I
        I2qnEUmNuI/XzH0uj56fTRdXvg==
X-Google-Smtp-Source: AGHT+IGvryi3AuJAk5xX9EktDr0cH+kRACmbSovIRj9gkarcNRzSIBNoBKPinxh4g7gj7OGePOBEpg==
X-Received: by 2002:a5d:4b89:0:b0:31a:ea9a:b602 with SMTP id b9-20020a5d4b89000000b0031aea9ab602mr8900195wrt.1.1696180746558;
        Sun, 01 Oct 2023 10:19:06 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c294900b00401c595fcc7sm5613042wmd.11.2023.10.01.10.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 10:19:06 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 01 Oct 2023 18:19:03 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-oneplus: enable flash LED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231001-b4-sdm845-flash-dts-v1-1-275a3abb0b10@linaro.org>
References: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
In-Reply-To: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=Zfz2LQwvMPPiN2Qwb+dfpDk64wKyyMi0H5c+r0COrD8=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlTJVRxHvwc41StImQSdnztb95HEs7dXjC9EH3P/aOTPs
 E9/YwBTRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjIrA2MDFuM5h4JyrdM5lpg
 8/SmRcet65cK6xYK/rXw1fWqLjCfJcfwP9O6VuiV3P1fxwxW3Rc5bubwIOWb1SMFL0bZ7wY8DBP
 0fwAA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Both the 6 and 6T feature a dual tone flash, enable it.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index b523b5fff702..e821103d49c0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -484,6 +485,28 @@ &pmi8998_charger {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &q6afedai {
 	qi2s@22 {
 		reg = <22>;

-- 
2.42.0

