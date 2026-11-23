Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438947;
	b=iTv4XZgPJs1K2euCnMHOlUa7neagxZDe0awVncQP+G5gnbw2LF5bNjBLFyGVEk06xboK
	 Xl3BCZBp70cdGdUYNw/lsTZXsBeF3SdTnzguMLgqF9oGioCkBF7pt0I+6VBJWvvrE8vrI
	 kQZk3P1LjnNnVysp3Q9Hcqp8EWRT1NtSs+1kS6tr70ud9tMEgX9lAna26UXWHcjwjQt/z
	 Adu735TPkQ9XREo/T4P99N/0IHSowO3WYAR00+lxr37y6AFDZ9v5RV6PPWrFHvqhZNzbv
	 84+ElJejC7CDlgus2eFiaFqer1PpJMmj/QWpHnunmQlYI0yJVi+Q1Qlrq4X9068LPtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
	b=Lo566kpvQu0OFSROBhHyhGmBa3WJu+DMQ+xTeGdpLdQbPtcl+9xgk+EGCyuQa263iJ8g
	 JjUcOnoLTDsJwomlVOSEGmjEpbNbyGKuCa3+7ZtN0oQxehwgq+OBrFztv31iceJGtsdyQ
	 aUBOlghCJTvAPPiQlnwURiKev2pcDEJm9qL3pnO2YVFmACd2SFzzkK8so5Gy8BRj5A5ry
	 KNDTCTzLsPb4eVn+7ZdpMAhbwi3VnZ6CbWFAbucJXZuX5oQq+V/4NVoY9qs4etR0vycTY
	 ernuoxkmVxk9k9jqpYNvd09lk1d3oYCcGq+kFpTX1Um4NCOBRXUMiaBH/MKktJIliEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+93h+Nj;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E59606A31F
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 13:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E59606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+93h+Nj
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5127c7abd5so517670466b.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 05:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438946; x=1796043746; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
        b=I+93h+NjMVPVj9yGSCa9Yr9/aLoxakDF33sxW0hA4Me2ZHmBigmgD3nvRHdVyy6Czf
         TA/CH/xVRgsZgVksQ6GlXxKXQMyND+oozcSLvV7DsUdVi2By+27y/9qKXG+i+00JbPRH
         2+KHo13vwZdmzbaFnGRiyzihcwP27TD3RrfomFbXAZorz6bUacz43tU99G3ycQ0LAORs
         T60Xd0qBHSzRgz5ln+D3CnLdPNMxPAqcmxpmoswe1W2kkMfVhTW3bEmWuelr475lx/Cd
         SwZybLGNsQNPoVMmgOulEj9ahnKNw9Jy0lOnJOUQ5mE9UAHbofILR8xJYb6M7RFc5kXY
         0THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438946; x=1796043746;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
        b=LnKr81fxUnkPZKmuemLUdMaGQM9MNGLosipCdclrI+UKnkCCisi2T49O6DB8AugHCZ
         VvulRgOUg8OveSIXNY6xkQ5kZoOBkSnfxAyUEpK2tg3S7daTm1Sc4mykfqm0YCgBE83w
         ISkm1oL4d0EjT16gzMzHAsE3eLeqKbMIPMRkrk2lLPqL1gp73bQGIkRDXzvGEWp8egHQ
         OlRQB893xvooQSlyPDnameJgPcF5rq8sfno+9FFfGv1CDMDK2vvBVsBDbya2nQwXhuTJ
         E9af9LtoH1otXHHWxHZsWsaDVD2sUkuaD1Dw+mDCeiU+pIH3C63iqj3e/IPQlF/JbEk+
         CpTg==
X-Forwarded-Encrypted: i=1; AL+hErGPVdCY6hebVhKQQG8javs+Te6I6HjpOLkLwyfxxqufByhfw3lhvhxhlTI8w8JtzbUqne7GFNI57MfURg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nGwLTc+bdigDUTnBu/OG9ggB83BEOMuWayEv7H1vaLWdG0Bvp
	B/ne0bwUEZdmWKY+vQ2o5672DFhWTlgIgeFHXSMH6Y0xSARCPpFKAX+c
X-Gm-Gg: AZFdTZfa2lR9oCRHXrkx6dwvpRm1fiO5V5X1RV61YPDKo8ubTQ/PVHNJ2pWwQoHy7zs
	xTZuPCbBEqEBMOe0sB/7aD1uDhQMimKKO9EPKn4l0+ekiWOb82wmk5Llu4Kbv9aupZwYJEm/0C5
	xuowhGc8hQhgXM/hUykQpwfLsfvjYCIJbld6kznMx2pUtvIMvlpjSs8f98wODAVXPNOi3gguBJC
	H6UvqW/6PWMVs8XBg9ShFE+mL9GufMJS9T2h+ONOrFupt1VKplEMS9G3+4Dru+S/rfXLWch9Sv0
	5Eal30Yir77SJeiAeThmpmQzqf5EdDn9h22whS1nwDP/IaHwlcPClsDQgngEqXl6zHqmKWTyx3y
	lccyVFEt8350vw5jvfUZMx+WBWbGZ8W2p9GT2t3uyCnSk7onvZkCe7xecdBjyZsunlpqn+Gshz9
	2STppKBttbCrx11S2A3XmCgkzboMHPhDpr0TvKUn+Ph2i0+7IOK/p8oWR7a9+AZ7wWIR7TVflef
	XwNMcBayAuRrGV+1sInM2nTqdJWIJsyTr4shOCCSR8rz5u/sdRQMLrTadtYsXIcQaaIgd2LODik
	gmxb0ILjwbD6fN8b6JswXp3g8d5evGcYGzFAixQrtWuW
