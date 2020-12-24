Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3E7C433DB
	for <phone-devel@archiver.kernel.org>; Thu, 24 Dec 2020 12:10:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67719223DB
	for <phone-devel@archiver.kernel.org>; Thu, 24 Dec 2020 12:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgLXMKh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 24 Dec 2020 07:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbgLXMKh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 24 Dec 2020 07:10:37 -0500
X-Greylist: delayed 509 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Dec 2020 04:09:56 PST
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1390C061794;
        Thu, 24 Dec 2020 04:09:56 -0800 (PST)
Received: from localhost.localdomain (abac131.neoplus.adsl.tpnet.pl [83.6.166.131])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 606B03F356;
        Thu, 24 Dec 2020 13:00:42 +0100 (CET)
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
Subject: [PATCH] arm64: dts: qcom: msm8996: Add missing device_type under pcie[01]
Date:   Thu, 24 Dec 2020 13:00:25 +0100
Message-Id: <20201224120025.6282-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index fd6ae5464dea..e7eb2c9f37af 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -750,6 +750,8 @@ pcie0: pcie@600000 {
 				ranges = <0x01000000 0x0 0x0c200000 0x0c200000 0x0 0x100000>,
 					<0x02000000 0x0 0x0c300000 0x0c300000 0x0 0xd00000>;
 
+				device_type = "pci";
+
 				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "msi";
 				#interrupt-cells = <1>;
@@ -802,6 +804,8 @@ pcie1: pcie@608000 {
 				ranges = <0x01000000 0x0 0x0d200000 0x0d200000 0x0 0x100000>,
 					<0x02000000 0x0 0x0d300000 0x0d300000 0x0 0xd00000>;
 
+				device_type = "pci";
+
 				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "msi";
 				#interrupt-cells = <1>;
-- 
2.29.2

