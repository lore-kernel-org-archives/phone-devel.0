Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE88C433E0
	for <phone-devel@archiver.kernel.org>; Wed, 10 Feb 2021 08:19:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E17BF64E42
	for <phone-devel@archiver.kernel.org>; Wed, 10 Feb 2021 08:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbhBJITh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 Feb 2021 03:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbhBJITe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 Feb 2021 03:19:34 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFA3C061756
        for <phone-devel@vger.kernel.org>; Wed, 10 Feb 2021 00:18:54 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id e7so758037pge.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Feb 2021 00:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3TY7Cims/zXIVET72hDHwG85GzF++wOgb0qceb5a5HA=;
        b=jtURhRlkMrMcNUS3JXa9PWeWl9t4137oHU+kdSMF4HEMAUKF2zEzZJ37ql+SoaWSMs
         gbXJRIZsjDsNf7r4FKFEyG0uE1D5YPjkT8ybju3oD1tbkwmG9Fqoa3csyPyZf+mhG8J0
         NuA6VV1IcPhqN9BhQxclaf+PmWk5JljnU7BBzjF27r0CNZw+buhdksMxlgOfPAn3Yk97
         bsMSCCCyI2flQ3BdVBsDyptoLxkSNhY7BEKd0XFacCPHYXpAZkQlsrqRjMDcXBIKWAqV
         BtBqAgHwkSbilcbBjubgfQCKI70xgsIwANJyVfH0eaCd+0itjwCX2efbTxiGpD7aJ/3u
         mX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3TY7Cims/zXIVET72hDHwG85GzF++wOgb0qceb5a5HA=;
        b=NPSIbjwkiNJ5djzvAhpa1sYlVCzzQ0V1hCItlt6Riho9sFZoKYB+QLtxAoaTde7DuD
         Tj6uadAEPH7xi1yW1Q9RZZaLbqZibXfRkvDORhmT+duKf83jm8ryekFqgtdYfniuUxxH
         tlp/W51X5UvFVMuJBqRPjW9VUmRL1vspoOWgzuiTGtZKHiCSKO6WP3etfEZDTa/S5xW7
         aq+313kiVzWxdfoRFopPOGguL8ddl9yFeSqgPMSYO3RtPS/8aAitmQXa0X73tuESvuR7
         L2+QKpBWQGI5NHyHFG4jXa3HXDtbqzbPM5RWMpcgouocQYwGU02zQmCXZkhqKibjR2aK
         B/LQ==
X-Gm-Message-State: AOAM532ym5e7vHY0kw6X+5C/HMe1gvrVqowaQm6xWsgWwPxZxtj+mElI
        UmAAaFByQZ9cuIKp9ac1dVZnrg==
X-Google-Smtp-Source: ABdhPJwRvw3OLUNtJPMJRIUGGxS/mv4UPx2bUXs05l1cTQtzPXoRUEkZda6mqSeLaU0wSuhm1nF9WA==
X-Received: by 2002:aa7:800d:0:b029:1d5:6701:68f with SMTP id j13-20020aa7800d0000b02901d56701068fmr2372207pfi.30.1612945133458;
        Wed, 10 Feb 2021 00:18:53 -0800 (PST)
Received: from localhost.localdomain ([49.207.221.41])
        by smtp.gmail.com with ESMTPSA id e26sm1397290pfm.87.2021.02.10.00.18.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Feb 2021 00:18:53 -0800 (PST)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and panel bits
Date:   Wed, 10 Feb 2021 13:48:48 +0530
Message-Id: <1612945128-23174-1-git-send-email-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Sumit Semwal <sumit.semwal@linaro.org>

Enabling the Display panel for beryllium requires DSI
labibb regulators and panel dts nodes to be added.
It is also required to keep some of the regulators as
always-on.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v3: Addressed Konrad's concerns. Configured labibb regulators
    explicitly based on downstream microvolt values. Display
    comes up fine with default discharge-resistor-kohms and
    soft-start-us properties, so didn't touch them.
    Smoke tested on next-20210209.
v2: Rebased to mainline (v5.11-rc6) and fixed build warnings.

 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 86cbae63eaf7..5ac049a247e1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -157,6 +157,14 @@
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
 		vreg_l17a_1p3: ldo17 {
 			regulator-min-microvolt = <1304000>;
 			regulator-max-microvolt = <1304000>;
@@ -191,6 +199,7 @@
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 	};
 };
@@ -200,6 +209,43 @@
 	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "tianma,fhd-video";
+		reg = <0>;
+		vddi0-supply = <&vreg_l14a_1p8>;
+		vddpos-supply = <&lab>;
+		vddneg-supply = <&ibb>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		port {
+			tianma_nt36672a_in_0: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+};
+
+&dsi0_out {
+	remote-endpoint = <&tianma_nt36672a_in_0>;
+	data-lanes = <0 1 2 3>;
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l1a_0p875>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -215,6 +261,24 @@
 	};
 };
 
+&ibb {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+};
+
+&lab {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
-- 
2.7.4

