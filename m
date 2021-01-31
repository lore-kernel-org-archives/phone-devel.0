Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB36BC433E0
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D23164E13
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhAaBlU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 30 Jan 2021 20:41:20 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:38791 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbhAaBlS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 30 Jan 2021 20:41:18 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id A10931F87F;
        Sun, 31 Jan 2021 02:40:22 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: [PATCH 17/18] arm64: dts: qcom: msm8994-octagon: Add TAS2553 codec
Date:   Sun, 31 Jan 2021 02:38:48 +0100
Message-Id: <20210131013853.55810-18-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Lumia 950/XL feature a TAS2553 codec. Configure it using the
TAS2552 driver.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 4aa33682f975..c0aa8cd80f7c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -300,6 +300,26 @@ rmi4-f12@12 {
 	};
 };
 
+&blsp1_i2c2 {
+	status = "okay";
+
+	/*
+	 * This device uses the Texas Instruments TAS2553, however the TAS2552 driver
+	 * seems to work here. In the future a proper driver might need to
+	 * be written for this device.
+	 */
+	tas2553: tas2553@40 {
+		compatible = "ti,tas2552";
+		reg = <0x40>;
+
+		vbat-supply = <&vph_pwr>;
+		iovdd-supply = <&vreg_s4a_1p8>;
+		avdd-supply = <&vreg_s4a_1p8>;
+
+		enable-gpio = <&pm8994_gpios 12 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &blsp1_i2c5 {
 	status = "okay";
 
-- 
2.30.0

