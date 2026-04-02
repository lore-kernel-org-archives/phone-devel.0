Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5707E382289
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111954; cv=none; b=rDMnd3sfzmTaSzWRVHI7bTN/kHQXbvdJQan5lSet/kdK5w7Fm2WRuqBCpVYJSnaD4bQiGTxsP/jKYoRaVRxcLPH2J0cib7J5KXKlv442Y9dfbdCslKf8ihVfCitGZbRH6p9KRU49Km0ulirp2UWWfj51PgsIaWlVO4IHLF4YUQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111954; c=relaxed/simple;
	bh=uDIn6ls8XEexqtEujcvxgGlg2EjDyGa1vVrumeV52tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6zaPNaGG573WjqpWOCz5tz18DpO/viTeFILJD17PGPBZ96DKQWMOuPCiseph7ciaLGkwJuQYpQOPx2ctAI3Tc+p0OVGhiOvld8eVRIb2Y0pChhlioSI3HYhQ6H2AW9xmbSbZfwfZHUBFku+Mw8ajtosJ6XqbYHQq5Fa9oFX22g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=nVbCJuiz; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="nVbCJuiz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSBFLjj+5Y3CqudrCs/UPWknuzzLB6M5QKE8MkbGi84=;
	b=nVbCJuizBxJmSmnwT5mFjJZyC7o4OO3sZWIvpEiU9Ns6Cb1Bn9vWHUPrQHyEpqr+r1idSp
	VliuouYFT4wspTcnE/JyavvvOBzN+BBwjm/aEDxgtm0dWXySc3e49ZjFYg9dfmamCKGFI+
	MigC/VCQOicSyodNgish4PFS7AVsO5vTXFuWbW++E91TR648gfbtX0qHD5peedgEfgUYQQ
	6SIfQTY99gsUeX5jCtCeFcOMwV3jvcEoEkbFSEDbvLPFciMx9MX1xTPb6T+stxh5FqF3W1
	3TYJmf+gfDE9otGyeP3oPnpM1/kp8RGEzK3/cf7yUAUUln9G7M5Ts/qqeqhB3Q==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:32 -0700
Subject: [PATCH v8 05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
 and their dma controllers
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-5-7677cfafbc78@postmarketos.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=1035;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=uDIn6ls8XEexqtEujcvxgGlg2EjDyGa1vVrumeV52tg=;
 b=ukpj3d0w5gXLrmL1iyCarwu1QrGl35RTGUWj9GPDD3EKPwVHmztGmz17JARb41Plz8dQn00PB
 l+bRK1YKYyWCmHjNWqvtYwQEsUe2llcELf2p8DnRZJQ8tDbGWUwaiNG
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Qualcomm serial communicators required for i2c, serial, and spi

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

