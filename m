Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58A2C4167B
	for <phone-devel@archiver.kernel.org>; Thu, 18 Nov 2021 21:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF61C61A07
	for <phone-devel@archiver.kernel.org>; Thu, 18 Nov 2021 21:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhKRVF4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 18 Nov 2021 16:05:56 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:36954 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233205AbhKRVFy (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Thu, 18 Nov 2021 16:05:54 -0500
Received: from localhost.localdomain (ip-213-127-109-54.ip.prioritytelecom.net [213.127.109.54])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id E727BCAD7C;
        Thu, 18 Nov 2021 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1637269373; bh=MiE+Odw8LejlaQe/AOr6z4tZi+RYMHJyotf1y9D3uqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IcSTjBOWb7q6k3OqTHaaeaM76bFQsd5Eko9oMEsoEbcE+ONdmW8dcEv1mtYmut/nX
         frOqtsby94KkulZ4DZ460Aa5eQBjv+PucvUXlMaEl71J4wHqfRtX5t+oz9VDjr4lqz
         kkkUw5Wxgwd6jooEmWQ3RHCg+LHyIl+wFmNB7uNY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: qcom: apq8026-lg-lenok: configure SMBB charger
Date:   Thu, 18 Nov 2021 22:02:07 +0100
Message-Id: <20211118210210.160895-4-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211118210210.160895-1-luca@z3ntu.xyz>
References: <20211118210210.160895-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Configure the SMBB charger according to the downstream kernel, some
values are rounded according to driver warnings.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
index b19522ad91a0..4e7a596d6101 100644
--- a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
@@ -209,6 +209,15 @@ &sdhc_1 {
 	pinctrl-0 = <&sdhc1_pin_a>;
 };
 
+&smbb {
+	qcom,fast-charge-safe-current = <450000>;
+	qcom,fast-charge-current-limit = <400000>;
+	qcom,fast-charge-safe-voltage = <4350000>;
+	qcom,fast-charge-high-threshold-voltage = <4350000>;
+	qcom,auto-recharge-threshold-voltage = <4240000>;
+	qcom,minimum-input-voltage = <4450000>;
+};
+
 &tlmm {
 	sdhc1_pin_a: sdhc1-pin-active {
 		clk {
-- 
2.34.0

