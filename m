Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA73C43217
	for <phone-devel@archiver.kernel.org>; Mon, 21 Nov 2022 07:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbiKUHyg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Nov 2022 02:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiKUHyT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Nov 2022 02:54:19 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5126B9DA
        for <phone-devel@vger.kernel.org>; Sun, 20 Nov 2022 23:54:06 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vv4so17266214ejc.2
        for <phone-devel@vger.kernel.org>; Sun, 20 Nov 2022 23:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GT9ErDbClBtlo66hqT2klzySCTqQIgR/TIVfNl1Gg+Y=;
        b=O8QBYlAGTTApUL6TLXRC+RdaXgjr6tjZq/PDzzK6ry8Y4u+YJOmeMB5Bn7NTt1qSBi
         Fukr5kVtdZ4oP8jT3o5Y4ig2M23vgoSWxqsEKX17jKqWA1nakj+jDvHCYj3zVMtgXt4L
         6w3BeLQUjC/HSQg6TnRYqaWM1WO8NI8d0YViYJ+vy0UvKzyKtMySsWpp99tt08PwS7Vh
         0/xED8W60TuQkxU12/G2BNND3IPn28OjtYxeXPDUHtbs4zYNN81rhzun5rLMy8kSU1GK
         QygY7zjiZdOTBVHWAttgYDOf2YlF1/SdqxTmuvWrr2LRwf4fhLC8LAIsuE8j8fh1D7Fu
         RzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT9ErDbClBtlo66hqT2klzySCTqQIgR/TIVfNl1Gg+Y=;
        b=I4yWJZBCv2sETnIgKpsDDpZnN6W4riKlo0+k1ZaCZKR2zCZpGczf2e2es2Rskhvbrc
         Tjf7ezSRy09ZsPNn+BSIMlgwcFJx9KQx43XRVMpQbiUZBhaCsEdBPRJbqHuymbBQ9Oge
         sh9MeofFZmOzjJZz+W73P8Iv62DoEjoi/AoJFgGSESCLF68RaLO2OX8XPxeUrSy9F4xd
         ibXwIhhNGWDmYckwq8wzOwHJSCYLiox7M/RrDuBhHaig7KUver+lvp2SWPXrifrxvu+W
         Pfk1WVCDGae8c1zF02VVaXyaqhjgFo4pfIUHak1oE9YN9W8H+x++bMuE+NxLxzdnBRT6
         MS/Q==
X-Gm-Message-State: ANoB5pn2EYeyK63DXgkS5rnXm2qG/n0dLVu+wzEXWnscBzvHz/gMclkM
        9/9L+0u2G2raOrJv+3OPmcEKvQ==
X-Google-Smtp-Source: AA0mqf62uSlXNxPTJw3z57ahsIMBOuTXwZwsI5C/DqMRrKONDTY65VHgWF2pcKCOJRSKeBBt/r1gHA==
X-Received: by 2002:a17:906:2804:b0:78d:e7c0:a2b with SMTP id r4-20020a170906280400b0078de7c00a2bmr14766006ejc.273.1669017244575;
        Sun, 20 Nov 2022 23:54:04 -0800 (PST)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906860b00b007ad4a555499sm4700805ejx.204.2022.11.20.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 23:54:04 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add sm6350 compatible
Date:   Mon, 21 Nov 2022 08:53:55 +0100
Message-Id: <20221121075358.76582-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the compatible describing the combo phy found on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index 97a7ecafbf85..68aecb638870 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
       - qcom,sc8180x-qmp-usb3-dp-phy
       - qcom,sc8280xp-qmp-usb43dp-phy
       - qcom,sdm845-qmp-usb3-dp-phy
+      - qcom,sm6350-qmp-usb3-dp-phy
       - qcom,sm8250-qmp-usb3-dp-phy
   reg:
     items:
-- 
2.38.1

