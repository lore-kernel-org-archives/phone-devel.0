Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21638654B
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111963; cv=none; b=iYGz8kNIk+tBcSK1VnPW1dAWF0BTY1J0k3F4+AGrSMPN4GYP4CBBQcG5zrISMl3vkH9hnd4WCbJHGuYFJovoM6yMY4ZLdAHYDVn6QwrlqGL21jbQqnX0TIAIL7LEoVbOo3QeIFMp3cP317k1UcLHW+ySNntUO8YpfiSii6DzRy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111963; c=relaxed/simple;
	bh=2OZZUVrxmCnuiImJ91NAO4ZXnGPXGDfivM1k6ood+Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kc6KkmX2ucmiXvExJV0FGpqxohB9bmnH2xLTbBWTmfkau7J/T0Mk278OQPrJA9zCmZWu7VguC3NtA6ucxoB3vhG9Rj21lvhR1vbH9Ix97U13SL0Y8CKP7HNbJuVvPIi/dR6dKWu+Xw//OLFsy0evjVovY59FML8X18dWz6JSHoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=k+4YXJC2; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="k+4YXJC2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PzExXl/EHRF/VL3fZKD3Wfza2ZqXaYA4mFIw7BUnBQI=;
	b=k+4YXJC21vKDtmSLXU68b1IbN1V4uUtXByLBpR77q/henS+ofXKAz1cZNahpWwIGQ8jFzK
	i6c5h4Y90FY82+B8XjU1Vb01upcCvoy55r+kCifx7Nx6q+xEdTlwX+JqJ6lC+MRFRh3j3m
	mEMdiyZhSm9v9rAvZYOOs1iH0ybWxJknQzKgF6gExh2P9TvrEf1sCCPTbNhqA41zzotnyz
	aQFOqU5PaQcnd4ZGRPgQoZzHjJRyaRQOYJIPPK0/Bhojula0P+k50ql6IWymzM6oFAffXa
	IPUKw+Vw+riKV1Xqp1ujk33m/9eu/Byoim2bVsiSQoPZNFoGU+vGZopoSWnpVw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:35 -0700
Subject: [PATCH v8 08/15] arm64: dts: qcom: sdm845-lg-common: Add LEDs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-8-7677cfafbc78@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>, Pavel Machek <pavel@ucw.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=1385;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=34eT61AAHtgeebYRAnh4RtcK/L2H9WQuYQajrBpPHng=;
 b=uc5CdtyRsljZ34BHNItXKj398fLLRzG8xVg2Pppatm1Nm1aZSIL5W+hDbCZ+5+Guluu0sJrjo
 A/Y1oOs+HkrDldTjUJNqLcdVA6/EqOjoj0WOzCQFrIRmxTcsfeJMVdX
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Amir Dahan <system64fumo@tuta.io>

Add the multicolor status LED in the phone's notch.

Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 27221b3afb30..51cd930488a9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -497,6 +498,33 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_lpg {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_RED>;
+		};
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0

