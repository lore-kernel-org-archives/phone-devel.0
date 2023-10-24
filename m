Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF121C07545
	for <phone-devel@archiver.kernel.org>; Tue, 24 Oct 2023 20:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344380AbjJXUzk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 24 Oct 2023 16:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344341AbjJXUz2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 24 Oct 2023 16:55:28 -0400
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [IPv6:2a01:4f8:a0:821d::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D359A10D5;
        Tue, 24 Oct 2023 13:55:20 -0700 (PDT)
From:   Stefan Hansson <newbyte@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
        s=donut; t=1698180448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WyL/zzD9SEbdEVP0sS0d2jVD0oYU+zFu9fVpTgzQOmE=;
        b=SOB6I4MEfwEiUdEZZlDPhXLfoW42dnJhtdjDII4/d6BwKVgSnhzcXTvN1J/KE9kXHot94B
        lkkwp0eIo2G+RkZ/RPcdqkqjCX3bZ+rjRq/wnd4u3LMsV111AEty32B4KaRsQorYLo3Lxr
        7P9C2J35wZRH121waAdu48qE4bgy0UA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>
Subject: [PATCH v2 4/4] ARM: dts: qcom: samsung-matisse-common: Add UART
Date:   Tue, 24 Oct 2023 22:33:45 +0200
Message-ID: <20231024204505.125813-5-newbyte@postmarketos.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024204505.125813-1-newbyte@postmarketos.org>
References: <20231024204505.125813-1-newbyte@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This was not enabled in the matisse-wifi tree.

Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
---
 .../boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
index 11fec4e963b7..35290ce63b40 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
@@ -233,6 +233,10 @@ muic: usb-switch@25 {
 	};
 };
 
+&blsp1_uart3 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm8226-regulators";
-- 
2.41.0

