Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C33845BD
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111960; cv=none; b=qgmWrFgpGeq/BClHTNL0ukRa9QaOQhS9YtSdjZayM00WFlt2xIPux0k5Ml+aZQLiGPDxGjgXYHm0WvZ0lqpFNSjAF7tW2tkaM4sa7oYXl0gLPYrQa38b3B5zMM24QqMrLR6FW5zsrub5Chl5PH0iqDIwhgAE9asW2KfVRJBPXZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111960; c=relaxed/simple;
	bh=vHcmJbJnFiriXlFNhyWcvijfXUxqMdaq/h0SYf7nGzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csXXaS3JBdUGwpk9kfezDuur/rGD+36sjAmBCiOPjCW1v/0pI6EMLwMK/WPlwk9FiaPyle8yORG9Y7XM11GLJ40Hax/EQKxvQyKuS7DjVJIXCi4GLt+vU8uWjBkQayblrO2WwZqVk4wx4NVrOzcFng7OeuGeZwpkaPG7t1fEnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=NImyyrBI; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="NImyyrBI"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXAlRMGR7jghkP+lnXdIYmzb8QsrY+DHKf9ZcHe2wtQ=;
	b=NImyyrBIih/Q880zbpCCpOHgZmDcfdq4XQmT2dTH+TGToupalDJ7idpZK3K+xrU+GR/pzA
	a1pOm2JoU3xgXPaCIQN61EoVglKYBO0eC6va6ntOk3rntXrXfpnT69mhOn3Uw18ipXXT5B
	wa4I+1cxYOSTfJ/FkzxSLj5PeQz2gOidnZzJEDS5Pyrjv6ERuG+15REbcPZm7UNF4j12Jt
	xynR0Mga8QTO3bo3xm7ySHU03AG2w4GzmRsTa11pE55bX/Q7xrPRS51mEfWC1fmYtNz53M
	VqkzCcRDZNrJsUR7LRBHFRUNhRiY9DCJdDrwJRdRxaIWEHdzxNZ5VSk018zuVQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:34 -0700
Subject: [PATCH v8 07/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-7-7677cfafbc78@postmarketos.org>
References: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=1347;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Ei6IXsIEZhjjI+rjDZqYmLKiYsgQWaTi16fUGmKfGLE=;
 b=NFzGzlcDSqeBTekqjE5xZI+cdFAcvRNClVqG6ASBsk10aU3EAIe1/vL2CjTIxJ1PKUPoms8rK
 lRQ7KWrXy0iC5aB/xdMYPKdMdnfVPCMrgueRvpcfDmmp2o1h79+7Fsw
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Christopher Brown <crispybrown@gmail.com>

Values based on lineageos kernel

https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi

Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 90dd5a2a6f30..6b837da4ef21 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -37,6 +37,14 @@ key-thinq {
 			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <3000000>;
+		voltage-min-design-microvolt = <3200000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
 };
 
 &adsp_pas {
@@ -67,6 +75,12 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
 };
 
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &tlmm {
 	thinq_key_default: thinq-key-default-state {
 		pins = "gpio89";

-- 
2.53.0

