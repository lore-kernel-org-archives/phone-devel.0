Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFE237416F
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994221; cv=none; b=UWbMoP1wXuKEtSEsr9xYvUZ0Jvj7omudQ40WQK+vfR+UIpA3zUTXlgyI6oZOFVW8x9289K751JXssnE82l6C4CabYYXKueRbVaNYzrraxd7cOolYZ07CWCxifZ/emxDGOfr762D+Rom8Ab+Q3KwQPF/y0hJfsnpckCvJH+qWOJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994221; c=relaxed/simple;
	bh=ZVeEkBuycOCd0nHZagbGIipxk4V8apZYhSoIWrKgIxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjoWpY/MnwJ08dMRBlagR3SkmmBwFd7apK/7ZZmFX0P1LDtAM5UQB7WvxV0+SA+aBig7OF+Za7cubnSdW/JiayiWixt9cMpuJN1hBES4DOF+lQW1ScMF2XCt9V0v5fKZi+rY/Ut9H8HQqpPocnnUNk4VPFjLfDXK0RoJ7vRpg/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wHMQTAaS; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wHMQTAaS"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9358bc9c50so211152666b.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 01:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773994217; x=1774599017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ithYjobQzMm/Lyd/lLjuU39YHOTs+QgqcfOEAIdEfwc=;
        b=wHMQTAaSD1Y0EbCxYN9+uCyj/Mkl2zKQu95II8JM9MaEsCBxonp6RvPCziwCA+vouy
         qy30y20vD6iaLX0j3Rt0jSLkJlCc6caimWPAEDkl2amm0uXl9Aa569NtiLPY9Yo0I+/k
         7hwt9iVk4fu5D6mXjLFQ7KiaGrINtueKNqq5uO4Nms1+NcqEDgmO+D9UJtcRhU07pWR3
         gMhIXjxG1Gbk8C1enWJZuo378JymQXkTWZlVKe6yOPhCqkTx8r7Crs1kur0URUaAR1uD
         cYRQ+5V+sYLmwPi5wJwVfI6duf3SSRkl07FDX5vQl08ItPUUEv6WKxPLVS6SU+jPcjSU
         VYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773994217; x=1774599017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ithYjobQzMm/Lyd/lLjuU39YHOTs+QgqcfOEAIdEfwc=;
        b=jKPiWI0hgACMzMcFyl40OmwadRQ2rJ2JTbC7UKEg1r2FlKMH+kYCQ8FfxqYDKEEeJx
         BeYs3PLSl1vuPPDba+EqM4SwPjTtuVwgf8iMwcbkIUpA/Y/0yPy1dHx/uxXkPL6KIWgf
         CdeRqvldqNC6eXyDkQxc/JWuiMHZ2czsmSCRuQMwBBWHk4UPz7K5GyaFFKgA91qqqQiW
         rNVhoft0/rxXqW3SmqjucLYIvZmRBrDhnug0luYM4xZGw4kNBUS9A0JKFOy5p6HtsA8e
         XuSjWeuuL0U7tL91pTF4PDxs4iakckFXhlLt7jADMqUMAsiuBRkJqLPwoATwIkshHS5D
         2/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE1tUyooWDuvKzhdyB6BcTnFWdKX7ir9+SPiXvdHwGx2a98sjVDq9xM8cezRYYqsPhMpA6+AFiqBAUkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDz24K9pv5R2UV0TBJwXVYN8zBlea7WpCHScurxchLyHq2coZe
	BCaDGcmrLr7anQ1wPATyQ8QtkbXuKEDw87iUuM+46DPGL2nAetrh0HiNIHCiaexAhMU=
X-Gm-Gg: ATEYQzwuNQwVjPK8DBY7MZhj+K6j6P0wT7nfumueVauqjO6K2AAJlvax717a2Uu/SLh
	Q/9ZoIFgYpG379uItk6YQ1oaf3bsJ02kePaBB7H8BWUAXwZcBMbqUlKsp0g+LSjCvvqrRQkGISr
	UT9YjAcTE2f8eO5B1a49FrfevJkV1AsRhEkADD0wlhpwCM1Eif3+TVvOHp60z4uM0k5oXXEPluX
	tdbB32om1XNQ3IVqDifQC2F4UoL5/y/j+OZrMZ4agdEQS8hwHZq33ZXKYV15P67/D+lEh6sDrFD
	/6OUBdibF2nwzZ9yS1MuJu9MbW+T4x+xztcqXFu74GoHJPKOAr8lii4n/bOKAX3t6EBMFdNqsq2
	NCtd1sbftVLBqdZkzM5+few1UfLLkVM4xXViOC/acoFXzOwff5SJwNCO1a2wmKPSmhb3nbuLAu4
	wVqdwoZlHXH3OykZxt7CpvhnUAfIXMxG/fy2/CZP1yd6MKzTJwRHVTmicCYObWgy7zyAO6MHyDU
	K/kgg==
X-Received: by 2002:a17:907:8709:b0:b93:81e7:845a with SMTP id a640c23a62f3a-b982f0c8097mr103281066b.9.1773994217357;
        Fri, 20 Mar 2026 01:10:17 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm121016466b.1.2026.03.20.01.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:10:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Mar 2026 09:09:50 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: milos: Add CCI busses
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-milos-cci-v2-2-1947fc83f756@fairphone.com>
References: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
In-Reply-To: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773994215; l=5346;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZVeEkBuycOCd0nHZagbGIipxk4V8apZYhSoIWrKgIxI=;
 b=JvH1cpPA8oAB8wBpZ+RQhMJ3ATTOrVsaqMgDVWm1E4tLVLdRVAMlKGR2U9b260cJctET0aTxJ
 X7F7wCWFdwPBc8CtVMlr4T0zpcbUeUWgn+O6r3BbeQx86wDFRryg8/D
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the nodes and the pinctrl for the CCI I2C busses on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 194 ++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 35248fa30747..4dbcd0147587 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1742,6 +1742,72 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,milos-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_CAMSS_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,milos-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_CAMSS_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@adb0000 {
 			compatible = "qcom,milos-camcc";
 			reg = <0x0 0x0adb0000 0x0 0x40000>;
@@ -1989,6 +2055,134 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio88";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio89";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio88";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio89";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio90";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio91";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio90";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio91";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio92";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio93";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio92";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio93";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio94";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio95";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio94";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio95";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {

-- 
2.53.0

