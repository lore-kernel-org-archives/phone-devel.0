Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4AE3A9618
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224534; cv=none; b=b1p4crs0iEqR8uaD6WlVMaDeL06pSaSFNwA1YcuFlCX2z42vYEpMWfVEgQJ+9/0iWCi/UTX61UbXfEf9gkYr+3pvuwDNgFfOF4rjS9fGDpbXpkQYgz5QT5qS891HaNAKypUSZDJsgytPiGBesh/TmIh5nTJU3GkF5fXznecwa6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224534; c=relaxed/simple;
	bh=akUQPIrMgPWRNFtOss4vuRIj1MAE0awNf856ZYFJhDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJ8mJ4jSIVanp0KJW3LWOTpxXpZQfsXQ7VwXgRNVitMVJaOxijZoqdq6zePdlERZGmdLCCvgfTZKF37wX2gIG7GAyOJoM4xp8fdhjxlYxwVr6xLHe2yKW0K9z/sr4Lpgpf4WAsjSnax6sME6JSYWikKYrOugF7ShanPQAKeuOK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1iJCghLn; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1iJCghLn"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b980b35534eso488203366b.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224522; x=1775829322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPHsiCpdUUXRFvwRdI2OtsPeWnYw906MZTDdwum5VRU=;
        b=1iJCghLnvgfSUtBrShdDy/L79Y4llpI3oHKz2+th4NqH//TI3YsOLlElBFTCFSwQth
         s2TttnLzyVCC6TT5Hqh0S3Q7w5CPh/XN94iAhtFlUExUFSEIhKsLbO4qZxCx6C5nQE0q
         mYH4j3uW0hAoLlm/RAE91f0r9igUBigZ6Vqrlln4t9KiT0TsNpxOSxrJWqwpJlCtFDKf
         RtbRRm3bQVdadj9CquFjAM//SK5tmu5HgRQ5E8pZoWo+WQKvdSfGYpYmmHumpTel/6Ip
         2V6Z0ARw/Lm6cLIx72YKxhq0+CVyFeXaRhyWn2yk33YEzdE3v07YnrkbVenO4wpixqU/
         bGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224522; x=1775829322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EPHsiCpdUUXRFvwRdI2OtsPeWnYw906MZTDdwum5VRU=;
        b=Ea78mkz/Ho1sRkzQ/l4NRdZGNOTIDbTTIYGHNZZhMnbzrbUUJ/e0nO/g6sbb7ujru2
         wb/DA4iPDlE5Z2+CtdZmdSNngko9oi33E00W+v/tGRm0yJ6YKujxrDdm1suQRaDuLNdW
         9hBHaXvGFgYnosT+YCbB7zTOzp/x0qJyo5qC8cngQkP1neY6Muh7Di1JleU4mHc5B6Ik
         j4LHJk0uo3FHNaWyPdVk1pqiNUjIrR7VajMXdM5fsjYyap+eryg924jjjjk7/uMzCNSo
         I2FNXVd93LMfUa5pbewy7Fen5M/XzKNW6u8GVv4oQsFTPr6FkDxJVUyB4q2q9HM9C1wI
         iHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHaEpoD3jC6L39E+DUf7zXSfK/1KqXeaSZC9/iMAMbSfNdAPfOKVvGLD95B/5KyrZappsb8uquIFQq4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLjFI57vLCSIfqeGHnppWMhhZdqohRpj3hMOhXbC4YMSzf3HA
	tAARF3SGdWQlNp8P/M5cGV4CKP0KlYV0/2fhm4LzZsWcwGL19dd7ZcO2URFEruI3X6E=
X-Gm-Gg: ATEYQzw/o16kGgmR9IquqMHZAAkzyZCVTuYjPRjdkxLlLFYdRlotZDgNk3SfphTVAvs
	A2T3osQefEzS0yP5GnzHpmXO8TEv/HbyoqpDqCOz2plboDLNSkypvGuJ1l6zwxLfJD0SrX/mKhx
	rhF2Yxc/4n+yWu/wW2AMBJi+Krp3x4dwJyVfDqFY3PuMbV70a6D2UXyJl9C6PTCFb5fD8+guaCt
	HZjgNJHWoogKqiDJEodjzPB1wipcmOjz+qu3gobk8azabmamnhn1LAsb9w0uwiq4vIpD5R9p5AB
	ePFVEWuFFT9hGvJmtpIxeWMF0SYU/fAGCM9xsb0ONYfUymLonjKhGEYbCKyAJ7WK0ijL6HxNRdS
	hjqhtCYYmbluhuPqblz9DvJ6+a+9MFIG0A1v8z9+lhZDR2F5Qq+Wh7GKwRB6HJ7WBh1LwJABzuM
	YVBNksdcgFiOSpB82ewt+FSCBbir8ix0jbRy0SH6QWQEKKNJJMYC5uae79Ee2N+BsdxbMFwRocZ
	cIpqhCD/XeGaDuUKwGCPdNsNdyDrQgj/bWEAA==
X-Received: by 2002:a17:907:3d56:b0:b94:231f:26ca with SMTP id a640c23a62f3a-b9c46fedc37mr308190066b.20.1775224522291;
        Fri, 03 Apr 2026 06:55:22 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:52 +0200
Subject: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=5650;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=akUQPIrMgPWRNFtOss4vuRIj1MAE0awNf856ZYFJhDg=;
 b=dyYdc5Ec1aiox9qFG4Riy10GAz315VOhkO2VRCASezMRP6RTMEzf6wuziUmcu2DsGn7c72cho
 P8++lG8qX9OCFoKmQAwkmfYwCfcltX0EMy6Baz9Am39oTehVbjctRh/
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
index c1899db46e71..db72418b7195 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -24,6 +24,7 @@ / {
 
 	aliases {
 		serial0 = &uart5;
+		serial1 = &uart11;
 	};
 
 	gpio-keys {
@@ -225,6 +226,67 @@ trip1 {
 			};
 		};
 	};
+
+	wcn6750-pmu {
+		compatible = "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";
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
@@ -752,6 +814,39 @@ &pon_resin {
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
@@ -810,6 +905,59 @@ &tlmm {
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
@@ -836,6 +984,32 @@ &uart5 {
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
+		compatible = "qcom,wcn6755-bt", "qcom,wcn6750-bt";
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
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 167 GPIO_ACTIVE_LOW>;
 

-- 
2.53.0

