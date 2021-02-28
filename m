Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1F2C43381
	for <phone-devel@archiver.kernel.org>; Sun, 28 Feb 2021 13:10:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11C8D60C41
	for <phone-devel@archiver.kernel.org>; Sun, 28 Feb 2021 13:10:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhB1NKI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 28 Feb 2021 08:10:08 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:46039 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhB1NKF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 28 Feb 2021 08:10:05 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C044C1F578;
        Sun, 28 Feb 2021 14:09:02 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: qcom: pmi8994: Add WLED node
Date:   Sun, 28 Feb 2021 14:08:28 +0100
Message-Id: <20210228130831.203765-10-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add and configure WLED node to enable backlight
control on WLED-enabled devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index e5ed28ab9b2d..b21c01fea37a 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -32,5 +32,18 @@ pmi8994_spmi_regulators: regulators {
 			#address-cells = <1>;
 			#size-cells = <1>;
 		};
+
+		pmi8994_wled: wled@d800 {
+			compatible = "qcom,pmi8994-wled";
+			reg = <0xd800 0xd900>;
+			interrupts = <3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "short";
+			qcom,num-strings = <3>;
+			/* Yes, all four strings *have to* be defined or things won't work. */
+			qcom,enabled-strings = <0 1 2 3>;
+			qcom,cabc;
+			qcom,eternal-pfet;
+			status = "disabled";
+		};
 	};
 };
-- 
2.30.1

