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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586B6C4727F
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 15:04:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28DB52085B
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 15:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ca90qH7q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgJEPDv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgJEPDr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Oct 2020 11:03:47 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB83C0613A8;
        Mon,  5 Oct 2020 08:03:46 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z1so9965896wrt.3;
        Mon, 05 Oct 2020 08:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VLyV+gEvPdXBCfQzavVLm7qZZj9wcK92N6joqP0d7ec=;
        b=Ca90qH7qwNVnnXiFq9UP0drNlhAOkpSo+bHv6QU4SPKptDSLg75aWFeVCrt1ziJVtR
         UyPbOvVF/Ey8hq1+HYmZ/XgIF1p7iMcRVPmRfjU5JjjVfvnvTwD076ixdNun0EPkrs8T
         BlxyzJ78FVoPwe/VVVnae6tXIZ9mq7eq13HhSOB1PWcLIAZwyiQychKQ66oXbhebGoR7
         XSVphzi6sgXyUpg6PS3/mfWoyixxtgru2ewc1kXZ/v4dqssPo/4FHdg2sz2HMEj2xcRo
         2MU6FaYY55Ha7xRUU1/NBpp+0bYbDGrVYf7rZguUjHJy/T2aGm8c2V99U3JnA5hFni9o
         eKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VLyV+gEvPdXBCfQzavVLm7qZZj9wcK92N6joqP0d7ec=;
        b=Sdd4dDELULb8ArFzYWPLSEJWrHHsx7tMX+kUWKwBKqzwDpiqRvyM9QmF+U65nirv0M
         9T5Ar0eTS3Az7pM6ZipVVXHMcikV7g7iwzNcmsp8QKX+AfKCbV8ZN1ocFWZPfuXABIJi
         7wWipzaDjjuI0Hhj6fX31xJPBO60mHRPqNyj7YvzRxEpUMJL3+LqDjz97uY/WVu5rLJ2
         1j1xWWUw+rMrQgywFpM3j+55zv3RcVPZxkc7Es7ywCyDhq0ISltRjy7Uue03U+SYT5d4
         Ouo6jeoTSEX8pXjWorot48BRhGBLdTJIX/U/aKJ8e3H/9Fqqt6QSNEpZjb8Lrwzl73KA
         oJmg==
X-Gm-Message-State: AOAM531qS6hYpyy0HcurwyQHEEdB/itOW8lKVzNAGLIoy/xYuCWPtrsM
        cVGZtU7LkxwenNmE8JV5gc0=
X-Google-Smtp-Source: ABdhPJwOeELbDYAb8g+NEqI65YFOxGrNBs4wao+xMeCiUfpAtUI36WLKv9gLTrKdR8ZQ++JpqeSI/w==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr19202726wrt.255.1601910225188;
        Mon, 05 Oct 2020 08:03:45 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:44 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] arm64: dts: qcom: msm8994: Add USB support
Date:   Mon,  5 Oct 2020 17:03:09 +0200
Message-Id: <20201005150313.149754-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This is a very basic dwc3 configuration (no PHYs yet),
but it works.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 65089d7670f6..8612a11c3584 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -282,6 +282,37 @@ frame@f9028000 {
 			};
 		};
 
+		usb3: usb@f92f8800 {
+			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			reg = <0xf92f8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_USB30_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
+				 <&gcc GCC_USB30_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
+			clock-names = "core", "iface", "sleep", "mock_utmi", "ref", "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <120000000>;
+
+			power-domains = <&gcc USB30_GDSC>;
+			qcom,select-utmi-as-pipe-clk;
+
+			dwc3@f9200000 {
+				compatible = "snps,dwc3";
+				reg = <0xf9200000 0xcc00>;
+				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				maximum-speed = "high-speed";
+				dr_mode = "peripheral";
+			};
+		};
+
 		sdhc1: sdhci@f9824900 {
 			compatible = "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
-- 
2.28.0

