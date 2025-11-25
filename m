Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148F2FC891
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058413; cv=none; b=PfFIQ6UgCObkza65X0Aayx/NUvbJWpavK4XCLg844PncHC1rEots9aCSAZgvixg+oA3sYzwXUTukP8VOsDVdnDoVQuP4ZzcMYcouKGgKuIJQu6jGOEcBTRlODlJredjWc8bIYjb+BY3b/fYHJzwMYMyFqd7TFAUYpieU1fGjAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058413; c=relaxed/simple;
	bh=6947H6/xb4Y9TK51M02+1TbH/f9gjvhWQorDiD4X0co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mugascf+zNdu2tgUKWdjjrfrZhHzenLhCrUm66Is2Ry60/JAdpud22sV9m0gnGjZGg67rUkfk2NGA9nwQG1NNrFaBA7hlj53g2F9kpC5MKXgAf6HjMq8aPnVV7q2D3bmhg3mUlxaAubbt29xlZZZtvo4aTCQhda/xIjQAv18s1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=VP8+kPsv; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="VP8+kPsv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TILqy4gjWRXZMMm8Uq0oNN64z2L+nTHnVZZo76yzAaE=;
	b=VP8+kPsv075ZI5m71pYfxMlSpUSUv4EZJ9XiQD/6encHIYsF64tDBBn7VrutxS8DfxedKh
	0+N4ZQsTbU19VdG5VPGhTnOBZ1pC3h65YbNcgvN/qC6BOVkII3O5W/bFgK0lqS9b5rBcqx
	Ki42EsDmXiel/S+KnKRzUtjTB0ev+N/JxAposxFxAyXaJwiKjavcsniUVXIhpHVXNsKqIW
	t6fGJuSJQBNAVVN1lgT2JELvTG+TI/hZU1ZkwOfgWkMczqOlOpz/ImRlhTlNMTHvl0CcsF
	IPwAwfHcU/HA14v+ORvIFA0/Wg13hfRUZcfmbcx9ad4Kxipayq2rXAcHUzSOPw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:39 -0800
Subject: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=950;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6947H6/xb4Y9TK51M02+1TbH/f9gjvhWQorDiD4X0co=;
 b=27mvmMJxCeD96eMXOSIOVJgxsyVw19KUZ1mvb5fV5ga0qbO1t9YupZAy1LbIzE6mW+U0sQ6w1
 6d2DXjx1lumDSC388+4KcqnlshoaOBFhjAy9WAZlQOqTAVLKkrsTRzJ
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
index 93b9a0246510..fa664b5120d2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -494,6 +494,19 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <100000>;
+		flash-max-microamp = <500000>;
+		flash-max-timeout-us = <500000>;
+	};
+};
+
 &pmi8998_lpg {
 	status = "okay";
 

-- 
2.52.0