X-Received: by 2002:a17:907:9584:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c513a88223amr879508266b.28.1795438945419;
        Mon, 23 Nov 2026 05:02:25 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm412660366b.25.2026.11.23.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:02:24 -0800 (PST)
From: Erikas Bitovtas <erikas99876@gmail.com>
Date: Mon, 23 Nov 2026 15:02:12 +0200
Subject: [PATCH] arm64: dts: qcom: sm7125-samsung: add fuel gauge
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-sm7125-samsung-fuelgauge-v1-1-edcdef00a6ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WOQQqDMBBFryJZd8CxmFSvUlzEcUxTGm0TI4J49
 8YqdPnhzXuzisDechB1tgrPsw12HNLASybooQfDYLu0RZEXErFACE5hUULQLsTBQB/5ZXRMnC4
 VSZ1ThZJEOn977u3yU9+bY4fYPpmm3XcSnj8xNacD+yfr7AhiCpLCWw7mbaFzGrRSlbx2FSNRP
 ePuaXVgoNE5O9XZwMsE57e5aLbtC13hJprjAAAA
X-Change-ID: 20261121-sm7125-samsung-fuelgauge-a57c6a0c916c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <erikas99876@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use Silicon Mitus SM5714 interface PMIC,
which includes a fuel gauge as one of its features. Enable GPI DMA and
I2C controllers, add battery bindings and enable the interface PMIC fuel
gauge.

Signed-off-by: Erikas Bitovtas <erikas99876@gmail.com>
---
Samsung Galaxy A52 and A72 use Silicon Mitus SM5714 interface PMIC which
includes a fuel gauge to measure battery state of charge. Add device
tree bindings for their lithium-ion 4,500 and 5,000 mAh batteries
respectfully, enable GPI DMA and I2C controllers and enable the SM5714
fuel gauge.

Tested on Samsung Galaxy A72. The driver reports the same SoC and energy
as on Android.

This patch depends on a currently unmerged series for SC7180 GPI DMA:
https://lore.kernel.org/all/20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com/
---
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  4 +++
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  4 +++
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 38 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
index ecba5be8164e..cd58f1449290 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
@@ -15,6 +15,10 @@ / {
 	qcom,board-id = <0x22 0x6>;
 };
 
+&battery {
+	charge-full-design-microamp-hours = <4500000>;
+};
+
 &rmtfs_mem {
 	reg = <0x0 0xf4f00000 0x0 0x202000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
index f18d03de1585..73a1c3b7facc 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
@@ -15,6 +15,10 @@ / {
 	qcom,board-id = <0x22 0x5>;
 };
 
+&battery {
+	charge-full-design-microamp-hours = <5000000>;
+};
+
 &rmtfs_mem {
 	reg = <0x0 0xf3700000 0x0 0x202000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 59ef4921f31e..5d854a76bb21 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -22,6 +22,11 @@ / {
 
 	qcom,msm-id = <QCOM_ID_SM7125 0x0>;
 
+	battery: battery {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion";
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -379,6 +384,25 @@ &dispcc {
 	status = "disabled";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+
+	fuel-gauge@71 {
+		compatible = "siliconmitus,sm5714-fuel-gauge";
+		reg = <0x71>;
+
+		monitored-battery = <&battery>;
+	};
+};
+
 &pm6150l_gpios {
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio8";
@@ -421,6 +445,20 @@ &qfprom {
 	vcc-supply = <&vreg_l11a_1p8>;
 };
 
+/* External pull-up */
+&qup_i2c4_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	vmmc-supply = <&vreg_l9c_2p95>;
 	vqmmc-supply = <&vreg_l6c_3p0>;

---
base-commit: 2c0da72bad5631bda9c70dcfbe3497a0ebd9f936
change-id: 20261121-sm7125-samsung-fuelgauge-a57c6a0c916c
prerequisite-change-id: 20261111-sc7180-gpi-dma-a77963d9e1cc:v1
prerequisite-patch-id: 70dc64e33232cae6744eeb11e8f53e099eb49c1f
prerequisite-patch-id: 1ba00e1d0ffd80fa49f64e8b627ab07ce9478e74

Best regards,
--  
Erikas Bitovtas <erikas99876@gmail.com>

