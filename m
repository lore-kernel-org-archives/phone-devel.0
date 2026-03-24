Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD94207A
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318075; cv=none; b=HER2yp8w+uhzMp899C9k2boUpVC8O21pMP/y+oHyQE8AzPiOEVY1F7kmjpx/H3+69jtndPIyGnwO/VhN+dUr23jo5BA4Nw3SuqVjPJtKWi3LfW3atRsawWFKGYUWQytDyyfhyPIBiQdRFk+CPyMnKfSfnoD8ZXvCFibXE+49v8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318075; c=relaxed/simple;
	bh=+xaw/AUFJw6Qn+Wudp9UTDMJK6rSUPaHJM0s6syWqZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOYIp+n6CsifP5MmL8qLldjRmG3Z+zrFx8V3SgcY4Sx1UwvLa77992qcpX4KxKyXHX47bTuZjLgNt1f5aY5izGtQozIeqq1JY0oQ1JGHQ2vJEh5PvblivlX9c+iHSnQ7apRP50XGZeoBSU4M9yele3qvBcK9aqamuK1tt8miVzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=eD0wY6Gy; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="eD0wY6Gy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqYmQ0oXqjFq1ORTXZyNxxxe2YBn40njmgLMo5bDfWI=;
	b=eD0wY6Gymxkij8OPrxfYq/3rH3d076xTH1Xrf7dN+A7gu27b25HtCY+56IS+BtfXregJb/
	Gm5esCEmJx20wmaOQ0/nlk6EVFlNzSbGR3c1uPTvD10wcYhaYRyu/vWYMxsuHDiaFovQiy
	QVshcTXqCJYk3nmGZQ6tZ17wJJqMBkT14n4eQLkAIBhkfJ7wgN88+nctigpLDWCfc0WVUW
	odMImW1izOb8GjO8DtiXVmxum4FLiEw5d0mngdvc/GwuNDCB0isTecoG/I2yF8gxa0Vulc
	mmqzRZZUw6etdTc3AscXWLJI2eap2h4KcQUNjGVVL6giJGWaZ2M75aVE8mHOqQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:33 -0700
Subject: [PATCH v6 03/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-3-29d70ca1651c@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=712;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=+xaw/AUFJw6Qn+Wudp9UTDMJK6rSUPaHJM0s6syWqZc=;
 b=Nftk5MGWEAc2JIuM6BrNppLB1Hj8HqeDuaCXq1JtxER9I1c1MwivgbHV2iY/QEESRI+L/9AG7
 hPKBFTw2mCdA9BetrgtOO+Bu2OV6Pc3k9j8RENvKX+EH3Qq+ZJmaYfc
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Qualcomm serial communicators required for i2c, serial, and spi

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 87ac41ec2e46..eb8de8d01177 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -482,6 +482,14 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 

-- 
2.53.0

