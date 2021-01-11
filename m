Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A7CC4332B
	for <phone-devel@archiver.kernel.org>; Mon, 11 Jan 2021 17:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D689223C8
	for <phone-devel@archiver.kernel.org>; Mon, 11 Jan 2021 17:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389980AbhAKR6M (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 11 Jan 2021 12:58:12 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162]:35247 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388981AbhAKR6M (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 11 Jan 2021 12:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610387659;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=SUXBlRYRk1Gp//wo8C/SRetvW25JjtZskFv2IDL2t3A=;
        b=Ic00qv3AUkyoztxRKvVetUGtCesEMoRRA2+PYTx3e8EG+9wNWO2cCBrtu8LMkMDmxL
        Z1pAobRXR/NPWCkp/Rt8zAPg+6x4VPj1VTDAXxNSvwgGgEW3ZlCSnKCmIQFMSEhysmU1
        PKSkhZlzH3aavlpL/fPyjVMLlYE3d1jUqGYDB+0z1hc1UvuN8DBPWUq7fliWR2NjrItK
        yBEd65xgjPZDmLqEvKzDYAUDtHTOYy+DK02UGTndxk2m/8LufIpkQ/Aa8IZkfnoRVxXl
        kASlRjT9Tc/9FbdMNpfDBoeKcLMic7B3XRNpBdS3YTMs/fTBQoEGdSwF8JyNQM4hCrPU
        I+RA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB626NJiA="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x0BHsJyd5
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 11 Jan 2021 18:54:19 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-a2015: Fix sensors
Date:   Mon, 11 Jan 2021 18:53:58 +0100
Message-Id: <20210111175358.97171-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

When the BMC150 accelerometer/magnetometer was added to the device tree,
the sensors were working without specifying any regulator supplies,
likely because the regulators were on by default and then never turned off.

For some reason, this is no longer the case for pm8916_l17, which prevents
the sensors from working in some cases.

Now that the bmc150_accel/bmc150_magn drivers can enable necessary
regulators, declare the necessary regulator supplies to make the sensors
work again.

Fixes: 079f81acf10f ("arm64: dts: qcom: msm8916-samsung-a2015: Add accelerometer/magnetometer")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index f91269492d72..f1af798abd74 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -106,6 +106,9 @@ accelerometer: accelerometer@10 {
 		interrupt-parent = <&msmgpio>;
 		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
 
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l5>;
+
 		pinctrl-names = "default";
 		pinctrl-0 = <&accel_int_default>;
 	};
@@ -113,6 +116,9 @@ accelerometer: accelerometer@10 {
 	magnetometer@12 {
 		compatible = "bosch,bmc150_magn";
 		reg = <0x12>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l5>;
 	};
 };
 
-- 
2.30.0

