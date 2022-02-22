Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC443C433F5
	for <phone-devel@archiver.kernel.org>; Tue, 22 Feb 2022 23:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235924AbiBVXfq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 22 Feb 2022 18:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236255AbiBVXfq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 22 Feb 2022 18:35:46 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D747131210
        for <phone-devel@vger.kernel.org>; Tue, 22 Feb 2022 15:35:18 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id w27so10170603lfa.5
        for <phone-devel@vger.kernel.org>; Tue, 22 Feb 2022 15:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Lrnzy/zn1skA5XpkqRF+xWD/aLLzRyUx1MHurTmSO4=;
        b=B1UmNjy8PFW0TBB3X4JowhPxFTZQ23xcM8WWIyzniz/PlSy265wyqdULN/xHmCij3A
         UmnLJk4t4Jr5xUkeMqgB7Wvi/ROldB8BusFfKWslX8LnwgTOzoI/dX34wdQBKWxrMH9n
         q9v4gyP8x6Kbs2z+JxaSjv2YvN1uc/PUyyBbQ8LEehErfyX5Kx089QmesbJzF4ThU87p
         2p0lAtioP6E2exzjAsAcKPjd95k4420K9Egc21mFawm/mKiK/RIVd8GAWdNUBv/b3CHn
         NOovoXh8BFVWrRKV9kPBM+jR2pYF/Nz+vqQcQDNMo83nKcCH8ykuc0ItJpIMMJFmeuaW
         Zxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Lrnzy/zn1skA5XpkqRF+xWD/aLLzRyUx1MHurTmSO4=;
        b=GrV2HYCZqGLJXpDkdjpGVz3fY9zzU8ZpMKNk0YDDGD4zVXpkXNthyACL08WVpA9Iaa
         Ou6NK+OqYxU6XVL1O+VX9NKgJgNtZRQq+T9Jsj8/BXnhdWxzSeWysg0BlrYjHv3lLBjT
         QZvlehqEBOq4RpR3Glbar350VXyFVbptE6OgO+FssfpkdRhqX5y5kvab/3BAWG9GoGtj
         QntvU4uRYQqO753eY25wETXZpCZdLfZ47tbeHGSeJDQFFZhVD6j6CkfwrAC2OauJE8Qr
         xGiEsup+VS+6ZmRsQJ0Qry2cvCym7ZjUP7E4iycHgEfkNQv2jqzGn3AsTfzvUgnxTGyl
         xppw==
X-Gm-Message-State: AOAM530BO1fs3Dg7yscdlv/UYi9C1i0E9nGxvSdooHNA/zoFgz9zaQMA
        IPla6K9L02W4+TQ5oLmEnrp9gQ==
X-Google-Smtp-Source: ABdhPJzfHCo4Fvdcf4tvykFuX5xEV4tMd6ZSTmg3SVEziVkp7q5laowaHskhmI5zwY9/EVWdu7lleQ==
X-Received: by 2002:ac2:434a:0:b0:443:e48d:50b7 with SMTP id o10-20020ac2434a000000b00443e48d50b7mr9572110lfl.45.1645572917058;
        Tue, 22 Feb 2022 15:35:17 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id r3sm1459092lfi.260.2022.02.22.15.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 15:35:16 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: ux500: Document Codina-TMO
Date:   Wed, 23 Feb 2022 00:33:12 +0100
Message-Id: <20220222233313.1774416-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This is a U8500-based phone named Samsung Galaxy Exhibit or
Samsung SGH-T599, codenamed "Codina TMO" as it was made
for T-Mobile.

Cc: phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/arm/ux500.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ux500.yaml b/Documentation/devicetree/bindings/arm/ux500.yaml
index a46193ad94e0..17accb31bca0 100644
--- a/Documentation/devicetree/bindings/arm/ux500.yaml
+++ b/Documentation/devicetree/bindings/arm/ux500.yaml
@@ -40,6 +40,11 @@ properties:
           - const: samsung,codina
           - const: st-ericsson,u8500
 
+      - description: Samsung Galaxy Exhibit (SGH-T599)
+        items:
+          - const: samsung,codina-tmo
+          - const: st-ericsson,u8500
+
       - description: Samsung Galaxy Beam (GT-I8530)
         items:
           - const: samsung,gavini
-- 
2.34.1

