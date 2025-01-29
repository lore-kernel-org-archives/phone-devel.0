Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C11E0DD1
	for <phone-devel@vger.kernel.org>; Wed, 29 Jan 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171201; cv=none; b=OZncODGVgcPB5yj9jGDepLb9NYVtSWjXalLDOCaNE2wAvRUoiWAqNEVRjYdFiocTW6TClOPdw8k5KHU67hWA7Vdz31MQg0XSvJZtRtR6NNO82Zls0bDdM3pQuNSIegekQdG1C/ntXS70Kp6FcIjLyl5l9O+m5dTbE9RgHdy2KkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171201; c=relaxed/simple;
	bh=FW/GI43N5p3BtB1D64rBvqr5odB3+1/4Ea0iYxTd780=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMmeDn20DUcBgeF6F7PvlpJkkbL0gEFoS3P7Xf/O4J7msVc+8HCtZhGv4Zd5GPPosTq9mX558G20k8w3ydkUsEIe4PD9CkwJ3cUG2KUxv7Ku4slJWRuSPCWVu6S3tg0igX2qErcZkJ0bxbEK11yjPXlr8C2rllfaRwSLOfF9ZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=XqIGXxxq; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="XqIGXxxq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738171192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8dAhViTZBchMGhqpRD9jGMu8g0CRLVsIwsVjBG5aSo=;
	b=XqIGXxxqfFGWikM3GD58Esh7FNvRaKbRYWOxWgqt6mhTtEAxATm0kXIDPdpzt+M429b11G
	azgxuDxoOdXMEjMOvATzrc8I5ZthPKknS7ZPhtX59r8LUmOz3odnFhvhkfbuDeaDYXl6mT
	ze/+sy9U6R1gN00VWdlj1cHmtxvt6pdE88H2fmvmAdTKgE3hc1wUwvgsLA1qFGmRmq/jRk
	qpE7U8rll01ACM/KNmOoLW0le5GzrDn9iOOzVqkYy+QfKGZS0/cTL78kilYpYX506KT5sB
	muTn/7vmeR3439edkBXDwVNhOLgIWJeb8AiWd606eUTkXTY1hj1So0wSRrmrbg==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sdm630: Add missing resets to mmc blocks
Date: Wed, 29 Jan 2025 20:18:41 +0300
Message-ID: <20250129171842.1588526-2-alexeymin@postmarketos.org>
In-Reply-To: <20250129171842.1588526-1-alexeymin@postmarketos.org>
References: <20250129171842.1588526-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add resets to eMMC/SD card blocks so linux can properly reset
them during initialization.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a2c079bac1a7..3722e405a97c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1379,6 +1379,7 @@ sdhc_2: mmc@c084000 {
 					<&xo_board>;
 			clock-names = "iface", "core", "xo";
 
+			resets = <&gcc GCC_SDCC2_BCR>;
 
 			interconnects = <&a2noc 3 &a2noc 10>,
 					<&gnoc 0 &cnoc 28>;
@@ -1433,6 +1434,8 @@ sdhc_1: mmc@c0c4000 {
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
 
+			resets = <&gcc GCC_SDCC1_BCR>;
+
 			interconnects = <&a2noc 2 &a2noc 10>,
 					<&gnoc 0 &cnoc 27>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
-- 
2.45.3

