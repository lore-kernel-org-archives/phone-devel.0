Return-Path: <SRS0=vNnj=DM=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C5BC4727D
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 15:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0DA320874
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 15:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5ud1PvV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgJEPDw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgJEPDl (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Oct 2020 11:03:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688CFC0613CE;
        Mon,  5 Oct 2020 08:03:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z1so9965524wrt.3;
        Mon, 05 Oct 2020 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XByuLTqKoi6bzKn452xrejvR/cWGNzxvxhZL/Y5yUwA=;
        b=g5ud1PvVsleooSow8jNBTAYeF9hmd7uTsioiKldjuWVDWQILY6HBlH/yRE44sIPR1X
         hb0krP+oK5px5WGixEu524V3yKGo/rTzcEFZFaZzIqnZu0VEv0nmwnZ2hqpCHamfW0yv
         Lip0HVNNh1xf00EzO4VCtcgXUZiG3X9u+mEo1oX1VE1gtci4/m/bnYB3K6McBgCV4hAS
         Tp7ed4vqwBpPnIaLkgJEC5N/deF7NHPvQYqjPxyQQKAzdelst9Tc719rglBKzrjbT+Fk
         yPOcyvoAqwEIgeHAdOIrzVN6R9k4yUqv/Iie0c21xkEuQML18itHQjcpbLrEaVYq3TQA
         ozRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XByuLTqKoi6bzKn452xrejvR/cWGNzxvxhZL/Y5yUwA=;
        b=anpfHcOib9KuaDIoabxY+2WIOcptiY6y+XH3AxecbQN65r4sIqDtO7Fvx00c+rvoij
         msuSO8GDC/G5j9myne9JTPjCbzDZrU21zyWmz4y0IvfLv7/mqhvUZL098H/adY2kXTzw
         O5dAuQqwEB0u9hXoZ+1yGH+SM8mtIeaoxAr4iCIeHw5dZ82i5rReZoveEUpcFUsReCQo
         O/7Cjl3MmCVADfcFjrZ43RUsZQLBVWCBDL9RkovEhz/nt8smV5CbcabuepXjFmUehaI5
         UxZUOiBh2E2ovJdXhMmkPmIwYjU2JimUr/0gr9MTAfZ0LOWyexpNbWckgLtllseazwxR
         AsAA==
X-Gm-Message-State: AOAM530o/gCf61AvIFM/Xp4xKbq5Y/zIpjJzVhFWHm0x2cR9+Wj43qKa
        iBSlGQeiSQilSe634ddY1a8=
X-Google-Smtp-Source: ABdhPJwFNviQSN2JQYY0IHQudILe/UDvQETl8iA/uatCrpvGxKPEHcYcxf5udML+aXEHRAuFpcCFqQ==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr19289505wrn.12.1601910220132;
        Mon, 05 Oct 2020 08:03:40 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:39 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] arm64: dts: qcom: msm8992: Add BLSP_I2C1 support
Date:   Mon,  5 Oct 2020 17:03:07 +0200
Message-Id: <20201005150313.149754-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This will be required to support touchscreen on Lumia
devices.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 6242c56a2bfa..81426577f2bd 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -305,6 +305,22 @@ blsp1_uart2: serial@f991e000 {
 			status = "disabled";
 		};
 
+		blsp_i2c1: i2c@f9923000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9923000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+						<&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c1_default>;
+			pinctrl-1 = <&i2c1_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp_i2c2: i2c@f9924000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9924000 0x500>;
@@ -525,6 +541,20 @@ sdc1_rclk_off: rclk-off {
 				bias-pull-down;
 			};
 
+			i2c1_default: i2c1-default {
+				function = "blsp_i2c1";
+				pins = "gpio2", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c1_sleep: i2c1-sleep {
+				function = "gpio";
+				pins = "gpio2", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			i2c2_default: i2c2-default {
 				function = "blsp_i2c2";
 				pins = "gpio6", "gpio7";
-- 
2.28.0

