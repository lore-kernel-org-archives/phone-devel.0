Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EBEC433E9
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F48F64E17
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbhAaBlO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 30 Jan 2021 20:41:14 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:60705 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbhAaBlK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 30 Jan 2021 20:41:10 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 28B761F6C5;
        Sun, 31 Jan 2021 02:40:18 +0100 (CET)
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
Subject: [PATCH 16/18] arm64: dts: qcom: msm8994-octagon: Add sensors on blsp1_i2c5
Date:   Sun, 31 Jan 2021 02:38:47 +0100
Message-Id: <20210131013853.55810-17-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Add AK09912 magnetometer, ZPA2326 barometer and MPU6500 accelerometer
nodes.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index e01c9dce187c..4aa33682f975 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -300,6 +300,42 @@ rmi4-f12@12 {
 	};
 };
 
+&blsp1_i2c5 {
+	status = "okay";
+
+	ak09912: magnetometer@c {
+		compatible = "asahi-kasei,ak09912";
+		reg = <0xc>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <26 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&vreg_l18a_2p85>;
+		vid-supply = <&vreg_lvs2a_1p8>;
+	};
+
+	zpa2326: barometer@5c {
+		compatible = "murata,zpa2326";
+		reg = <0x5c>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <74 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&vreg_lvs2a_1p8>;
+	};
+
+	mpu6050: accelerometer@68 {
+		compatible = "invensense,mpu6500";
+		reg = <0x68>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <64 IRQ_TYPE_EDGE_RISING>;
+		
+		vdd-supply = <&vreg_lvs2a_1p8>;
+		vddio-supply = <&vreg_lvs2a_1p8>;
+	};
+};
+
 &blsp1_i2c6 {
 	status = "okay";
 
-- 
2.30.0

