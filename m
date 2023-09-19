Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B7DCD5BB6
	for <phone-devel@archiver.kernel.org>; Tue, 19 Sep 2023 12:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbjISMqV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Sep 2023 08:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbjISMqS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Sep 2023 08:46:18 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F577138
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 05:46:09 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso6953227a12.0
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695127567; x=1695732367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Aj8Gv+tiuDZcymBcA5+44sWc7PVlwPM61yOxENISt0=;
        b=QFvoPxcWxC4AInGhfcpr3jXInoOj9Z8yuVESonyQSvAbur0SuwG5HFwW76b4iXh/nI
         EXqmpYPJ1UTGea6KjCCI065YeUv16qJ+DaZN9WI8s0o/jbIyCYACmt1Vz67dQZBGPBA9
         fj0Vl22RISTwWkXiVJ878qa5QwcYbM+89JT48dSFQCex9ySu6NPEbUnomgzxJAJSJ9I9
         w59DtG7xU10sc6do+Mx+9bMyMFCQzklR27rcpi40qQ+KhgIExicJergjAxj13KP80tJi
         lNM1h8Zcc57ZmYq1oyktGTpRinf1Ay2niJpkS8FOVbWqDBRpHwgRwqr6k0XrLDBrs4Df
         m8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127567; x=1695732367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Aj8Gv+tiuDZcymBcA5+44sWc7PVlwPM61yOxENISt0=;
        b=evjkGUaeISWT//n27R9P2HvDOZfzFAevZpd4cAIPekOYydh1ZMy/KEf34dKSkY9lDs
         t256ZeLxFU2y6B/SYdl8Jd5AI6k+oAEKESyveyIwMesYzlppJ8sXQSSMXvj1aJM7sE7q
         PWI4G7ogYLxqIxOBnRTsC+1apo6Mv2KyjrNMbE3stORdNz7UHwn3ZcOM38HXvHk/QS1F
         w/4kw2YawKndKr2h6bLIdVfyT9WMYhXtGgaFLnSy+aoFFO6p4WZ0oCjxdmQNZe3GkXUR
         TyZu72uYdzGHHjvqLDtwluT8k0M/t8jX9KX3Z9qeITjp8e954NnrbmK0HEiR6EkG/K7z
         x10Q==
X-Gm-Message-State: AOJu0YyFtIIo2TSSkWnmaTImBomm6DT30nYGtR7LbHy1BlXi8QXlGrqy
        4tG/mtFdom1JGjjjdJKpVr1sTw==
X-Google-Smtp-Source: AGHT+IHY4XkH3n3f08uxPsLLePpLe5k2m9wL4+D7Lpa4GDsuvM4bqhqKckSMAs66C27gXJW0c+//AQ==
X-Received: by 2002:aa7:d954:0:b0:526:9c4:bc06 with SMTP id l20-20020aa7d954000000b0052609c4bc06mr9723390eds.18.1695127567821;
        Tue, 19 Sep 2023 05:46:07 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id dn22-20020a05640222f600b00532c1dfe8ecsm635878edb.66.2023.09.19.05.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:46:07 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 19 Sep 2023 14:45:59 +0200
Subject: [PATCH v2 5/7] dt-bindings: pinctrl: qcom,sc7280: Allow
 gpio-reserved-ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230919-fp5-initial-v2-5-14bb7cedadf5@fairphone.com>
References: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
In-Reply-To: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Allow the gpio-reserved-ranges property on SC7280 TLMM.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 368d44ff5468..c8735ab97e40 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -41,6 +41,10 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 88
+
   gpio-line-names:
     maxItems: 175
 

-- 
2.42.0

