Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CE0E784AE
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 06:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235619AbjJBGzs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 02:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235615AbjJBGzq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 02:55:46 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02341111
        for <phone-devel@vger.kernel.org>; Sun,  1 Oct 2023 23:55:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-534659061afso12343265a12.3
        for <phone-devel@vger.kernel.org>; Sun, 01 Oct 2023 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696229736; x=1696834536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwwrmFR4vDTJaNi1kPRW+bxNbMVZUqqlhEa36sL0+x0=;
        b=X7eAzZhA6IOTvzBrJdK6OIgzkkXZzdkfjKScUHnH8Kw0JvGYrKfd/O65H5roRR/sye
         2DVPjg8Cr/8hFecO5Z+34zhhipahj8T67sD+Kj9UlBenWOpB13FtrDRhYoPZrpytRSmM
         898mprrQuLQSzr1RPTrZh0pO9BwXe61sS/H06/nJTGsa5PGUJm/yGuFVuqkSNH8VsUOY
         ai7KQ1eUAebdf9BccwSBMsvgJLWJK99RDeoovv1EZj9x+g+VbkRDzYb3DKW5xTZZq6RA
         YO2DlaoqiKH6L++DHSdM4qllRTJYa9MI8Hjio2iuJXQZWY/bdCheGz2Tx1UaZJO1quJd
         3n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696229736; x=1696834536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwwrmFR4vDTJaNi1kPRW+bxNbMVZUqqlhEa36sL0+x0=;
        b=hqdx6ai2jVJEBqv4lj2sJF7A8UCCfpgCMvVE+HT9c7Yp0jh2Qn+eSrCk2R3E6Z/8Yq
         PvSW093aVFlJP2wm2CeeIKb8xeHLBzT9Pk+Va8bM7fRg5iTyV9kGUuDsIeTnpurnSK27
         scBKKUogoVnx+OpzVv94pVbghJ5HJTxVIP/jnfu4cda32kXrEqmOby43ihxSd6oTfUV/
         L/7DUd5z07URCkSzYJQ0/Yi3InnkR7ufolL8hoyFrIqkYJ3vUweeBzBbM2tnC1LKS7Uk
         ly+eki/vqC5AqX6imd0fcldw98pJjcWoU9/2arAyrLQpWaAP5SruPziHn6QcuukVRjGm
         +ZGQ==
X-Gm-Message-State: AOJu0YzYHeFa9YX62XrBswkO0XNcYHVVzeMpX6WzJt6oB7MdqtkSQQIm
        4skm3np9oCl36vK+z56DgQulrw==
X-Google-Smtp-Source: AGHT+IG748rMZzqwrEOaVjCa90z9zqxPEEcFfHIyU60ZyBbXRdg0mBN/e0Wmme6hTjgtOYd6iaq3xw==
X-Received: by 2002:a05:6402:cb1:b0:538:ae5:6138 with SMTP id cn17-20020a0564020cb100b005380ae56138mr4526460edb.34.1696229736335;
        Sun, 01 Oct 2023 23:55:36 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id m7-20020a056402050700b00537f44827a8sm4095557edv.64.2023.10.01.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 23:55:35 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 02 Oct 2023 08:55:30 +0200
Subject: [PATCH v2 1/2] dt-bindings: i2c: qcom-cci: Document SC7280
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-sc7280-cci-v2-1-9333fda4612a@fairphone.com>
References: <20231002-sc7280-cci-v2-0-9333fda4612a@fairphone.com>
In-Reply-To: <20231002-sc7280-cci-v2-0-9333fda4612a@fairphone.com>
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
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible for the CCI block found on SC7280 SoC.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 042d4dc636ee..8386cfe21532 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sc7280-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -159,6 +160,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc7280-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
     then:

-- 
2.42.0

