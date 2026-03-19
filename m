Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C714C3A5438
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908614; cv=none; b=PCW1w9oU46k8tU7OLrplQzLFc1yuABjw4nWfm5raz86w2I9p4FligigNvKmc9BQbCpwLSxcaY3oJf2+s5/tJKExO7Jb7rIJkmmYyWjP5DPoQlRSoMyPOZKK3Trw3zP64S9ZGR6x3CW4kHNDDfZmis3m8ZHTRA2GDt/mLUtpKu8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908614; c=relaxed/simple;
	bh=DztUC4lS/7DD4vVPL63G3J+vnYcM9o3DQ762mAq/SwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSvg/1XLwIf2bpmC4L2UzndfC2+8SdzdEzcXgorLN6Ne+pikrTAhDau4cqRjdb4cggAc5/sc2FRpAUoIMYw4/HGh4bcxoy9bwku/VccIt6LawwnlReglzyDtXXVSkmbum+5nSmRuYWVYM9YRrGyYQh5IHYQXzmaNXRQXp/tW5QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4KSN+uUf; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4KSN+uUf"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b93698bb57aso122264866b.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773908611; x=1774513411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL/hyqTgwB/G3QPzkxaidzuCBRuVwzstO8c3gTas3yQ=;
        b=4KSN+uUfoH2Ifd5a/fLqnff1Ui43k3YzH8G+6CUx9jKMoJeiNLQAu3P7pC+2YW0v+S
         PNwsZAMbYFZIOac3yxhtHo6aKP1osvH3ReEYTKt7K4Ok/qP72Vr9zL5SVfFzRtV170MP
         EjwtZ8LPUo7X9YbtprC8vLoNguCC6xez1cb+Ilf1D1U9GuVKpViPiYKsyRZZMJAkdWLB
         lesBDE0p5smRLYWVspxg+Zg3ggQeoNg65h+acLeCVWaA6CGtXVRR+HQev0+v47+wbeyZ
         njvB3dkV2YXFi1VyhRFUVTBZlo6alyLOwMuFqjmP5C5D8Q675Ai9MJRinoBuse0Y9hky
         o7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908611; x=1774513411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cL/hyqTgwB/G3QPzkxaidzuCBRuVwzstO8c3gTas3yQ=;
        b=q+fts07I1YCGhyu1kkjWjqSH78Hy/GhjaodhkpYSblLSJfbYMhOFx3C0AkTTtAa60B
         +LuEWBe2e3Q926qPdPhwbyElcih3gUIG6Tw0oh6O9y7t0wPnhtLNSE7h7EhBqJINDEJ7
         DoZ8EDjFKUqk0FytKwj6Jl9au0+gQRTOu4ePx27O5ZHMVW9n4JFg3tlaStvm8urysooW
         vJmhyCYJoBhu4cU3M9dEM1FeEWSVUit++OkJjPUSc2Rz/VnzMyZRp5hQBBB+VcFg0kn+
         FM0WAq6VRXGNGjwww+Tqp/TRwTlbwXpwhVXjIa+4WUrXNa8DxM1o/b4cezr2AcrRJ2bt
         bxyA==
X-Forwarded-Encrypted: i=1; AJvYcCXIiBXk6j0BcKgwq6ezuTSsVnsC2KyuVCYFtzZNHYQph9YeG51xvPES717AMKTr2CvR6fA0pgolI5txhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTsI3QNyy3VXh5hmmqPPQmPfEs1KIadMDa9DfX8KVhZKb3I4F
	vcFwz3TJjRa6qpWNLkaJntPWZ/wcqKvnTNh1SEVUsblK8bbmsIG17pwWDyQJ8Pngmmw=
X-Gm-Gg: ATEYQzxSP2kv/8BWYvTLePABVqc02GCOr8YMnTAjbg6bNrIYB2eLY52z6OoM4mQ/xXL
	CzyahN2ptWW6i4VLfpTrSo64ATovv31CiOx8wemWa8y0TjCTIKEwShfxQDpx3zehio1pdSLN7Hz
	7sktZldst+R23MQ16xnfJFavFarApg51hZiLASWa4n87Q5z0l+Bw+QnZuORMoDEeRTpckVD0NCG
	le52Yny+bcwm5GK/rTyaLypc0Jl3qEXjSlCVHnJCX1l+rSXAhYueNXWIzpyRfxxmkLkSu3S7NhN
	+dfHjO2WWtdgkAAXW0bE3SUH7Nev+Zp+ZIxSIkSqW4gRBKI6cExS6ZfZrFeAAjN+hcl8vnSZ76l
	Gum4qujAd1lROLaXNXtM7/EbANGyHNQNqBoMpxk7O9UjvWu3xKBG4P+u6WODV+7r6Y1ynfOyxkt
	RjT2e3t+WxFIYju8Hzq/BXS7PhYJCGjxhJQGuMOwPNvsdIy6LCM81bsxFajUk5vJh7c5tSuu1Z/
	+kkdQ==
X-Received: by 2002:a17:907:86a1:b0:b8f:c684:db28 with SMTP id a640c23a62f3a-b980f982e02mr145214566b.12.1773908611130;
        Thu, 19 Mar 2026 01:23:31 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142cf16sm419743066b.20.2026.03.19.01.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:23:30 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 09:23:18 +0100
Subject: [PATCH v3 1/2] arm64: dts: qcom: milos: Add UFS nodes
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-milos-ufs-v3-1-b7c60bdd0d48@fairphone.com>
References: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
In-Reply-To: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773908609; l=4541;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DztUC4lS/7DD4vVPL63G3J+vnYcM9o3DQ762mAq/SwY=;
 b=sm2YyMqQvUM21AQ7DTyDpnJanoqPxL2+GlgoyE5EnJD7GmpwOY4aVaIt7y1zWdIC7m/77H5z4
 FdIRJahjwkqAN3vGul0NmjqdnVr8LcXexv/AlrrzGFK3BiHjzIZMAbO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the nodes for the UFS PHY and UFS host controller, along with the
ICE used for UFS.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 129 +++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index ed814c45ca05..25c092fae262 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -798,9 +798,9 @@ gcc: clock-controller@100000 {
 				 <&sleep_clk>,
 				 <0>, /* pcie_0_pipe_clk */
 				 <0>, /* pcie_1_pipe_clk */
-				 <0>, /* ufs_phy_rx_symbol_0_clk */
-				 <0>, /* ufs_phy_rx_symbol_1_clk */
-				 <0>, /* ufs_phy_tx_symbol_0_clk */
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
 
 			#clock-cells = <1>;
@@ -1152,6 +1152,129 @@ aggre2_noc: interconnect@1700000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,milos-qmp-ufs-phy";
+			reg = <0x0 0x01d80000 0x0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&tcsr TCSR_UFS_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>;
+
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_cfg SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			operating-points-v2 = <&ufs_opp_table>;
+
+			iommus = <&apps_smmu 0x60 0>;
+
+			dma-coherent;
+
+			lanes-per-direction = <2>;
+			qcom,ice = <&ice>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			#reset-cells = <1>;
+
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <300000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		ice: crypto@1d88000 {
+			compatible = "qcom,milos-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.53.0

