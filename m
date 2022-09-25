Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEB9C54EE9
	for <phone-devel@archiver.kernel.org>; Sun, 25 Sep 2022 17:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbiIYRcO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiIYRcN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 25 Sep 2022 13:32:13 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F0FFAC8;
        Sun, 25 Sep 2022 10:32:12 -0700 (PDT)
Received: from g550jk.. (2a02-8388-6582-fe80-0000-0000-0000-0006.cable.dynamic.v6.surfer.at [IPv6:2a02:8388:6582:fe80::6])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id AAE60C78D0;
        Sun, 25 Sep 2022 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1664127131; bh=qH3uH7V7qntn4R2nJ29eHBIsTcnW5XeAJphWi60aOzg=;
        h=From:To:Cc:Subject:Date;
        b=aEpaXzRAW1c+JLFw/EeaUXVgBqfwwg5Mu1IsPwRh+pyBZ8Q+WSQx3P38wACozMfAW
         QX7Frgn3rqEGRN+tpYsUXG4CVEOW5Byv0piN+71d/ZFK/X+sAF0pCRF+VwN4CwAzqc
         IDU43PEYiU6/DYQlvvhhEcRh9PJOBRDaBJvUCB10=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: msm8974: Remove bogus *-cells from smd-edge
Date:   Sun, 25 Sep 2022 19:32:03 +0200
Message-Id: <20220925173203.96117-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The bindings check complains that #address-cells and #size-cells
shouldn't be in the smd-edge node. Remove it.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index da247d799492..c2cf6a95d40d 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1703,8 +1703,6 @@ smd-edge {
 				qcom,ipc = <&apcs 8 8>;
 				qcom,smd-edge = <1>;
 				label = "lpass";
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 		};
 
-- 
2.37.3

