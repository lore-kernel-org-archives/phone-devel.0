Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD933C25B71
	for <phone-devel@archiver.kernel.org>; Wed, 25 Oct 2023 08:42:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234006AbjJYImO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234092AbjJYImN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 25 Oct 2023 04:42:13 -0400
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD167136;
        Wed, 25 Oct 2023 01:42:11 -0700 (PDT)
From:   Stefan Hansson <newbyte@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
        s=donut; t=1698223330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6r3dSHTG8MJoeBeMsRc4og7REhXyB8UTCzvH7ydN/3E=;
        b=adHunTKc9d920qaqb9go7VoYx4Y0Xim/PsaK2W0MtQbfJbmEt8EkuCqpcRE20aPVQT6cnR
        j7+p5unkDJpGRwIqMx05No79mkXF5R8pLdgdlfNJsaiF+WBI0IDnpZV0KMsHwINlX90X/b
        ntKRDMdggvr/FBOQN/wlNJyY4yZqUX4=
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
Subject: [PATCH v3 4/4] ARM: dts: qcom: samsung-matisse-common: Add UART
Date:   Wed, 25 Oct 2023 10:37:52 +0200
Message-ID: <20231025083952.12367-5-newbyte@postmarketos.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025083952.12367-1-newbyte@postmarketos.org>
References: <20231025083952.12367-1-newbyte@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This was not enabled in the matisse-wifi tree. Without this, it is not
possible to use the USB port for serial debugging via a "Carkit debug
cable".

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

