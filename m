Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8411CC001E0
	for <phone-devel@archiver.kernel.org>; Sat, 21 Oct 2023 14:31:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjJUObX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 21 Oct 2023 10:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjJUObX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 21 Oct 2023 10:31:23 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9AFD68
        for <phone-devel@vger.kernel.org>; Sat, 21 Oct 2023 07:31:17 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4083740f92dso14465145e9.3
        for <phone-devel@vger.kernel.org>; Sat, 21 Oct 2023 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1697898675; x=1698503475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5LJpDlIiRiwiuxdMoVURDKmaMGrN9X/vug2AO0xEv5U=;
        b=H2rCcNXpA3jXDGeFbK9mj8zF5cR2vDU+1i0xbHxt+sZWDm4AduF7VCfvOLyUAPMkKz
         UFK5RyKuwDR/TA4qlKctoO9TRXTz6deIZKcaceDcbCFJ1F7qfM5o/FMrOF72QRys7eY8
         MXuckKa1UOfOOBGSskPKrnU3OeF0dT3MOuiF7TYYydCDFLbhZIfN+2dGmi+pkGCUjdcP
         H/O0AY4oV7xvkmLuibBmpPHo9lNG+fAUbPrbfuOBmd+6jxajtYDC91qsxAjuVrbzwmBn
         jkn65jw76k+WiVFm+VJ6878wSeLQ5qSXWJFZ/aMPy+7y5qY4+d/JFZfg9QhTnoeBFekz
         iMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697898675; x=1698503475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LJpDlIiRiwiuxdMoVURDKmaMGrN9X/vug2AO0xEv5U=;
        b=deq7fw3PNBMVQrmhL+0Fu1Rp89UhQnc1Eqad0t5BpZB16cKmwi74YBBlYPykP5n+9D
         zuhj783xt83H7m3aWnxXWwknGi2gHY3/lWbHBjcmDzqsKIH/zKbF1bHnJzbk8uBRsvoA
         btDzEAPdp8hw4TRvRit4vdEB4lCwrdXLnE71a54/5/q2Muf9ZAca88M7XIkt/M71tKu/
         yQ+yaSmYTz3SD664oNmDrTpuR1O+rA391c/nEVSS1q/iBS96Dvx+pxTFfem7CUkRdvf3
         HPXbrvzYwuYTbE0dHORycJ2Jam/OoTINFAcTkQoxsEXi831LIqeFAnghoTz83c5tQHC/
         gMBQ==
X-Gm-Message-State: AOJu0YwwMYV3IZXV1+E0rByEa3Gqv1dGN1D/lGbau1Hds5S8U1bq6EUt
        00RWMRHfpiY4rA3okrJbJYdfLw==
X-Google-Smtp-Source: AGHT+IGNJjyZb+7Uajr8RQ49cwaAVeZxiqb20qecfa04uv1b45gqac/gM6EA8xUjxJMHl12ZkWoRgw==
X-Received: by 2002:a05:600c:4ec6:b0:408:54be:d961 with SMTP id g6-20020a05600c4ec600b0040854bed961mr2901184wmq.35.1697898675050;
        Sat, 21 Oct 2023 07:31:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:d89:b820:87f5:4b33:b582:39f3])
        by smtp.gmail.com with ESMTPSA id u3-20020a5d5143000000b003296b488961sm3793917wrt.31.2023.10.21.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 07:31:14 -0700 (PDT)
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
        Lukas Walter <lukas.walter@aceart.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Huawei Honor 5X / GR5 (2016)
Date:   Sat, 21 Oct 2023 16:30:24 +0200
Message-ID: <20231021143025.77088-1-lukas.walter@aceart.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a compatible for Huawei Honor 5X / GR5 (2016).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lukas Walter <lukas.walter@aceart.de>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7f80f48a0954..20d914b21847 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - huawei,kiwi
               - longcheer,l9100
               - samsung,a7
               - sony,kanuti-tulip
-- 
2.42.0

