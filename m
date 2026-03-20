Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D0374160
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994221; cv=none; b=QcX7JiobfLcBBvpR0LPo7ba/eobWJpvopoW5QqTRw/kHherW2y8ABYJh6oO272/ogu9hPAj8/i6g7wyQWRPPt/baU3sgcNzzUZXpEWHWmzYYZir/jgbfBgcEcZCH55vl0rAc42ncPEU198xlcYa0B9VFF2Gqe6CFW8oj8M9zscQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994221; c=relaxed/simple;
	bh=OOBMl6N+6wWq4VI/kMem7gKFfbgc3xAME32xiW5QX+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HdzbCextdzhdhy6D1e8xa1qLBVzRH0PUuCLePOj2PGmQhgNiexX+1BmKm+7NLNajs5BPOuIKoWU3MQWWOKzKKixQUOfG+jUgMb35VrRYSmrl5vFDMB7TYt7z90NPs2dFUnUgWp+D8mbiRQxLN7BT6pjq0fsRA6RIGc/NB3Z3GCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4fLtUZSh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4fLtUZSh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b980b35534eso312187166b.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773994218; x=1774599018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xz0m8rU9A280bToU8IuILL5Mw5gJnGqIrAD0/ydeaXM=;
        b=4fLtUZShdAuIn9+mW2e/IYierHJgZA97eTd/3tmFFEmhLgZSfTYDHArmzx1JBZdzi9
         cKrXgmNwG/muGDMFYKeecZXsP9a9yjBvvLbIQOdv/sEqFpesqwcoGPDm7HwonxNF+bpg
         cLDZMR+tZ/bT2fdUQx1Jjiyk3nsl2pCT3YbAWVL9mKO7uFeokS3ShmA10TK0aGs2pskH
         e00BtKk74/gv6c+Z8p1xJj8x/oU80MhUH+anagd62XdHvodaDN8s/2NO26q8XOPy63BP
         zl2qdDzkSoBI+sKPzsKTX95dun5JZeXfDBiN+Sy6/5V42m8HjUoaFzJh4dKsX3gE+qJ9
         oZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773994218; x=1774599018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xz0m8rU9A280bToU8IuILL5Mw5gJnGqIrAD0/ydeaXM=;
        b=N6L7HfFOlW3LNZhIc5tA4iy0k3i8Izu/keYeQDNDvCzxjDqYIy0GUyCv1egM+vWuXB
         IrrU2YQN3nFFIouaDix+okKquTPWyGbq/F/yQDwmLHgahOGkr+j5Uem7IaMpUCBn7bd/
         LOOZmh1r+KTUHR6cWCML7/R0GIk4MOMTKpyEiW4zrBpWv5HxP4yrY77/VT2EodAgbbwg
         G8bJJoISdDFHvgSWEP8pytOAeZiV0vvgJrWnbujTqTaeGwEnq5M3ji91sBTE76derPrI
         8uHfPcFiDMJyAs60BVeBDSZW3wmNx9aCbnJzs295LKjQ9yrUh8YMly3lDj3aFeYnObU9
         ia0A==
X-Forwarded-Encrypted: i=1; AJvYcCVOJqq+9GmXKP44FGhAG+s2c6pcQ3//u26BXS05BOtjuyHtJzC0pDIHrIzv5xlw527mYWQP3qtD7jN90Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzALIBJ80LC/5nQ+m7uYorXdAfFAzDUkODFEmMwbCuSF10AvJWr
	cX+GVU0MXozAP91wFA9zCyNfe0/6jDQF5WrjvsBLuatG7f2SQ9VZY7UHsj4mBUnvPfM=
X-Gm-Gg: ATEYQzxUe4lL0iTVCgwE54ACIXSbbM9wWjFscmZ/AzVwqLcHTIoEbb7Du38F1vW5lRc
	BXKQXm9WNtke9avyx3vN8eJm3EdZ1ZBok005Ci6tItiVE8uWWAOnECzbEsUJL9URg2xrj5DemO1
	xvmdwxQ/nUBi6bDmDxwKzq4ChBdNZY5+0F7AaGsu3gCgOj00OZ0MTxfvpXWsiJNltHP3q43p+O5
	5tvDM4UFB12JYBxfkr9p5NujrOsBooL/4qPU/7jXDQoW/hgt7eTKAOghgqjWaOwAJKIYALNfQlD
	FD51ieYHFrMHFZOJqbedwZ3FjlhFgFrdiSFwrPlLEMKGAr3NvM8BA6+u04vWEYXzBclAXs97kpW
	qrKyI5lWGZrJELxDwH5SG1bAbGSP5B29Q73J/HqxZjuWWuM0MWOQAB2EG7JaTbE9bUWdFwlkOc5
	1XDyNy8TdeEpH/1jbi06EVBBXhchmzcxb9qlywCNjZ414iMkwB1UEztXT2kTIfryxtg7JzE2rBe
	Ahpnw==
X-Received: by 2002:a17:906:37cb:b0:b97:f2cc:8c3e with SMTP id a640c23a62f3a-b982f39b197mr103173666b.10.1773994218017;
        Fri, 20 Mar 2026 01:10:18 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm121016466b.1.2026.03.20.01.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:10:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Mar 2026 09:09:51 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-milos-cci-v2-3-1947fc83f756@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773994215; l=1724;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OOBMl6N+6wWq4VI/kMem7gKFfbgc3xAME32xiW5QX+Q=;
 b=PtK07MSBbaUBbhPt07Jp3YhUm43bkaj9J/cjajCZxkqEJDLGAMbgkavtMBPQ1xvpFsBgidmXv
 HN6LoKa4+BNDhiBU8v5dt3YQbHIyzADJhP4OPy9KuTy9VDJdlU4XbqT
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the CCI I2C busses and add nodes for the EEPROMs found on the
camera that are connected there.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index bba327cc7a38..3e65f5deb5a6 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -541,6 +541,56 @@ vreg_l11f: ldo11 {
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
2.53.0

