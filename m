Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B237FF6A
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013384; cv=none; b=XPzpQ1+QLVcaNUIywgBhwEu7MZlk1pdC15+35s4DWQn7/qsnHnG4HadshPNvZ2lzbTf7c0KiOph8o2k0TLvc3wNEMY053oSYovtT8KJ8Nb9a0VHqhayK4FoCxJPrcyp9EKm9uYZZTqjRSjDE4S19dkzNwboaHaDlqu9tqvBY7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013384; c=relaxed/simple;
	bh=3IrHi3Mcv3c5xAse6y3RAJeobRsXRa0HsBEFrcGQrqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MG5pfnmNC6R1MiVX//dZUHBAE1UxrO90v6YVWxJrgeIu0ldTkrk/Z2HJy+31dpQgS+M2XSA19csWHHwbV+qwJmG8cB3dabZ1jJl1wcTD3jODQ6IxQrMqbP+hPRy7+se1q2lMfc+40wXYujrmqjpOUdXORLA7nxq0NMqZLpFXz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=rU5K4ywd; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="rU5K4ywd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiDukw1aM2i84BBU9Udntw+qp1ClJnW/ElHufmGbE5g=;
	b=rU5K4ywdwewfSmWaNIAssicvn5/o8dw2m7WcDmECDYFk+y18u1N39ORqpKQh3bWuw6kqaN
	jjik39lVZUdeYiQ+8S4om50I4NPhibQFcUyJjhZVqln2UClo1uxFkHhi4527iALFyYNJD4
	wxRiRtaV5gD91Ykjg/LtHzGcy6jRmsq4rH40no3cM8wfWQNFBMEYlieWYNYhKVWhSYZhY8
	nqjbSNnvOapnFbUMVzBZQ0LHirvq6ChcDczQhb57HkAqtTUUJqOXDdaSuUtnJMMnBvvPOr
	13+RBTLAdfYPgFtUvMXyRDYa+ARVGOjyLx4ReVCW5BNGBTD5ebtRCui//KyP4Q==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:14 -0700
Subject: [PATCH v7 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-9-87217b15fefb@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=1151;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=3IrHi3Mcv3c5xAse6y3RAJeobRsXRa0HsBEFrcGQrqA=;
 b=q6O+7VZjnTjM70wm42OxMmHYz8kTGnMDY2Xgri9tppvz9X1Rbz3FuNSqCVXwQe0z3OE5ZrvHh
 uEBc57BKjAnDTv5sOYvbj2OiO1gdolc4zzTDovvjExZ19zLbhOPkskE
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

