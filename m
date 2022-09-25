Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335A8C04A95
	for <phone-devel@archiver.kernel.org>; Sun, 25 Sep 2022 21:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbiIYVDM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 25 Sep 2022 17:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbiIYVDL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 25 Sep 2022 17:03:11 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF79924F1D;
        Sun, 25 Sep 2022 14:03:10 -0700 (PDT)
Received: from g550jk.. (2a02-8388-6582-fe80-0000-0000-0000-0006.cable.dynamic.v6.surfer.at [IPv6:2a02:8388:6582:fe80::6])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id ECA35C7D73;
        Sun, 25 Sep 2022 21:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1664139759; bh=poR0ghKnKVIuNsX5byWuHAVoKfpOreY8z2hqo8uexPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YB7VA9lNxA/CERY18L30k7LgcS740iY+/pfbHhwM38K5MVHk9gQyTnaH+ltYnT/NG
         RDYhhL02dwdbj9B+DnJz0BGeM9NlEtmeHGXv7FTT+AGAt+Ed8Ci+oAngZg4Vb7m/K5
         r1LgRi2Tug/r6PS5XaGQ0Opa5eUsVKj60QHq4uP8=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: qcom: pm8941: adjust node names to bindings
Date:   Sun, 25 Sep 2022 23:02:28 +0200
Message-Id: <20220925210229.128462-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925210229.128462-1-luca@z3ntu.xyz>
References: <20220925210229.128462-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

pm8941-misc should be called 'extcon' and pm8941-coincell 'charger'.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index 33517cccee01..01f14d5f314d 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -27,7 +27,7 @@ pwrkey@800 {
 			bias-pull-up;
 		};
 
-		usb_id: misc@900 {
+		usb_id: extcon@900 {
 			compatible = "qcom,pm8941-misc";
 			reg = <0x900>;
 			interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
@@ -138,7 +138,7 @@ pm8941_iadc: adc@3600 {
 			qcom,external-resistor-micro-ohms = <10000>;
 		};
 
-		pm8941_coincell: coincell@2800 {
+		pm8941_coincell: charger@2800 {
 			compatible = "qcom,pm8941-coincell";
 			reg = <0x2800>;
 			status = "disabled";
-- 
2.37.3

