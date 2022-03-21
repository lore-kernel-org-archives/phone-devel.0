Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75DFC4321E
	for <phone-devel@archiver.kernel.org>; Mon, 21 Mar 2022 13:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347918AbiCUNfh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Mar 2022 09:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347935AbiCUNf0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Mar 2022 09:35:26 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49193CA65
        for <phone-devel@vger.kernel.org>; Mon, 21 Mar 2022 06:33:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z92so16905810ede.13
        for <phone-devel@vger.kernel.org>; Mon, 21 Mar 2022 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x6BxZch4uZImMxpopzhj/TV44ApdnEVZrzFIJlaiPFA=;
        b=wzYxgeoIax8d+We0XG2f4nTSOUImN5EoFfh9Lu1qqqg/T/M8YkqCuBEsZGLyy6EngN
         pioZEioorYT3x1q2CPJOzLdyGd2iCCL1fWngRY7DYq5XrwqGrsyq90nG9t3qSKUvrh9h
         dmwYa+6TaIqbMqA7Bs/6YfF71FnfzVbfAWH3VOiJDLpoIX58jAnAOICYNn57piHWaY9f
         rV0dikn5CkZyqWMZwJH5nsGOsdp/LQk/JYPJit8kVNd2/j4nXGu40k8piBqnnRTs1LoZ
         FC+SPX0SEqGv9W/lDx3vNYzq9wy7vNsU+p+Z50lyIcKVrNJvubKAkwbYoPBYPMc8QZjR
         lBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x6BxZch4uZImMxpopzhj/TV44ApdnEVZrzFIJlaiPFA=;
        b=P4LDZ905M7qs8y+tg83OVLqjO1u8OtBZpUsPN+n0FBEPDU4qskc8W0o8rebI61xySS
         mBegc6hc14dhuytn+J4mwgCDV9pqTlCM+yYw+q1Z3CjgiMzPY9W+wKcR8WndIMTg2jMg
         mhY2QY3q92hi6IxVxFQv9HEbs1gYrwnvGL+V9aB5KaCWuOi82C5ZcNQTsvbSUOVNhWMP
         kaLpVBaDeXS5etoxTGH47oyBbxGz470PhXPF7mfQHuB/ifDmqflD3kXj7XpcVHjgI6CT
         bDBN+gySTwoQ6DXQfyVLclsFqw25hWdMxQNSGF9RxgkBGhCRir/vvaKPN6pjJpO6qEKY
         1wyg==
X-Gm-Message-State: AOAM530Gy2NrwjcYRSMj7G3TN/BwY4GCyUO3ORcVIE16sNBTsm0a10Yn
        2FAbWr0N+gttFPO+HjS68UUZLw==
X-Google-Smtp-Source: ABdhPJy5wcFMSxqYF9z9tT1TTrf1HxYWEDeD8UzOptL563RO6bUoh84uqACrFycVwHbxAjuXq70lkw==
X-Received: by 2002:a05:6402:13d6:b0:419:2eab:d21 with SMTP id a22-20020a05640213d600b004192eab0d21mr7959137edx.78.1647869635192;
        Mon, 21 Mar 2022 06:33:55 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm6862154ejd.133.2022.03.21.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:33:54 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable UFS
Date:   Mon, 21 Mar 2022 14:33:18 +0100
Message-Id: <20220321133318.99406-7-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133318.99406-1-luca.weiss@fairphone.com>
References: <20220321133318.99406-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Configure and enable the nodes for UFS that are used for internal
storage on FP4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- nothing

 .../boot/dts/qcom/sm7225-fairphone-fp4.dts     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index adb6ca2be2a5..533a1c88040f 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -336,6 +336,24 @@ &uart2 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 156 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7e>;
+	vcc-max-microamp = <800000>;
+	vccq2-supply = <&vreg_l12a>;
+	vccq2-max-microamp = <800000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l18a>;
+	vdda-pll-supply = <&vreg_l22a>;
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.35.1

