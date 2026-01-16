Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD33933F3
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575058; cv=none; b=UteYHCzEgXZcPIGAlvJQDYvKuvYDkLZ2OE208qOSWS9VC/GI6luhL4lEPLDr99asqnsYNKRpSQrNBvEbPT4CcgqQXTxHVcmi9iys0ZxLlGBe/ZDQaJCfBme76gj7Y5OOvvOemztbTaZ50KeELg29vOtsBChMMWxCPdfRSfy4Rbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575058; c=relaxed/simple;
	bh=ECsvfV6QjoeNkmRwISP9U3VOBdhyVRqc0C5tYiyxtrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1qc0jMf8LrB5sK02ISf5XQvW/a+jEySlyKywvw2BpYW9ivqKyxw2INXIeqDLHgaqKRbE9Xu4YYLOzGKBFfWYETPTvQVsOAHwN8IQ/lxVkZUec+ssiz1+W9iu3ptsbA9axCIbbPYBRzpRuN/Xu0KiMHVmWlGSuoBzmWuLcy6w8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cJEbdhGH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cJEbdhGH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b871b6e0c70so335310166b.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575054; x=1769179854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTdhlSQh9bgg1HQ8ddUGd/f3OaTyJXLPCOZMlEFvb88=;
        b=cJEbdhGHH6rxy3wFK9xhsc8KeJo9SeDaEyRWz2v7hb16lEPBaJadWBvfmWmzeYf422
         qyYgCba9F+SVxSKre2PK+WlgVBcDEMKTkjglfXHb0hRcUJlKsxXiQ+i3v6wTMMa19ubO
         NMZnBQXuhfDtVimOUeeqdDwLyANbHuu69lt91AXs3jp5pNXPHfW0oAdSJYhKm5kYJ6wh
         ddsr5TNu1WgYMLokkLzPRj1NI3E868nANpmLOxsRbH3X6DrRslJBRYcA98gz6yYdHqMP
         uCebs3Ck/C2xvAzCcWf8TDtL5bkNZm+bnX/FJDzqwK6JS673AfF18FUzrwXKeGhN0Rbb
         JXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575054; x=1769179854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTdhlSQh9bgg1HQ8ddUGd/f3OaTyJXLPCOZMlEFvb88=;
        b=i755ZLdaPD1sSJdIEIIPfe3dS2DxPY/Gm/JQ2jEuxrQ8YE5TIPvoVLTaOWvNxeSGr5
         uFs3aXlhNLleswtA73PR92Byqlc+qvy9Oyuts3TNNxIEzEkhKj9WF/P5edI9e1VjwTJn
         DhpnWnTd+B5xN1Y9TZLCF28QNnZ7tT+LuXFaBfc5RL2XDWVUcLWPGWLV6TL/esGkBC+s
         RjW/byEGwA3HssdGZXVm5LoZLuFoScH+f5gQMFvz5aSR8XKw8Jw3lS1tkkKSr+Kxfvqv
         8KglvR8rVv/hllDlSSQv8c2/IfjflD50O+IhAU4srNx3gqY36RBKM8y3DKsWXoh+AmHb
         cblQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWf0tHyDbljE5V2LVMw1EDMpZpgsKGukoJOSE6muRHY/AxJe/1K1eypu9eCqbcB+AVVacjxtSKAR1aKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUXC5tdh5JLRcqK5wjjC1Ykyh+8Nvolgo8pGnOnIM+O2EOUpPw
	hwDwqP/Tqxq2CU+jB5QokIBhy7+f5eoJTtf4Qo3SJITqTXyL5WxtUSeIgdEj0hba5rY=
