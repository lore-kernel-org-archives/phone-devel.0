Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E47C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 13 Dec 2021 08:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhLMI13 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Dec 2021 03:27:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbhLMI1V (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Dec 2021 03:27:21 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319BCC0617A1
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:27:19 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id l25so49771208eda.11
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V+6dBa0dpNiAQwBua/Vm565hJ98yro3E+rDoSxhzfnY=;
        b=lTwIXlkDnyymIXPmnEgC/IaaolT+Iv2oiXW9XoVoG0OH8QD9MF97aPfEUbilbu2/r7
         u299Wl6c/1wfuJttjTyGyeFtKhbYRWOsulOptrG+d/OpVVvIUInvv9R+PP4P91Q2Z4WG
         0oh256cbj9wwM/F4L3AGUgJFxJatW8eKIpVgLaybiV1pJOA3Y/0t1IkpiltdGUIe7wN1
         xp0V8wDNpkIXNimCNoQY7VeJodR8GaXJgK8PbCyaNoZLqKf0N5UbTuE11CPLpXDWq79l
         WWwBOk8oQSe+ndLg9BYeUrzcOGAC2Ndd2y20nBY0q1GxyU0Up/KfityPdbX5BpPfgeTQ
         V59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V+6dBa0dpNiAQwBua/Vm565hJ98yro3E+rDoSxhzfnY=;
        b=4QlIHeDsG+1laZuV0oJybCR8Bw3+SW1Gk4xjcellMYRpFW2jBbc3+VkIOODZOOitnh
         Ms1Up77WA6cxFZo9ySTcsDfuR4fAzY59rl2kk9cKFCDq3aAKabqnABWhWT3DogOhza3D
         1jKmHaXFzlr9cL8awO9Q3txhUqClCWUr6r/j++E3RCBYyhaLK2krlV/EV9cRXpzIFsT/
         npMuFyzP7daFya5L2CtL5pZA5hRbAKyyP/Wi0H+dPjsYah89xkP8gQ3X7xTbBuw6abtr
         z4CA75ShRIceaRXae9IBBfnhNz1Y4NjB7B3KmvBbBhQj4kUs3Syuo+WOjS3MvCt/LZwH
         z+Aw==
X-Gm-Message-State: AOAM531hZcbPdU8BVEMZmbkng1RaX66w1ItTB5ZNOYkrwArF/ZOuT9c7
        wzicrDJdRN8hKcAYnWzH7wKfEQ==
X-Google-Smtp-Source: ABdhPJwVXB+mq+ZXbgybllyImpIV7Dlkqt4dop/0/+ZeKlyxBj1li9xcYHbotGeBCDYeBklsH6KgXQ==
X-Received: by 2002:a17:907:608b:: with SMTP id ht11mr41425453ejc.479.1639384037784;
        Mon, 13 Dec 2021 00:27:17 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:27:17 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] dt-bindings: watchdog: Add SM6350 and SM8250 compatible
Date:   Mon, 13 Dec 2021 09:26:08 +0100
Message-Id: <20211213082614.22651-8-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add devicetree compatible for the watchdog on SM6350 and SM8250 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index ba60bdf1fecc..16c6f82a13ca 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -20,7 +20,9 @@ properties:
       - qcom,apss-wdt-sc7280
       - qcom,apss-wdt-sdm845
       - qcom,apss-wdt-sdx55
+      - qcom,apss-wdt-sm6350
       - qcom,apss-wdt-sm8150
+      - qcom,apss-wdt-sm8250
       - qcom,kpss-timer
       - qcom,kpss-wdt
       - qcom,kpss-wdt-apq8064
-- 
2.34.1

