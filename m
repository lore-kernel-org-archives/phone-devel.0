Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE20E743F5
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 08:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjI2IBR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 04:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232832AbjI2IBP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 04:01:15 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1671A7
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:01:10 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5344d996bedso10198042a12.3
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695974469; x=1696579269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYzKGHRYLJ6g+A5OXZ4xV/Es8JjR1AM+0LwhrF0kzy4=;
        b=aig+9hcZnVthGb4gyq2ydfqHOpzS9esCDegx9CQ8vn1pcjxo+Bvf/EetqGbsmnDKdX
         L21wmhc62T16A5VDZQJOdjsAXg/zON/XvFVsjhVi5FzwSQZQXfA4yiNG325zqh5m7WmN
         YliRVbRFPXySfVL7qy7VwHPVjufmhA4EWWaI7JBaTwNPff21GLLoTfvS122a/nj1aCz+
         nQ3AXcO/WEXTX1oVhplUUej9JthHsqRTSPpkB9/fvznpOeQcObVU0ow+mNwjmnzvqy2Q
         yJssgM4nvoaENshjmHx/DS0LOemq3sbpAESFB1+Q38vHUYQ9ts01iVP4pBMjA8HM0f1P
         HBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695974469; x=1696579269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYzKGHRYLJ6g+A5OXZ4xV/Es8JjR1AM+0LwhrF0kzy4=;
        b=PrBBu/oympUHyErhytfM8L58BcN0TDPxw+1nYZox/GUqyF9rVPAnSnqw7FISTAG8eh
         7lbC3DG7TKq9/p9Xh3wjIw0JGpYw6wgwPHA5usreNrurs7NO22v3bNc/ozWwCWU8Qmn6
         YmxGvy9TMua/QjE9WGhzb/wKWs8sk5n98Oh9BywkZakB6DPyh63gCT5M8sHb6fqDDvJN
         fSo0LxgnIM7rO7V6e1GoZC2onEqWuAab7ihODsqPT6HLHX4bpT3oeBu6OaogYiwOiZfG
         s+Qz80Bu2QyE209suAIfnLVE5SnYLCvzmHJTE6EztSk3mxnameRBwiohXWK+jtGONVOG
         2Uuw==
X-Gm-Message-State: AOJu0YyMDchjmLm0FspjLp1YmU5fAw5UDqny4VwWkrpp3S2KvBwlfETi
        owM/j4DO9/BTX7GYXZb/Uo/X4tMLAwwE4ME7gPp70B1J
X-Google-Smtp-Source: AGHT+IHJBvE2q/+7hRsyhn1O0y4IxujNTuvfrEPD8B7LeqjNrRbB7ab95rqVG4rYWD0lWKFme/7IpA==
X-Received: by 2002:aa7:c409:0:b0:531:1455:7528 with SMTP id j9-20020aa7c409000000b0053114557528mr2896677edq.40.1695974469074;
        Fri, 29 Sep 2023 01:01:09 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j6-20020aa7ca46000000b0052889d090bfsm10825040edt.79.2023.09.29.01.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:01:08 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 10:01:06 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sc7280: Add Camera Control Interface
 busses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-sc7280-cci-v1-2-16c7d386f062@fairphone.com>
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
In-Reply-To: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the CCI busses found on sc7280 and their pinctrl states.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 136 +++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 66f1eb83cca7..65550de2e4ff 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3793,6 +3793,86 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac4a000 {
+			compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac4a000 0 0x1000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac4b000 {
+			compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac4b000 0 0x1000>;
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+			pinctrl-0 = <&cci2_default &cci3_default>;
+			pinctrl-1 = <&cci2_sleep &cci3_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc7280-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;
@@ -4298,6 +4378,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 175>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				pins = "gpio69", "gpio70";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				pins = "gpio69", "gpio70";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio71", "gpio72";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				pins = "gpio71", "gpio72";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_default: cci2-default-state {
+				pins = "gpio73", "gpio74";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci2_sleep: cci2-sleep-state {
+				pins = "gpio73", "gpio74";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci3_default: cci3-default-state {
+				pins = "gpio75", "gpio76";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci3_sleep: cci3-sleep-state {
+				pins = "gpio75", "gpio76";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			dp_hot_plug_det: dp-hot-plug-det-state {
 				pins = "gpio47";
 				function = "dp_hot";

-- 
2.42.0

