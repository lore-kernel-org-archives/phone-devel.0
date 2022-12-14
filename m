Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7E4C2D0CB
	for <phone-devel@archiver.kernel.org>; Wed, 14 Dec 2022 23:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiLNXVb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 14 Dec 2022 18:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiLNXVU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 14 Dec 2022 18:21:20 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2AB4A079
        for <phone-devel@vger.kernel.org>; Wed, 14 Dec 2022 15:21:17 -0800 (PST)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 20D7620392;
        Thu, 15 Dec 2022 00:21:16 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: qcom: pmi8950: Add missing ADC channels
Date:   Thu, 15 Dec 2022 00:20:46 +0100
Message-Id: <20221214232049.703484-4-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221214232049.703484-1-marijn.suijten@somainline.org>
References: <20221214232049.703484-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

These seem to have previously been excluded due to either not residing
on the test board, and/or lacking VADC_USB_DP/VADC_USB_DM definitions.
Now that the channel constants are included in dt-bindings, add the
channels to DT as well.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/pmi8950.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
index 7a857b2f3a5a..42a867685275 100644
--- a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
@@ -69,6 +69,30 @@ adc-chan@d {
 				qcom,pre-scaling = <1 1>;
 				label = "chg_temp";
 			};
+
+			adc-chan@e {
+				reg = <VADC_GND_REF>;
+				qcom,pre-scaling = <1 1>;
+				label = "ref_gnd";
+			};
+
+			adc-chan@f {
+				reg = <VADC_VDD_VADC>;
+				qcom,pre-scaling = <1 1>;
+				label = "ref_vdd";
+			};
+
+			adc-chan@43 {
+				reg = <VADC_USB_DP>;
+				qcom,pre-scaling = <1 1>;
+				label = "usb_dp";
+			};
+
+			adc-chan@44 {
+				reg = <VADC_USB_DM>;
+				qcom,pre-scaling = <1 1>;
+				label = "usb_dm";
+			};
 		};
 
 		pmi8950_mpps: mpps@a000 {
-- 
2.39.0

