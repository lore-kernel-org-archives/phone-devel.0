Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B199C4332D
	for <phone-devel@archiver.kernel.org>; Fri, 26 Feb 2021 20:08:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2309464E38
	for <phone-devel@archiver.kernel.org>; Fri, 26 Feb 2021 20:08:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhBZUIS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 Feb 2021 15:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbhBZUHb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 Feb 2021 15:07:31 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10474C061225
        for <phone-devel@vger.kernel.org>; Fri, 26 Feb 2021 12:05:40 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 8196D1FAD9;
        Fri, 26 Feb 2021 21:05:37 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 14/41] arm64: dts: qcom: sdm630: Add qcom,adreno-smmu compatible
Date:   Fri, 26 Feb 2021 21:03:44 +0100
Message-Id: <20210226200414.167762-15-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210226200414.167762-1-konrad.dybcio@somainline.org>
References: <20210226200414.167762-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The Adreno SMMU in SDM630 needs this compatible string for proper
context handling and split pagetables support.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 9e50c9adada6..deeb1237e67a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -910,7 +910,8 @@ pinconf-sd-cd {
 		};
 
 		kgsl_smmu: iommu@5040000 {
-			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,sdm630-smmu-v2",
+				     "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0x05040000 0x10000>;
 
 			/*
-- 
2.30.1

