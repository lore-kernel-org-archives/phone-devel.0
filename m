Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1625DC43217
	for <phone-devel@archiver.kernel.org>; Mon, 21 Nov 2022 21:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbiKUVbg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbiKUVbf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Nov 2022 16:31:35 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E296868B;
        Mon, 21 Nov 2022 13:31:34 -0800 (PST)
Received: from g550jk.arnhem.chello.nl (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id E313BD040D;
        Mon, 21 Nov 2022 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1669066263; bh=2kQEDLnxydBtnrXW4wyJ8ZCEZ/tqkyS1WnCU+hJ/Fkw=;
        h=From:To:Cc:Subject:Date;
        b=oC0eEKeizh+Ot4fLWu6mdYf8u1+UJAk3P56bo9FHIopY8EYM/SOAdEoELzU6+s+VC
         wWdzLnl2cdAT02ftRdpkIA8brXzDj0ArO7hkalzPRLpqjI9Cfe8bjEZuimq2RVoHmg
         Lc/YNY5Nb/t1d+jIs4Ir32e9Yy68GtP5Jsa51tfk=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: qcom: msm8974-castor: Fix touchscreen init
Date:   Mon, 21 Nov 2022 22:30:19 +0100
Message-Id: <20221121213019.324558-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On some devices a higher delay is needed, otherwise touchscreen probe
fails.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Two simple patches that have been sitting around in msm8974-mainline
tree for a while.

 .../arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 36044130a739..2725bd343f3a 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -122,7 +122,7 @@ synaptics@2c {
 		pinctrl-names = "default";
 		pinctrl-0 = <&ts_int_pin>;
 
-		syna,startup-delay-ms = <10>;
+		syna,startup-delay-ms = <100>;
 
 		rmi-f01@1 {
 			reg = <0x1>;
-- 
2.38.1

