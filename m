Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579B9C6379F
	for <phone-devel@archiver.kernel.org>; Mon, 13 Feb 2023 12:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjBMMfH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbjBMMfG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Feb 2023 07:35:06 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D3913D77
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 04:35:02 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id lu11so31491846ejb.3
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 04:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Q3sX6YTXGYHIP374Q+pFww/SYTQVJ2mqj5WKR3Qc1U=;
        b=kLl/jILGxL54mKZded902Aly+RfC7qMgTcFZG9lxQspd8a9GK8XJIDu3kSeB2Nzr/A
         ryLQMjixE+VK7Ei5PaUWmmkMCY4Uv1T5RfzJXmXOsyysS71SH2StCc2sCxaArZ/hb8K2
         6Ng8Ahs/2gjX994EYhD/vrm0GAqBbVsie0ThgHMrbFs5JiOZhKE41ekZUi5J3ebRKH+Y
         Q1mmWcamqioEswh9+CyZ/gZY78YOb4nljiKDASG4XWaBu+s22c8lpuISO09f+LnKOK6X
         zeNMdUMaxtZcacrPUW+qlRown7J4tWuEwFoGa3vdF9XmgPoprCHnIIHr5x1VOtU0PHId
         vPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q3sX6YTXGYHIP374Q+pFww/SYTQVJ2mqj5WKR3Qc1U=;
        b=RCt/JMbhu5vkfh6gpsUKAyc/5A0jB9NKVJPvYZSASnL3udvLsGoxc/Fewtr9L1u0AQ
         AZgH2R4AY5qN+1VsND58KKJ1EOcSFsZPMxv/ceXNVMU5n+AhE2QBmde84+GWOU0ey9Do
         nDjksX8+HeOEoiLl1GhxLkCdgsRjPrPGnrPf4Kc21eWUx1IMByQPCIS4dL45PXfzGiGw
         Hjl3GjVP8P740Q6/Px0maK6JMmAHe9xqGJNmSp5Aj4f50yB6aqgQGJEkyaBokD5TDBr4
         Vasd6+J4u1vw0tmSB4Ktt5prqrE3V3kvlDeW2qE1bpNz+bsbrWa32V/gRHD4Az+toiTl
         N2Yg==
X-Gm-Message-State: AO0yUKWDs6qTdUGiuZHg6/LmkaLi72reTQkFC1jpIbiPMWqQZR4gcu5c
        yDbvw1u34IDYaQlzuZrz6OJE0ysmQnpr0hROJjw=
X-Google-Smtp-Source: AK7set8mPWY0QxVCcTjYcTg+eO3ExK3Y0MeaLVtKVVfXmRLsYFfVDyraXEgNif+JO9i1+c9QYVpqBg==
X-Received: by 2002:a17:906:6985:b0:886:fcbf:a1e5 with SMTP id i5-20020a170906698500b00886fcbfa1e5mr24064268ejr.59.1676291700871;
        Mon, 13 Feb 2023 04:35:00 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm6721858ejz.214.2023.02.13.04.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 04:35:00 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
X-Google-Original-From: Luca Weiss <luca@z3ntu.xyz>
Date:   Mon, 13 Feb 2023 13:34:57 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm6350: add power domain to camcc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-sm6350-camcc-runtime_pm-v1-2-761fc69f7a80@z3ntu.xyz>
References: <20230213-sm6350-camcc-runtime_pm-v1-0-761fc69f7a80@z3ntu.xyz>
In-Reply-To: <20230213-sm6350-camcc-runtime_pm-v1-0-761fc69f7a80@z3ntu.xyz>
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the CX power domain to the camcc node so the power domain gets
marked as in-use when camcc is used.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 1e1d366c92c1..62d6dcd8d1fe 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1507,6 +1507,8 @@ camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm6350-camcc";
 			reg = <0 0x0ad00000 0 0x16000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			power-domains = <&rpmhpd SM6350_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.39.1

