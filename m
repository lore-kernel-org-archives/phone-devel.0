Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04504E7849A
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 07:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbjJBHAX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235603AbjJBHAW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 03:00:22 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF80D7
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 00:00:19 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5347e657a11so10913599a12.2
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 00:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696230018; x=1696834818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktFRr1CyTGjJizjBCavkn96vmdNuVPfuYSai3Lj20Ho=;
        b=A8rTHl0bHs+fQRldcQ2EKRUpzMdadYZwDJJBbKmb1acAmtTL6s56RkTMynTuXRjW4q
         NJzre3dW/lyhnPmR4x6oLoyjwNfY5r24iNX6vRsR1HGq5CdO6tFJn0Am5JeVFC05ycfK
         iTvNuAUT1XyuVIqEhu3q5lfj1JW649Wn4Ld+EIXSc2t28q3oJ2ghc6YtcvuvrhttxkRd
         8k4X7MY/JMI+kqeD4xO1gd/kjglvyde4Wc2VWeD+t+FuKtXJc/1kIkcQUfOAZNgg+LZB
         3N3ri1Qugg8Bm7GiOoEU0l3reA2QcuTWv7h3sf5JduTReMpMgWIcvcumlYo6pppCQ+HC
         wKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230018; x=1696834818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktFRr1CyTGjJizjBCavkn96vmdNuVPfuYSai3Lj20Ho=;
        b=F682f6vSR8W0yT1A4livSXhXETegFKlYqyzOYi+VREnxSAcpCtDr/tco32Wzvu7hXr
         kmF8yvw40j7G8T4f7pyzHTkPlgaCT6BHj21maXludjhEkExGRoEMhaO7y4AEeYaH6WWc
         Ip18oZhjk7YD/QmsJKTC5agmUNVd3CKL2bHkwsF+8TRQBHij04RHnmlk19p6NxUTW/GL
         HtLSgG9Ml4xI7smISMOPY2OOLRP8INF6P3L0k4l8Yo1818sojwTCnCvesOfUgctATrld
         AsCOWYtza1VqGEDvzGaxpHYP3bsQTMQhByk/PwvY2sAqgNQys1iEFPBFjeRshAyzZ4tG
         veOA==
X-Gm-Message-State: AOJu0Yxv1n85s4U48OHFLQ10oDAN1/e9Z+cN5L8vzNXHZl6XlAyYk4AX
        3Utm+E5xK2Mt/SQSVoDzz3dfsA==
X-Google-Smtp-Source: AGHT+IEJS20GX9/Mz9Z0qBVhL4ZNvgD0cSbmWS3xm8ggW22h2lQIbSpD0NnWIB2Ep/fOKv1woD89+g==
X-Received: by 2002:a17:906:cc15:b0:9b6:53a9:792c with SMTP id ml21-20020a170906cc1500b009b653a9792cmr238046ejb.15.1696230018260;
        Mon, 02 Oct 2023 00:00:18 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b0098ce63e36e9sm16692013ejj.16.2023.10.02.00.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:00:17 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 02 Oct 2023 09:00:11 +0200
Subject: [PATCH v2 1/2] dt-bindings: mfd: qcom,spmi-pmic: Drop unused
 labels from examples
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-pm7250b-gpio-fixup-v2-1-debb8b599989@fairphone.com>
References: <20231002-pm7250b-gpio-fixup-v2-0-debb8b599989@fairphone.com>
In-Reply-To: <20231002-pm7250b-gpio-fixup-v2-0-debb8b599989@fairphone.com>
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

There's not much point in having unused labels in the binding example,
so drop them.

This patch was originally motivated by ea25d61b448a ("arm64: dts: qcom:
Use plural _gpios node label for PMIC gpios") updating all dts files to
use the plural _gpios label instead of the singular _gpio as label but
this example wasn't updated. But since we should just drop the label
alltogether, do that.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 55e931ba5b47..9fa568603930 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -239,13 +239,13 @@ examples:
         interrupt-controller;
         #interrupt-cells = <4>;
 
-        pmi8998_lsid0: pmic@2 {
+        pmic@2 {
             compatible = "qcom,pmi8998", "qcom,spmi-pmic";
             reg = <0x2 SPMI_USID>;
             #address-cells = <1>;
             #size-cells = <0>;
 
-            pmi8998_gpio: gpio@c000 {
+            gpio@c000 {
                 compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
                 reg = <0xc000>;
                 gpio-controller;
@@ -330,7 +330,7 @@ examples:
             };
         };
 
-        pm6150_gpio: gpio@c000 {
+        gpio@c000 {
             compatible = "qcom,pm6150-gpio", "qcom,spmi-gpio";
             reg = <0xc000>;
             gpio-controller;

-- 
2.42.0

