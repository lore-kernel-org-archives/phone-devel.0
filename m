Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE3DC433F5
	for <phone-devel@archiver.kernel.org>; Sat, 18 Sep 2021 14:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCCEC61212
	for <phone-devel@archiver.kernel.org>; Sat, 18 Sep 2021 14:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238048AbhIROgj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 18 Sep 2021 10:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238008AbhIROgi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 18 Sep 2021 10:36:38 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E62C061574
        for <phone-devel@vger.kernel.org>; Sat, 18 Sep 2021 07:35:13 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E5D983E912;
        Sat, 18 Sep 2021 16:35:09 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm64: DT: qcom: msm8998: Provide missing "xo" and "sleep_clk" to GCC
Date:   Sat, 18 Sep 2021 16:35:02 +0200
Message-Id: <20210918143503.634920-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

In a future patch the GCC driver will stop requesting this xo clock by
its global "xo" name, in favour of of having an explicit phandle here in
the DT.  Aside from that this clock in addition to the mandatory
"sleep_clk" were never passed despite being required by the relevant
dt-bindings.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Resending to directly address Rob Herring in the To: field and add
Stephen Boyd to cc whom already queued the clk driver part in clk-next.

 arch/arm64/boot/dts/qcom/msm8998.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index e9d3ce29937c..05ac5172fcba 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -117,7 +117,7 @@ xo: xo-board {
 			clock-output-names = "xo_board";
 		};
 
-		sleep_clk {
+		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32764>;
@@ -855,6 +855,9 @@ gcc: clock-controller@100000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x00100000 0xb0000>;
+
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo>, <&sleep_clk>;
 		};
 
 		rpm_msg_ram: memory@778000 {
-- 
2.33.0

