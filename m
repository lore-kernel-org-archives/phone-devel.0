Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107276;
	b=azYiD8x6ZbQJ27BY9eAD/LEm7mxg3Ujv4C+6i+Z7pU7GTL44eGEXvMlA4ZGpdEOrilR8
	 a+9oI9EEuIrJoFpQkVFi8a70kIy8EEuSE6bQSd0GxpEl4WmH3spCGhW/fRWJEcQ9dWLoF
	 ItG399fakal85aSOZ5MbGtepx7BTJc0w4sSumMfKjGQYHTCZLZGwoUBoBAtpbXQz7gPy/
	 Eu7nE8MC9JiaQ/yXK5GAS8bClOMbX+uQfZFFFgnjq7NVYO0K8yuiVdMJNvxTj2g0a2e2+
	 uva+87LBoOh/voJQaWC1Z8wG+TrWK/SaRrO9C1pqCygwdw59QuoqDfGw3MiM0kmMJiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
	b=mEdwVhjYXxhzBxu98W7nuN6o4DYzh5B3F+YSuKMvoZvjQpi0KqHl+pE8DuJvTB/LhW/z
	 kns2Q8COPv+lc8SOmizhqSPYSEmQiSH5w+HRbg//HaPJsL48YjCprTwDaeRgTLc0DkrN6
	 L454/gQ/X3pgxLi2AjPYEfdr1D7xeGhYghB9PoMo8rWkNIi16r89CUWLIUuNe4a0DHJuw
	 Yc6Exuftx1MT8xxoK4bYo2aXEQh+wMEjLOL8K+7Ql7pU0jchq9gzU6kQXjKSRGbfUO5vB
	 +XtzluXEl8X8w8e6IMp/+OFgBrnp5VqTIc44FEzaQ/Bi2WVAdU8yVP6jouWoRTgNE9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nrx391Qe;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669760A6F7B
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6669760A6F7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nrx391Qe
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so19449835e9.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107274; x=1795712074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
        b=Nrx391Qe8+O8LqOtDCxu0O4VfUEM6BMWsAQwTIo6k8TAeB/r7c7TRfxpIZo1divfz4
         r8tO2cydvdc/MU3hs6payqwcxFAz9jPrmXFLNOdrDAvI3N9j+cXAVx2J2yH2FUrhXRea
         K+jyFhiVfTiha3RQw9kkuX2nQRWcBS5adNGDMSxkH0QsFJyVRSHwUMpxaZxkGUbgDGb1
         6b5CLWS1UAN4WZ2Ws7iiTdWqW1mRUPWrNVKiSTlA8306egVDp8KG7vtlPMrUmECR3+ny
         CjReWy+0X4DMn9i0Mmy+v/siVTSLv7Xb8hx/Gp2kpi1xdliQfdCEUV6OtE2fncCVBnri
         SGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107274; x=1795712074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
        b=YIGyaxkBy5SYXcknA3LlNG6253DTj1zcZy9LSMmN+IR2Id6/fFHVPMfhV7qGax2L+N
         dxKUCo1s2NDgiP5IIuNJ+AIqcoIGh04THWgSeqjl4mmWL5mE81tPpshrMsqP9oIYdVJB
         qwSZiqYH6Pu2kz23tYTYWDzk+ysZWW+TgvwMQviIgZd8hxTCRIA3B/oaYl/pIOtBh5CS
         K1cbema7Q8t/IMLrs+R12+PJXj4LXCsrqgzgSKJ3v+oPy2l1qyMIL5arKdaQQVfzD2pu
         gbtwQ1wxdo5Bq1p6lT43vpm33Jf1Isfl2vy2sSaR75isJRZkH8eUYkEU4eR9Jfz/eAnl
         vZ2A==
X-Forwarded-Encrypted: i=1; AL+hErEseAza6O318D1GMhlzgpZTpMNnDcdcJaT6E99dcHNzj0dbBi/Vx3Cw870hFpCWmWLG/u+3udYtqoVXWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yVksSKuIK49bt055o4P2ZpMJHztWaTc35tS8LJIh4zPDGDxJg
	OHT7H7oklSc0sEUb154w9364WLrjxwfrHzjGR8VJMebNOz8+S/dRk/UO
X-Gm-Gg: AYBFou3AQhmvQ1CMIgPeQ3NnaBo5nhzPE4ZdOMAlB3JCVEQLbYcrzKy3BD+0JniTAeg
	zmNw0k654ekFq05dLyzYBHibGOcsX4rhV2ExhSGeS1J6j9MrK66op71FQUtBNL6tPgC1q3Po/1f
	S57M89I04OpgDUgaeTJDR4dDnnWONBvWMJ7tKywe2vBow3NAIIxmOKC3G13txS/Yugu7my/lfOk
	+U5jmmFQiZsP/lGKVEMnGqRgiI94BwGtqPVVHYM8B+ry205HsCz3SxCGmT2FP7k0wfiRhKf9r1a
	EHqfcC8M/bMFAwbx6W8V0THmZNMoo2ZQ2g4lAhxxKcNgs3fQWhgSpsM+aRF9f8F9/7Q+BIu7Zm5
	ziXstW18SBw5WoVATeYTVwBzLlsxdAVQgZmgTOeUFK8Jdz6/XzPRFPbGkW48q5Y1p+RHbOnWq6P
	iEXmh38Lmefkcl7nmcDQMb/0ob19WweFCuANM70E7E3gDPORxrgzP1B2rMZ7U5YSqUTNzmTNOB+
	cqnL6Wu4DOAV8BPq0kkW1RwOpqIwVdV8/1ahFwJBtaLFKUcTVgutG0uwvZZTjEG5wAZbjVjrDYE
	X53omGAP4IegMbuGvKlw53xPazd6zMCl60uG/qZGK20Cm1WvgrXaMsObaTaVOeO8m/x8y2Cg1Pg
	=
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb8880abafmr2552105e9.9.1795107273824;
        Thu, 19 Nov 2026 08:54:33 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:33 -0800 (PST)
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
Subject: [PATCH v3 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Thu, 19 Nov 2026 17:54:20 +0100
Message-Id: <20261119165420.24466-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
index 3ce8161574a95..1426ce82d3f58 100644
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
@@ -634,6 +695,14 @@ &sdhc_2 {
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
@@ -667,6 +736,29 @@ ts_int_default: ts-int-default-state {
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

