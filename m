Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06143388378
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318088; cv=none; b=uTogOmWheyDU3rYzRgdDVkWkH7Xv+Gwv4v0ZE7uaosW3ApdiC1hnaqagP/+QonkX3bDaxLQbn24k+7/G7XZzH6XuqigecZO+DMtLL8AhZwsfgqOY5sJyn/qaW7Nto79btT2FiGUBZEAHqXsLgY6zyRxO5DggmGSJDB8TO+BjBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318088; c=relaxed/simple;
	bh=6xoFlZVlY5etAeSqVv+qkdD4WZk+2DUAtOHNeZLvqiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEbKgnav4M3LKn6oRdDbobZ501ZbspqxwVAfUm+tN26gK+JfOmU8Xi4TbxXLeFdhgUa1r8qeC/QoVJR8ZXKilNVkniXUpfEbbyZqY/y8M/QJIR8pAERpIl3co5dRzwaQfwK2LbKLsBPiZcv0eGI7mQ9DoZHcyQ7wkDb91Xo6WFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=fgIRRc4b; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="fgIRRc4b"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sjAu9F2Ij3hY1reYG62HkcTE8+Tm43f71szHq2LLmRI=;
	b=fgIRRc4b2N/6Z/DXSacfExKwGq31ubBmkw+OiLhmwiIiiNkl7pVkZaT+Az++yQSR5KPGcE
	NekOb8OH4bDv+AZbkR++Aj8Gu5bE3tF5ahY7+XF4JsGdYA9vR2e7eIytFSRKG+1WocYDjv
	RwER11ZPMZfWdoZ2rp8L78Tl0wf1G4E5vQft+qAfh8c2JBV4GlXAskls2fFj4iA77Y5LlX
	Gy5CcfBdcScegiiR0M+YjJ6UWZgJoPF/WID4sN7Nw5I6TXr5ehc+GMKWLhvluYV03Y8DCh
	43ibcRf/wRrJFyW0u50s0KijGiKbImb58+VhY5oFrUcpn4JwTT8ehEJ4STt52g==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:37 -0700
Subject: [PATCH v6 07/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-7-29d70ca1651c@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=1093;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6xoFlZVlY5etAeSqVv+qkdD4WZk+2DUAtOHNeZLvqiM=;
 b=qQjCWciNSTceSumVkBBrDX+ycmMH3SaOYhrgWYvlyQc4ZfBvB+UFyO8z7q87ZIsdIICyCxOxw
 PS91vX+ZjdcBIk3H+rqNUwOiIcxb9CxPE7MgjFUUsHS8cSzIzppEfrk
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

These regulators are required for the LCD

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 55bfddab3afd..bbfa709048f7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -67,6 +67,23 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
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
 	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
 };

-- 
2.53.0

