Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDC3C04FE1
	for <phone-devel@archiver.kernel.org>; Mon, 14 Aug 2023 10:15:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236282AbjHNKOm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 14 Aug 2023 06:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236627AbjHNKOY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 14 Aug 2023 06:14:24 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1A510C8
        for <phone-devel@vger.kernel.org>; Mon, 14 Aug 2023 03:14:23 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52340d9187aso5448653a12.3
        for <phone-devel@vger.kernel.org>; Mon, 14 Aug 2023 03:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1692008062; x=1692612862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8oO/PwgsW79kOUbldrma34w+xKKDHQ32lW8yb4A9TU=;
        b=xTyyDV4bqm7A76/QoUoulaPJJxQ/9mx2vWKTZgbgYy16q39AQmya0IeogAfYfDPsvB
         4jwmq16zkvVhmqMXMZvPFNKBlkT6sVrETGpwdkhmukLgp+RW8qSRIGp+jiINrupjri6Q
         d9SC6OgyXmWcyIiVXdCnxCLV9s84IcIQcS8qRtPfzjDXSR2uuS8TP8dvnD51ZYjBCK1T
         VKtumtkYqThr0PA8UqhUllBTF/Ju7p/63jBaT5CpgrTggvAAkOSCWdZxg/ynvVeILgJt
         l5VbmWeMpQa9h263jOJTDz2MLe8hUziqYKernZMqM6XBZS//EZghP4MlQqIhv7x/CBZj
         Glaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692008062; x=1692612862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8oO/PwgsW79kOUbldrma34w+xKKDHQ32lW8yb4A9TU=;
        b=Z6G/7A/pZeR9uRIUQLLnnKqoqZzvYd6C1I/HHACuV9+WpC0y9hSaoHWFKV5ev3PhWp
         jLmwOXZR6K8qtjUArxhQxvil1vCfKkbxYoUOERN2NQBzJoWeNsI6utIoD+6GrI6FlNqD
         2vfzohXmMaY0GI74AXH3y6x1Ky300PzoJydyfYmwS2rWFqf9x+cWKTcnFayXHKHC64BW
         W329OiZuw1P4LFMUBvDqE4OGZsduXrITCU4a3eRuMmLgWznLUexUO22JDmmPfRpSj5mi
         ao0wygD2VBRok8K0HuUvtbHd7u4JmeqRQAoaTsVGd1hCTSK0V7xp+oFNGXTZc61YhXN4
         7z2Q==
X-Gm-Message-State: AOJu0Ywn8yH9212SURr6NhSJuq28OQi58Ddw4G9nkNYTpj0VGqbWAvT6
        H6QjV7Jj5eeC/Yjwo+YuuF36yw==
X-Google-Smtp-Source: AGHT+IFPnyhVQ4mf+lfev7hGeghOLu2St2ZJl1ynlBYniqCScspLIKrSCuVG9bxHMqdE24EjqBnMTg==
X-Received: by 2002:a17:906:5307:b0:98f:c9b:24ed with SMTP id h7-20020a170906530700b0098f0c9b24edmr8108333ejo.67.1692008061827;
        Mon, 14 Aug 2023 03:14:21 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (212095005216.public.telering.at. [212.95.5.216])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b00993a37aebc5sm5472870ejb.50.2023.08.14.03.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:14:21 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 14 Aug 2023 12:14:14 +0200
Subject: [PATCH v6 2/4] dt-bindings: ufs: qcom: Add sm6115 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-dt-binding-ufs-v6-2-fd94845adeda@fairphone.com>
References: <20230814-dt-binding-ufs-v6-0-fd94845adeda@fairphone.com>
In-Reply-To: <20230814-dt-binding-ufs-v6-0-fd94845adeda@fairphone.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Eric Biggers <ebiggers@google.com>,
        Iskren Chernev <me@iskren.info>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Iskren Chernev <me@iskren.info>

Add SM6115 UFS to DT schema.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Iskren Chernev <me@iskren.info>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/ufs/qcom,ufs.yaml          | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 4cc3f8f03b33..2b0831622cf0 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,sa8775p-ufshc
           - qcom,sc8280xp-ufshc
           - qcom,sdm845-ufshc
+          - qcom,sm6115-ufshc
           - qcom,sm6350-ufshc
           - qcom,sm8150-ufshc
           - qcom,sm8250-ufshc
@@ -204,6 +205,35 @@ allOf:
         reg-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6115-ufshc
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          items:
+            - const: core_clk
+            - const: bus_aggr_clk
+            - const: iface_clk
+            - const: core_clk_unipro
+            - const: ref_clk
+            - const: tx_lane0_sync_clk
+            - const: rx_lane0_sync_clk
+            - const: ice_core_clk
+        reg:
+          minItems: 2
+          maxItems: 2
+        reg-names:
+          minItems: 2
+      required:
+        - reg-names
+
     # TODO: define clock bindings for qcom,msm8994-ufshc
 
   - if:

-- 
2.41.0

