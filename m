Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E3EEB64D9
	for <phone-devel@archiver.kernel.org>; Tue, 27 Jun 2023 08:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjF0I2i (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 27 Jun 2023 04:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbjF0I2P (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 27 Jun 2023 04:28:15 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F921FFA
        for <phone-devel@vger.kernel.org>; Tue, 27 Jun 2023 01:28:09 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98934f000a5so509987166b.2
        for <phone-devel@vger.kernel.org>; Tue, 27 Jun 2023 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687854488; x=1690446488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGkxfIlXXVd4eOlKO+oLehocpXpo7RbZWzh/FcRwcEo=;
        b=wSx/vsi+dSAGNtnIZJLOmr47YXVYrT+OIjNd17ObKEghBtToSaOOl6VScQmelJWiqF
         mbcZe+YIg65HLi6PlwhXcTD/QrA3pReuxqEyDXKPaDGuok4W/pV5cDaI8pIDm5eVxC+f
         6LURrDoL1qr0H7ZeajbHM/0XNgHhp7Ly4ZDDWyoaXCv5djF6CO3Z93EYlpFXDpWyHgDB
         6tTZGDi4QFNhmFxHQBzUqHBWo8jQOGNH5puvI+WMWC6I08a8IjYTFzTU8HjZVb+DCEHJ
         cSUV/pN408qlMSLyuysdXo0Fnp+23F2gao7+wTZp/+hXQg/cfij9h8mfq45TxJu4/YNh
         fFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854488; x=1690446488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGkxfIlXXVd4eOlKO+oLehocpXpo7RbZWzh/FcRwcEo=;
        b=XwcPEdZLYfFe6bOevPUveAPJn/WES3COL2GYv7gDwz/OovB0PO6CqX10PUdr4EvkX1
         FdzcidDIor1RO/eAgqYb3hs2A4F95c46leydLqMYh3Z6G6OL+/95bqAWZJk8q889FV+6
         KXsu78JcXBRrA3vrXQW6TQhGVJifyJB0V3Am3lW+1nMdMMIQj6Uj63mXqfEA8UhDKd70
         pRlGpMQXdh5ddPAFOfIJOApIIIZwvgzK44vI0fAop8LOyHvdJVfs4CSvVKfkXVlL9kmA
         U+GHUAVSkUBhH272+s6MXDuVm/JPjNrOxWDJo27JWfdhSHFdakS8x6t6TUYqNEgU9+R1
         eKUg==
X-Gm-Message-State: AC+VfDygj/ZWm/PF06VE0xP2xDQ9dss3Wc0WAbtwGeD9VghKdgN0cle+
        IjI289nADYon302kcpMaTRrO8w==
X-Google-Smtp-Source: ACHHUZ5o29H62hyx8EnN8GKeHWPpEAgm3+WVyEm9aHFVWmoQn3ipXBi17KXb4i8YtY364/aodDnhyg==
X-Received: by 2002:a17:907:25cc:b0:989:450:e57b with SMTP id ae12-20020a17090725cc00b009890450e57bmr18027423ejc.7.1687854487780;
        Tue, 27 Jun 2023 01:28:07 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id kt19-20020a170906aad300b009894b476310sm4253038ejb.163.2023.06.27.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:28:07 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 27 Jun 2023 10:28:03 +0200
Subject: [PATCH v5 3/5] dt-bindings: ufs: qcom: Add ICE to sm8450 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221209-dt-binding-ufs-v5-3-c9a58c0a53f5@fairphone.com>
References: <20221209-dt-binding-ufs-v5-0-c9a58c0a53f5@fairphone.com>
In-Reply-To: <20221209-dt-binding-ufs-v5-0-c9a58c0a53f5@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

SM8450 actually supports ICE (Inline Crypto Engine) so adjust the
example to match.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 2b0831622cf0..462ead5a1cec 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -317,5 +317,6 @@ examples:
                             <0 0>,
                             <0 0>,
                             <0 0>;
+            qcom,ice = <&ice>;
         };
     };

-- 
2.41.0

