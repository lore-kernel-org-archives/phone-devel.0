Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3E4C433FE
	for <phone-devel@archiver.kernel.org>; Fri, 13 May 2022 20:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384018AbiEMUF5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 May 2022 16:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384005AbiEMUFz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 May 2022 16:05:55 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD4D2E0B3
        for <phone-devel@vger.kernel.org>; Fri, 13 May 2022 13:05:54 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id j12so11442179oie.1
        for <phone-devel@vger.kernel.org>; Fri, 13 May 2022 13:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/I8e8XHSj9FadDokH6BQcFNSs490tOz40Q/W3O77dAA=;
        b=XZn4TWTLD10sx+S1p65y+Xo38LIkJ1uBdSGxTOWHp5S3VFR66XDcZ90SkWK0hFBERn
         MjcPH4SgICgFKmrP7wbeDRlNxEglVhBjfgVV0e34sOXQ3ERgRNxhY2ytwP0Esj2Rwz+2
         ua4FnjAzgcmMpmDdBtJh1j0uSXo3VnwZiQFgIAcwC14bP0qxdyhh8jN90U7WZXzRvYUp
         CSqIL4A/ABA9Qq1VRYIrl/qE1bBzfJN0cPvVjqnLoRvYtKyJ6aay2TOMM97C1+eXDkKz
         Jzhtp1vjq49iLE3okqXb/UKE6JKQ2/c/eFHu62q+vsbJoSqwB9bWwbcJbVZoosQ4D64Y
         +1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/I8e8XHSj9FadDokH6BQcFNSs490tOz40Q/W3O77dAA=;
        b=gRNIa6/d+FAvQAJxiqxpIbzJmt2l6d4vtMvkzfKB8wsR1kxBrvJ9WY+w6w3nU7NG/i
         d3MZXCiA4M/lhBXgSloiW5QqmZPPE1U1nP7bVV8gL/x4VymMu5xgJy/9g86V+lo4WvnC
         qqJyp7K5unJ2aSlm3DQMoPW/1Nc6q2Qmq3/MmasUol4lB4c2refrkPk1EDJfIO0+iQZ3
         MulQJ/YI3vgubIg/Z/vEcG7W4UOGPCV9kf9aqKHUDaQnDTZdkUlq125gcdXZbA3bXiQP
         RQhgbdHg9vrZMnXg1paRzPmZM4JkpfXIc3XXH7ytqygq0qoIzJ/hGJkjbxsgxkfLvIMS
         CtIA==
X-Gm-Message-State: AOAM5308pYX1UG0HvQ4vGjvoalV4+WdLDwwfxYVSh75gcAajSc7uS69Q
        JpQKP0EZQ0+18FM3XjixdyLJ8Q==
X-Google-Smtp-Source: ABdhPJww6k6u4X4pBs0yHlkrssPbVQ3j+fcAc2f4P7DuBf+/NsfQKqvKeZQW1JD69Hjpk5Kn3itBEg==
X-Received: by 2002:a05:6808:3098:b0:326:7275:73ec with SMTP id bl24-20020a056808309800b00326727573ecmr3081167oib.54.1652472354217;
        Fri, 13 May 2022 13:05:54 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id a1-20020a9d5c81000000b0060603221240sm1456962oti.16.2022.05.13.13.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 13:05:53 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: qcom: sdm845-xiaomi-beryllium enable pmi8998 charger
Date:   Fri, 13 May 2022 21:05:11 +0100
Message-Id: <20220513200512.501156-6-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513200512.501156-1-caleb.connolly@linaro.org>
References: <20220513200512.501156-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Enable the smb2 charger driver and add a battery node to report the
battery stats correctly.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index b3b6aa4e0fa3..1a5e127d7a43 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -109,6 +109,14 @@ rmtfs_mem: memory@f6301000 {
 		};
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <4000000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
+
 	vreg_s4a_1p8: vreg-s4a-1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
@@ -302,6 +310,11 @@ vol_up_pin_a: vol-up-active {
 	};
 };
 
+&pmi8998_charger {
+	status = "okay";
+	monitored-battery = <&battery>;
+};
+
 &pm8998_pon {
 	resin {
 		compatible = "qcom,pm8941-resin";
-- 
2.36.1

