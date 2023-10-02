Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B07E7849A
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 07:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbjJBHAW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235596AbjJBHAV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 03:00:21 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78E6BD
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 00:00:18 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-533c8f8f91dso18356432a12.0
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 00:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696230017; x=1696834817; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4mI7wPjfIFJjRgS4m9j0vBzf0bhNyvH1PWkrNn+YUw=;
        b=KNhAsxmL87TmGWjswS8Q41/DmigVAE4iZak/ipzI/ysf6WxNXOLgZ0txZLG9x6Mke+
         SjvQMv3FjAsZGfWP5J4L6bZyHHJSlhsdELtr2OcEaJUbi8+fyCHDZD7v/t2vOHH4Qlm6
         tQLWabA7cOcYK/sSz69VcHWkh+GkignjqbuyIhp+ZwXscx+iGEomGn68DYqIV9Mp/7N7
         vYZSXrzEqGyERtvdZIZgsipgSMV0Q1Fkez5q9hD48xJbrMuf0Gjzk5XprmzhrtuBLjs3
         HHHh+Rf72qoV3Vl1duKMhnoStvYCU3RGL/+vdFAr9TC5uFOG27NMxutOqhQoN0AgySsc
         AqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230017; x=1696834817;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4mI7wPjfIFJjRgS4m9j0vBzf0bhNyvH1PWkrNn+YUw=;
        b=U3f7ONasy46F785ZyBwLWC2IGsLnsSyBvWzoGV9TBL691EoNO6YguD6bX3VoJf5gDt
         Y7ghsmtcS6ijut7n1230jhL8BnI11pNmeo+6jE0uciPRDHi0pNeMozXPdh7lJTo2EMxK
         u104tQ7xmdXNjRERU6fzgAnCvNNHLBW2nOAmM6e2zQBiD8Iuzyyq1nWlSePEC6cL6+m3
         iCKRZP6noKFCJvRfvpEmofOwb8wYLG/buUVpT2bRTmRWu4/aXUS6SYEjB9YpUU5NQevQ
         aStb0CqImTrbUHMsXoffEK4mO+JPOhF0X/ngUppzVUJuA9LyRsRZ/F0NT2lGc4h6RdBm
         0g9g==
X-Gm-Message-State: AOJu0YxLpKjImfHzf6JNn6Kqe1gWVMr6y1synYzSRBvbHNP4T2fmvztE
        DEPFhrRzY3mg8ZwQV+SdOMxIFw==
X-Google-Smtp-Source: AGHT+IGHstSSOjwQORJoy/Ro5XBc08vqCnp7VSvvKVm9VrTRh96OXqE6aYHnx6tEAm9+uPnY2S3fOA==
X-Received: by 2002:a17:906:3116:b0:9a2:16e2:353 with SMTP id 22-20020a170906311600b009a216e20353mr9427422ejx.6.1696230017331;
        Mon, 02 Oct 2023 00:00:17 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b0098ce63e36e9sm16692013ejj.16.2023.10.02.00.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:00:17 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Small updates / fixups for PMIC spmi-gpio
Date:   Mon, 02 Oct 2023 09:00:10 +0200
Message-Id: <20231002-pm7250b-gpio-fixup-v2-0-debb8b599989@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHpqGmUC/32NOw6DMBBEr4K2zkbGmPCpco+IAswabwG27MRKh
 Lh7HA6Q8s1o3uwQKTBF6IsdAiWO7LYM8lKAtuO2EPKcGaSQlehkh35tZC0mXDw7NPx+eTRKNER
 dq2Q9Qh76QLk4pY8hs+X4dOFzfqTyl/7VpRIFkrm1tap0OVfT3YwcvHUbXbVbYTiO4wvnuraNu
 AAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Update the schema to use plural _gpios label in the example. And fix a
dtbs_check warning in pm7250b.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Remove labels instead of updating them in documentation patch
- Link to v1: https://lore.kernel.org/r/20230929-pm7250b-gpio-fixup-v1-0-ef68543c1d3b@fairphone.com

---
Luca Weiss (2):
      dt-bindings: mfd: qcom,spmi-pmic: Drop unused labels from examples
      arm64: dts: qcom: pm7250b: Use correct node name for gpios

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi                     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-pm7250b-gpio-fixup-f407ee98425a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

