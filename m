Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13388C77B71
	for <phone-devel@archiver.kernel.org>; Sat,  1 Apr 2023 17:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbjDARft (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 1 Apr 2023 13:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjDARfr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 1 Apr 2023 13:35:47 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE0B1CB81;
        Sat,  1 Apr 2023 10:35:46 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Ppkp71fpzz9sln;
        Sat,  1 Apr 2023 19:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1680370543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hWiphqrZhkAwhsMq44QXsxmY4StgGMzw96DBVzGwbS4=;
        b=ddfzjzp0PySIkcifLTRe7jSBbikRLVMmx/vVPhivEQJqmeoUmjHKtx/4yubxbG6eLxxkgy
        vrUUtoZqOWH2rmsN/1Z1I3W0OyL11mf5o5QJcXQjETb1OV3dsemq8pTNRH0DtdxIoRxFeO
        DeoVWdJnz6G51tUZRf472Dfmy8N2mT0ALymrIGURdEq9WKPGzWRPPTI8il3ICrL9hA9Tvo
        K132rYq0DSkw2ctP5ZRIIqUPihB1GmfIZ0GmG/quWveANFeJ4Oyp1b/N4Tr97cgBRn1tbM
        4x3fgJxGJjtjCOLXmQ8nL372y1xuoqWYytZSQ+yjv/qrKQ3hx4jHrUESFO+pwA==
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
Subject: [PATCH v4 4/6] dts: qcom: arm64: qcom: sdm845: use defines for VMIDs
Date:   Sat,  1 Apr 2023 19:35:21 +0200
Message-Id: <20230401173523.15244-5-me@dylanvanassche.be>
In-Reply-To: <20230401173523.15244-1-me@dylanvanassche.be>
References: <20230401173523.15244-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4Ppkp71fpzz9sln
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Use VMID defines for SLPI's FastRPC node in the Qualcomm SDM845 DTS
instead of hardcoded magic values.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1f25a7f4e02b..dc4b553cbe2e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sdm845.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sdm845.h>
@@ -3372,7 +3373,8 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
 					qcom,non-secure-domain;
-					qcom,vmids = <0x3 0xF 0x5 0x6>;
+					qcom,vmids = <QCOM_SCM_VMID_HLOS QCOM_SCM_VMID_MSS_MSA
+						      QCOM_SCM_VMID_SSC_Q6 QCOM_SCM_VMID_ADSP_Q6>;
 					memory-region = <&fastrpc_mem>;
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.39.2