X-Gm-Gg: AY/fxX4uTfWufEFGFd7M1MB+wvcvFZBA46htrLCKYN3js4hGX0roW7OEMvLg+8YQgTv
	KlDoceOegVA7ng5yu+MMIBUBwAwgg4L/nDgAYxtQK3bvHqmIFevkoOTe3MClrvQQccQmyGc/nr1
	BrpwiyEp3mAKas1MH0d2B5IUBOUOcCQTI6Y7IY/7xO4omJEs/+xdZpWt7TgRrENxTlJCUFPxOkH
	Xg250NWLHoklpfhBfkWz0mpeVnBcTAFM8L/5Iz0+++deRu+VcGVnroGTrqWHpaQw1T2ArTe+HdF
	InYZ9Hr8xIhqrhrq/9YYrQLlka46dFjgV8MpZAzZVHiOVqnGiT6+UdJozsuDyI4MMfD/rC3yiqi
	ZC8MfJbWlsXAskIx7Q1yXGIGRBrG7qfMn6QqKlhZI2YKNDx9lOw2CO7lQNaGk1IXirtRd2DSpBJ
	W/t391xq5i8fcOnDc4r7hqJxn+//mL/NlFkiNRvJ6SZiru27n8IlSxKH+geOI1N7LO
X-Received: by 2002:a17:907:c1d:b0:b87:205c:1aa7 with SMTP id a640c23a62f3a-b8796b7933cmr215966066b.44.1768575054091;
        Fri, 16 Jan 2026 06:50:54 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm2699427a12.10.2026.01.16.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:50:53 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:50:50 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768575048; l=5608;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ECsvfV6QjoeNkmRwISP9U3VOBdhyVRqc0C5tYiyxtrY=;
 b=7lXxhGjRCr8WtGvgaxkho7Yp5VCGBVEM1BfXLvX3i4NOkj71PFC7pJhHndMs9D7l76s8W1jyk
 JCu5+QRmj+eC4ATaX1KTJhRG/53uz8hwmtEGWI8EctBQWPPiQRLie0C
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
parts.

Thanks to Alexander Koskovich for helping with the bringup, adding
'clocks' to the PMU node to make Bluetooth work.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 52895dd9e4fa..cbe1507b0aaa 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -24,6 +24,7 @@ / {
 
 	aliases {
 		serial0 = &uart5;
+		serial1 = &uart11;
 	};
 
 	gpio-keys {
@@ -215,6 +216,67 @@ trip1 {
 			};
 		};
 	};
+
+	wcn6750-pmu {
+		compatible = "qcom,wcn6750-pmu"; /* WCN6755 */
+
+		vddaon-supply = <&vreg_s3b>;
+		vddasd-supply = <&vreg_l7b>;
+		vddpmu-supply = <&vreg_s3b>;
+		vddrfa0p8-supply = <&vreg_s3b>;
+		vddrfa1p2-supply = <&vreg_s2b>;
+		vddrfa1p7-supply = <&vreg_s1b>;
+		vddrfa2p2-supply = <&vreg_s1j>;
+
+		bt-enable-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -690,6 +752,39 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_uart11_cts {
+	/*
+	 * Configure a bias-bus-hold on CTS to lower power
+	 * usage when Bluetooth is turned off. Bus hold will
+	 * maintain a low power state regardless of whether
+	 * the Bluetooth module drives the pin in either
+	 * direction or leaves the pin fully unpowered.
+	 */
+	bias-bus-hold;
+};
+
+&qup_uart11_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart11_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	bias-pull-up;
+};
+
+&qup_uart11_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -748,6 +843,59 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	qup_uart11_sleep_cts: qup-uart11-sleep-cts-state {
+		pins = "gpio48";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart11_sleep_rts: qup-uart11-sleep-rts-state {
+		pins = "gpio49";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart11_sleep_tx: qup-uart11-sleep-tx-state {
+		pins = "gpio50";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart11_sleep_rx: qup-uart11-sleep-rx-state {
+		pins = "gpio51";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio53";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -767,6 +915,32 @@ &uart5 {
 	status = "okay";
 };
 
+&uart11 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 =  <&qup_uart11_sleep_cts>,
+		     <&qup_uart11_sleep_rts>,
+		     <&qup_uart11_sleep_tx>,
+		     <&qup_uart11_sleep_rx>;
+	pinctrl-names = "default",
+			"sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6750-bt"; /* WCN6755 */
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 

-- 
2.52.0

