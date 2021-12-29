Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99BFC433F5
	for <phone-devel@archiver.kernel.org>; Wed, 29 Dec 2021 22:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhL2WBW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 29 Dec 2021 17:01:22 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:32923 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhL2WBV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 29 Dec 2021 17:01:21 -0500
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2081B1FAEC;
        Wed, 29 Dec 2021 23:01:19 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX"
Date:   Wed, 29 Dec 2021 23:01:17 +0100
Message-Id: <20211229220117.293542-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This reverts commit c23f1b77358c173a25ef21303d2a8cc893e9ce22.

The SM6125_VDDCX constant was replaced with 0 temporarily as the header
patch defining this constant resided in a different branch, creating an
unwanted dependency of the dts branch on the drivers branch.
Now (by the time this patch will be applied) that both branches have
been merged upstream, it is safe to revert to the constant again.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 49e6bca646c2..e81b2a7794fb 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -449,7 +449,7 @@ sdhc_1: sdhci@4744000 {
 				 <&xo_board>;
 			clock-names = "iface", "core", "xo";
 
-			power-domains = <&rpmpd 0>;
+			power-domains = <&rpmpd SM6125_VDDCX>;
 
 			bus-width = <8>;
 			non-removable;
@@ -474,7 +474,7 @@ sdhc_2: sdhci@4784000 {
 			pinctrl-1 = <&sdc2_state_off>;
 			pinctrl-names = "default", "sleep";
 
-			power-domains = <&rpmpd 0>;
+			power-domains = <&rpmpd SM6125_VDDCX>;
 
 			bus-width = <4>;
 			status = "disabled";
-- 
2.34.1

