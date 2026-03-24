Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD22637F72A
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318105; cv=none; b=R1UE9vANawDKS8YeinJ4PRH1vHlXILQ42EMSjNchtlvgfK3z0b3nwUL+pMgIONzZup3JOWupEAob5kuksjX5j8NCVOUrjMad/XGEM+LkLZxaTp7stAJSvYQP6gbVWR6YMcbXAeesY0gmp/JC02ivz+d34/nIH2+nodhealfQwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318105; c=relaxed/simple;
	bh=RtO76bLqR3KvoL+vzb9hOdekFgXJte3oepaYg1d9P5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9qMnCG4W1ePKNVU1xldQAlbOc3XGousMqFukIiureLQRExm7WLsQnS26Y8a6k+Uogu1GC4DUqh13ICXvCIoXLIx8gEp/u+/uJ5CJLhNq4vty0QEXarkZRc6/KukcQQMpUhHh2laoG7fT36SJ4jnhHUtcS+ZplqH03ogUxC+SDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=g3Rv1Ll3; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="g3Rv1Ll3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tee/LaQAr8k+6jbnlvZuBhYjwZFcj/ilcVGFXycsJe0=;
	b=g3Rv1Ll3J4cUbECWvoeJvMBphYotrx5IYDRCAUwxPkHOXaD4vYviTqrpP6CtSYRx507Ub6
	DufEVcd0Uns/i2P97Je422/afkU8KAbzX2ClcWD3b0u8hmP5qF+RbN2R3COwsqvoLKbplB
	hnXowOl8JWXMwAj9OeKZYSPHAqniATMXxei0kezVXCcRJ6nY1h0GUrbAzXqDpPzir4eivi
	ApmXIwi5F2lxuktZhSwBxxBTzvw+XP8veY0p88LQP1IvsOkKn+A1lGzNmIlmMwxYRlW+0Z
	dSEKHeFCta11eCK7/BzRE5cCzGe7dZt1HpSpI+p0WitY62ya/VEVbYMYzmRLqw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:42 -0700
Subject: [PATCH v6 12/15] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-12-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=955;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=RtO76bLqR3KvoL+vzb9hOdekFgXJte3oepaYg1d9P5A=;
 b=QnUfRvXbwgK70LSc2+R6dSA2e3YQm4O66M+0wqEU07sW4g0jLMDEwqZU7cSZqykY1y6d9XRSr
 hyHKxskglU+AycgGKL/o23sb7GqOCNIV0de0lxq8FQuXFZu4XNJ00Bt
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
index fab5ffb3404f..7e803886ca8f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -490,6 +490,19 @@ &pm8998_resin {
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

