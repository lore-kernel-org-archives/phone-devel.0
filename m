Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7EFC41513
	for <phone-devel@archiver.kernel.org>; Fri, 13 Oct 2023 08:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjJMIKU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Oct 2023 04:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjJMIKT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Oct 2023 04:10:19 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1829DC
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 01:10:15 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9a6190af24aso301611966b.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697184614; x=1697789414; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpzwZ+RNeBqt/RBUQJuOWXGZTsvoBXF446IDuijvCXI=;
        b=kJ9EkaoogYB8jyX6l1iFyAJ3s7hSB02WpYBbOOVQodugp1bR8SG1UF51YbKsnJvX7b
         DxcGX0qjJBxYr1s5M2tB50SFxwAso4qUntOoQ4/27Qs8Gjqq6346K/VhrPTR9SB3jzsB
         qFASt53uqQZJPw4GUjVDwYUU5U0OIkUeMHZz3OSj/C02vDesb/TDcJ7Z7wJaaCinTOAe
         DfX8tf2ff/GTDiTMrAdO2eBazQ0D1ovW2LBZds9d+fTV0Z9zm7AQc6CuRFJDQbmtwxFv
         IBtYDfNCzZfEsICROYZ2YW9Mg+8psjR5hn7I8UUgZShJImyA1OS4wehql9Te77ttTBGL
         kAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697184614; x=1697789414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpzwZ+RNeBqt/RBUQJuOWXGZTsvoBXF446IDuijvCXI=;
        b=mTGSuJQqD8y4fT22q7D4F0xBPmsmGDJaFY/YisBbEqcXE7slOZiZhS0BltoHipArRT
         Atrb1DyZ/SwPwZw5zgW9ZJNyjujq8UiuwAPRcAEsppDiMwK2rZKXA+JVekqGyIzcJwHg
         oseIMSQjblHwkZzQLRom1W5nkow8A8asDPZ0vwm7x/uGirij3DBxzJj3XKnbrmHVbOQm
         NohyqFyRySIX6xU8a70E1WwzATip66yX1ZWlzpDeNa6Zt3tTWG5vBhfOH/+EbjWpP47W
         ggve08u6fIRCJD5y4vkq8xgNzFkrDpzeITYXXZJCJj/jgafJ5r1R7ttOyONJ3kLcghqu
         4GnQ==
X-Gm-Message-State: AOJu0Yy+armKboVRlvLs0mRJ3jkfdOfvdifhZKbV+ENixTS/JIexnwTr
        j9rYXOpSp7jcooOrva3JqGPKoYNETBF2oNBsACDs9w==
X-Google-Smtp-Source: AGHT+IElyBa/M08l1OcsNaeLT3o4FcMgzP19oxx4R3SJSqBBmUcsZEoHvdxs+bocsEUyU4kW0WXBxA==
X-Received: by 2002:a17:906:311b:b0:9b0:169b:eedf with SMTP id 27-20020a170906311b00b009b0169beedfmr24945565ejx.7.1697184613862;
        Fri, 13 Oct 2023 01:10:13 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q14-20020a170906360e00b009a5f1d1564dsm11910761ejb.126.2023.10.13.01.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:10:13 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add Fairphone 5 thermals (PMK7325, PM7250B, PM7325)
Date:   Fri, 13 Oct 2023 10:09:52 +0200
Message-Id: <20231013-fp5-thermals-v1-0-f14df01922e6@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFD7KGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA0Nj3bQCU92SjNSi3MScYl2jJGNDi2QLU8uUFBMloJaCotS0zAqwcdG
 xtbUA2B40Pl4AAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Configure the necessary components to register some thermal zones in
Linux for the different thermistors found on the Fairphone 5.

The names for the thermal zones and ADCs were taken from the downstream
kernel but double checked against hardware schematics.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      iio: adc: Add PM7325 PMIC7 ADC bindings
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PM7250B thermals
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PMK7325 thermals
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PM7325 thermals

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 221 +++++++++++++++++++++
 include/dt-bindings/iio/qcom,spmi-adc7-pm7325.h    |  69 +++++++
 2 files changed, 290 insertions(+)
---
base-commit: 7c0d0c1272e82888aa01017818d00245d452b895
change-id: 20231013-fp5-thermals-2b318c859dd4

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

