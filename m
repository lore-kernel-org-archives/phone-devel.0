Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA57CD37BE
	for <phone-devel@archiver.kernel.org>; Sat, 16 Sep 2023 13:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239115AbjIPNm0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 16 Sep 2023 09:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237013AbjIPNl7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 16 Sep 2023 09:41:59 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F151B5
        for <phone-devel@vger.kernel.org>; Sat, 16 Sep 2023 06:41:52 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so25940865e9.1
        for <phone-devel@vger.kernel.org>; Sat, 16 Sep 2023 06:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1694871711; x=1695476511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dq5MVWHSLDa3ue2z16rOjOH4TMxsojWJwYBj2T0FxCo=;
        b=QqAl+beqTosvZVcMPPmHACOVO1wqf0WgkFbKp6YylEB+2UNoUmGOZyTlhd1geG0Jmx
         g4cistb/dXZdmYFPFj0dEVv2eiogWHJEsuJALO5YCcug9N5f3wQGKgHLaHqAkPLum8D8
         b6J2+bY2DHAA3iZhrehIrlOVQAT+Ij3lkt22ZXqGhYihPOdMz9JwQzFBCaob0LcSUrvj
         J5fXwL/imBJc64vYuO7A9FM7jgZgU3OPJvKCMM8ABrCRS/OztFnIs++jd150xsaX06lh
         ax04HRPxPAOIrehIduOri9kRrz8oc1CV/YEfKn+FljR9So0nldzinLJmkqsxlz7Cd83P
         J8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694871711; x=1695476511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq5MVWHSLDa3ue2z16rOjOH4TMxsojWJwYBj2T0FxCo=;
        b=BmMTp0lZb9GEXsk3ubRFuptBz07XCNzVBQwlnnpG/Hh0ebNAg4teICmyqxr2rSS1pE
         aP16uapdhYb9ZzNpLP9OHbwDdyAKqS5d3Xx2n64t5fEQrNljO29/rNNiXdKaQ1h7G5dp
         4Q3p7jmHj1hD0xPB0RZFk7aAnZGeSRpuZZaGK2A8xpg54WzA7LWs2FjqvZ6sd6NXY5fY
         TwgS0TI3fmhvsWR2TAioF2gZB1jlzyqCJUD+4BIC7NmaliDntD1brbM1qtrIbC+avEp4
         UX/+UvFs+1WD/gWVTw168lYkIwTNlEkvsMT4Za/JW/dGpikKLMS7YetTd7MXvEFod6Yu
         t3XQ==
X-Gm-Message-State: AOJu0Yz6G7ihgV41ye8g9YIOqk1+140MyVv+p420piF00h6eyztxhTfz
        d0i7fkknACqRoa5eJTNhNM9h5g==
X-Google-Smtp-Source: AGHT+IFl7ojvB+vli8z8CIemz0JnDFCyKUAaw6oHAfDopUyuChUSPIE5Zs0Zep4Z2vR1CrcPWYSgHQ==
X-Received: by 2002:a5d:65cc:0:b0:314:3e96:bd7e with SMTP id e12-20020a5d65cc000000b003143e96bd7emr6029919wrw.4.1694871710815;
        Sat, 16 Sep 2023 06:41:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:d84:9160:acd3:26fc:724e:a2dd])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d568d000000b0031fd849e797sm7144278wrv.105.2023.09.16.06.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 06:41:50 -0700 (PDT)
From:   Lukas Walter <lukas.walter@aceart.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Lukas Walter <lukas.walter@aceart.de>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Huawei Honor 5X / GR5 (2016)
Date:   Sat, 16 Sep 2023 15:41:46 +0200
Message-ID: <20230916134147.163764-1-lukas.walter@aceart.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a compatible for Huawei Honor 5X / GR5 (2016).

Signed-off-by: Lukas Walter <lukas.walter@aceart.de>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index adbfaea32343..eabd7f6af07f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -189,6 +189,7 @@ properties:
 
       - items:
           - enum:
+              - huawei,kiwi
               - samsung,a7
               - sony,kanuti-tulip
               - square,apq8039-t2
-- 
2.42.0

