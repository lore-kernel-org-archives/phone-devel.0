Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A0CC83F17
	for <phone-devel@archiver.kernel.org>; Wed, 30 Aug 2023 18:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242930AbjH3SsV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242946AbjH3J64 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:56 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8297BCE0
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:58:53 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52a4737a08fso6828067a12.3
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389532; x=1693994332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNs6j3Ggs2JWRbc5ZnKbQBXSzYL49uka3JdqYW+Ab2M=;
        b=SPtsM+1X/Bj7RGHNV3Z7c9pzhdLQobQ32YhJ0DXAZDGab88dcYHhzrDvNQulKV4vi7
         N8yJimOKI0VdToc358sFAOeH6uS7tj7IkCMzR2zBa9Li8mq8ecEIppINgfF6z6SCdQ3l
         Xc+XSqkP5h1XU8yihi7NFSRNj92fMC91BbxYJ4fqDiDptzvrzsOdGprQjqKmXDV93kyL
         jqiHgRirFvyxe4Lffw65gyzQRBLTzf5XTrz38xpvjRrq7JqF48noIzCjfvpVAnwh/cES
         FRBDMK0/tKBo4ensZXRxuPppjEpczyJbXGkrToN43PdUhif9U6mU5cBFemi6nhabxHaS
         cjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389532; x=1693994332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNs6j3Ggs2JWRbc5ZnKbQBXSzYL49uka3JdqYW+Ab2M=;
        b=RlV4+sr6cxnTK3fP0kEIAlN3I8X4PmhDgqA4wgNOJyAlU04ZlExz52jO7JsyaS3rO4
         9vK3Wgqk6yKh+6/mE8ZOVd/ft4lCEBsfmlI8Drsh/Hc/EcviHrlOaY7E5E9Z5hJNLBQ0
         FBNh42jesVQTqH2RnWWUC/KPt7SWZJnIjYSYF0mUtUl7z9uszrCdbdDr2AceOJLZ0cJ1
         77wdcKWkfaiT1eopcAFjTwwqaabaPNOszyo153jO8qx97393dyH4Z3gJ7394M5Lh5jBk
         QuBzJUGFpm9HNkoMhfAEKBU+Dyzm3eRVmU59L9lvmzXVCwKNkoTmZrKOvFnCHVfuSlTO
         /8Wg==
X-Gm-Message-State: AOJu0YwMB8Z9QHEjFuNbmxQQcQ53g8uMDaqdgdzFl+m311Fjg0ZfsyJA
        BvEfniqJcuvXEvi7L2cLiC1t2Q==
X-Google-Smtp-Source: AGHT+IGOpJWT1BIO52CgEaoaxvd+0F80/V3wR3R9uefOOSQL+y96/QoEafSts3Kl97HWgTVhtP3qTA==
X-Received: by 2002:a17:906:8b:b0:9a5:a0c6:9e8e with SMTP id 11-20020a170906008b00b009a5a0c69e8emr1614064ejc.31.1693389531990;
        Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:32 +0200
Subject: [PATCH 07/11] dt-bindings: arm: qcom,ids: Add SoC ID for QCM6490
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-7-5a954519bbad@fairphone.com>
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

Add the ID for the Qualcomm QCM6490 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index be12e1dd1f38..b6aafb988e08 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -233,6 +233,7 @@
 #define QCOM_ID_SM8450_3		482
 #define QCOM_ID_SC7280			487
 #define QCOM_ID_SC7180P			495
+#define QCOM_ID_QCM6490			497
 #define QCOM_ID_IPQ5000			503
 #define QCOM_ID_IPQ0509			504
 #define QCOM_ID_IPQ0518			505

-- 
2.42.0

