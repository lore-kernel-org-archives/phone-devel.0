Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC37C04A94
	for <phone-devel@archiver.kernel.org>; Wed,  2 Aug 2023 06:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbjHBG4h (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Aug 2023 02:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbjHBG4g (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Aug 2023 02:56:36 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0589E57
        for <phone-devel@vger.kernel.org>; Tue,  1 Aug 2023 23:56:33 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso863621666b.1
        for <phone-devel@vger.kernel.org>; Tue, 01 Aug 2023 23:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1690959392; x=1691564192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WekZWN6r3kEo9Z2SWEpwzpGIFVoo4aO3LnnSXjlvYM=;
        b=dQbyTvayxNXzXnaDzhb3dWNJb8dFPo5kSGVOQt8Y0gQ7TNrrZWVkzaPRmfiPVPLedF
         mGG3RDRxV7QUaRLkg8aVqfQRr8ODrJ2KdPxvphBZYq0UGKJh7blaLtLFzzm2ln4bq2SZ
         pF2N2ir4xI/1aJevJD8H6tvnHfK+Rt5zs9kzVaMa7JpPd7qTC+FCUx4vV1ewbi36xjTS
         D2WrR+vD7Wg0O/RVDXd7roySAyHYTJh2dkMkOCeFgVjpinIQdXwuvXegP8wymfFstsH2
         RsY5OPte5dp5ISxz1iL9meNywNIq3qCZazN3AlfMZY30BSCWZfnrp2DCBjI0CVRpIlnD
         ruTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690959392; x=1691564192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WekZWN6r3kEo9Z2SWEpwzpGIFVoo4aO3LnnSXjlvYM=;
        b=TvLONJUhQf6yGskWyxiUfqakipDaZModBFo3deL8jws+mQkldciu/eIgTo9x2e4PTe
         rKiJxTKH3a098HhkULlzmFH2jMx9WFvnuJWcnU9e5CM3uU4r6YTklTkGSNK+jEEDY3/e
         /51kR13cMo6pnx5i6lyyN1+KP0vLHZcbv363Z0IiB/SqKG47mWKOwPRda/KrM1y901t0
         BpDreuat3pgI79YhljJ3X6dk3xI30LSA0r47C9BECDSRDKSOkV0yj/L07NZyY4fUvyA+
         b2JebOhG8zNEwzqYseZU9i6IGn+SQIG/DdjmOO38MpQ/BfOHT5LLro1iRItTZG+PPCZo
         D1ng==
X-Gm-Message-State: ABy/qLaC/s+ytNf4FkmvP/spslTri4zZkkr6tgXdSOSzzisvI3tdddA2
        gJD67v+M+rAL0GHw3v3kVFy8XA==
X-Google-Smtp-Source: APBJJlFGxq+aMT3PqHDgik/2AOf8hLDUHBWjDVKJBcTpdIfewNezftcZ0MjSF0LXzcYzfzYmQ/xYmw==
X-Received: by 2002:a17:907:7631:b0:993:f9b2:93c1 with SMTP id jy17-20020a170907763100b00993f9b293c1mr4129777ejc.9.1690959392217;
        Tue, 01 Aug 2023 23:56:32 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e1-20020a1709062c0100b0099bd5b72d93sm8567400ejh.43.2023.08.01.23.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 23:56:31 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 02 Aug 2023 08:56:28 +0200
Subject: [PATCH v3 1/2] dt-bindings: net: qualcomm: Add WCN3988
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230802-fp4-bluetooth-v3-1-7c9e7a6e624b@fairphone.com>
References: <20230802-fp4-bluetooth-v3-0-7c9e7a6e624b@fairphone.com>
In-Reply-To: <20230802-fp4-bluetooth-v3-0-7c9e7a6e624b@fairphone.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the compatible for the Bluetooth part of the Qualcomm WCN3988
chipset.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 56cbb42b5aea..2735c6a4f336 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
       - qcom,qca9377-bt
+      - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
       - qcom,wcn3998-bt
@@ -111,6 +112,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,wcn3988-bt
               - qcom,wcn3990-bt
               - qcom,wcn3991-bt
               - qcom,wcn3998-bt

-- 
2.41.0

