Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB7BC433E0
	for <phone-devel@archiver.kernel.org>; Thu, 25 Feb 2021 21:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D792364F1B
	for <phone-devel@archiver.kernel.org>; Thu, 25 Feb 2021 21:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbhBYVj4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 25 Feb 2021 16:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233127AbhBYVjv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 25 Feb 2021 16:39:51 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1254C061574
        for <phone-devel@vger.kernel.org>; Thu, 25 Feb 2021 13:38:55 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 22B8C3F400;
        Thu, 25 Feb 2021 22:38:53 +0100 (CET)
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
Subject: [PATCH] arm64: dts: qcom: pm8004: Enable the PMIC peripherals by default
Date:   Thu, 25 Feb 2021 22:38:42 +0100
Message-Id: <20210225213842.117694-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

It makes no sense to require one more step to enable the PMIC features.
If the PMIC is present, it already has to be explicitly #included anyway.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/pm8004.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8004.dtsi b/arch/arm64/boot/dts/qcom/pm8004.dtsi
index 0abd1abe12fc..532b79acf0e8 100644
--- a/arch/arm64/boot/dts/qcom/pm8004.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8004.dtsi
@@ -9,7 +9,6 @@ pm8004_lsid4: pmic@4 {
 		reg = <0x4 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "disabled";
 	};
 
 	pm8004_lsid5: pmic@5 {
@@ -17,7 +16,6 @@ pm8004_lsid5: pmic@5 {
 		reg = <0x5 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "disabled";
 
 		pm8004_spmi_regulators: regulators {
 			compatible = "qcom,pm8004-regulators";
-- 
2.30.1

