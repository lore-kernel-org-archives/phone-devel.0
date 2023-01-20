Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAFBC52D77
	for <phone-devel@archiver.kernel.org>; Fri, 20 Jan 2023 13:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjATNSj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbjATNSf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Jan 2023 08:18:35 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639D5C41DB
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 05:14:53 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id rl14so10529028ejb.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 05:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=031w1g9Y5G2a1Xr/z7EdzNKTzhiIoWJq1q3UhyHxNMk=;
        b=hjhSK/azGy6/8bHlJ36i3bsWkmf7nBMd/TaTMlbpWpkf5BHUzAS+W4FnI2FVT5gmlR
         aPG5xxtLBO4AuU1ncz6zDn4FIjN1a3/OQs+iCGGtsRBDIWNolX+58WEGA3N944/pgCS1
         0ptgjvIhYL1ijkt3qnYfFr3wEJq2piFDJZpFNLcxxUdxOMu4POh6fJ4V1Fasskv84Mj8
         JJP/pJPsym0dd3nCdtDPzdRlm2UHgYW7tCTGzx3nFb3XvWcPSJK+rnaKuGOAcGQe9N/m
         YGfiofAv7F5KgTa1nGT0tc+Q3HKmsFp40tBU9RqElL9+24QUIa5QR68e/A6nt9gxWO8a
         AyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=031w1g9Y5G2a1Xr/z7EdzNKTzhiIoWJq1q3UhyHxNMk=;
        b=tUz/b1Zps7rSLPzUH/nkNvfkfaBDFG0adlcGqLDx1tsOOQB7AkB4N/pMm6lqTSYlL2
         09XDDuDfuAi0uAx/Co4s11nYHjPh1AGZHySmcaTAH1sAXxhseirP4lPFIditltnSIsOc
         rn2KJTQIJItpY3Yom5Bs3amcSV2dqVLB/QNzVB2I3voxfOGrxBg3rG2b/8G51IRe7k5m
         vRUp5Jt0hr6rQWe7sTknMiWagH0Knw5Egh8IGrbE7M0MXnEGeg0bhfsgASblUSSoX9Zg
         VZF4vkVuRHXd53W/ir94SFju1rxqhqkihBMg5I3E4P5j3EtMZ1Gw2nTgZhHqMBLO+3de
         Q9Ig==
X-Gm-Message-State: AFqh2kr1ZW784ZGofQWdQxQgpui0KmMyXfYopIlmDEExXK+TOdG/TyFO
        nyw/iW/lC9wSdmxKwRlVj0gOUg==
X-Google-Smtp-Source: AMrXdXuIXbFX/5M5zW9GdKZmjUZ3xfV0D1QO3DSGLjENqCzrRFFaRRvPqHuh98H+c2o9c9R6ZkDS9A==
X-Received: by 2002:a17:906:358f:b0:829:6064:bc52 with SMTP id o15-20020a170906358f00b008296064bc52mr14368169ejb.74.1674220491895;
        Fri, 20 Jan 2023 05:14:51 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm8063276ejg.223.2023.01.20.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:14:51 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 14:13:44 +0100
Subject: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document SM6350
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v2-1-15c2c14c34bb@fairphone.com>
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12-dev-78462
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible for the CCI block found on SM6350 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 87e414f0c39c..ec79b7270437 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,sdm845-cci
+              - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
           - const: qcom,msm8996-cci # CCI v2
@@ -139,6 +140,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-cci
+              - qcom,sm6350-cci
     then:
       properties:
         clocks:

-- 
2.39.1

