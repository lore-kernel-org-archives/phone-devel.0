Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A4AC61DD8
	for <phone-devel@archiver.kernel.org>; Fri, 13 Nov 2020 18:00:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F183C22201
	for <phone-devel@archiver.kernel.org>; Fri, 13 Nov 2020 18:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bO5uZR33"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgKMSAD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Nov 2020 13:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgKMSAA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Nov 2020 13:00:00 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A77C0617A6;
        Fri, 13 Nov 2020 10:00:00 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id 11so11807359ljf.2;
        Fri, 13 Nov 2020 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CWzu43DCeyauYJ1F5BcQ3LeRiSYYRPXz26NLfU5raCA=;
        b=bO5uZR33QoWdvnpfdzCdIj5Vp5615LRvv6EXtBEYIbGbGIwvIa2MTEAE1hkuXiJCf7
         bW4jSKrugXh4l3Fajyic+3sE4JrasoLc09DROc1reA1SJxa5E/3sBsmnB0qcCciZmI/R
         FQVE6N+UeLCYoCh3iAIdWaIOxUrCQBjEz0DnU2ln+dyvR3uqEejYsYp1L5jotiNg0rCz
         kTU0NaZOXUprJiZkYCLh0TU9HUhsokeYphk89+7FYv707rlfjqxVgnA4ptsWOnFOYqOa
         g9w+v3xwIV8p0xO0CDSy3dGN7SCVwOXqMfQm4wPCSkX9nOAqd4nBT1i9N0KKxwP2AXWU
         r/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CWzu43DCeyauYJ1F5BcQ3LeRiSYYRPXz26NLfU5raCA=;
        b=QFjJ4EzMqB2p6lY88OoDsVq+ryzRo5PxG1BaU7SfHgO3zuSPDpuzaMz+iUCMAmxKgH
         uW5wC6KCEL9Gl0ok4DqB10jZz+N9bqziA8rqF7FcpWEmRigSCDdVILE+yyWsfYOzp/V+
         AX816MtuZgv0lOy7eE0/AvWwSyhUNe6i0QdE1H/J53GWdb5KNxtJkGWxmgamxilkEBdN
         NIk9DEXiRz6lwFksLwmn8CFXW3dOtrveBAZCbuJl5zwlm1oclDTSHYcpWX2KLy8m/tnJ
         Pgjv06McYmn5J/D9I1veJKMSOQ1zWEwxWf7VfOMJXd4i0TFbBiNCkPlvMdPsvdzRHNyU
         MmCg==
X-Gm-Message-State: AOAM533VayEWynzYiom0B4lUEYUXf+pe/BP6Z76VC4wdzwLo1IVdcKAu
        3pwVcw2sDyzd8Am6txJTPB8=
X-Google-Smtp-Source: ABdhPJyqRCBL1an7ZzFadh9tKDIxogvuQA5R8J+Ul4J+rYM5Artv2tgezJYf65n4x2LUh4GYZRnvFA==
X-Received: by 2002:a2e:9614:: with SMTP id v20mr1621709ljh.13.1605290392925;
        Fri, 13 Nov 2020 09:59:52 -0800 (PST)
Received: from localhost.localdomain ([2a01:540:2326:b00:1d75:252:b367:4629])
        by smtp.gmail.com with ESMTPSA id c1sm1629363lfj.222.2020.11.13.09.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:59:52 -0800 (PST)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, stephan@gerhold.net, Michael.Srba@seznam.cz,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 3/6] arm64: dts: msm8916-longcheer-l8150: Add position sensors
Date:   Fri, 13 Nov 2020 22:59:14 +0500
Message-Id: <20201113175917.189123-3-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113175917.189123-1-nikitos.tr@gmail.com>
References: <20201113175917.189123-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

L8150 has:
 - BMC156 accelerometer and magnetic sensor
 - BMG160 gyroscope sensor
Add them to the device tree.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 21f2e8e0d05e..79a2475e3cd5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -67,6 +67,44 @@ reg_ctp: regulator-ctp {
 	};
 };
 
+&blsp_i2c2 {
+	status = "okay";
+
+	accelerometer@10 {
+		compatible = "bosch,bmc150_accel";
+		reg = <0x10>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		mount-matrix = "0", "1", "0",
+			      "-1", "0", "0",
+			       "0", "0", "1";
+	};
+
+	magnetometer@12 {
+		compatible = "bosch,bmc150_magn";
+		reg = <0x12>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+	};
+
+	gyroscope@68 {
+		compatible = "bosch,bmg160";
+		reg = <0x68>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <23 IRQ_TYPE_EDGE_RISING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gyro_int_default>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+	};
+};
+
 &blsp_i2c5 {
 	status = "okay";
 
@@ -264,6 +302,14 @@ gpio_keys_default: gpio-keys-default {
 		bias-pull-up;
 	};
 
+	gyro_int_default: gyro-int-default {
+		pins = "gpio23";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tp_int_default: tp-int-default {
 		pins = "gpio13";
 		function = "gpio";
-- 
2.25.1

