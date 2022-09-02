Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32873C54EE9
	for <phone-devel@archiver.kernel.org>; Fri,  2 Sep 2022 11:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235674AbiIBLLT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 2 Sep 2022 07:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbiIBLLP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 2 Sep 2022 07:11:15 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2559F1BB
        for <phone-devel@vger.kernel.org>; Fri,  2 Sep 2022 04:11:06 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id se27so3139213ejb.8
        for <phone-devel@vger.kernel.org>; Fri, 02 Sep 2022 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ddR2V4NQZ/uHaIj0TMBF6nHgNNaXNlmSk7XRDg7SJk0=;
        b=XY0XaCadCm+9cjwcm9VM5ahsPw4zgoyXqhB9qX/k5HYD+z8oZ8PvjX/8K9ldNS4zK1
         P9j0Y7+tvUxCEhrW5iKWxajxYy9yhYpHyqmpnqIXWt4AyOHDviFZNaCQrQob6o9jmfCs
         /+yClxRcpRz2H01AIooDY/JTm1o0RZcvHcrBIsixis4hX+9BT5UUNDulIdg+fbDVji1S
         UE8jTd5AyGFmlx14tXb4qKuEzkXIaSCuotaJkpTAEOlMMQTy3Y/MqFuc3agqbSaFPczQ
         ZLJkC0vbnGkwHJywA0+7SQh6Nm9rtb0izOkhv+WTkYEHBHQnLYK4nGZ17IzsQHFNtnS/
         IC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ddR2V4NQZ/uHaIj0TMBF6nHgNNaXNlmSk7XRDg7SJk0=;
        b=ZJB2G+CHzOUZR+bhkJ8QHEITMFZNo4bUdAHLm8AgC7F+bXDxhcavH9r8sVjOUdm9Yb
         fdbtoWE1HKyFXvriKoHVyLeGUncQ8bhh9BwwLIj1xVKuiyR+UjDYTR/axiIq8cFRj3qf
         sVNU1w9hmCEeJfCnjRrBbNLT2v0YYtlm1z/FMj8Ws8C1OBb8j5xq3K2hfhccl+qj2+kg
         bZYQ4DXQp6Soh+3j92UpRn9cH7i0xxGxK6EMuU1M3E5DBicOcY0cz6CO9pqEyc+8GIOc
         +XbDcpHTWC5ExPLf6CkDWZEMgfYhvNQZwl/yo8CnqE0ML9x4+IifgayXY54WzMlWgkIG
         3+JA==
X-Gm-Message-State: ACgBeo0PA2gCY+naJnvnWI5tElv1lAsZNgNikJARmC0+L00/QzNSVR3h
        x/BfwT2WWcObIpHZwHOD3nuJAw==
X-Google-Smtp-Source: AA6agR7cddYAXsTIKrq5CDpMgDL8ePEg1TA0rtMh/B2q0E7hidAxQDtPuNj4r20hwSBJ4aJZdkJ1cQ==
X-Received: by 2002:a17:906:bc87:b0:73d:bacd:84e2 with SMTP id lv7-20020a170906bc8700b0073dbacd84e2mr25409192ejb.494.1662117064619;
        Fri, 02 Sep 2022 04:11:04 -0700 (PDT)
Received: from otso.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl. [31.151.115.246])
        by smtp.gmail.com with ESMTPSA id h1-20020a50cdc1000000b004483624d550sm1245624edj.71.2022.09.02.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 04:11:03 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mfd: qcom-spmi-pmic: Add pm7250b compatible
Date:   Fri,  2 Sep 2022 13:10:53 +0200
Message-Id: <20220902111055.106814-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible for pm7250b that is used with e.g. sm6350.

Also while we're at it, sort the compatibles alphabetically.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 65cbc6dee545..202aadc1539d 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -33,11 +33,12 @@ properties:
   compatible:
     items:
       - enum:
-          - qcom,pm660
-          - qcom,pm660l
           - qcom,pm6150
           - qcom,pm6150l
           - qcom,pm6350
+          - qcom,pm660
+          - qcom,pm660l
+          - qcom,pm7250b
           - qcom,pm7325
           - qcom,pm8004
           - qcom,pm8005
-- 
2.37.3

