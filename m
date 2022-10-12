Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C967CC4332F
	for <phone-devel@archiver.kernel.org>; Wed, 12 Oct 2022 21:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiJLV4g (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 12 Oct 2022 17:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJLV4f (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 12 Oct 2022 17:56:35 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E5C12502E;
        Wed, 12 Oct 2022 14:56:22 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id EEAD1C9CE5;
        Wed, 12 Oct 2022 21:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1665611780; bh=NZxJM0Mfp4tG1dvfoBIyUkMnYtwc3xujwcIwoZevaV0=;
        h=From:To:Cc:Subject:Date;
        b=xq5jxx9CSLYLZiRzOlc4pE3fDKJvfCOpTOUY6G/BBiop6OJRpVMSQvdWuEAu9HKPg
         nYhngl4Y50jA+q5qcp+//qwK3g9FPJI+7YQ77qnqZR5DMxFhY45hwQ/j3WXK23QbpC
         A0OQILfe+TcnXW1dnIj1AQrhX8eJQqPhHMAFrMW0=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996: remove bogus ufs_variant node
Date:   Wed, 12 Oct 2022 23:56:13 +0200
Message-Id: <20221012215613.32054-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This ufs_variant node seems to be a remnant from downstream devicetree.

As it doesn't seem to be used by anything upstream, remove it from the
dtsi.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c0a2baffa49d..87e9aef951ab 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1995,10 +1995,6 @@ ufshc: ufshc@624000 {
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
 			status = "disabled";
-
-			ufs_variant {
-				compatible = "qcom,ufs_variant";
-			};
 		};
 
 		ufsphy: phy@627000 {
-- 
2.38.0

