Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE2138756B
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111967; cv=none; b=Deyo58CFR1+N2ZkJn9zRN90NoB7Fa9BJRnH7ht0eOUaXoLok5DCucpezEX/tiO/3nKTBSFPm2Q/04xCItbi2FR9wwHirQcYdJMQSQYhHNp+aLPpL79mJLS0BunTGNQ9tSk4af+s4QnuCjwZewPlgOUZ0XxsWF6AkQ9R4BaKkwYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111967; c=relaxed/simple;
	bh=3IrHi3Mcv3c5xAse6y3RAJeobRsXRa0HsBEFrcGQrqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FV05FQZ44RJj8UCVsMYtQe5c1JALLnO/rXLyYrScnBlSksLwd5O+XIvrubN2Ehlzf2A/IqXEW2IPpLrlpM6Fgm0tClol+2Wt8ylalRn2vYebqzQ9eiQOB1QrhJyatDlY0utNaHGpZIL3/7lfsWW/AFwEzspoKUcFzFgCgL/3vWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=O/ehiUK1; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="O/ehiUK1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiDukw1aM2i84BBU9Udntw+qp1ClJnW/ElHufmGbE5g=;
	b=O/ehiUK1FEEJ504WvuiHIh5LepGs4DEDsK6rZQpr1avrP9KWG/s6Fpk6F9GKmewuqfgLYE
	kXra658qbEPyzfm2gMVf0xug8UVV7a3JyD039oywwPk1InBY4hcAkLyHgmUPOI7I1ECb+R
	Fkv9VOc9SXhSSrVYdU3SeMxlDdHVHDVuAkNPQAV0AXo/Ozxp7I8PufF6h5/izZQu1dnvyn
	pzk8hZ53QelF+eyIc5s1AkgA0WGvYMR72OZ6H7JZfTiNUC1xyyKXYinSQtfpa4M41vUGPi
	ActtCSW5zXZVBZSgVVsXxtX7zS9V5pff5Q2gb3cQL9kssYut1FrOfoL4tk14FA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:36 -0700
Subject: [PATCH v8 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-9-7677cfafbc78@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=1151;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=3IrHi3Mcv3c5xAse6y3RAJeobRsXRa0HsBEFrcGQrqA=;
 b=5lt4NIiySlhVbc6tRp9Hv+DQHvJfSHjrKNHYtRvgZTzKpeXbvK8w8aDYuDW4gsA9l3EQvgJCp
 0MG3JwbqPxsDe/buualmaOgYV13oV/T88u9gyznichlLBO0Zuqh4jCo
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

These regulators are required for the LCD

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 6b837da4ef21..2c024b32c00c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -71,6 +71,23 @@ &ipa {
 	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
 };
 
+&ibb {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+	qcom,discharge-resistor-kohms = <300>;
+};
+
+&lab {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+};
+
 &mss_pil {
 	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
 };

-- 
2.53.0

