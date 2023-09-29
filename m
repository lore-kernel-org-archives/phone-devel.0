Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74AEE743F9
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 08:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjI2Iij (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 04:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjI2Iih (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 04:38:37 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3D91B4
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:38:35 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so878385066b.3
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695976713; x=1696581513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eb8SXxyy/PW+V96CqaPd3QJGGDx1CmgmZ0KsU7u1POg=;
        b=OFwZj2kc3WBPg5A4j1LXYvHp6W5Si7JjPkH9S0+RiWIxvV9pLhFYEPVliAP2q9XC6v
         oBxaey+2k1ATLwW+VtrCWKuhKe5d7oj/CPvB81bDQ0+JwMMS4i02TOJemdVX5qlC9uG/
         ct+gUAjG4I1628mgDG15PtuA6tdpW9nxykffbgLpfT6EtcVbBPq6PW8/PDTunn2NT3YE
         NnlhKMqU24KbeCS56fvslpwmlbVnu+D4DfqrAJPz42Wg8PIEmCrtSJBTyPHjpYdnGjpw
         /Iear0TMi0BHtdYx+zgQEHBto3BMFY/dvFl/8uENYIl85ofvKQcAv+Tyw8+52xvNHccg
         AF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695976713; x=1696581513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eb8SXxyy/PW+V96CqaPd3QJGGDx1CmgmZ0KsU7u1POg=;
        b=e7uRmie5gxi+pIXOqjBkysMoi4NcZiYzU2hmRaAjbDfPx401an/k5btHgzhgA+xC3E
         HF/gF40/5ZD3l21vCFeba3dRLxuegHH3snyjSOO3QKba+Ayp5KroHJAhetk5NT3hOBtH
         CJKhO0y/fZCcaRWzjnXjWWZmLBYuaO4Azvx9z2NBpzG51TviYiJ45sVQoeMfKz73oj95
         9OAI4fmWEw41/KoFOiI7HxGbhvYONNySbPseoteTEme2+Eev7gT8ZKoQ9RGhAV7E6J1J
         SPqNMJkokD0yjOSUib9wYFa21zFE4mjyGg4oZweGZlO4zP0yjFTWX09JkGdQ9XuvLET4
         oCFQ==
X-Gm-Message-State: AOJu0Yw6DxKkPxYGMxOHr3FvL3EcGLA3rHtEORysbMlccpW6Yzc05y7Y
        VtKPODZ2R6aAzJ2+1GQkKZgqbQ==
X-Google-Smtp-Source: AGHT+IHWo6Ad+NGH7yOlybgeRKc1BDC4UBNVMKM73Iv+L+9Io0w560rL/OsLgRo5bWtZz2faxPtTnA==
X-Received: by 2002:a17:906:10cd:b0:9ae:7081:402e with SMTP id v13-20020a17090610cd00b009ae7081402emr2825437ejv.64.1695976713284;
        Fri, 29 Sep 2023 01:38:33 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id qk8-20020a170906d9c800b009ad89697c86sm12208965ejb.144.2023.09.29.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:38:32 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 10:38:20 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sc7280: Move video-firmware to
 chrome-common
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-sc7280-venus-pas-v1-2-9c6738cf157a@fairphone.com>
References: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
In-Reply-To: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

If the video-firmware node is present, the venus driver assumes we're on
a non-TZ system. Move the video-firmware node to chrome-common.dtsi so
we can use venus on a TZ board.

At the same time let's disable the venus node by default as is custom on
such nodes.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 5d462ae14ba1..cd491e46666d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -104,6 +104,14 @@ &scm {
 	dma-coherent;
 };
 
+&venus {
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x21a2 0x0>;
+	};
+};
+
 &watchdog {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 66f1eb83cca7..fa53f54d4675 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3740,6 +3740,8 @@ venus: video-codec@aa00000 {
 				 <&apps_smmu 0x2184 0x20>;
 			memory-region = <&video_mem>;
 
+			status = "disabled";
+
 			video-decoder {
 				compatible = "venus-decoder";
 			};
@@ -3748,10 +3750,6 @@ video-encoder {
 				compatible = "venus-encoder";
 			};
 
-			video-firmware {
-				iommus = <&apps_smmu 0x21a2 0x0>;
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.42.0

