Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D57C433E0
	for <phone-devel@archiver.kernel.org>; Thu,  4 Feb 2021 08:10:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BA9B64F59
	for <phone-devel@archiver.kernel.org>; Thu,  4 Feb 2021 08:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234836AbhBDIK1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 4 Feb 2021 03:10:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234254AbhBDIKY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 4 Feb 2021 03:10:24 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64493C0613ED
        for <phone-devel@vger.kernel.org>; Thu,  4 Feb 2021 00:09:44 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id e9so1341176pjj.0
        for <phone-devel@vger.kernel.org>; Thu, 04 Feb 2021 00:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=mbzglOInmCBEXi+RhAT4Ml3f+J7eG2WI0sIBzkLXfK0=;
        b=SZ3fQhEZi6dCMB7apBij9SlRLDenqp7RPeseE09ECbMTNx32BSzfp6j2xkAjThBubz
         X71vvESM4qpUsKIetZcjH8oVKxHRc6tIOMvcCcFqvDdh8w41zEzu1a7Q491f1mld2xK0
         SC2IxsAGzp5RuKelfRv0qCkpaJKBJiisG7Qc3IrOrTRbubkwB6PdHClePE3c1dncS4yP
         q0Q8WJhAl+GF0glkL48/U04GIIQwHeG+wALkCJrX4iE6I4Xf754hrSFzEb+/Dy9Qg5Qv
         d4WaYj9IEQraIvPO6KRE2JOYrodg/Q1ckGZUjH64spb83V7j7aNB0Sc1XRboPE8yUWEj
         z3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mbzglOInmCBEXi+RhAT4Ml3f+J7eG2WI0sIBzkLXfK0=;
        b=P/P/+/cc75k/szD8+ompoSep0hjnr31YfCDP21BJpTpsS9dJvxiCLKFxygHsm5Xjii
         5Zjhh5m+F+tGIax9uvKebR6l3668gRsCuxRyLLJnvbN+5QokbkgbFSW1pU3U1h2UDmVI
         NWypRzn7PMzmb8EOqF36Ir+Hy3drtDC6Fpz/E4fwAztlgak3///1CHC/ET4H11a8DRTd
         kPhBr9z5Vp/rLlr4koHnS2eQoYGQSFLQOqV3fncZEmjCHEFIG0J2KTPo3SR4yL4DGfDc
         FAWOZFdlyf4WbJsOEnliWxI3Blzlaj0Xfkpj1hkZ6L1NCsvd1aEnv96dzlJBfZ9yxyWO
         41dQ==
X-Gm-Message-State: AOAM53305IEwKS26tQqXljZZrjWPUGA+/H/TWWjdi29N4tCeekX0FFYn
        lca5Gj6wo88uK/LowIQiT+GJjA==
X-Google-Smtp-Source: ABdhPJx84IjwzzWpe79dKS1zQyZmeN9Puw8PDovhSQYM9e3FvitZrqHK6CyiqgES8SplFG48bg1KVg==
X-Received: by 2002:a17:902:ea0f:b029:de:5fd5:abb9 with SMTP id s15-20020a170902ea0fb02900de5fd5abb9mr6853830plg.46.1612426183934;
        Thu, 04 Feb 2021 00:09:43 -0800 (PST)
Received: from localhost.localdomain ([2405:201:6803:610b:1c6f:cebf:a887:dd42])
        by smtp.gmail.com with ESMTPSA id 9sm4698796pfy.110.2021.02.04.00.09.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Feb 2021 00:09:43 -0800 (PST)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and panel bits
Date:   Thu,  4 Feb 2021 13:39:37 +0530
Message-Id: <1612426177-6611-1-git-send-email-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Sumit Semwal <sumit.semwal@linaro.org>

Enabling the Display panel for beryllium phone (Xiaomi
Pocophone F1) requires DSI labibb regulators and panel
dts nodes to be added. It is also required to keep some
of the regulators as always-on.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v2: Rebased to mainline (v5.11-rc6) and fixed build warnings.

 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 86cbae63eaf7..034246b5c529 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -157,6 +157,14 @@
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l14a_1p88: ldo14 {
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
@@ -200,6 +209,47 @@
 	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&tianma_nt36672a_in_0>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+
+	panel@0 {
+		compatible = "tianma,fhd-video";
+		reg = <0>;
+		vddi0-supply = <&vreg_l14a_1p88>;
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
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l1a_0p875>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -215,6 +265,14 @@
 	};
 };
 
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

