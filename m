Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFB4E784AE
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 07:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235630AbjJBHAZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235606AbjJBHAX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 03:00:23 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D60E6
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 00:00:20 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a9f139cd94so2137122566b.2
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 00:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696230019; x=1696834819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mjg/OOV1lyu0ZM76luSIdSZTlINxZsnRT51fNeIzO0U=;
        b=ZNXAZOHS/Z9gCOVOn1+BisO4VFWYFj9Igw4yIYJCXY0nNk6UyhbluNSMGye9GOBSyr
         kRLArhBatDyDWent+bb9Cczv3fuJ+Awy6EE5E70eRSZQrN7AdyZ7Qz/DwSZozo+NEpCJ
         2MD9HV8cVAZXMLYCt1UQwt6QYzuVLDJjVAoV1mNOefj8xNksLMUfi/kSFp/ONpdRVESQ
         UuAAyjvkct3OkzjoIlF0ZPPZqeApk2Jyw2DFwfHnCcWJNmvtmetjXgHS+WK3d68GS9f1
         IBiInK2cajlZ/Y2ReYo5hJG1QVj8cPvnIoauFqV8HVaxUQSjAhdUgayl0t32eBb++4QM
         gY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230019; x=1696834819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mjg/OOV1lyu0ZM76luSIdSZTlINxZsnRT51fNeIzO0U=;
        b=oe9AjJCwvx4GR1yRHRYP5uMz+kPRKMaknA33zWmt/Tj7SYNkWfVhHA92icqTOQS7hO
         fNwLJxkuQoSm8eRrn48aEWipygHfuWMkWfHGUTnPaMjmAvkbDz9qVpUItVL5mXvcCTm7
         D61CMYsd5s18ajDklrlpEjfDF/OJ6ecYjIA05KhS6hj5bPcxoOMMLp5aUY02WvyShs/9
         PNKByXtjn2/Ij0YsHegWQrZ+Fy67JPQbKxBriwHAZ0ruBHI8YAAuwNH2owPzIdq1cmAa
         kqYIChMYmnHkOT+Ot0cZoYwGyMdxspj+t4CIl6hNz9FbKbdfvxgjzVeXaUSTqaWyvzZe
         GZAQ==
X-Gm-Message-State: AOJu0YzT3AcScnwKgT0rLKRhghQTC1o8L7Mft5elch4JAXx8kS/gHnfc
        8zX2bKmfNOMJRFROthNe5ipPdw==
X-Google-Smtp-Source: AGHT+IFPZZqNOuwD5VfVyNpAT4DhFkPyBAAaF8Bs8h/W3A5JkHfSfs0skU1TyPsToCdnD4cTvqHScw==
X-Received: by 2002:a17:906:cc13:b0:9ae:4d6d:ba51 with SMTP id ml19-20020a170906cc1300b009ae4d6dba51mr9425084ejb.21.1696230018967;
        Mon, 02 Oct 2023 00:00:18 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b0098ce63e36e9sm16692013ejj.16.2023.10.02.00.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:00:18 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 02 Oct 2023 09:00:12 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: pm7250b: Use correct node name
 for gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-pm7250b-gpio-fixup-v2-2-debb8b599989@fairphone.com>
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

Use gpio@ instead of pinctrl@ as that's the name expected by the
qcom,spmi-pmic.yaml schema. Update it to fix dt validation.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index df0afe82f250..3bf7cf5d1700 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -148,7 +148,7 @@ pm7250b_adc_tm: adc-tm@3500 {
 			status = "disabled";
 		};
 
-		pm7250b_gpios: pinctrl@c000 {
+		pm7250b_gpios: gpio@c000 {
 			compatible = "qcom,pm7250b-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;

-- 
2.42.0

