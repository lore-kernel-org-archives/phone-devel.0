Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A7FC83F18
	for <phone-devel@archiver.kernel.org>; Wed, 30 Aug 2023 18:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243486AbjH3Ssj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242963AbjH3J67 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C651BB
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:58:55 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c4923195dso675929966b.2
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389534; x=1693994334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMaT33TMEcSdAqEfjzHnfiZm0MHlTu0tg8DNCHLNy/4=;
        b=HBV0EOKdS+6uEzk0jhmP4YwUyavmqI+ctdqAq583d3cTi2Q+Th15NIUXDqyct9quqa
         9DxMt2cfdeGsCNqfRmjY8t/TRlgycmD2mJVi1Af9vWfusDSZamFkPidxgLd7bbsPziwn
         dWDVoVIiSXOYCW4HAwCh8jAd67gTLXl+NR2ybhHIxQH4XKW1zkFY5PVXhXA9zjlpE+db
         kkzlt3dFT8uW4Kem2lICOB/moVgQERsQPy/7C879ou1ZGJvjF+NEWlms8zZD9f8ihiz0
         u1KK8yDsm+aXe08FZq+WPFy01p0pfpPI8G3k/7ATYDJEfpu/z2T4fU5NDEyw/QulgT/e
         2rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389534; x=1693994334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMaT33TMEcSdAqEfjzHnfiZm0MHlTu0tg8DNCHLNy/4=;
        b=dqWbTx9YBBKOKlUPGr4inOicKFIuSVojjglvRrGlogGgXiBtkZ9x4XD48EmueJrd1J
         kcnjPeC00QFbmRlX62eTQdojfswtOGCziBikseejztJVccHyXQ+rTZcWd6O+Aq6OwWoh
         REh0CtbypIs/V1enmwnWghSAM/rwli3hYznurtkJkRm6AUUH3IgvvgPv8pQ9EW4t5ogN
         mMUG/AeHtj9x36SKFvrK5jpJHonDJF8AcXs1HqOZ/RoNzpWRASWlATdkXd5AWDKlZHko
         +OIvXdwgy3FZqISDsIvBxojv7/pEUBvpoVFx5eBSqdOL3qwQ4Cy9eUo6YbYaCv3FQIqb
         9mjQ==
X-Gm-Message-State: AOJu0YyRgIsyl/4aeYJxRB9Io6O2Ar088ibe3kOAuBXXlyznx31lsdKC
        c7o+htBHKEzh8IDYkVW4gQt8Rw==
X-Google-Smtp-Source: AGHT+IEsayzgtGNMlFizdpOnfPYW6WrLF+nLZTrAoohOtQ7FLTkln95jhDk+INqp8xVX4Gj4B65n1A==
X-Received: by 2002:a17:906:20dd:b0:9a1:c89a:9260 with SMTP id c29-20020a17090620dd00b009a1c89a9260mr1229467ejc.51.1693389534562;
        Wed, 30 Aug 2023 02:58:54 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:54 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:34 +0200
Subject: [PATCH 09/11] cpufreq: Add QCM6490 to cpufreq-dt-platdev blocklist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-9-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
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
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The Qualcomm QCM6490 platform uses the qcom-cpufreq-hw driver, so add it
to the cpufreq-dt-platdev driver's blocklist.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index fb2875ce1fdd..02ec58a8603b 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -145,6 +145,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "qcom,msm8996", },
 	{ .compatible = "qcom,msm8998", },
 	{ .compatible = "qcom,qcm2290", },
+	{ .compatible = "qcom,qcm6490", },
 	{ .compatible = "qcom,qcs404", },
 	{ .compatible = "qcom,qdu1000", },
 	{ .compatible = "qcom,sa8155p" },

-- 
2.42.0

