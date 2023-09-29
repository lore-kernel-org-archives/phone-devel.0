Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82724E743F2
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 08:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbjI2IBN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 04:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjI2IBM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 04:01:12 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA511AE
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:01:09 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-533f193fc8dso12936389a12.2
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695974467; x=1696579267; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3LpdYfllnzk+eL7xy8/BzP6mgFCymyy/bqU+HI0uTEs=;
        b=DYibaKNTuzhI3DaWppNe87iHmzawQbHMDzwPSB8yMWo/HJyzuizLS5/u9txgC2X0qf
         d2YDLd/mGKeCjpo9j8A4bhw6T0eYu8XjvSQMNHuY5+heLiFRxtiuiKafO/UoaQdixNnB
         ++IIwTCFL5K5L0cJ+zN8wDLfko91B8qlwGctymyqM+4HaqVv0xDb1TE7kEM/3miQYPrw
         HmRNtLEHaIrgrq7Ag+BPvJwgL6J7Kux4gLPYoH5RvE9Srt3JjjKNVx4CHbQK2TPQ0m1P
         uzCGZ1V5S1Dk3YSRLkD5WSu5l5ZXhe+vpQpOQqdOtdnYtAQg2LmeQfk2EhV1kvQIHBcY
         hemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695974467; x=1696579267;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LpdYfllnzk+eL7xy8/BzP6mgFCymyy/bqU+HI0uTEs=;
        b=UNkQ7njFjIpTe6IdKunuNCWJAT9RV9I0q9QgeswtLC3TU4/lOeKK/KAmzR+XgZUvbe
         Oof7TET9WR7xhabWvoZGY7dpPFBfwGbTWKv/Ea99UQJWDnRpqY2VkbDQ5mLrJGvaAU1j
         kuJXJ6ld5x+Gat7deiEdFdukZijfm/+1SDPyp7xI1VYKxu4ClIXNpXWSFRRr15ldIcSk
         mjwAkFySQcfR0GHzJ5HlmGv8mRsa9S5AJ9yw8CNDarQUf+afWor2/wgviNzWgi5KTOpW
         kXlAzw/Z7U7flOdOS3K0sIWWI+v11OL7a7hVreZwzTVz0GYTyb65uIPk2uJuqDS5TFGS
         VDHQ==
X-Gm-Message-State: AOJu0YzUKs3V0Qy0iL/go0myr4d/oRIFXk+vm6hIor6iyZxh8A3FZ5VM
        s7Jbf+ebSYxRiTrMdR3TZCLcM/Q2w2rDD8Cqedac4KqA
X-Google-Smtp-Source: AGHT+IGFZ/5xxIudkRrtkvptEGoNA89AtAFlEqkjdKJowNCAVNzpC6iHSsAYaP3o5stnPODfbs2fPA==
X-Received: by 2002:aa7:d58d:0:b0:522:2d1b:5a38 with SMTP id r13-20020aa7d58d000000b005222d1b5a38mr3304809edq.10.1695974467458;
        Fri, 29 Sep 2023 01:01:07 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j6-20020aa7ca46000000b0052889d090bfsm10825040edt.79.2023.09.29.01.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:01:07 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add CCI support for SC7280
Date:   Fri, 29 Sep 2023 10:01:04 +0200
Message-Id: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAECEFmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDSyNL3eJkcyMLA93k5ExdEzNLg9Q0i5REQwNzJaCGgqLUtMwKsGHRsbW
 1AEZyCoNcAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the dts nodes for the camera control interface found on the SC7280
SoC. And then enable the CCI nodes in the Fairphone 5 dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: i2c: qcom-cci: Document SC7280 compatible
      arm64: dts: qcom: sc7280: Add Camera Control Interface busses
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI busses

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  20 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 136 +++++++++++++++++++++
 3 files changed, 157 insertions(+)
---
base-commit: c858197a69efe69e1607f4854af42ec338e54e96
change-id: 20230929-sc7280-cci-4690ef8da107

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

