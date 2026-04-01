Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7E537F01A;
	Wed,  1 Apr 2026 03:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013371; cv=none; b=GqvCk3MAxK+iBlXmNe4Ywkm6/qFYaoFWU2RcPI+hzKiJaQg3TmzqSeuLwPHHyuPp9v/qZMjArm4ioRLE+TAcx6nKzmrub1YaHIsn9ktQWTyL56aTuJR12Dq/TPXNt+q3iJ3w7TVuqcYgqOxDp0lKu86UOtfJmcC5ZkQ2YJ0/MLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013371; c=relaxed/simple;
	bh=u5nVouTJ0w385F2XNsIikPqhP9osK2MLTB4BRp4Z7i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAde4GPkfz18EzAcTvUcNpEA0f1XuNGOYOkVw8X6GHssq/i9gYba9EyZxzxzU7xj6pgGPaHHW0HJ5SO1rPKVEHQtRNPhLLToAXu4zzy8fO1iiMnvdOmpHXoyVZ30t72MuTjlY8XAxsw0MTNAZDv4UzR1gogBwvu10I+EB91JmoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=IVFwWAcr; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="IVFwWAcr"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5bT51AXEU41SgrYgdUegMfpFGq26JQyeTEpJxxtiuY=;
	b=IVFwWAcrmLnMCNPf6RHA/Y2eehTjRs7O1cKTNP8sii40Cjvh7WVm/UtdSLaNQQ8bx5yRD6
	SqsnKRAZNH0Pm5T+7foj1NVwotFpZZp0E7vldMuYv0CbpzX7jBkEjiBn5hVma+cAp2Kdpt
	s6LcLl9bYy05NLqyv/t0wl5y7kKFcIkpk4h4AjS7YGFdrvA6jBied/C+5feEkpYj67MVNZ
	ufiIsAPzi1nu9O+I1w93iNRx4Uxv5/wMKHfrLSTBsQEAMsNNUUS6eW5ulZuen7cu8GxTVI
	DmIpracPtSC+nITDKd3v2YcgbzhOmIdem1ce/GM/+TlHh6cHuhG53cDU5a7QOQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:10 -0700
Subject: [PATCH v7 05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
 and their dma controllers
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=907;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=u5nVouTJ0w385F2XNsIikPqhP9osK2MLTB4BRp4Z7i0=;
 b=CmS+iXgzLGtEVLpdPjrtMCuPDjLMsv711cTotURsMfg4kKoIPfqSF7D9HgiLvU3AJGzPj3iZE
 pEGxyae5PAoBLjowUcyurJLIu8sDZLjPgfeLpoWtV8UcQPLoPdB9gK4
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Qualcomm serial communicators required for i2c, serial, and spi

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 87ac41ec2e46..8b7a271b7568 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -454,6 +454,14 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 };
@@ -482,6 +490,14 @@ &pm8998_resin {
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

