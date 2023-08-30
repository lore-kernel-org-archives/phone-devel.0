Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8AEC83F01
	for <phone-devel@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243331AbjH3Srs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242948AbjH3J64 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:56 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4902ACD8
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99cdb0fd093so707686866b.1
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389530; x=1693994330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMuJsymgFdsKAjrQm0VavHQLfVQtcng3/FrcyEkfn3s=;
        b=hG8s/jX13xStnQ6ibVDSDr+X0BmUOjyNWmsOWdrRPnsG3rkKUXxxrPYyj9dSlecZ2k
         qS5CO5SLAeTpYzuFwTacFGLfFmGBBMktNmkzYDzfMN8cYPdwUx7Q6KmSAMoeOdgg13r9
         xUUH9B9Be9xgBtzPO1RuEloeuPs8HFFrv/1lpeypCO07pF3K+GlZcaQbbvA2ZjHu+1MI
         3LpDaiLQv4NYUU1Bjl1bP4KVBHEgxfUDYbdgm0gIwVjwzZ1GhOurz56sNP9VuAevi+P5
         FrV24JLFkCQEvD5i7VH2nuq/m9+uYDH6XRJPAGDS0YlBcyCDkxsarnsn5154FPGOqKQE
         kl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389530; x=1693994330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMuJsymgFdsKAjrQm0VavHQLfVQtcng3/FrcyEkfn3s=;
        b=bROZdBBQFsrm4P+sL/KZKngcIMHPX/Ffns+hdqRB5daSt7QuexpAs6PXZ+2hYDfmrP
         BhxQHl1S5jQmP5sjswT685L7zfEb7R/9X63qz78nmHHwu1sFMTo3kXV0aNdRG4EZ8Ez5
         d5MnqeyGdK/PXelu/zwYUwT7YzWH4kXHmYKDrsw3fyyNJmKast0FOaN0gw/J/WZgARkZ
         IOCYLObTthB1sREso6pZWQ/an28qzhWt7cxGVBAQyjGOdyRwhoGhLalC6vM/WPWWgIT/
         Jl9m+nhSATuoZwcz6Lff1LIIVaOibUZ9voIGag/0NRa5eScrj7BL26kNpRqrG6WkJBFI
         at4Q==
X-Gm-Message-State: AOJu0YyGmRgLck+bcGtBljKN+6TSTJxa5J8A0KbsdxOtKb9Xy3bY5WDV
        QzydzClgyc/UXIaluLx/VFYW+g==
X-Google-Smtp-Source: AGHT+IEf8KL+ACn7JaRgtK1OVzWD45Pz7Q/Rp6ixSdbBEUiDBLjrnNxNNLgw3xdnQkN85h/UEJPDEg==
X-Received: by 2002:a17:906:208:b0:9a4:dd49:da3e with SMTP id 8-20020a170906020800b009a4dd49da3emr1337672ejd.68.1693389529786;
        Wed, 30 Aug 2023 02:58:49 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:48 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:30 +0200
Subject: [PATCH 05/11] arm64: dts: qcom: pm8350c: Add flash led node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-5-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a node for the led controller found on PM8350C, used for flash and
torch purposes.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index f28e71487d5c..aa74e21fe0dc 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -30,6 +30,12 @@ pm8350c_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
+		pm8350c_flash: led-controller@ee00 {
+			compatible = "qcom,pm8350c-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+
 		pm8350c_pwm: pwm {
 			compatible = "qcom,pm8350c-pwm";
 			#pwm-cells = <2>;

-- 
2.42.0

