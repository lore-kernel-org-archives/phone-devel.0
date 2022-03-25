Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E5DC433F5
	for <phone-devel@archiver.kernel.org>; Fri, 25 Mar 2022 10:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358783AbiCYKUj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Mar 2022 06:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240723AbiCYKUi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Mar 2022 06:20:38 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64099156F
        for <phone-devel@vger.kernel.org>; Fri, 25 Mar 2022 03:19:04 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bq8so421617ejb.10
        for <phone-devel@vger.kernel.org>; Fri, 25 Mar 2022 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txfMDWQceDbgmOrEc+CTlnZSlzPPay3e29bbmFGpskI=;
        b=aY/UlNLKFcwQI01npAcjm/L7wOLzS2xJ9Zw+MT1p3HNACImlKg70WPLKtmacFC5gTb
         Xoc4FrJdHP7PQLoY0UEuhuaX5Vwyqrktj7Wa2sBTQwFhDG6gUhJ3ul8LMrL4sCHZ68sd
         l+aY4QkwQfvVu5ngmZ70I9/AhkbFbwIkCrLZqSNqZh8notZEpsidKFpSagPFlPM33Qrh
         MCCSJuO/jpN81ZAdQdvKAvnW8yjUimN2YyiH5G933lvB5D89+1LvRivokfNBdrebDj1/
         oG1UgkYqp4+32YQtoBGYC7OQstec+bwYQfqoXyQj5uTSkDt7jZ/3mDQzNEahw80oQ6vn
         pKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txfMDWQceDbgmOrEc+CTlnZSlzPPay3e29bbmFGpskI=;
        b=GpsRgo00FShX03gr9kVwtQaywVZSZnQ/8pRazFWxpdc3ACP1luORDpOgIvR4fdhMxR
         FcJ8y5OtiPk1nx3D4hy/vtquRTq8tE9kDIMz/CGkq2wu0kaSJBS6Ww3PrYGLHpOCbxeB
         YcszALB+2xL7zG6SG8cgMgh+LetfqI/zYh4OyHRw2KItdc5OBioikPZLs0TvoGN0DL7E
         0TXFI0RTT75IVgr2pjfC3J0v6UVTOtavW6jney+yGK6ns9WGYys+cC00zTC3IgJEt8J9
         bQDpWTd/99MWlbcs4D6BOhxti4KTrKHHnag6oxaWJG2hVUhwu7xH77jALM1NxNqpvlil
         T7CA==
X-Gm-Message-State: AOAM530895KxeSdSfR6l5oibTY5OzU9L6kppHcOk0wpNoHyyfaFiC0HP
        584h5SRKj1gvpXJBiYnNp35pYtHlWayWvQ==
X-Google-Smtp-Source: ABdhPJyIbsV/hWkQgXdZIzsB8nheQMLmBqixJtiigslgQjtIJpHte/2eaEQGBql+3YZPSHhcRqh45g==
X-Received: by 2002:a17:906:5245:b0:6b8:78e0:5649 with SMTP id y5-20020a170906524500b006b878e05649mr11152534ejm.520.1648203543499;
        Fri, 25 Mar 2022 03:19:03 -0700 (PDT)
Received: from localhost.localdomain (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id hr13-20020a1709073f8d00b006dff3a69572sm2122695ejc.5.2022.03.25.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 03:19:03 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm6350: Add wifi node
Date:   Fri, 25 Mar 2022 11:18:40 +0100
Message-Id: <20220325101841.172304-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a node describing the wifi hardware found on sm6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9ad30086cfcd..1e2810021b30 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1267,6 +1267,28 @@ frame@17c2d000 {
 			};
 		};
 
+		wifi: wifi@18800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0 0x18800000 0 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_fw_mem>;
+			interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x20 0x1>;
+			qcom,msa-fixed-perm;
+			status = "disabled";
+		};
+
 		apps_rsc: rsc@18200000 {
 			compatible = "qcom,rpmh-rsc";
 			label = "apps_rsc";
-- 
2.35.1

