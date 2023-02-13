Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2737C636CC
	for <phone-devel@archiver.kernel.org>; Mon, 13 Feb 2023 14:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjBMOqu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Feb 2023 09:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjBMOqo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Feb 2023 09:46:44 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367F01C313
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 06:46:34 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id bt8so7420081edb.12
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYt0UvSCB3GCUEfFP2VKDcvyRzb86/6xZ/drofUnvWU=;
        b=H7CmGL4toJujXUyjXiOqsBKS3oQ/OPCqgVxR2qZX3NIeNQomor2BuTBe3CxRxqblOg
         yYfBXQny4rQqh8eTKQjULC97fd68fuEk/j88P6cGhkoqjNmfsUnk6Thq/HwPVKffaTLq
         hJ4EVomttNgezaxMnpMSAekHR3CBBEALmptn7WxA8YPndyn/qrQcSI9L/239c9nhGfhs
         AuLXsPwRbpI2oROquQp6CUGkJgaeWHc34u39xDVF+HhJJ7KpqfoS76/sy72Darn9lJRp
         j0grQk86/WmBZx38gX2/wXwYFtMwjRQf3g+IlLzTgEtY4THIh0DXVw6OPRvpPDUHkNIk
         3BOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYt0UvSCB3GCUEfFP2VKDcvyRzb86/6xZ/drofUnvWU=;
        b=kyhHAX/QIsko6m2Y753cjKQjfFqflB19jOBZYCBKZV2ZzLfNKo6MUCBJkiSGP0OrDb
         DGxfpR1UlNcrkiaTZqRCG5VpJ4Ll9QljTZFo6939wZWXg2Gy2zUyqSy63iS30dcLqThG
         GBKU18vt3twBTgnkh5es1ErwpUoI93TF9qEZ3I0qXM/pnUWAonEv9m9oDhux4a090ske
         7ELWvICKpxy2ID2F/9QwqCdxQRenWWm8wWtRbxVaVAdyFYjMUqejzj01ATn0Y9r+sycD
         /0ip9QHMhAq7SZWsCaD/Zgh+qzhIM+Q97A0oNSmZG45kFtlS/eiaKl0uC7WX21ooGFrq
         wODw==
X-Gm-Message-State: AO0yUKUgKMpwYvjFVdsCA8exIE0I5OUfVjOPJ+coc471VUt1/Sf7woDe
        bZuHzMQWpet7RPgX6GeI1Hm6wA==
X-Google-Smtp-Source: AK7set8kR2+9bPXCt4cS7kPEIOFtMli+K3NI8BYypsYy9bfi0z72yfNI8hiPIiJhzQbpCmp7+qBE+w==
X-Received: by 2002:a50:c35a:0:b0:4ac:c12b:8ef8 with SMTP id q26-20020a50c35a000000b004acc12b8ef8mr4904070edb.26.1676299592737;
        Mon, 13 Feb 2023 06:46:32 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id b19-20020a17090636d300b0085d6bfc6201sm6884208ejc.86.2023.02.13.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 06:46:32 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 13 Feb 2023 15:46:31 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: enable
 remaining i2c busses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-fp4-more-i2c-v2-2-1c459c572f80@fairphone.com>
References: <20230213-fp4-more-i2c-v2-0-1c459c572f80@fairphone.com>
In-Reply-To: <20230213-fp4-more-i2c-v2-0-1c459c572f80@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Enable all i2c busses where something is connected on this phone. Add
comments as placeholders for which components are still missing.

Also enable gpi_dma and the other qupv3 for that.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 86114dd2c0c4..7ae6aba5d2ec 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -359,10 +359,39 @@ &cdsp {
 	status = "okay";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* ST21NFCD NFC @ 8 */
+	/* VL53L3 ToF @ 29 */
+	/* AW88264A amplifier @ 34 */
+	/* AW88264A amplifier @ 35 */
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* HX83112A touchscreen @ 48 */
+};
+
 &i2c10 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	/* PM8008 PMIC @ 8 and 9 */
+	/* PX8618 @ 26 */
+	/* SMB1395 PMIC @ 34 */
+
 	haptics@5a {
 		compatible = "awinic,aw8695";
 		reg = <0x5a>;
@@ -495,6 +524,10 @@ adc-chan@644 {
 	};
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.39.1

