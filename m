Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F162848BB
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570749; cv=none; b=kPjyg+ohumw9uhbR3OftAAdESLK+XoZSQLO5W50dmgEzhcU6lV2DDcW2mxgDTeeKwvNcDifiZ9B5xergyB3visRunbVo8LXrbOfxJGeNsIIMofDdBrf5v2y6wT+LgLrF+oXemdFEOC4p0JhjeETHQSgaCqIfsJSozfIwtS2ksBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570749; c=relaxed/simple;
	bh=WtTP4Q+pd0r2GTIiE/rKycdBfVnflluT14Fgkgdo+hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NNbws5JtEmiOFMBy4C3w+3qVtKvveEyDCx3mKa9WWIrRsarUsT5ZSUgtXUn+hnDX+ikY4pz9jkn5ssXvkNkgLck3uHZ5n43lDp81zZiz/Ndd10rUrypxMfbrViJOUlwwVYANm3iwVIKLXIEg0Q5FvsQlpBoitHBQV5v/lkOOA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Zp0nU2+W; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Zp0nU2+W"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so3962872a12.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768570743; x=1769175543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4iZQThVl/1y89JJfcylszV4UE/kUt8KV2BoTPAif84=;
        b=Zp0nU2+WHNWeWn0jPZqyl4s7FFj2S1DvQld4vE++8ePJpSTwqTDTa+EhqSuXYN6bQq
         o4q/PobBxrdLuFRrR/Rk4/3z2+0X2zxAF8s+QGTsjldE3ahKbFPtJvj753RwA/003eFb
         IuwWUJZOTr+sLnNT/0s8+wcdzOwsDqFpb3D1ZCza2tcI3KcIlnMEDKTIlyqHjRq7kJxD
         6LhWr0Ro9a51NZILVMISk21Js/1eO5zEXJqGkAXBzFfnBYNEEA1upitzYbjB4Fm17MJM
         6TuHuNcuI4h4xQI755DzZMhDadGgSubFNHZzdg7MOjL9EnRwGpp4CgW4uTgWpP1SdWP2
         SQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570743; x=1769175543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H4iZQThVl/1y89JJfcylszV4UE/kUt8KV2BoTPAif84=;
        b=JjXqEIDgqHIjpiLJgSzo81R0iv4wHTWIFzZHVAz4tRbtKbue6GRIVTZhb7z+/qnHGV
         HCucw3gpVTtZpgpnQPJRN8W9x/2IbJlMrnaV+dC7kZFQcF19PBo1fXOlg79ZpNi5Q+Y3
         KmhnbIqalMlq+iqHRYVgi2xrDE14+M4gH7j5SNvafdB9F7sjCUPkhSVOMHWGUDa8nuLI
         MKnO/kd6hICPvz9k7duLMeGs8e3ixWKZjMkAeq/jZJ2lzaHxX0Ig0qCaKhV87LH8gnU9
         QWAMrVY6xLZlXl6Z5ao6l160Mg1wD+bqzrz3rFnky6vQ/lVps7zusnSkcaZKUIqAWUsf
         f0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWNjSZ0ADikDhnYW5CqdJw6i08eA0yASEahrQKCuwswHRT4EriOSar0QnEMdlHLsMBYMcwJvtwEQ8LLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPusW7QV5NLGEGo5gobWewaD/NxUxAKNPrGV38hZrA1+Th4nG
	Ey2u7LKcBro/affDnpar+KJs+88j/EG3skTni7EByhXRugnbSKuNxwNDcqB/9kYnXs4=
X-Gm-Gg: AY/fxX73glOblGiDbqmR7mBHEbWVZlCv51G0RLSas69pUNDYgmxhs3YZHpzpZwP+qjr
	uIqSukD2XGaMzJZ5WMrrNP9jNgsR2rs6JCLH7KbTUH3rMmaJTT9QQ0pUWgTuS3vg8jz4G3QffWT
	exxc09Jv3NYTOWqDg66+XWw3n9L7mrZ+2DUPz5/rm0y0PZpqyMVa/bCGgPotJiqLQoo9Xz73WBo
	FEeQPp/uQTxKHZFfZYorbUCf81fBrrJzyhelJgpiBTR0F2FwKyWaDd1iMibU4kZt+lelgzdl/tS
	1EKW+HtxYj7XnUJITInGEcKrsqcGUL896NXLgEr7kumHQJ4edQ9vHGPMIeSWI0ZRf89J8PlTSo4
	26yvOLLiiZiwaJk3VMcr5Hc1dE+/7JsnzXeC4SZYpmX5nkO+kdMlmLLAJyJQeC3toTs3sETHK43
	Uok7cK+BP5sKngfQfwIJZoJ40FH7VgbJn57ZgqXwC3Y9A7BR/rmBUHSUdpQ9AN7BEX
X-Received: by 2002:a05:6402:430c:b0:649:5bb4:59e5 with SMTP id 4fb4d7f45d1cf-65452ce39famr2213004a12.30.1768570743300;
        Fri, 16 Jan 2026 05:39:03 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8b7fsm2495528a12.27.2026.01.16.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:39:02 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:38:58 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
In-Reply-To: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768570739; l=1663;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WtTP4Q+pd0r2GTIiE/rKycdBfVnflluT14Fgkgdo+hg=;
 b=Tlm9u6xt3xaLwM3g0YMIG/P0gmiBgjT0e3aiXa0JdE+oJH4t25lUsvfkeLG18t+EgT3l2SNcH
 PcEmJt/N5cADoY7oz/lCZC+XYi3k6OjJi+w/AD6dm/jT8cEHEfhCvRR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the CCI I2C busses and add nodes for the EEPROMs found on the
camera that are connected there.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 7629ceddde2a..c4a706e945ba 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* Main cam: Sony IMX896 @ 0x1a */
+
+	eeprom@50 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+
+	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
+};
+
+
+&cci0_i2c1 {
+	/* Awinic AW86017 VCM @ 0x0c */
+	/* UW cam: OmniVision OV13B10 @ 0x36 */
+
+	eeprom@52 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x52>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
+&cci1 {
+	/* cci1_i2c0 is not used for CCI */
+	pinctrl-0 = <&cci1_1_default>;
+	pinctrl-1 = <&cci1_1_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	/* Awinic AW86016 VCM @ 0x0c */
+	/* Front cam: Samsung S5KKD1 @ 0x3d */
+
+	eeprom@51 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x51>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
 			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,

-- 
2.52.0

