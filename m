Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7440386443
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318081; cv=none; b=HT1RmDewh0ELRJWpajdC/pcfE7avgbcVwL7fFYJA0q+Sd3CN+Yo35+aAZqSDaQ8zr+o5b8eGkaWqYcB066yxfXgdqPTVxw1iT5CBslLjtKF7adfNQjiZje5D42rs4q0sEK7YSRMAtc8DEEcag3iz8Ja6X7B6T6SBIxy0nuI9cZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318081; c=relaxed/simple;
	bh=G7UZ6vYjBafB+oPzdIBj/6SxzdaTGA4Zkk87gzliC/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5z6JlR70Xn7s4PBKmb4xihtK06Cgq3Dh0X0R4yGf4m48fWWSL/RoVy5scSgxTs4ivAVSpsCkLg3jbNG+DtDuzRONMBneHyTLxVkXrfw8G5/OLBuGyyjc0YEjAYS4lVoom5DxgncN8LWf0m6ftNivN2EDFoghfjErRtqOF3mZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=HDoNVTnQ; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="HDoNVTnQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t59qGVgMPKG4CYO8nz306j+pJ1sS0yDzPSxA2U9fqmg=;
	b=HDoNVTnQgrqNzheeSTYmqJxBSI6Imp8UIs0s8IKH8iZdWAuTQkgESSiRcY8ANxZsKR7pH9
	kylHLTGP1DNh+AlonccrdZRR8nnAe7/1sUV67YHrPZ9/hY9n1xHOZepHKuht/FKC49romE
	SZ3BAjQQXnlAcxNuHghms7VFbpTksmoMgquJFMHpd+KtICWsg0yxVgQlPl181J6wq0ZklJ
	misX8phtDmDLcTrUYxb8s5nsVIInVlKFsRbXkumQSxdVqjWCnpEJAQrCIjELi/mu4rXN1S
	rbW1rlotn6lmLqSu7ii2xkcDQkePIIQLvTiulU8AMEqyWqT3N670cni07vFcTg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:35 -0700
Subject: [PATCH v6 05/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-5-29d70ca1651c@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=1341;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=BNxWBjp9hPmaywExtLfz+ncleFdLM9nB5RQE+JqTmdY=;
 b=38R6AeZqk6RexUrJ+BpK4Ua0e+IeNZIuxkn9NeAqQNrczx84MfgxmaGyi85G2q9WZ7aNZeNqv
 dfj3D7GqhgLAL9OfOXv/r1GCod7e52wwZ7kJWjylUlzAD1q7JjxLetT
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
index e530a08f5e27..55bfddab3afd 100644
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
@@ -63,6 +71,12 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
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

