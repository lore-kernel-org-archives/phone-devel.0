Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D358FC432BE
	for <phone-devel@archiver.kernel.org>; Mon, 30 Aug 2021 17:57:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACF9A60ED4
	for <phone-devel@archiver.kernel.org>; Mon, 30 Aug 2021 17:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238332AbhH3R6q (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 30 Aug 2021 13:58:46 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:33499 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238327AbhH3R6q (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 30 Aug 2021 13:58:46 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 26FBF3E83C;
        Mon, 30 Aug 2021 19:57:50 +0200 (CEST)
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
        Brian Masney <masneyb@onstation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: qcom-msm8974: Add xo_board reference clock to DSI0 PHY
Date:   Mon, 30 Aug 2021 19:57:39 +0200
Message-Id: <20210830175739.143401-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

According to YAML validation, and for a future patchset putting this
xo_board reference clock to use as VCO reference parent, add the missing
clock to dsi_phy0.

Fixes: 5a9fc531f6ec ("ARM: dts: msm8974: add display support")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index db4c06bf7888..96722172b064 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1580,8 +1580,8 @@ dsi_phy0: dsi-phy@fd922a00 {
 				#phy-cells = <0>;
 				qcom,dsi-phy-index = <0>;
 
-				clocks = <&mmcc MDSS_AHB_CLK>;
-				clock-names = "iface";
+				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
+				clock-names = "iface", "ref";
 			};
 		};
 
-- 
2.33.0

