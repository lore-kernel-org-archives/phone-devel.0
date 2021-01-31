Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E25FC433E0
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4989B64E13
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhAaBoM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 30 Jan 2021 20:44:12 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:48247 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbhAaBku (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:50 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 4683D1F740;
        Sun, 31 Jan 2021 02:39:51 +0100 (CET)
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
Subject: [PATCH 10/18] arm64: dts: qcom: msm8994-octagon: Configure HD3SS460 Type-C mux pins
Date:   Sun, 31 Jan 2021 02:38:41 +0100
Message-Id: <20210131013853.55810-11-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

The driver is not available yet, so hardcode the pins.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 78443f5a3881..bf6e63a23600 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -337,6 +337,37 @@ pinconf {
 	};
 };
 
+&pmi8994_gpios {
+	pinctrl-0 = <&hd3ss460_pol &hd3ss460_amsel &hd3ss460_en>;
+	pinctrl-names = "default";
+
+	/*
+	* This device uses a TI HD3SS460 Type-C MUX
+	* As this device has no driver currently,
+	* the configuration for USB Face Up is set-up here.
+	*
+	* TODO: remove once a driver is available
+	* TODO: add VBUS GPIO 5
+	*/
+	hd3ss460_pol: pol_low {
+		pins = "gpio8";
+		drive-strength = <3>;
+		bias-pull-down;
+	};
+
+	hd3ss460_amsel: amsel_high {
+		pins = "gpio9";
+		drive-strength = <1>;
+		bias-pull-up;
+	};
+	
+	hd3ss460_en: en_high {
+		pins = "gpio10";
+		drive-strength = <1>;
+		bias-pull-up;
+	};
+};
+
 &pmi8994_spmi_regulators {
 	vdd_gfx: s2@1700 {
 		reg = <0x1700 0x100>;
-- 
2.30.0

