Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3274DC05027
	for <phone-devel@archiver.kernel.org>; Mon,  6 Feb 2023 20:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjBFUlY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 6 Feb 2023 15:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjBFUlX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 6 Feb 2023 15:41:23 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50A976A8;
        Mon,  6 Feb 2023 12:41:03 -0800 (PST)
Received: from [192.168.178.23] (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4CAD8CE06C;
        Mon,  6 Feb 2023 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1675716032; bh=bDlJVkD5QTEg5c7M328wQLe9SAzuVrBEP8dUuXHHvEw=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=RbFuaJtBRPaesr6pihtgvrTYh9CceszYn4HcP0AQCsocpeYnrctxugV8IQDvLhiVU
         i5HRChMqIXqHvLIBlO5ipkuO5v3Gk7XP9KvpZcoLPIHWs/NTZWhGHPJYCj9VLhnikI
         wBpXTSxY+pD1tpEZGUt91Ffx9SiJA5afsY8o/7CY=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Mon, 06 Feb 2023 21:40:15 +0100
Subject: [PATCH v2 2/5] ARM: dts: qcom: msm8974-oneplus-bacon: Add vibrator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230122-msm8974-bacon-features-v2-2-06bb83c20a58@z3ntu.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=bDlJVkD5QTEg5c7M328wQLe9SAzuVrBEP8dUuXHHvEw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBj4WW8v3bg+ZGXlM/xf9PQS5fgx/qMCHMwVHTf8
 PMPBJi7MkyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCY+FlvAAKCRBy2EO4nU3X
 Vu0jD/wJCHQDC1sY5seIfZC938fqLmr3zKPbyecWMEJHMvvReqC5RvdhnIqPDxcjFx9t5a46qYJ
 J5B4XL58p2gSL6EC4WrsHzXEpuNY1gXO9QL414mWRi8SP/FizBn2ngGT1HcJstL3YyKrfrib7yc
 VpD7Ebo4dOEfNRRPMLrlPBCMnQv7B4tyukfIH0PtHy2pJLrQRWUMsj61YfBE/b+fL2WFk7Fc9k7
 vJB2nODgdUx1e1iIvZr1ImJZWbKVIaawCOvV1gt5ZrlTwPPZpKd7FX29+2E20ynxBixH6WoEoTR
 PNdqxV07PHh177oMh4v0dewxY9sqryspMYucElpd5zy/RaphytSRvevwl7fXikgdHx4tD4MVJj6
 2AnofUta0qfCrWQj1dIVqYJqKXkFUvGBh8E7QgAZioqt5sxxoy0r5+wLq4WSuQKb/Y+MYn9sER2
 49wVVq6t5pwiCk4SJsfdTngU3Vv1PLGdtwfc+u5QYvNke/CaWF8uDkZi5SemrJNaGoZfp4qMYda
 G7VQJoy+sGItlxBOiRZTFbHnWojw1c86G/IziKOooemmRTS6KdI45wqX2y3L4KOpg/91pgMtwXB
 tg1TjaFaGb/8BrzSrWhF13S5FuTzLOaudK05Xdq10aq19sauHg2Oyde3+o+a+uJJgug/w9i4g33
 E1Isl/bAUtKw+uQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Enable the pm8941 vibrator that's wired up on this device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
index b5606623f968..63180fe1d292 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
@@ -95,6 +95,10 @@ &pm8941_coincell {
 	status = "okay";
 };
 
+&pm8941_vib {
+	status = "okay";
+};
+
 &pronto {
 	vddmx-supply = <&pm8841_s1>;
 	vddcx-supply = <&pm8841_s2>;

-- 
2.39.1

