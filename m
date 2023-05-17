Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CC4C7EE23
	for <phone-devel@archiver.kernel.org>; Wed, 17 May 2023 18:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjEQSVy (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 17 May 2023 14:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjEQSVx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 17 May 2023 14:21:53 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050:0:465::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419C77EC5;
        Wed, 17 May 2023 11:21:52 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QM1f50hvRz9sjK;
        Wed, 17 May 2023 20:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1684347709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OUTW/1nl21rkbLxL1BJ2Mi9Ky/aG3WBLvZCR8496Gfs=;
        b=w0HCpVe9Kotu/fkyqY2cfKBbv77oO28uUCYSzLZnCvp/agfv5jqwAH8mgzXj0KrxJirrn1
        um+rkgAHzOa34d6ZhBSMs0ULabSrpQRq0h0tn+23lrkS/Oy6BVvY1pHhaU4KQ/Zh8SxyAx
        yfxHlGAfsoiiVKWaGIwfB6PTTMnkGOPO1VXyRYHXLXmiIel99xgCa6HPH4NSLN84z0NIUe
        igov0CNskxLwSWUflZNoxKD17vsHn7GSNVMQDWQjUifkZEaKVHTJ38M/0wi+wxNS2Wph1f
        D9RWLEiZZHAP9XhFXXVMQ+s97ksAS1x2/mVj58diwtBgmCUMPLoKqZNtltW+cA==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        amartinz@shiftphones.com, Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-shift-axolotl: enable flash LED
Date:   Wed, 17 May 2023 20:21:33 +0200
Message-Id: <20230517182133.72590-3-me@dylanvanassche.be>
In-Reply-To: <20230517182133.72590-1-me@dylanvanassche.be>
References: <20230517182133.72590-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The SHIFT6mq (axolotl) is an SDM845-based smartphone with 2 flash LEDs.
One LED is white, the other one is yellow. Define both LEDs in the DTS
so they can be used as flash or torch.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 0ad891348e0c..e7fc0c3cae58 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -554,6 +554,28 @@ led@5 {
 	};
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <180000>;
+		flash-max-microamp = <1000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <2>;
+		led-max-microamp = <180000>;
+		flash-max-microamp = <1000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &qup_uart9_rx {
 	drive-strength = <2>;
 	bias-pull-up;
-- 
2.40.1

