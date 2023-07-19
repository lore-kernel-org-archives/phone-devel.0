Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BAAC001B0
	for <phone-devel@archiver.kernel.org>; Wed, 19 Jul 2023 09:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjGSJmh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 19 Jul 2023 05:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjGSJm1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 19 Jul 2023 05:42:27 -0400
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [IPv6:2a01:4f8:a0:821d::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 882C110D4;
        Wed, 19 Jul 2023 02:42:26 -0700 (PDT)
Received: from lexxgentoo.devos.club (unknown [77.239.252.99])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by proxmox1.postmarketos.org (Postfix) with ESMTPSA id C0D09140121;
        Wed, 19 Jul 2023 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
        s=donut; t=1689759745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=meT+EQqITVdz8Y3mT8iZaYriOiIgKIZ/SrythyqBZfM=;
        b=g3fQ6MVH+lALdS5cvw4i4MMYv63vT6jEulktXl0irVwxNfF2piaumqExGRhLaGR2v8XLHP
        G9i04ioGvtwSplIICaNIUFncOeSXLnIcRLQ5oznIk+GnQ9qZnW1L5vHvSY5Mdb6snMyLXG
        plmxYKjxXmB5kKFV3GnaqiY84L8KsgQ=
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH v3] arm64: dts: qcom: sdm630: Add support for modem remoteproc
Date:   Wed, 19 Jul 2023 12:34:58 +0300
Message-ID: <20230719093458.2668842-1-alexeymin@postmarketos.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Modem subsystem in SDM630/660 is similar to MSM8998 and
device tree node for it is based on the one from msm8998.dtsi.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---

V3: Use memory-region property to specify memory regions, instead
    of using "mba" and "mpss" subnodes.

V2 link: https://lore.kernel.org/lkml/20230621175046.61521-3-alexeymin@postmarketos.org/

 arch/arm64/boot/dts/qcom/sdm630.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 2136ded22f7e..797625cf78ac 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1032,6 +1032,65 @@ data-pins {
 			};
 		};
 
+		remoteproc_mss: remoteproc@4080000 {
+			compatible = "qcom,sdm660-mss-pil";
+			reg = <0x04080000 0x100>, <0x04180000 0x40>;
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&gcc GPLL0_OUT_MSSCC>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
+				 <&rpmcc RPM_SMD_QDSS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "bus",
+				      "mem",
+				      "gpll0_mss",
+				      "snoc_axi",
+				      "mnoc_axi",
+				      "qdss",
+				      "xo";
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&gcc GCC_MSS_RESTART>;
+			reset-names = "mss_restart";
+
+			qcom,halt-regs = <&tcsr_regs_1 0x3000 0x5000 0x4000>;
+
+			power-domains = <&rpmpd SDM660_VDDCX>,
+					<&rpmpd SDM660_VDDMX>;
+			power-domain-names = "cx", "mx";
+
+			memory-region = <&mba_region>, <&mpss_region>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 15>;
+			};
+		};
+
 		adreno_gpu: gpu@5000000 {
 			compatible = "qcom,adreno-508.0", "qcom,adreno";
 
-- 
2.41.0

