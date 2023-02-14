Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8323C677F1
	for <phone-devel@archiver.kernel.org>; Tue, 14 Feb 2023 11:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbjBNLBq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 14 Feb 2023 06:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232718AbjBNLBm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 14 Feb 2023 06:01:42 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6949C24C84
        for <phone-devel@vger.kernel.org>; Tue, 14 Feb 2023 03:01:37 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id mc25so1703928ejb.13
        for <phone-devel@vger.kernel.org>; Tue, 14 Feb 2023 03:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhcKoN5ST7xXXL4advBn9C/NLBwyPeRYvlSSmMsZVTc=;
        b=Ec1aAWyfr5zWmwwLyROj7VgyT5uAT/F121zLh/UypO4SjLMz1qnhCaEfZcTxRaYIjG
         7bW2G1R4M7R5QB/bLSqspAsBZPFTFLOyLCDGiZzpVTbe3sMeMbSOrKcrizVqYkrTf5GN
         GZZQQ9sgwtsUxD3DdEdeCOB2ajV7mTibD7hs+R0eJF7BlIiq+nXu7KtJvMeSbjAEX9Vd
         TfBsGdyhAy4GtzqKztS2K+RzAnOSqAp8ZETVNwBGnVdz6sgEHv3TTQTS+H8fE3pSjx4G
         6lNhWUrtpXyryIWY+/cNBgrIzcck18xTtArwgp7Ixfcdz4X7V3KWCGTRf20RgLNyVsMn
         xXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhcKoN5ST7xXXL4advBn9C/NLBwyPeRYvlSSmMsZVTc=;
        b=elSqyOfLS0t2ajvpyA0OuSAOl1nv3m4jOqWTNeYGU7/AOw60iCXCLEBGCJcwmsq6Zg
         RCellX+rm68bjmF4SL4nf8Wg6SydXY417wq5CR4ZoJa94vFYjTn8dGsfX8pQomaJMFWT
         IYLGuMpW4HqY+ceV3wSoDMSSPjbmx316ZF1+Nzb9PDs2Ea/IC6ohvLVZcTS8iA+c5JrC
         KTAtENy02gJesui4YoN/zecl7APphii6naQIW6PzrAYs3tD1bfR+h2cb4DFZbfSL9XJV
         ANKAvKqdBxhH4IknOlgNcOrc3RTOu6PCU59KwQnND2FbyYwW4sXXs32gnpJtE4pBcLRw
         MZFg==
X-Gm-Message-State: AO0yUKXzSk+HfVwpXk2K8oXg52jlF4eYs4x7qkGTrLIf5sy4obySmzTA
        +PByZHK2suKJU6+dZvPm+TFZCQ==
X-Google-Smtp-Source: AK7set95TCpJ1aPe+yuVK1lRMxdTbn+xO25lkd43tCJDJnxUuu3PgC0uFoLRfzSWRLDb9RbTO0ZD8Q==
X-Received: by 2002:a17:906:1354:b0:888:a72f:1599 with SMTP id x20-20020a170906135400b00888a72f1599mr2791543ejb.11.1676372496015;
        Tue, 14 Feb 2023 03:01:36 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906115500b008711cab8875sm7959596eja.216.2023.02.14.03.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 03:01:35 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 14 Feb 2023 12:01:33 +0100
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm6350: add power domain to camcc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-sm6350-camcc-runtime_pm-v3-2-d35e0d833cc4@fairphone.com>
References: <20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com>
In-Reply-To: <20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the CX power domain to the camcc node so the power domain gets
marked as in-use when camcc is used.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
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

