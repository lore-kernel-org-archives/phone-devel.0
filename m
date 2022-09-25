Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6C4C04A95
	for <phone-devel@archiver.kernel.org>; Sun, 25 Sep 2022 16:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbiIYQNn (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 25 Sep 2022 12:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbiIYQNk (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 25 Sep 2022 12:13:40 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6192C66A;
        Sun, 25 Sep 2022 09:13:36 -0700 (PDT)
Received: from g550jk.. (2a02-8388-6582-fe80-0000-0000-0000-0006.cable.dynamic.v6.surfer.at [IPv6:2a02:8388:6582:fe80::6])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 3A6F7C70AF;
        Sun, 25 Sep 2022 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1664122413; bh=erdiCxZ8T7FcIaqDJLtAw5Fr6IV0GHUaZke+uh6Zg9w=;
        h=From:To:Cc:Subject:Date;
        b=umPK3Y7b90BTp7DuHokZemgcqwyA+SZw18HoeXmQelT/Khj/bOJc1VXvwzJ4X69kg
         oCtJ1nHp2TowLTCNjl/s3qZSvMhvTvU7+SLkVDqCs3uhsCJudaj20He2uDVx2qN5eI
         1NxIeUtHdaDBC3jhLHYxcMBX2wehV7TF0bwiK3MU=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: qcom: fix msm8974 tsens compatible
Date:   Sun, 25 Sep 2022 18:13:16 +0200
Message-Id: <20220925161317.76356-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Bindings mandate the use of the fallback compatible qcom,tsens-v0_1 for
msm8974. Add it to fix the warning.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index f2fb7c975af8..defc0602d750 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -258,7 +258,7 @@ tsens_backup: backup@440 {
 		};
 
 		tsens: thermal-sensor@fc4a8000 {
-			compatible = "qcom,msm8974-tsens";
+			compatible = "qcom,msm8974-tsens", "qcom,tsens-v0_1";
 			reg = <0xfc4a9000 0x1000>, /* TM */
 			      <0xfc4a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7a9be0acf3f5..cf8af99a4864 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1116,7 +1116,7 @@ cnoc: interconnect@fc480000 {
 		};
 
 		tsens: thermal-sensor@fc4a9000 {
-			compatible = "qcom,msm8974-tsens";
+			compatible = "qcom,msm8974-tsens", "qcom,tsens-v0_1";
 			reg = <0xfc4a9000 0x1000>, /* TM */
 			      <0xfc4a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-- 
2.37.3

