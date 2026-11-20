Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190104;
	b=ZSpx2TD1yTY1Z+efZxZUyW7DcKAPbzx+0IFB1pZbX1dQOgbd1VcAirmZSyReIEg+XXic
	 GiQe4EHyVQvZ8Q1mlmLBnetuyy9b6bLWMJuTfFigPczycoynIvVMIUsjIf+GTP181AopD
	 YzayqEOYiUrDRyL/lwI2qU4GRmcqvXTzqEajZn/c7ZqiV+xVlsQDjYqUWG3TRlvfbcg18
	 vRUCg/w27qbDX4gqXAxa+myz5DtiFV2EMK4xXNnLVSSovF3oPwgywG86nT3fiZlBsOzfz
	 Q/pv8FV8Ap35fUYIy+Yn0HM3lH7dlUqGob/RqEQFINjhiy5ROHWWJw+uROBxy90UHqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xs8qsWr3WzXXJQ7Iw3lOFiXdEVTvIvytDHijgZN3pu0=;
	b=uYONGsbrSrCEfu0mEkvJzDWDtbpHN32jb+dJ4IjOYigWujXF7jsyJkh/M/gPLH+PrJS4
	 DOto7kyzmRrbQ00Fep0IUTwOpIy0WyV1uJeqWxupPxsK9FEmhfQWMFeWF+kD9iWRn8Qhe
	 rQRjIWJ5AFPEFo0urjxMitfKVnTpoWZGE0y84gtVU2D/xCbKlrRF7+kqtNgDzb2X1AvmX
	 wSxwbRQmZYBjOqJdkKr1WqbfSJjnSTkqKLPe2uj23+ancNywqBf52d+9tF2cJofu89cba
	 EeXTNuv/f3Yn6MyjKqVybMd+Doi2VuahmFt/geZidO9y9bOM0h4ER7OUsUK4WSBZkgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=du0gvix4;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249660A6F5E
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 15:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E249660A6F5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=du0gvix4
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so4464705e9.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190102; x=1795794902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xs8qsWr3WzXXJQ7Iw3lOFiXdEVTvIvytDHijgZN3pu0=;
        b=du0gvix4PF46UU8EW2IzrDZh9IoSmqO36VYXVJObJZaNizza++7PRBnMcNBGYXs/l8
         XnP3wICQc0mLrKKfZzO0pj3iLGFUFR+ckeLzlDjtA1OYmfHC+T8mRj9LkqLPhDA4n0v6
         49uRiBZxK0Roozx1BCz2ssEZt1V6XxbZN/xI5x2QE3VS+TGWdi39uXLyHt/H+Uk0299C
         wviApfX+8/oZ8l9eJHlopjYcGsJmRa08TPCeV2O/6Va2sJ8VaVupsnXekaqkg+hwzamh
         huB/hDb6W+RTwl3AwLpWnOQERIxDBnSx42xpsAUoc3lMm7nmuqfsaPoTr5zGoaIESvRy
         edog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190102; x=1795794902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xs8qsWr3WzXXJQ7Iw3lOFiXdEVTvIvytDHijgZN3pu0=;
        b=G4OJgi3QxsekHdncObyCEhluuEqkC4W/Pj1gGqK5bQV4LrpuHv2USzJiuA2EQ/L27p
         CIZgQBEKiK5B1mTbTKn2S1L8VGs7ZWLKCNDyt8S1LhEyPqSVxjgiCnFEEhvV9AgCrrDC
         51vqB0K9BV39UuVPm+Te10MRv3ed973CAY+ERsVElJKv5Z6L6SnA54L3/8InO7wKMeCb
         4PDwHYUKScGW43CqQSV5QVQ42Wu5rrnijMwgtpOxm+EiJc/DP2ERUAMUfn02o+FCZvHH
         PoNIMa7boX9Kq0GSavJTqCAOQ51ulv/GlBpuTst48kME9Q4nZhRqPY/oZX3LxnXV/qeB
         NEvg==
X-Forwarded-Encrypted: i=1; AL+hErE3Bl2UZWoeSAyVVTdpWIMtrIPxMMYDeCuhbducLD3TniRlCE9PmAX1QOigQv4/io2YUERCSf4RNuRl6w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0k/bE9K/yWcTfl9k0VgREsNKUF2y2Hvz4L9NgS4+soc89pv8A
	cSxAA2UPhEbRKHcZ7aF2V6TAtGJc1l6nPQ0KQUQG5g3ft34HOOIeJA1C
X-Gm-Gg: AYBFou2Hbc4jkZZHaQLfMQmIwhlSWZ0PjDW3/pOx2EU7F6Kato6KkLI8z85Er6rRV2Z
	0KDAzQV8DMjFRfu1Z72m0BpAV8Q6aTxtD3A2JgOERs3T6IAtyAvEwJ9k0/oSMHhuJ17oLsFZ3Bi
	77ccx7+YUprM/58NyHK4Fm20PrKMV/xppXKwmDHucT8NkqDbCAdyE/1OwXeZDE1ggOHcOdvKalo
	xexy6b5l44b0bp6f3CXsM2qSbd+g5s8aJsl8dhU+LiQRUC18Vpw8pwU06awKnVbRrQX39p70tGJ
	PxYYvkSzGuDsyntUo49Zh3JmcJZd4OSphNCnQeJ93Qa00UBPXGBt5vzWvpHcanysBgr3SG2n4Nf
	iVC1fSZw6imhSzqqSU437bd2UWINp6oZIjatWpp1yxDDRdH6/FoQjoI+V2+F95CGhKuWg9am60o
	g3E8ggIJKMZsH4O3nM5rO5CdvYbniM9ee1Roa07VkwVIZg0USkXo7pD4AMUhTK9TOuGHudFKd2w
	TNcQM5OK4C0gJlcquxr03ub0/xPvX8cpz4/Dkiq1IeSaO0bH3jm6U7JjrstNe1ATXcg8wzgWE/X
	+o60qCFG3Cv5nM9rA3XkR0uNeqMMK0xjiVYT+qaiGA2Ez9ARm7Jx2PhH+PhAHIx7aRALZusvpfw
	=
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr81647945e9.31.1795190102271;
        Fri, 20 Nov 2026 07:55:02 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:55:01 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Fri, 20 Nov 2026 16:54:49 +0100
Message-Id: <20261120155450.7719-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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
index 16ed6b3871374..66cc2a0a57124 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -65,6 +65,67 @@ key-assistant {
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
@@ -633,6 +694,14 @@ &sdhc_2 {
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
@@ -666,6 +735,29 @@ ts_int_default: ts-int-default-state {
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

