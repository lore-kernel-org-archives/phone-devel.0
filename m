Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94989C7EE3A
	for <phone-devel@archiver.kernel.org>; Fri, 26 May 2023 21:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243280AbjEZVu2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 May 2023 17:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237839AbjEZVu0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 May 2023 17:50:26 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13DEF7
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 14:50:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3078cc99232so1083641f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685137825; x=1687729825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=er/2tuStc06EOJAYB0EC0jKDQF+rhEFocuKHGZ+uPaY=;
        b=dbHNhiexvqcQIvBBx61Rj2SqPYE/CBJTFGnQOi5PQrYfQmqqwnSqxTOIajoEgnx1Gc
         Gt+zXxA3+JdWzFsmmQJc+ZEXfp2ppf9s6RGzgDgc2E9q1MW6BLjPXDDs0zKubGLxTt34
         k95Jg6+RgElnyUqoI9OTMD1WOO3pz0Ph8qJIHRvgRgnGSsF/v+m03SjKNhC2pJZhQ36/
         9HGRiHiFjYh3LxCPkHmkpEqxA8EgORY5BY1C9zNHALu23bPTnYywVt1WTvxCQVytwQHj
         cZivVrF9ZKzdJIXqr9jsvTO41Uutzg38UY5dRjpO1sJn16aoNRe7yVAiFUnr1MeQxk1o
         4muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685137825; x=1687729825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er/2tuStc06EOJAYB0EC0jKDQF+rhEFocuKHGZ+uPaY=;
        b=j+fh9q5pm61wyaXGN0DfO1Uk0mmFrdW79hS+qrrICHOrD3cA5lzGPe4R73+v0dYzDH
         pMZ4LeT/0GBZwJ8z0m7lhrIYscWEYTcHUWTk+yT7n1VrkeTXWhc94bMCe1nwVW3Fq0OT
         tzYdYkNUjL4BwbuXpmT3ZS3SzPSUJJW/afRqRNvQRremuYhU5+gn1YmWyvgF8MT8nQqj
         re7gkeFwBtJqN6sCTDPOUAyic8g1HeQzuq+YWPeSjsTkZ+xdVTf5EqtHYr/+zIp/nuDi
         RqLwo12+VFelMPKSUEfZBX7rWVkf32VQQek3jf/CqWM17FntcfvnSssxSYIXqpRhGlY3
         8NuQ==
X-Gm-Message-State: AC+VfDwG/tXssTnEUAoyldcIUY4XTXDt8ozDl9HB+h1lFkGVQVpUwoTR
        jbWnx8dHy3FteU4Jx+o/bduNMhVB7YIK3ZELTFm4Dw==
X-Google-Smtp-Source: ACHHUZ4h3F97kw674IYL9xtz7a8u+ZZsGXwyGv6N7y4HIF0ZLx/vUkW9YkJC+lxmbD73aes0lvJ5Lg==
X-Received: by 2002:adf:e4cf:0:b0:309:3e48:f400 with SMTP id v15-20020adfe4cf000000b003093e48f400mr2789165wrm.18.1685137825357;
        Fri, 26 May 2023 14:50:25 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id u4-20020adfdd44000000b003063176ef09sm6294314wrm.6.2023.05.26.14.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:50:25 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Fri, 26 May 2023 22:50:24 +0100
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable
 pmi8998 charger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v2-5-2a5c77d2ff0c@linaro.org>
References: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=TWdn+N73wTGUSjs6c9D0VmHIB8Wx2mCJogU9cJy2wTA=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkcSmc5CpiRZ2Q7Ru4yPYpv1I2fGMJsvMYY+x+b
 VGowKFFlnmJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZHEpnAAKCRAFgzErGV9k
 thoTD/9Z4Ax636Vned+uscdxImWart6i6LOH+2P+Y9xstVS23XWqkjQg6wea8MHrSSWUgu7BW5N
 j6mZE9UUV160GTGvGUXa33J2u93uUbeYuxRpeUuYNbmvekTzcruX6eB6WB1TLop3pR0hA2aYmP/
 /aT5Gafk9wf9tNBTqb/8CcnlzO8J6UnVRHYD2V++F4bzmA7qeoaupnuUpYvW9Al9Lt8yiG5+dc8
 lK389PDSnjSkB6PW1Mhdmmj+ZIgsQTNZprxaIjkFK9LEyH9S9aQcaKdzBho60I0SdUUvhtoOjAb
 4Orx/6FGvOZ8AckPCMrOKj/WPW7CgacjQoGcfq0SnOnFaObNp9fbzzT+vtcBVxdvU8L9vDmS4Bj
 sbr+rQ1cTMSADxGMElW6chA7PvR1v/A5U9JBYDYfClXQu04VMUDo0xbj6DOkfVWh8BPV9k7Lzyj
 zsMoD3peKvLM3nObjQVeJU/h3/AafBDwA/VC6dOaDhvlm/vY19/Xoy8C7owD9X21eVf4uCcy+xz
 nbE7EY86KywGG0a7hcqNb8IhcgE3r4u8qQ+q5VGpXh+7XNYFpkpVn6snoKuGWxFnyauiX3Fw812
 pQ7Qk2AIxku8k8c1pqq8hn2cDonwnV7nbv02UimTUJvSzFc2To4Jw9P0HP5oN8/+jAZ5QS2Navk
 yM+C/O3jc19gBEQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Enable the pmi8998 charger and define some basic battery properties.

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 1915643f1c49..f7fd897afe1e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -115,6 +115,14 @@ rmtfs_mem: memory@f6301000 {
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
@@ -341,6 +349,12 @@ &pmi8998_wled {
 	qcom,cabc;
 };
 
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &pm8998_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.40.1

