Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EBDC6FD1C
	for <phone-devel@archiver.kernel.org>; Sat, 25 Mar 2023 13:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjCYNvw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 25 Mar 2023 09:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbjCYNvo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 25 Mar 2023 09:51:44 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050:0:465::102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9125C11EA7;
        Sat, 25 Mar 2023 06:51:42 -0700 (PDT)
Received: from smtp102.mailbox.org (unknown [10.196.197.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PkL8q1x9Sz9sWQ;
        Sat, 25 Mar 2023 14:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1679752299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3TgYxIYBsgJ3DUHbxhjvEZTBfEJtBTwhr68FKDRs1wM=;
        b=vSqDH8ZnQUz8euuYmZwMrCoGtq7wg4GG8T6cOsHUKTy1cnf2nKrHtMBjchfR+MaNm9Ggz9
        sYHQAh+/xvk9GHTLAn0AifBXhoMLoWVW5yNmcok24yda9Pe6sZXf/JHu22XGDkK+SKOptT
        rfj8iZeUzcC51b7uqvCdTWoBFfnKohnRIkkRz+2BMgBjZ08PP1y5KArb86tgs7xhpt7Nnz
        hSyNRebNKy2YLkGaGkQcu+UF+84Lt1coy4SSUQyPfR6C5RY490DsxbfaPih1Qu90yPNmVA
        GNCwAKj95d9OyR51TZkwWZJOuE/a54se0+3CjzJZDFf/YceJVE6f43LxsAfE7g==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH 3/4] dts: arm64: qcom: sdm845-oneplus: enable SLPI
Date:   Sat, 25 Mar 2023 14:51:13 +0100
Message-Id: <20230325135114.21688-4-me@dylanvanassche.be>
In-Reply-To: <20230325135114.21688-1-me@dylanvanassche.be>
References: <20230325135114.21688-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Enable the SLPI DSP on the Oneplus 6 phone with a Qualcomm SDM845 SoC.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index b01542d79ae2..a14e6021c934 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -450,6 +450,11 @@ &ipa {
 	status = "okay";
 };
 
+&slpi_pas {
+	status = "okay";
+	firmware-name = "qcom/sdm845/oneplus6/slpi.mbn";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.39.2

