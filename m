Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756B7366810
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 02:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775702548; cv=none; b=TL27UdNei7nvQTXmZ7/Qbrl5XGq+uXTOhSjy0VBJtvFndH3xtvKvvm7ETQSs8MaFx6uFEti4t72KPN32jeakICGijFosBkkFnjwb2xq1zoGT09Hn6k+inZY4jscNjauSl7IBhTM/JEb+0vopJ5mJR744/Rq9LAqflS9ffLeKIxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775702548; c=relaxed/simple;
	bh=fOcr/7mBz1Sen5Zu/vhR6WZBAfKDprmnT8KTucqA5Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spbpjZXlNam1gqNmG5OpMymzDQxxICAls6l8HFyQnk/780MNrEaExc6HxrMn3b465Pzv1FnLA13/Cu99huuCAluwgt05DN7moubVvFCuKput/4vLhHqJKCpVdvswd7HXVRGjLow93wP780hSzFrGhEonMlRt5t1ZXlHslYXNfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=U3kNLGRX; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="U3kNLGRX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775702545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oiArMNH1scHIHb4vGHz83I/PRfi65XhkSgmiVQjhohE=;
	b=U3kNLGRX34eiaEI2XOfPqsWHWhh7UXcuLHTAq+RWnQ2noyjLzEGqDagShK9/ZBAiM6YLrQ
	wivBL8YPIjNIk/gvEygFTl/xNXr5ahrSH5K+7vDX4fqaZe37gf03LFcQ9QeVS2sNh5Bc5J
	aO2++TGAyo2ARloLggatdHeO64BeFMCUgt7wRXlXkhE9dtn9e4MV4utY4qnYJTbELsi3SL
	Nt+fP7rpVyaQ4iM+lo+2DGaJtsJCldeufx9isg1+coyK3NUMgtoxlAGWCLvz0LDYiKmVoH
	KWVcuh3b4bxGAYczqfY9QkshziR8F4sjpw80cnokDJaCY5G3mQdIiW3auSvRVw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 08 Apr 2026 19:41:15 -0700
Subject: [PATCH 4/4] arm64: dts: qcom: sdm845-lg: Enable
 qcom,snoc-host-cap-skip-quirk
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-judyln-followup-v1-4-823467519b59@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775702528; l=743;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=fOcr/7mBz1Sen5Zu/vhR6WZBAfKDprmnT8KTucqA5Rw=;
 b=ZqGfUBv92qnTjnsx3KsufSh1RpTYO5j8Xi9mVtt+7PvCxM41zKVPJELiMbhksxyu9zCFaPrBz
 dSVQqQxDwhRBNRb6SWiecY0fe2J34QZ013bei/cUSdDAPlRnqQ7/9jh
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

The WCN3990 firmware for judyln does not respond to the request for
host capabilities. Add the devicetree quirk to skip this request.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 86cf4eb44084..e0c3566761bf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -694,5 +694,7 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
+	qcom,snoc-host-cap-skip-quirk;
+
 	status = "okay";
 };

-- 
2.53.0

