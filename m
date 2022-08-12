Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA845C00140
	for <phone-devel@archiver.kernel.org>; Fri, 12 Aug 2022 08:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237428AbiHLI2L (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 Aug 2022 04:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237427AbiHLI2J (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 Aug 2022 04:28:09 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50BEA8328
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 01:28:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id uj29so857312ejc.0
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/UoqSEAsTHkqoWWs7/M5jpw98+8CpunSRLbcHfAbHAI=;
        b=U1GHKKJ6mexj4ZkoYkCxMnXrayjvvJCSL9lpj1svT4E7titpWsDYjkI0nyKvAXDpqE
         uhkxhnWXKFd6yvnULVSpGC2wZTO70BklauX03huRyXaP5iDNGBtcu57x3YrwBoOZ2qHN
         x1UMLYcvHv06KWJZ47FGcyhXw6uU+e4dMugeuNrwCVW1wSQwHf3CVwRcKeo1h0vTPnOG
         MHjspl8jKP1S4RE4rpDcUMFKhkmp9ssjuf4gtDtucZu1BN0heayJw4a4vk+aWLCFz1+q
         wzrAo2qnv2B9TH3mdmAr8oka/cM0+YlI07rQZqbhN6l+YVwLaOQe53qMVR33n7pho3Zy
         DOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/UoqSEAsTHkqoWWs7/M5jpw98+8CpunSRLbcHfAbHAI=;
        b=q2Ul2hb6aUxv80RkUxFJre14/XQ9GCn6celw4VTLbyXVKL0cXAOYhNpAr3w0jjfAU6
         8e72eW6zhfKRakGgeDJmallJJZTtLwovjUATC7TUQvg4jXFSVrSF54nyQsvoScis1Zco
         9ZbbDWRSLGQH5WC6l5rRxyYgIjNRLXk1xu/8yEY5ACA9uLpTpUJbEd7gwsSaZOH+H49R
         hR4mUEWIEdgPnjkZR6ud2NwLgDdNRKw287J24A7Jo7I8nViepWWW8dLFfznyJY54TGvr
         QZyISIPm3BtrNCTAu6ZLkEd2XW6Lc8T0s9qT1D1oKzeMmJtOniuBaIX2H5xDjJ2qFTKb
         VZzA==
X-Gm-Message-State: ACgBeo0/COrhzbh30eZtiLdP5x8QsBL4Jj5y68or0Gp6dRpxncHvfoYg
        EroZe1FpiOXD0mOWR99z73WxxQ==
X-Google-Smtp-Source: AA6agR4FXQQ4aqaIoLj1wXTkm1i8iEZPWyRrMq3qFrqX0RpW955wp6U4Qr94op3EwFQSIYy6fLHz/A==
X-Received: by 2002:a17:907:2707:b0:730:af0b:3572 with SMTP id w7-20020a170907270700b00730af0b3572mr1896043ejk.411.1660292882373;
        Fri, 12 Aug 2022 01:28:02 -0700 (PDT)
Received: from otso.arnhem.chello.nl (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y6-20020a056402134600b0043cf1c6bb10sm971326edw.25.2022.08.12.01.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:28:02 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: dmaengine: qcom: gpi: add compatible for SM6350
Date:   Fri, 12 Aug 2022 10:27:19 +0200
Message-Id: <20220812082721.1125759-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812082721.1125759-1-luca.weiss@fairphone.com>
References: <20220812082721.1125759-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible for GPI DMA controller on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 7d2fc4eb5530..eabf8a76d3a0 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - qcom,sc7280-gpi-dma
       - qcom,sdm845-gpi-dma
+      - qcom,sm6350-gpi-dma
       - qcom,sm8150-gpi-dma
       - qcom,sm8250-gpi-dma
       - qcom,sm8350-gpi-dma
-- 
2.37.1

