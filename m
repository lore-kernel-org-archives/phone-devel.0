Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B3F36D9E1
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111947; cv=none; b=iRW3uqT+HxHINP0yTLl0+8Hc8251z/QhqkkMJLciPNh3ZeHL/hLHCS/OdcLU7zo1+paXPvACVza13Pv5B4shZzy5cYxx9vc8EYtEzG7SqHh41/YyeBvByNHvf6f15M11E8/yXO2wZUBlcObcilohu0D7JUSOZoOoTtswJ/gkFf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111947; c=relaxed/simple;
	bh=zApbbXYni1gzGOLyTeTNtvriZHhep2sMKCAUx/mHuqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+cCLiV0b/ynRdJRw2+p8MComSexod5MbsMDAxqvL/bjgEjmD7HchDzD0zYXG12W0ZNz4bQbZxxAYSzg0zep+AGKJx3kh/WmUifEZDNT838xfU/WdbcgQOOcPp84KZNZeUE6bTVmFMTnmAH9GAqhy/6lY60deYD+4hTAICxCNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Ykwwuway; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Ykwwuway"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dwwoVBr8g+kp2SFK4hR6HBFGHkUWgDGC6Y8GBbVGEE=;
	b=YkwwuwayWfMvSDi6VgSVc20qB5XKroqt4KP6aqfvYTPyR2G1cMlFXwqG7Kdb/4HgaFIK78
	BgNpg4p0X0OpHHMcHpMScmFHtJvTE288qzVUEoeAOGBFP6jM1NuPZKk2ZnGt55Dbc/oyOU
	C7qwbyy6EXsbWkBwvkU749pgJckmzI1/lJXUR5/eNHTKRQJy2c9MBl+xymvZf/QgpBH+hl
	2jhv59exoIWIat/PwwVTSOFLlw3TKgpGs0ceEPQ9AUv7AJ8KUa2CHcKBIq9y3sKElv0lCT
	o5MVTCIdGcvSd4YuOJB0nnYWPfzOIHFg8CMbEvWf4yCjWxmX2ooBe2wKhVgDXQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:30 -0700
Subject: [PATCH v8 03/15] arm64: dts: qcom: sdm845-lg-judyp: Define
 firmware paths for judyp
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-3-7677cfafbc78@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=1276;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=zApbbXYni1gzGOLyTeTNtvriZHhep2sMKCAUx/mHuqw=;
 b=wRGUvsjjQbVpSLVAT/dj5IALn75zYjMRdDHAlrQfk8RrACkKwnIR/3/Jr/+GHRwSot0YcnH5e
 uCy8Sf1nv4mDYjF/yvpfvGFCMIip7dIDKGZE+GYznJTOi8P+7NO/gk9
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

For consistency with judyln and new naming scheme for firmware

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index ffe1da2227f0..fd62abbb7128 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -26,17 +26,25 @@ framebuffer@9d400000 {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyp/adsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyp/adsp.mbn";
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyp/cdsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyp/cdsp.mbn";
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/judyp/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/LG/judyp/a630_zap.mbn";
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/LG/judyp/ipa_fws.mbn";
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyp/mba.mbn", "qcom/sdm845/judyp/modem.mbn";
+	firmware-name = "qcom/sdm845/LG/judyp/mba.mbn", "qcom/sdm845/LG/judyp/modem.mbn";
+};
+
+&venus {
+	firmware-name = "qcom/sdm845/LG/judyp/venus.mbn";
 };

-- 
2.53.0

