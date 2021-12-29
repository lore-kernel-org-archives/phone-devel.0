Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79CCC43217
	for <phone-devel@archiver.kernel.org>; Wed, 29 Dec 2021 17:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241006AbhL2REd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 29 Dec 2021 12:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237593AbhL2REc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 29 Dec 2021 12:04:32 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A89C061401
        for <phone-devel@vger.kernel.org>; Wed, 29 Dec 2021 09:04:32 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id m21so89772233edc.0
        for <phone-devel@vger.kernel.org>; Wed, 29 Dec 2021 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96HJkI6wY3qB+mvO2ST+cjDYlFymmYG8L//fUQrj/Jo=;
        b=N176GTGT9uTNBM/lNHY3viroE2j7RNyzIAGjMDuxaY+V0D1fgSqOgdkj7epPgiTGPt
         JWs++rwSKtKOm00NQTTSStWwOJAStrOxAXAt31ULVJ2KERgnhgR6pvu0ofJFWHOL6N/N
         gvr3SgzulkVNvRJqBhZzf/7YojmoO3mNH9a7R3l+a8wI9KrZ1dEIgJqJAwb30a8rUpdF
         EpGRJhVSJBas722q8AlK2fVsJHVnE77VwOG1RrcE/pXZm1zV2Fa8/fxGVRDDpVrVz0sn
         oDd+5LJnq3SQELHBtEqC8W6AivL8O+5qMg8275X6Lb02g/2IBnn5DoF/JKj1k7nj1cmk
         kGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96HJkI6wY3qB+mvO2ST+cjDYlFymmYG8L//fUQrj/Jo=;
        b=v0e26AeY7POSXyWsopal464xcuDzmt2uYuaITmthulFk9bzMe2zCi9husarV+gzLvV
         4QskLwcw9vksSfdxne4Z5sFWSHQUuOuaFp/bnYl5K4YpvgeY/vUZue9zVKzo30aI5hVj
         2Vzl+fUNmOG8Z1hByNnW3J9/H1RwS+64P/cRAWO1K3/CSEaBQzhRYTNlwN65Oj3OusSc
         yHmoffB9CKJbQ130uXi4n7Q+1NN779z2/whg/6WRUIYIiGa+HYevrCjyWvVcthu2M0yv
         o/sweDBww669QOeQvi+m5M9fBRrzhqxAVUQldZQ+SNN+3RmM+kOhk1o+q0kw9XB4IlOh
         cjYw==
X-Gm-Message-State: AOAM5332QD9IuneL1cLtYF9i02QaMTjT+iTrdg5WH1aHRp6mCAq+auSP
        bQeewllyDqRjVPJUjuVYCEbktA==
X-Google-Smtp-Source: ABdhPJx7fmCGVyYTONde3Afz2YEg3Ytza6u1AKO88xPsobuwvKKB+blwvg5emdFPJYP//+ZNe1xong==
X-Received: by 2002:a17:906:5603:: with SMTP id f3mr21611529ejq.272.1640797470828;
        Wed, 29 Dec 2021 09:04:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 09:04:30 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: backlight: qcom-wled: Add PM6150L compatible
Date:   Wed, 29 Dec 2021 18:03:55 +0100
Message-Id: <20211229170358.2457006-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229170358.2457006-1-luca.weiss@fairphone.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible for the wled block found in PM6150L.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index d839e75d9788..1c24b333c6e2 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,pmi8994-wled
       - qcom,pmi8998-wled
       - qcom,pm660l-wled
+      - qcom,pm6150l-wled
       - qcom,pm8150l-wled
 
   reg:
-- 
2.34.1

