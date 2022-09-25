Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0424AC04A95
	for <phone-devel@archiver.kernel.org>; Sun, 25 Sep 2022 16:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbiIYQTH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 25 Sep 2022 12:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiIYQTG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 25 Sep 2022 12:19:06 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E6A2CDCF;
        Sun, 25 Sep 2022 09:19:06 -0700 (PDT)
Received: from g550jk.. (2a02-8388-6582-fe80-0000-0000-0000-0006.cable.dynamic.v6.surfer.at [IPv6:2a02:8388:6582:fe80::6])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4AA86C9C0C;
        Sun, 25 Sep 2022 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1664122714; bh=O0u7m49vIJxyt3kqoQ1MJVrDoYXSpjMOmJWylm+NvQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=f0Ej7UXozBznOheUiffDs3Xi/VysLfV9f/r+Lbtp8cG/xc8FJEYGt/5Jgd4rdOz98
         5c3YAJ2/pMLXCuHEP5OpIGz950EBN32i5Hqo3jywH/NQmXki6n0aMYI1CohyVOM0ga
         ow1CjE7yE+MgAbcP7MRJMuLdmenhMhMv/OABPITA=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: qcom: pm8941: fix iadc node
Date:   Sun, 25 Sep 2022 18:18:21 +0200
Message-Id: <20220925161821.78030-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925161821.78030-1-luca@z3ntu.xyz>
References: <20220925161821.78030-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The iadc node name is supposed to be just 'adc' and the compatible is
only supposed to be qcom,spmi-iadc according to the bindings.

Adjust the node to match that.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index 3c15eecf2f21..33517cccee01 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -131,8 +131,8 @@ adc-chan@48 {
 			};
 		};
 
-		pm8941_iadc: iadc@3600 {
-			compatible = "qcom,pm8941-iadc", "qcom,spmi-iadc";
+		pm8941_iadc: adc@3600 {
+			compatible = "qcom,spmi-iadc";
 			reg = <0x3600>;
 			interrupts = <0x0 0x36 0x0 IRQ_TYPE_EDGE_RISING>;
 			qcom,external-resistor-micro-ohms = <10000>;
-- 
2.37.3

