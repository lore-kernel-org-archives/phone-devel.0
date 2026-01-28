Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECCF34EF1B
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603221; cv=none; b=ukU16OXHzoFE/y0mOYBAxDiFYKpYvPsCiE+IFtEuI6cpv+kNstxw3qLj6kYAEhBZ7Bk0BzJ3W+Laq+1KFB1AMl9FnZPblRPvc+pJkrZmJSqSvKPs+ncw3qEUGU1WClTF+wVcLCZecEM57PTE25W4NRYHcNTYrfY5k3IgBaqpBD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603221; c=relaxed/simple;
	bh=DAIXJZLgc99QDCiZ1C54DNaCXxm8xbhdrA2aDX9YeRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FY17awzAqOA8gmj/8UelzMuZGGR77qRJ5G2JBiZ9qCfFuJs1iTEkLX94tNGAEYCzXFr9TYsDIL5Q0xfXaJKyde7Eh+tKyqJw9OMhNTT4a6+Hj4xNkaMLaNukaMuZ+ZCyiESZnmR0pbo6RU/bM/k+i9YgAlFuDFoyi4gbtL/NNaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uvxQFD7G; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uvxQFD7G"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b885e8c679bso831239266b.1
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 04:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603216; x=1770208016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J4Wgi9FdaGcRkgWW/fDa8if5n5CEMCZLtNv7Iii2Go=;
        b=uvxQFD7GYMxwquNMYkebdeSxCcYu27gMk+DnT/EhaanRubF1qYTscu2fNq1ZHHpYDX
         kZhUiFPCEvsz/Ysavx3bx1dCyhm9c/Eaa1YsHlW4KC+vaVmhxRe70cH55DuKkUfjkVhc
         2CfAuHfvkKnmsBawZc8Qhb1D3OmnnpJGfL7xD2ahHzMxv3/bxQ6BsoqC8r6n5mwm/Azo
         68C1AZmZiOYrcoEPZZErlOglpyyf4NBYmx7qQjEYranIgzjjWmbERx29aeByU6YRgPSx
         quGdMX6J9RbGAtvMtuXERw0t42VZQFKbrDzoe4/P4WqGCrbexuAnkgXlFNkXaLmT7YVv
         xW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603216; x=1770208016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1J4Wgi9FdaGcRkgWW/fDa8if5n5CEMCZLtNv7Iii2Go=;
        b=MEShl4iRclLCrks7y5rd4CH5jlVmAgrfBNS+R8njpIkiuGP/CZhomgNP3Km00C+Hcr
         rZa9pP3QOs1LzPCgCV6pRzmZ89iN2cwP6NAWFBPmemXGy4TTBRSrsUxbbH3RQ2teyCVq
         bVaPptNAmbElhaBgyzlZtLxqP1NO1jukKQXgRBSBKSYv91zGI7doxpBQc5NHFEDzAPlO
         9vOmkT1BPX5pewg4RIZXe8DZ0Pb2Xx09POaXWeoVLbbG2mKz9AbbvJ39N0AmGzO7tXf3
         m6I/iUAW6nrFEG+37dwu2O9x6puLT13AwxuHuMrVGwoSOtYb1myn6FBGW/osqn+jr+re
         8B1w==
X-Forwarded-Encrypted: i=1; AJvYcCXME40WUJDJXOhCEitYhaaF0lBLUv2cMi8Ua55NxjGxb2h58n3JQwO3uPN8nOhr21pYRQE0p/LdJDZCFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSLO8Qx341OyinLYcvaP7yCP3n4W7ziHrXsj1ix4odMmM3mA++
	9X7PaTen8Ddo5HgI2REG4YHWtkBshwiRgGX4pd+Ar4yTgiJBEhH5lSp+HOcz8B0Rfkw=
X-Gm-Gg: AZuq6aJ3vA9jV5nS1f2dJWEqU5kE6yHDn0lO3xu0LRx/hNFW19fF+REI37c2Dgls0zP
	+yrmVhZZECd7yOXGYDoUuRH/Y4ryjOK7Vmcii14i6h/feqfjrheCKAWi4MJw1Fewjf/w8aNq59j
	0qJOks8QoV6Zwrh9LryNmBzQFp0nWe4vAwHcAJ1OAYxFJls27J+dL3f3PINedjP9uucal/f1ZZy
	9Kcm911nzBWhxWS6ujLNR9rKEyjXpEllupXqDkxnVa8u8QDsmuhLQvmqdjKmT7YSo0DalwI5PXV
	N9DYRdFUYHg2RfegsSMI0mDmXHzZLnz2mJ6FE8tL/cNo6PE0ZD0TXiv8bFa08s7Px9wPtcQpnG/
	wSPBPBdf/QuCPGwb4TJaVMd4/shRQzWEMDnvARLSe7dEbVnXAG+nv7Yy9rpHHyraTaHpfW31nYD
	rcC531+iwGPvYdEmzmoC/ojCVUDPiOVajCxcyhBj/5AA4Mq5B5g4PXgH8LAqHiXpcgaw==
X-Received: by 2002:a17:906:d54a:b0:b88:7431:3942 with SMTP id a640c23a62f3a-b8dab331b78mr418073866b.33.1769603216171;
        Wed, 28 Jan 2026 04:26:56 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:55 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 13:26:52 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=2150;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DAIXJZLgc99QDCiZ1C54DNaCXxm8xbhdrA2aDX9YeRs=;
 b=D91UBY5cJfLVMutL2lsGmg1v4mvGKWsRzbXpEV4eu/U4K9lh0e5fm7C+ouiiz0kgmE3NtTPM0
 6L9OFAXNAvxDq12KGz1dCTCCPaJ3gME7iJyvbMthwVmtBDUV92lcK72
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add LPASS LPI pinctrl node required for audio functionality on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9b9f9af0da..b1fb6c812da7 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1448,6 +1448,72 @@ compute-cb@5 {
 			};
 		};
 
+		lpass_tlmm: pinctrl@33c0000 {
+			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
+			reg = <0x0 0x033c0000 0x0 0x20000>,
+			      <0x0 0x03550000 0x0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core",
+				      "audio";
+
+			i2s1_active: i2s1-active-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			i2s1_sleep: i2s1-sleep-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-619.0", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,

-- 
2.52.0

