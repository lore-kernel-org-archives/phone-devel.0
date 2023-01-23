Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E675EC54EED
	for <phone-devel@archiver.kernel.org>; Mon, 23 Jan 2023 13:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbjAWNa1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbjAWNa0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Jan 2023 08:30:26 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E65B22A16
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 05:30:25 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qx13so30371768ejb.13
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 05:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiCSAx5OP0HL/qhjmYmfiTOJSjelq43AEFISt1JmlPM=;
        b=WBtE0bBwM3UOcZHnEzwQfAzX4RFesXn7iyw9+E8Mm8055sx4yURLxuTVsU3qS7jEoS
         086mIbUN/JwIk5zvZGrmb6GZS1TYFha7P0yMnLlP0KrwqHHxN6nrYYE/cz63N6gH7K+s
         OBNnaJDVj/MdiSTnIFLITh/QfScqcZbCDDSXH8uLLqwkYUUrdOA0ddoOW+3U0S2c6KpM
         F0jrnQtM8VcQhnThVcoJj3ExStITLqo2btEQByXhRt57L45ddw6vkQ48DI0sGpPeAh7I
         7dT1H7/UYevnf2Gg/ohL04DM1APsIHRq5rsnpvUzjVS0oHqJ0sw2K5bK7wovlMZHefiy
         YCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiCSAx5OP0HL/qhjmYmfiTOJSjelq43AEFISt1JmlPM=;
        b=m+Zb5eiJy9y31uYINevq4vOE/hlwZNpc8tJup/a2zDlLHx5x1wDAjs8CVNsj6GpUOP
         /A7OUWRb+MKe0lgSr387x/SsADZJiOrZww1SYH8RTFNGT1rDpB9zORYOYZdDMeJO5K2U
         +3BuKWOO+srQJ8LR9+I4KccaDHqc0TRWmdZogNchNl+mpYTeQp1O5MzBycFif5cWaEWH
         eAamZbNxJe2IahUH1E/9Wf0hRwJ3PGjFguOdbKAVsITyHlR/eeXcB8/eQ4Y94GDGjVkK
         R602sptVV/5kZJsThxbBNK5yrmPPBrnXWneOIHtbON90krHCgd06OFe72BQuR7btNUbG
         G2IQ==
X-Gm-Message-State: AFqh2krQEIhf5HxyhYT/NmqEhQsPw1kmfimwaO+zrwS+WDzGzIH1ktof
        T+Drrc1mte5JC2zNeb2xPEup0A==
X-Google-Smtp-Source: AMrXdXvMacONiIlsA+l49gQG20Y/D0E/HrMPyVBKSIzyJSf4UKkvzRx1VNwWXufjIQLel3IMCgZF6A==
X-Received: by 2002:a17:907:a2cb:b0:870:7b:94db with SMTP id re11-20020a170907a2cb00b00870007b94dbmr30053894ejc.28.1674480623700;
        Mon, 23 Jan 2023 05:30:23 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906c30500b008552bc8399dsm18410066ejz.172.2023.01.23.05.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 05:30:23 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 23 Jan 2023 14:29:49 +0100
Subject: [PATCH v4 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add sm6350
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230120-sm6350-usbphy-v4-1-4d700a90ba16@fairphone.com>
References: <20230120-sm6350-usbphy-v4-0-4d700a90ba16@fairphone.com>
In-Reply-To: <20230120-sm6350-usbphy-v4-0-4d700a90ba16@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the compatible describing the combo phy found on SM6350.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 6f31693d9868..0764cd977e76 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,sc8280xp-qmp-usb43dp-phy
+      - qcom,sm6350-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1

-- 
2.39.1

