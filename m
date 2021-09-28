Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EB1C433F5
	for <phone-devel@archiver.kernel.org>; Tue, 28 Sep 2021 17:27:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50F0960FE3
	for <phone-devel@archiver.kernel.org>; Tue, 28 Sep 2021 17:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242063AbhI1R3O (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 28 Sep 2021 13:29:14 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.172]:11642 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242094AbhI1R3M (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 28 Sep 2021 13:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849694;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ate8aNGD9Y3BCuk05fnC9BYkaLgxkyM/iTTiZ0A3sF0=;
    b=Mj2ss7D55SJa/TKkyGzT129/TJtQqKt/TjC+gkU9d8Mwig5/DrMAx2n9Qkqq1DpIyS
    zSVImmkPEbTwY/4XzlmQbwFQ6or7WaZI9R9ie3H40QGxe8bvJ/OSb8El5M96i3l+/THH
    i6sgJIb6IWBxg0GpmkVTcFG7g6RmnUrvTLTjS1g+IRfv7UTtG6OaYjkmacUJzmrcziQE
    3o+LzCJMAjVvpA6T8ncOWwOcX0pwINz9NJrCgAWUMFIeSAirt+Xt7G8b4CdGcW8p5vvB
    FREZJizw3GY3i1lV8rhy7IcSLiwYv8rAJBLYukS4OXojCAZHsjytsIDCJ7HUmYm+qQx0
    mHvA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLYoBU
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:34 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 14/15] ARM: dts: qcom: msm8916: Add include for SMP without PSCI on ARM32
Date:   Tue, 28 Sep 2021 19:12:30 +0200
Message-Id: <20210928171231.12766-15-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a special device tree include for MSM8916 on ARM32 that sets up
SMP and cpuidle without PSCI. This is meant for devices with outdated
(signed) firmware that does not support PSCI and only allows booting
ARM32 kernels.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm/boot/dts/qcom-msm8916-smp.dtsi | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-smp.dtsi

diff --git a/arch/arm/boot/dts/qcom-msm8916-smp.dtsi b/arch/arm/boot/dts/qcom-msm8916-smp.dtsi
new file mode 100644
index 000000000000..36328dbe4212
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8916-smp.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/ {
+	cpus {
+		cpu@0 {
+			enable-method = "qcom,msm8916-smp";
+		};
+		cpu@1 {
+			enable-method = "qcom,msm8916-smp";
+		};
+		cpu@2 {
+			enable-method = "qcom,msm8916-smp";
+		};
+		cpu@3 {
+			enable-method = "qcom,msm8916-smp";
+		};
+
+		idle-states {
+			/delete-property/ entry-method;
+		};
+	};
+
+	psci {
+		status = "disabled";
+	};
+};
+
+&CPU_SLEEP_0 {
+	compatible = "qcom,idle-state-spc";
+};
+
+&cpu0_acc {
+	status = "okay";
+};
+
+&cpu0_saw {
+	status = "okay";
+};
+
+&cpu1_acc {
+	status = "okay";
+};
+
+&cpu1_saw {
+	status = "okay";
+};
+
+&cpu2_acc {
+	status = "okay";
+};
+
+&cpu2_saw {
+	status = "okay";
+};
+
+&cpu3_acc {
+	status = "okay";
+};
+
+&cpu3_saw {
+	status = "okay";
+};
-- 
2.33.0

