Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003649;
	b=YmVX1eeZCY/+4uUBoO887vsdaDAE3HC83g4xffv6pIEQH12ju4kU4z/0HsR7TuWRH8lI
	 /MWSa3I6u03A2m5mGnmHgW+/4/TeOhNfZaRZd1c6U+3cCx4C1IFQIwdR0d3AEbrThOJR3
	 PVkPrB8uRPjlv7XCVxkl/0YxvIHj5GX7qXjK56022BzaOmSp4D5LIj3+jBOmsIfcNQQay
	 E8H1OQq552WJd04KPu0C3O164I6pZGuU77C7BG7TTvUu9AQgobLN2lKiLmJn4mheA7/Nb
	 qFnCpSRvvS/ndbRPlrNmSXhPyH3xDH4MI5AEfAyJeRZB5B8CfExZ2mVzbDD+qqihKBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3RiYetiebufQr59c1XKeWhbsUwEqVSkodNc50lBB/z4=;
	b=CKOLb1FvDdVyRQBn8iTkrP1x17u0Xx4cwRf5SCNMFI/0JbhJR0A8RB4PtnvivjMiZ1Z9
	 H0oG39tQkibpsP7nndH5tf9bV35TMNjjDW15xAVKWDvAY59WdTi2KUl17YEQDB+vJ+xNX
	 2++1w7tzxDTzvGAZDTM+/7jw/0KqeNfA4+Mn4t5IhHFBnjwDX1MYB409HTNxR+4en1ELZ
	 KFBp7br2A5njZkj24RMQkKdJuVQ/tIjGu5bKLp+z/U4vaGN1PjIP5pmpzVDiB91JcVwqe
	 G2jnd4pNQwq2795XWZ+L3esTyjWvV1Td6NDLtc7ngAJyp2WFIh5QVWcwIdxd9apvojA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbz4eToF;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA860A6F7A
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EA860A6F7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbz4eToF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so6790685e9.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003647; x=1795608447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RiYetiebufQr59c1XKeWhbsUwEqVSkodNc50lBB/z4=;
        b=jbz4eToFtbkmkcUjSm2s0E3wVNeRhz0CDifw3wn4or6WdNIk08jOTUaxblKrLn5VcD
         FTwP1k7GqdSPFnP2nBhEiXUYVJqQ3y/mY4HFGaCVJ19HlDsTxyLs0UOpxniALFEeWijq
         fca5783vNEPVW8FKdqsyhQN1dM06fA/akUSpV4tB4fiiuk1NESrIqIzeRNSLLBQxWrY9
         u9XYdjmlwfTmTu9YxuJ79GthES2zNxaqhBe2dCwqdcKR0I5hrSEBxc1gALwjtMQ3ML1/
         D7pcf+ff/bna9PSW4oTXdTP6gMJJtvF3RW33CvpXyroktqwL2wYzCUQlUPN+EQSrqj43
         WxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003647; x=1795608447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RiYetiebufQr59c1XKeWhbsUwEqVSkodNc50lBB/z4=;
        b=eKe14J8nsK2Fm21EzwpD7JnGOP6ABkDlxLqX0LOyb/GIAa6q0gSYt6rHI/Tia13eb5
         rI34StWA3oDl4aPifW6uINjAyhiih954yfFI9b6PD2G5SXeUNwvKUMiNMoIaiyemYjYk
         /feMjnLZfMBVJZeSjZe3FcKp/sKxFlRhS7oqFIMN5YqVwdeBio4COjyuuPsRrHOYzGe+
         piBD1MCR6LKlhCo+vsBgsgfwK7kkidtOSRcQXDcsJY/nZuEeY6P389L8pIh9ntriS0QF
         zWKY7kY9weY1TPcn81x/fKCCFg0aO36HDtBTHIBn4lc+x0miuXNX0qQRH+kpAn8diYuf
         0KZA==
X-Forwarded-Encrypted: i=1; AL+hErG4ZsbKBsVERSBJz6mYnCvA7WQ24fZ/4yEFP5CaAoG6pYBc8JyYRvNFkvUhWGYNNN69axfEGJFsECJTKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z98Z0DcPpfTjcz6+OlpUxhUJm4KOaQSCqyV7L1RgrbVj1J8ccRL
	x3I4mrBEpesW9y6Xewwcl6NFCopVbnBvH1S/aAdGfME7mDy8WIYTylQs
X-Gm-Gg: AYBFou1kKm6o0twAw4BG/J/nRDXcF9Ed1CgJL5PG35k32YsavsEZsnScZsOKPCupSO7
	gJFh3EV9Lu6gVDixu+SdEhQa0BY4bqc6xMkXpsiod9u04pmGBxWuombySSIhIOtv4LL9DJ2rOck
	xtMPgDhKP44VeZOHgbx6TlZl/Hd/qHkmfcdMasER7cShA5CPjH+NLtUm6L7WnEXF1bRLPqfnQAw
	7jAHvN7n3LthNT2ExWUuxWCnyQ0NxeI9DJHg+/dP+61svVVVpQCElnYJLmbSfJOSFNkGYS/LXor
	iW++tEOZ1iG5WARngwf9YLUUEWDu3/QSNWqEn/xt7ima+WB+AL6O4eV8IVa1P6CNhJ78av37FVj
	geOqfveyayjmgh9coKpwndegk5hYpkmvdMHTj47pRu1sdy3hkOVu/8T5O/fsCCBvUC2hzbSa5C5
	/AFMHj1ja8xyVBuvWPX093xdDypGGh2p3SCDbCyJGBSo1BXgJ2/JV/LwQ1Bbhf86dI2PRhyO7ml
	//Fvyni2eGWJbK74bzT+K/svwaOtq72k5cGLfmrVlb0VQVwy9rB9Jto7anUVxkLT2ono347/Qiu
	PvTzszaOWkWuLmVRoBRrb+BCzt86vcwxi7HtWgLWvDAFi0oA6+sTWAF4qzj1qa6czgvlY+aVqV4
	=
X-Received: by 2002:a05:600c:474c:b0:4bb:6a2d:b426 with SMTP id 5b1f17b1804b1-4bb7d5d40fdmr43108495e9.1.1795003647402;
        Wed, 18 Nov 2026 04:07:27 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:27 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Wed, 18 Nov 2026 13:07:14 +0100
Message-Id: <20261118120714.31505-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the QCA6390 power sequencer with properly voltaged supplies
and enable Bluetooth HCI on GENI UART6.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 12ca5ea921fff..3356099696a5e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -67,6 +67,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
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
+
 	reserved-memory {
 		res_xbl_uefi_log_region: memory@80880000 {
 			reg = <0x0 0x80880000 0x0 0x14000>;
@@ -639,6 +700,14 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <40 4>, <52 4>;
 
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
@@ -692,6 +761,29 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <8>;
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &uart12 {
-- 
2.39.5

