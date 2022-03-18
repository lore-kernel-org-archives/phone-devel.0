Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C76FC433F5
	for <phone-devel@archiver.kernel.org>; Fri, 18 Mar 2022 18:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240110AbiCRSmB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 18 Mar 2022 14:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240241AbiCRSmA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 18 Mar 2022 14:42:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CC41CAF0F
        for <phone-devel@vger.kernel.org>; Fri, 18 Mar 2022 11:40:41 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g17so15478049lfh.2
        for <phone-devel@vger.kernel.org>; Fri, 18 Mar 2022 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IsPzUzvYgLroRu4csiaCo2UKzNPvjuzZI8dPfwBHJgI=;
        b=Bb7G9eAidXa4LtVJHXlV2hdxDrOmusC1eMK5cZl9Dw1C0hBIEEgp9CgMVxa2ho8EH9
         Iy7Wvie5D5ex39h2yW9Q2Qm+2rfhzPmHV+hzlZ2dg3kkqTUki5LdJIvsugrmihAoep49
         dnU8et/omSgk0dpcxJyQ0aUlBsqs6GVSlPxvGYiuoA//woteMVcI+GpeALlKT4mZRY9Y
         R+Agz8iqrxzPEbsdZ9bGSz+n6IsfkXJx0nw0D4rKVzuQLus3hk2vlALuyF+HIszpwtve
         k9ci5JTZsfn8NvOzj2PidOYW9KILHgvJ10PAHxLnCYmnaNxCGUoiu+RJGlKibcpe+eHN
         TchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IsPzUzvYgLroRu4csiaCo2UKzNPvjuzZI8dPfwBHJgI=;
        b=HRYypPm/iJDlxB/TxR2T7pnn89zjQ1BE3ldYxXe6bXpaeQNCnnue04JB0efuBQlE/F
         6lnt4DsiyRwuSRGH7h6VIp5uADN4NJ7rGfLD9TugYq30hCjop/yN8960UYUV58DNjLJx
         h2gLQt1YT8jeD8I4+gtG798Aheifg/+4H2aVoOsOYs8mGBIvBLX9Qd2aj7Asa3BU2tPe
         GEyHbJP2nH9hSdt/IfUsyPzGsUwfZNB372a7fkOZQORARNSCoKylOMJShxrHln50SyYC
         EtEDeK49jUJykxar2xkNON82NcQpYKyYrzCIJ2jJixFXdZOZFOSUrwOH/8NDK5NmDj1j
         eZSA==
X-Gm-Message-State: AOAM533YcI3Nz4esC3SvBxJs4bcWYcYDqtuKop7+13aGsrR6IO/JmxAt
        aN72mnDz3eXxth7raArWwZW5u1P+4KxOEQ==
X-Google-Smtp-Source: ABdhPJwCFaAeaJnJiep/ONIqfYgxBm2KzuK6ldKFXPAH+O97PzsAaUVBZLeOF/oW5FVvabze6YOf2Q==
X-Received: by 2002:a17:906:5597:b0:6ce:f3cc:14e8 with SMTP id y23-20020a170906559700b006cef3cc14e8mr10038931ejp.426.1647628231596;
        Fri, 18 Mar 2022 11:30:31 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb08000000b00418b114469csm4567551edp.52.2022.03.18.11.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 11:30:31 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable UFS
Date:   Fri, 18 Mar 2022 19:30:04 +0100
Message-Id: <20220318183004.858707-7-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318183004.858707-1-luca.weiss@fairphone.com>
References: <20220318183004.858707-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Configure and enable the nodes for UFS that are used for internal
storage on FP4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
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

