Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52BD36828D
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 02:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775702539; cv=none; b=SZ+NaWt+gqqOi6UcgSGopDK0k63kkN0D6OKhocU9viwI+EMGqqFv0mBWizThzldHpUCmTytoHrUOGeBzVtOjf1v8ws5erwANSBDYMXA7ZBrOgf044XHKRXfxy6kWVRHVsSjEFCNpBv2wpUinntReG5AGqEWj5G+v5estVKyJsrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775702539; c=relaxed/simple;
	bh=62aRNidf81NIQSpQlivJzpjBxKi4+6TnrkQkwf9cnQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eatW10qRMnFeKw8Gex21MXdd0v+CanQ3gTSzm6frsP01+Oj2BSHvf70KoLOWvpiUMUSPrZW/3fq6bK6H28nsKS/g/V+nBF742mn4LIZ2vsygV2bThnCsDpd+Goi6B/c0syix9vOOdKjkdbXLq8IxFT7qjn2/lhnG76fDNaJBGrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=aUBB8ZCb; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="aUBB8ZCb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775702535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ncEp6L8HOBIzKU2YR0UCVFBGSGus/FpKTSPP46t8Nw=;
	b=aUBB8ZCb9eP+dJCBXqRW6Sjna1itBqfcFFOVvn5ybGZpC+PuxDnVd2NjMnTzOoMKfHROgZ
	84lTQGxjGpEXgCQfzsKNBWKItJrWiEVaJin3LuYwWsE4lBc/Ra4arJTb9h+Tj9voOExyNJ
	9foD6RWWVS0I2hu+XVftnWwAdriSmiAPdtvqjqdlrylypoOjD6Kog84CdI8hPgYKGDutW3
	rhuUgChqGVTVK0MMwYrj9nv4rUkBZCQhQ37K5j6YQwUIgBdb5lmZVjMYF7nUk/BNSw0sAi
	JLn67kQB8lrtuuZCgcc0lM4m0oH4Vk1Dq3j88+A9UZTLJkrW13vJFFTZHwtHyA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 08 Apr 2026 19:41:12 -0700
Subject: [PATCH 1/4] arm64: dts: qcom: sdm845-lg-common: Add camera flash
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-judyln-followup-v1-1-823467519b59@postmarketos.org>
References: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
In-Reply-To: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775702528; l=955;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=62aRNidf81NIQSpQlivJzpjBxKi4+6TnrkQkwf9cnQY=;
 b=Q0LoHbKUeSRoXcFmsI3g7Un7r2NLs2w2hheSv1YsDGDy5tVCxgpvcu6QSfYCMjPtK3OU1J9E1
 Q+GSqpFCz0NALZzwzkuNg1jRAQGQiG9u9XHqlMEMmvZLj/VAHGnbNo7
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Camera doesn't work yet (imx351), but we can use the flash as a flashlight.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 71d070619ad7..9d82961d527e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -496,6 +496,19 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <2>;
+		led-max-microamp = <100000>;
+		flash-max-microamp = <500000>;
+		flash-max-timeout-us = <500000>;
+	};
+};
+
 &pmi8998_lpg {
 	status = "okay";
 

-- 
2.53.0

