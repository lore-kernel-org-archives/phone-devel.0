Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE14CC4332F
	for <phone-devel@archiver.kernel.org>; Mon,  7 Nov 2022 21:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbiKGVrT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 7 Nov 2022 16:47:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbiKGVrS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 7 Nov 2022 16:47:18 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69229B853;
        Mon,  7 Nov 2022 13:47:17 -0800 (PST)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 511471F541;
        Mon,  7 Nov 2022 22:47:15 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6125: Enable Command Queue Engine (CQE) for SDHCI 1
Date:   Mon,  7 Nov 2022 22:47:01 +0100
Message-Id: <20221107214702.311271-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Downstream sources confirm sm6125 supports CQE, and after fixing the
reg name for this range [1] this feature probes and enables correctly:

    [    0.391950] sdhci_msm 4744000.mmc: mmc0: CQE init: success

[1]: https://lore.kernel.org/all/20221026163646.37433-1-krzysztof.kozlowski@linaro.org/

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index b27f42f19fae..7b5c09547b73 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1061,6 +1061,8 @@ sdhc_1: mmc@4744000 {
 
 			bus-width = <8>;
 			non-removable;
+			supports-cqe;
+
 			status = "disabled";
 		};
 
-- 
2.38.1

