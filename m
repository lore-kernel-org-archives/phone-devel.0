Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014E0C001B3
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jun 2023 08:16:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjFZIQW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jun 2023 04:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjFZIQS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jun 2023 04:16:18 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9776EE53
        for <phone-devel@vger.kernel.org>; Mon, 26 Jun 2023 01:16:16 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9741caaf9d4so230903266b.0
        for <phone-devel@vger.kernel.org>; Mon, 26 Jun 2023 01:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687767375; x=1690359375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzrG3UTQMv24aqqyJ4HuHcMxqLMgWVT3rshhNA4f4yA=;
        b=AujfvBqUOERGZYcrtu35naU40C2xZtvAxwYUyprrz9GGpKUikKYkuO/cT+ENo6uAS0
         ++9QHTIrY0XlgtSVlKcmj812+aYHQIZtsCCXpNnkX4VPqKVgsD/+2N0a/AN1eHEyZmvw
         uGuenuFXo7ZUrN078schSxTrY+8ry/BzduSXodfy2XZ/vvGB4D0MVlxytUYEhcPWj/qg
         T/348a9anyrLsF/sz5vmkLVRC0/TyrxkQlv3xYJXek9UhSzqeulTCNJ62+2XTCEfxycR
         o7M0xL4phPnRucrcGSr4Hkk9A2mcSQ3hvpPSE689sweXkBb1CbCskBWfZa60v1oRLUvU
         Rvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687767375; x=1690359375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzrG3UTQMv24aqqyJ4HuHcMxqLMgWVT3rshhNA4f4yA=;
        b=WFbl3MDKmdpF6cK9x1/O+jIVC7YRNUuxI5hSt6AbTcSCtBxRi5R7n1iPDYljdo4UCd
         uxs9/M1Kl1VE0EloERWTWlr6dkmVdtgKL5bV0BNWnff6Tlgkg9uAg7LdRs2xrGLBIIgl
         OFAXixPT/G9pmW21HG5HH9dPMGy192DJHVq6Zxr9KohzWUpuZpqZHJ5eIFbNTQzRAiNQ
         ztIn5rSOx8nL0TO/h5EHPcjbjXJC/2LI/c89FCz3xho9qY6B7Dy1PhDLdkjr0HTPRF/b
         gm57WsHIjwCXRwy6qGO7xhNsezgt5I82xRabS2KVdjUb3VKb3GiIhUMCyRUt+PDO+W8A
         ZCfg==
X-Gm-Message-State: AC+VfDw28NFUMGq6f4zyWbML3EHZPk9MrahnuzXKOEwH5902kPhoErYa
        9lkEtol6oLmBGihdJkHlKex/fw==
X-Google-Smtp-Source: ACHHUZ5F9fvoXgjhnq9skj8rdwunM3W0BZNCjB4r1eGM7eWvK9W+EP+t99/yg7EAa+Ho+4nd24m56g==
X-Received: by 2002:a17:907:6d20:b0:991:edf7:4115 with SMTP id sa32-20020a1709076d2000b00991edf74115mr247285ejc.2.1687767375026;
        Mon, 26 Jun 2023 01:16:15 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id bm4-20020a170906c04400b0094f07545d40sm2935617ejb.220.2023.06.26.01.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 01:16:14 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 26 Jun 2023 10:15:59 +0200
Subject: [PATCH v4 3/3] dt-bindings: ufs: qcom: Fix sm8450 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221209-dt-binding-ufs-v4-3-14ced60f3d1b@fairphone.com>
References: <20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com>
In-Reply-To: <20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Eric Biggers <ebiggers@google.com>
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

SM8450 actually supports ICE (Inline Crypto Engine) so adjust the
bindings and the example to match.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Iskren Chernev <me@iskren.info>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index b5fc686cb3a1..04baa98bf7e4 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -119,7 +119,6 @@ allOf:
               - qcom,sc8280xp-ufshc
               - qcom,sm8250-ufshc
               - qcom,sm8350-ufshc
-              - qcom,sm8450-ufshc
               - qcom,sm8550-ufshc
     then:
       properties:
@@ -150,6 +149,7 @@ allOf:
               - qcom,sdm845-ufshc
               - qcom,sm6350-ufshc
               - qcom,sm8150-ufshc
+              - qcom,sm8450-ufshc
     then:
       properties:
         clocks:
@@ -275,7 +275,9 @@ examples:
         ufs@1d84000 {
             compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
                          "jedec,ufs-2.0";
-            reg = <0 0x01d84000 0 0x3000>;
+            reg = <0 0x01d84000 0 0x3000>,
+                  <0 0x01d88000 0 0x8000>;
+            reg-names = "std", "ice";
             interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
             phys = <&ufs_mem_phy_lanes>;
             phy-names = "ufsphy";
@@ -303,7 +305,8 @@ examples:
                           "ref_clk",
                           "tx_lane0_sync_clk",
                           "rx_lane0_sync_clk",
-                          "rx_lane1_sync_clk";
+                          "rx_lane1_sync_clk",
+                          "ice_core_clk";
             clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
                      <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
                      <&gcc GCC_UFS_PHY_AHB_CLK>,
@@ -311,7 +314,8 @@ examples:
                      <&rpmhcc RPMH_CXO_CLK>,
                      <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
                      <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
+                     <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
             freq-table-hz = <75000000 300000000>,
                             <0 0>,
                             <0 0>,
@@ -319,6 +323,7 @@ examples:
                             <75000000 300000000>,
                             <0 0>,
                             <0 0>,
-                            <0 0>;
+                            <0 0>,
+                            <75000000 300000000>;
         };
     };

-- 
2.41.0

