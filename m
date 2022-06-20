Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EFAC433EF
	for <phone-devel@archiver.kernel.org>; Mon, 20 Jun 2022 17:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244553AbiFTRzs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244557AbiFTRzr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 20 Jun 2022 13:55:47 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E041AF12
        for <phone-devel@vger.kernel.org>; Mon, 20 Jun 2022 10:55:46 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id lw20so264044ejb.4
        for <phone-devel@vger.kernel.org>; Mon, 20 Jun 2022 10:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=resent-from:resent-to:resent-date:resent-message-id:from:to:cc
         :subject:date:message-id:mime-version:content-transfer-encoding;
        bh=vGTTZHlQr24mk7rw2kpSOCNl9rG0rfShjLY5RzkauRM=;
        b=o0ZaSwrLE07b4UO2i8CO+c33wXgmXzY/TQ8StWoSOpfiLZaxVGSIhw2BnvyZZfir74
         hQjVLEKp3tdWm5jeWg4OjPEoS5At8oJgvoMgKmmFF7O+LiJ94eqjtZ0ZHIBS3GHMrCCz
         S/9kTE3WLHH78Jcm93uHyKZ92iNywrmIUB2G4W+rgnx3fkPuudX5lK0sFA5PDj8GJavd
         fbin2N4xjUKamVqXFFNED2SX/PEPgOSQD9MWRBStEPUdgLwUXxGyrGnExZH83zPFopho
         bh/B568XsxfvYzlP3iKmJj4vcr34T/MQz7T3yHME2kz3aZa4tSLVgy3hgzI4q4zS67EQ
         tvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGTTZHlQr24mk7rw2kpSOCNl9rG0rfShjLY5RzkauRM=;
        b=jLssGIWPGzwVFI7QLPONbPVrQ0jumAdluKLbHuV0E3kGxAiZNbnnxhgWPel+t31fUv
         UB0wf8S4+7vJItCvn6TtypAhy+WK+2F5GoUB4fSXMGj2fVgj4+U9LxifrwPWOoLBZqXF
         opTU3Hb20rikfusY+Z93qg04RgctAUDeCY6qIhVYrR/Vrd3qt3wBu9t1xM/OB1TxrXVm
         ozTLZeSa1hQ6esfqtvE/vzBklqVJw/0tV6B0mczOtyGnok7oSHY0vZD52gz35jrj8y8p
         fH4JDHEzhX2h6vNL0a6dWaZzHJLyPwvS88TalBnjMQOTZ2Yzf1Ogo5li3lH+MIYJaur+
         Jaog==
X-Gm-Message-State: AJIora9s+wu/E13UfxZF3xLOJh97aaIUIXSCUABomp6KeZJaI0xbWNxg
        DKJEmLCe+sT5SNWgbU9PXR8skWnmWydO2g==
X-Google-Smtp-Source: AGRyM1sK3B2ZHYfrzZYOwORhdf7qDpoYc5+64Ko+jp216LJ9jphLilUu8NbMVWMojyq2vWtWYNwZ6Q==
X-Received: by 2002:a17:907:1c18:b0:711:c83b:8a14 with SMTP id nc24-20020a1709071c1800b00711c83b8a14mr21231661ejc.379.1655747744709;
        Mon, 20 Jun 2022 10:55:44 -0700 (PDT)
Received: from [192.168.0.211] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w13-20020a056402268d00b004359202969esm368782edd.4.2022.06.20.10.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 10:55:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] leds/arm: dts: leds on Samsung Galaxy S3
Date:   Mon, 20 Jun 2022 19:50:30 +0200
Message-Id: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

Merging
=======
1. Bindings patch: via leds tree.
2. DTS patches: I will take them via Samsung SoC tree.

Changes since v1
================
1. Drop the label from example and DTS, per discussions with Jacek.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  dt-bindings: leds: skyworks,aat1290: convert to dtschema
  ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy
    S3
  ARM: dts: exynos: add function and color to aat1290 flash LED node in
    Galaxy S3

 .../devicetree/bindings/leds/leds-aat1290.txt | 77 ---------------
 .../bindings/leds/skyworks,aat1290.yaml       | 95 +++++++++++++++++++
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |  6 +-
 3 files changed, 99 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-aat1290.txt
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml

-- 
2.34.1

