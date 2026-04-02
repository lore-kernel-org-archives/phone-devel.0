Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C71366075
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111979; cv=none; b=cCT3FgePkAExnRtqoXGQKJ5NG5LljQuBDqujlRjdMoklE3snL382qOOSuxm3wCXVZOX9ZGDDfOPHM7nyjgbO9QyBEkUPZVTGWvSKsWzY6lsYpfJlG+g6bjBMmCvsRb7cYU4LxKaYoCCG66KGEN3W2Ns/GfYzd/1wMnE6XhM13KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111979; c=relaxed/simple;
	bh=oJc+1cBUxP4xA2PdQfzSyU3jCiJ8U7GICccKavJd3cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxpMQx67dXxaa4qygazz3FSapU5Fi5KKHRUaDb061ZuKU1cQdBjtyYYlIzcV7AUhDyfDfoEdCy3TQZIrPIRvmWSHb2CxCvA0hVPgm4pXmbgWO99juHfl3yw8WA6MXF0OPI/ehlm0mEzA+epmalVHg1KHXTmmnatpTajvIxFUXnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=ojRGGMYg; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="ojRGGMYg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUCus0PQMAXlm5B90msn8tZF75isfZdVdYeAoVZuGmk=;
	b=ojRGGMYgOEPeG24BbGxjif+gSyTZ2/umfdEK36mXbF9X2nHEasHKB5ixzQUqN8253xvPfx
	TaYYheqec4bo7cTXHTXExDsBSwF/JWRAAK7sAEV8fu173LEFmJ+P7lQO20F9yfda5qkyIJ
	5IJ3ZCMS2964kBj4Ui93NLPCOih6GzHS80rT98wsV/0muTigAguRekIRnZKa50ssuY2ekS
	YJR8lMPDeSBaGOdagnoMWde53ANpjg+hC67PP3MgOIjd+wM4kWLIGpT5T3VCiykOKPW82S
	rPe3hrMnW6gN/VCJMo2TO203nFoyiGPM5VdHpdb5GZqSGGKGG9IbCQf+OvxRew==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:39 -0700
Subject: [PATCH v8 12/15] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-12-7677cfafbc78@postmarketos.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=770;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=oJc+1cBUxP4xA2PdQfzSyU3jCiJ8U7GICccKavJd3cQ=;
 b=x6H5JMfrVbtYzvwCmQovCEEJHjW15cRwwGsgP+6uuGfqfFrTKC8/ihAz0DgTCbkiACqEId2N2
 I8x9jK1HcgoD0iOOIBpniHC6Tq07nRq11dQLwLnRIxK5YCmnMlL8D7i
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

The sdm845-lg devices are all phones, therefore handset chassis

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 8481f0cce974..71d070619ad7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -28,6 +28,8 @@
 /delete-node/ &wlan_msa_mem;
 
 / {
+	chassis-type = "handset";
+
 	aliases {
 		serial0 = &uart9;
 		serial1 = &uart6;

-- 
2.53.0

