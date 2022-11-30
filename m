Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E0CC4321E
	for <phone-devel@archiver.kernel.org>; Wed, 30 Nov 2022 08:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbiK3IPL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Nov 2022 03:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbiK3IPK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Nov 2022 03:15:10 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC124FFB8
        for <phone-devel@vger.kernel.org>; Wed, 30 Nov 2022 00:15:08 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id l11so22989123edb.4
        for <phone-devel@vger.kernel.org>; Wed, 30 Nov 2022 00:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7I8QL/Ha6XNxxvmNTzLyv0oQRFX98817UR5iIbDrCVQ=;
        b=kS+qJIq6r6/vc7eM30tkz54Wl55Mxc4lv9TYRmobJOkFt6bNF+mGS+FJ3ADfLhPF7/
         ik4Nx5pCBc7+RUnPPbKUs4GNvEMChCnidsydxLn2vpBBcYp5Hz9DmHzH5i41is21ThLe
         WJVSnZO+bKsEo698Qc9K89iJI4hNLUSUVHNbQn6vz7K0X6Bm7TzJat093gF64Unc2qo1
         tG9qKKGN7bQcQITRknikMkJ68UUME/wf2oz9ah0UkaTwCyGDAzFYgFVFYIRgMUo/U6no
         ZNqOB3apAZ7Jr/0n6sHlIzBCBzJRNWvuLsZbUmnoNM5sn/8DZGvwNCe000o0JbG+Ms9z
         86eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7I8QL/Ha6XNxxvmNTzLyv0oQRFX98817UR5iIbDrCVQ=;
        b=qQObZT3ZhAJIYQ9pVpt9qNGwk7+Zvzfv1rPGGbZsjS9W32gNReCPu8xX7FMV64jWWs
         I3SfdXRM71zwMNnkYJxmYPqI37ozw+lJjc3x0tbY7Cc9W0P/mP8iJ7f63kHC3zeTaMqd
         gtaAS/sR8ahYCQ/7xgGw+E8Yq31/uE9OfaaQVE+6VBYZLaaVt4wLKG3rMOLmJpXhmcNB
         TepYSz6dj8NKf+k5sYBrVeXwXmaJnezrC/+yjOKcvebBrQzGSv7mGiJ5tKPjgE8cdFS5
         6V30QHT8Xb4ZQhc8aG40ov2CPQA5+iMjZFDqLUfh7724PyoAAonZ/gAplv136GEEdyxo
         kQ8w==
X-Gm-Message-State: ANoB5pmejXg8R1qXS5jQDysUcJv77WFirRWgQYCO/bhtPIwknp4nXYvJ
        WndXUcy645HWkCo6qdlcPZy7Bg==
X-Google-Smtp-Source: AA0mqf6ekZ3WI2ZeOyGg4/cQcagTfR7iRVKn6AvHqe4HxRolvXty3ci2rlrW2ysTZbYBzBtDdj7zyQ==
X-Received: by 2002:aa7:dc19:0:b0:461:f94:913 with SMTP id b25-20020aa7dc19000000b004610f940913mr39800501edu.102.1669796106723;
        Wed, 30 Nov 2022 00:15:06 -0800 (PST)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jw11-20020a17090776ab00b0074134543f82sm358285ejc.90.2022.11.30.00.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 00:15:06 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add sm6350 compatible
Date:   Wed, 30 Nov 2022 09:14:27 +0100
Message-Id: <20221130081430.67831-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the compatible describing the combo phy found on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes since v2:
* Drop misc schema changes again since same schema applies to sm6350

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 6f31693d9868..0764cd977e76 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,sc8280xp-qmp-usb43dp-phy
+      - qcom,sm6350-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
-- 
2.38.1

