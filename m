Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC602C433FE
	for <phone-devel@archiver.kernel.org>; Thu, 13 Oct 2022 19:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbiJMTI4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Oct 2022 15:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiJMTI1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Oct 2022 15:08:27 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6222159D50;
        Thu, 13 Oct 2022 12:08:19 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id C9E8CC9D28;
        Thu, 13 Oct 2022 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1665688067; bh=h/Izxm/0pyobJFjbIQknz1FbQw5R53PgIVfJQ724Zbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=oD2hfYrhf/pSqJum7YiqBQzQl989FO7g0TgXsWLreMe1phyfEjR6CxAIC7GBxdyOt
         EFdbjoDs/fIdpafcJxBFm6LmhgzDBXw+NoxgCPe4TVcqblQzS4dlcWN516Xzz1r6nE
         2djQS23OAmUl7rjXeUjE8rvtSXMF5vZr4hbJMG04=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: qcom: apq8084: fix compatible for l2-cache
Date:   Thu, 13 Oct 2022 21:06:56 +0200
Message-Id: <20221013190657.48499-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013190657.48499-1-luca@z3ntu.xyz>
References: <20221013190657.48499-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The compatible "qcom,arch-cache" for l2-cache does not exist, and all
other Qualcomm boards use just "cache" for it. Fix it.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index f2fb7c975af8..e910b1f7c9ed 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -72,7 +72,7 @@ cpu@3 {
 		};
 
 		L2: l2-cache {
-			compatible = "qcom,arch-cache";
+			compatible = "cache";
 			cache-level = <2>;
 			qcom,saw = <&saw_l2>;
 		};
-- 
2.38.0

