Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54E37FF55
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013364; cv=none; b=bgVn0/SitFhIuda8GaOcJM0vVBDbjAEcKePQLWZJ/Ikm/aT7LUfpUg4dPghVeV8zy1uMbYhxQWamQkAdWvn50wmAv35RKF+hkuJ9RsjnH5AzCLExzSKLHJ6W13rTuOBcp2HaC20eElvD6zDxMm5RpNl9dgbTwHzupeRqxGvy9I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013364; c=relaxed/simple;
	bh=zApbbXYni1gzGOLyTeTNtvriZHhep2sMKCAUx/mHuqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mORhKoy57PYOGXJR4Fcs6Eudc2MMFZ8bnv4XCqGHNG7vGJUlDxBKMUi0ZTnn0EDXUapMhXfBxDcV5TJvE8y4KkEToHjEhYjHjFP5qDSFMleENEf/3JAlzfvfbKqs7du2cCt16Ik/2AqElk3Ss5xau0Uew7twWSD9aujEZ7d+Viw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=n03VcRRq; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="n03VcRRq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dwwoVBr8g+kp2SFK4hR6HBFGHkUWgDGC6Y8GBbVGEE=;
	b=n03VcRRq3lzW9wIfIkEbt7h+i2kEHE2sOpqa5DFwD2pbQpLnlv9iPpwXFYv/ngG9ZyoXEO
	58+4QchToD3Nw671YpXWzmFyfYenP+uT63J8r1Xz5+/uVI3JHvM1BQkmqpj9zijdgSLsDm
	BlvfJfkJRRqCd0SlPWSeDB8iMnoDTrUQuFd/RXzSnfPk1EL1XBFuNH9mJI82hal/YTq9l+
	oZd96BkASt5O70YwVD6EAbMuZer8eMYRsut1WSF5FTg0+YllSstKAuO+/EJlnT4DZ4AZ2q
	JIEawvAsU41knhoLmQxHZJmAFy9LzYj6aMesgBeVzrLvXUGadF7WaEdWHUhfpA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:08 -0700
Subject: [PATCH v7 03/15] arm64: dts: qcom: sdm845-lg-judyp: Define
 firmware paths for judyp
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-3-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=1276;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=zApbbXYni1gzGOLyTeTNtvriZHhep2sMKCAUx/mHuqw=;
 b=Pe5D3s3c6qX0jBZdElA29lJ2noiKA7qpGonyymG8Of6zabPQVWYL7u1vBnb4Uhrd+b45WXz5Y
 ST5/nPv9XmLBmjT8n0V33jBt/yi2l011UqpRFshWzUwZ3D+q+G9hOVX
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

