Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6143C433E0
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jan 2021 16:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABB46206D8
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jan 2021 16:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406099AbhARQ0F (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 18 Jan 2021 11:26:05 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:42579 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406663AbhARQZq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 18 Jan 2021 11:25:46 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id D3AC11FC5C;
        Mon, 18 Jan 2021 17:25:00 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] arm64: dts: qcom: msm8992/4: Rename vreg_vph_pwr to vph_pwr
Date:   Mon, 18 Jan 2021 17:24:24 +0100
Message-Id: <20210118162432.107275-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118162432.107275-1-konrad.dybcio@somainline.org>
References: <20210118162432.107275-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Rename the fixed regulator to follow the common naming scheme

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 ++---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 0c422af47917..7c2770f60b07 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -725,10 +725,9 @@ timer {
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	vreg_vph_pwr: vreg-vph-pwr {
+	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
-		status = "okay";
-		regulator-name = "vph-pwr";
+		regulator-name = "vph_pwr";
 
 		regulator-min-microvolt = <3600000>;
 		regulator-max-microvolt = <3600000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 6e083a2f690b..f7e6423db8d4 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -790,9 +790,9 @@ timer {
 			     <GIC_PPI 1 0xff08>;
 	};
 
-	vreg_vph_pwr: vreg-vph-pwr {
+	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
-		regulator-name = "vph-pwr";
+		regulator-name = "vph_pwr";
 
 		regulator-min-microvolt = <3600000>;
 		regulator-max-microvolt = <3600000>;
-- 
2.29.2

