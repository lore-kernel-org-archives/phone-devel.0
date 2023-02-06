Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE79C636D4
	for <phone-devel@archiver.kernel.org>; Mon,  6 Feb 2023 20:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjBFUkg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 6 Feb 2023 15:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjBFUke (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 6 Feb 2023 15:40:34 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C220A7D91;
        Mon,  6 Feb 2023 12:40:33 -0800 (PST)
Received: from [192.168.178.23] (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 05291CDFDF;
        Mon,  6 Feb 2023 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1675716032; bh=wlZhYLWOENv0UNIglzrm9eMdi8ajcS07tw10uEADoOs=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=jLMsJGUfMObpVXsvfF3SR4kkA5SgwvJ6jXXzfbapSgWcuqQZVXW4XboD93IKfuo7O
         JW0EBZH2Q5Lwmw6XjpzlgG/xp9q/XDqgR9mW8Ffa7/5rgrwQzfuEMiHsmIkH2wKciz
         9eRM+HnCEQa9VN9LywXljjfLHXactYSFmXktgNQo=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Mon, 06 Feb 2023 21:40:14 +0100
Subject: [PATCH v2 1/5] ARM: dts: qcom: pm8941: Add vibrator node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230122-msm8974-bacon-features-v2-1-06bb83c20a58@z3ntu.xyz>
References: <20230122-msm8974-bacon-features-v2-0-06bb83c20a58@z3ntu.xyz>
In-Reply-To: <20230122-msm8974-bacon-features-v2-0-06bb83c20a58@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=768; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=wlZhYLWOENv0UNIglzrm9eMdi8ajcS07tw10uEADoOs=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBj4WW7V5Y9LcO7ZlIfqleBoBct/ux4tjEaaU+5i
 /4Aq5HETXqJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCY+FluwAKCRBy2EO4nU3X
 Vr5qD/kBOV5q24CuwqDrtQ05D/CRNVPXbTw99M2/HRAwTjfmwoAmTrIfF0qD2X0Dy4Lycb5J1KX
 2hT2VhXadsumFOlAcZrAgedRnzkpbCDVXfx9foSiqmBpbxxu/vHWvhyaKU+rdBiqgRLJ9TuHSRl
 4JVq2QOHluFUyY8PbWSz24WYj0ejjHhV3U/lS0xOv1Vz3eL6pwYXXLgSRKsj1MlG86R3t4NLbbZ
 FV/Yz94jPfN5d0RBX61wExOKTw6fiuc3R6FVdjUBW1yEyP/4qUV6/86lRcADlRwpLHWdJvZLo04
 nlJvri8m6n5/g/NB5+DNed1uB8nCh4cnjn/0Tm+s3aw7h2127oIlFwTfaXfmRnj8r+mK1ati69R
 oCwRugCDOmp2Ohkd5iq4GNB4v/uQyOU+ZA9GdPxdVgW+xAEMsgqnTvQsq76PgSQ2OKwZLnv80nP
 S9BB4s1h6f6ar49w7Zelp+C4vGrkeXtcOZ47dZIjyNsOhJhnl39NbhAlHD29F09vF+Avb09de5n
 cTstjZNZWAE9h18LTjhWe9mZzB1l/+S5YZHsPLS1F3tKaT4N+rpZ7iM0xZrtukXl/sZQmuotKvK
 2vTedL1B81dTI2F8EZJpKutZkBAIz7nD2kHIbpIFDvmHl3WqprhVwi1zHVb08KHUpf1khpT4YNz
 GCej1gwCXwwGKcA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the node describing the vibrator that's found on pm8941.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index cd957a1e7cdf..a821f0368a28 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -161,6 +161,12 @@ pm8941_lpg: pwm {
 			status = "disabled";
 		};
 
+		pm8941_vib: vibrator@c000 {
+			compatible = "qcom,pm8916-vib";
+			reg = <0xc000>;
+			status = "disabled";
+		};
+
 		pm8941_wled: wled@d800 {
 			compatible = "qcom,pm8941-wled";
 			reg = <0xd800>;

-- 
2.39.1

