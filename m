Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0D32D0E3;
	Wed,  1 Apr 2026 03:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013763; cv=none; b=qmGBK2s6D3/LOZ2n/qoe6f689DG1QNfwXgEDayYTeg2WzJztz1bCez3X81Mlgil8vtvXg1MzVERk1ibgK1YD+jJbVu0R+c4YXk2IB4cRmUXE40F2jrHhMKF86kcQk6QY2GykqbVox440x0bVHWjW33X/UTuYcqV78L2+2B7+dVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013763; c=relaxed/simple;
	bh=62aRNidf81NIQSpQlivJzpjBxKi4+6TnrkQkwf9cnQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXrbrSBgwdHgBXvhbAy8oMe9juXl5pNDZGryCInutW7RJJ4SdvM0Pd4LRcpQBGjzQstvYTe80xTr8GxqcNQYNcJI3ZPgU+XE1id8G27RUUNFqnVd2fgnCSxKsyoABSCnJZChOZa86KqvMSfa5skNhRzs4/6MrGCK+pPARsM/gao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Z9HjMUBG; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Z9HjMUBG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ncEp6L8HOBIzKU2YR0UCVFBGSGus/FpKTSPP46t8Nw=;
	b=Z9HjMUBGTnz5pXgmGRbd4Ua2it923pe60MP0hMKLJcvkT08gGrHNzW+UWd4WSQU5XLdBSX
	jwYxxR+IPTXXf0XUPW9Idnrpf6uMyLHWkHLkVXOtiQ9JUKo9G2GlGovPR95cj7PnqVHGof
	6j9Lp4Xtxatl60r4DoiIh8WzQDBLMdHTjjsnEy/xeoxl70R+8rbXL3gZB+EBpPYlHc1nxv
	aR0HuHM8bEltelVagW3ge/D0KZhTrq+vd3IjxInDgd/ZMf046XXl+EgBvArh2VCJeYXluE
	eTYVcpOaTQ2IFjVMZOASHLf401McE9lRCMTm2Y/JDcNHJow9HAZ/ukUHeNC6pQ==
From: Paul Sajna <sajattack@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 13/15] arm64: dts: qcom: sdm845-lg-common: Add camera flash
Date: Tue, 31 Mar 2026 20:22:18 -0700
Message-ID: <20260331-judyln-dts-v7-13-fbbc4b7cc557@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013472; l=955; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=62aRNidf81NIQSpQlivJzpjBxKi4+6TnrkQkwf9cnQY=; b=SHC4CTQifJradAxFbUMU7CiH/zT8XYO8xhivpZ/n/XYMc2RjgyynuaAYbXZcIyvvkIvHYz7+v kkKet+MyUSvB+fk1smQc8Fh+yW8Up/PUIonsRq8OYVnRshVBsh0veOh
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Camera doesn't work yet (imx351), but we can use the flash as a flashlight.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 71d070619ad7..9d82961d527e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -496,6 +496,19 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <2>;
+		led-max-microamp = <100000>;
+		flash-max-microamp = <500000>;
+		flash-max-timeout-us = <500000>;
+	};
+};
+
 &pmi8998_lpg {
 	status = "okay";
 

-- 
2.53.0

