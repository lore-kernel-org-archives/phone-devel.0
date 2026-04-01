Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6F32D0E3
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013804; cv=none; b=fqRzbH8Z2gIRBq7MwIXZ20gtd9cFGr+DmZtj9v/hGYBAabQxLat0PA8D4yL+jNKLYRUJZdSNaxtgjki4F1ZzcgiLY8k2WjsmqTU9jTmn1r2pCcY1xJ6qi/fpBsLoBeDaOq3mCezcZXHHoNYJY/5jdShuyUV1WAdNhzwFwnwAdCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013804; c=relaxed/simple;
	bh=NBEN5Fp8oA9zh6cl4CSFlQc6fI6G/g2fGa68y/VBlHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgIdHx5eftmNvzAaaB5xkhg9+7ffB/EOjrTgISYm6xVniX28gDuUeDV5HQ7LJFxu4fyvLQYhvn8qYcpMgsmw5WaiTcFyoCfIhcp4TgZSA6ekfoBDIrOFVJUnwEq2mF5m90czjvhFNX4nds0Y336/6q1fRINcQ97UHmPB6PmOgFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=RVJkSS5e; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="RVJkSS5e"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJm1ozEkeqtRtb+iNWaGVl+0P2d5K7qsItmvKMseT8k=;
	b=RVJkSS5eLdWUDXBzEjWp9OZ+0WGegs3czDFw2FQSpuTZMlp4k1CGYqsjniuWNjOjLHUQvP
	gNVU+c4eBe7StNsKHclJ9imMHSsnVIh2soLcP312674M8RDffvEOhZkZboSSz5gXI0B1CB
	8z6ugFGjPxuJWqF48POUGukOudwI0POFchxeS+NhqaYgHJRrBW/eeCDqZAAMKxedgifaa4
	4U55nES+fyNEb2hvzIxuNNk2+uZ1RTBysrobJD7pZcSrHqeuWXsNrPhz6bl2qBCjaInci8
	xwjimlpNOdQSAGBXWlPQ0f5Yj78XZutk1u/UIEm7MrHXnPoFSYdfsz+FRgTSxg==
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
	Christopher Brown <crispybrown@gmail.com>
Subject: [PATCH v7 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference memory region in fb
Date: Tue, 31 Mar 2026 20:23:13 -0700
Message-ID: <20260331-judyln-dts-v7-15-fbbc4b7cc557@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013472; l=1970; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=NBEN5Fp8oA9zh6cl4CSFlQc6fI6G/g2fGa68y/VBlHM=; b=DB1I77V/lVN9MPaUm+ClHozuN7Vs4Wf+rB+UdrnCn//RlzE0z8fWMpB2xeExx9WW6XORIViHo NIv+1llCEd5BKF8gO8mdm6DqH3FyRVzCKua0+6SoqDxFxTOG+12v68/
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

To prevent duplicating the framebuffer address and size point out the
existing framebuffer memory region instead of specifying the address
manually.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 85dc4468b6c4..86cf4eb44084 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
+		framebuffer_mem: memory@9d400000 {
 			reg = <0x0 0x9d400000 0x0 0x2400000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index adf41aa0146a..83e392907244 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -16,7 +16,7 @@ / {
 	chosen {
 		framebuffer@9d400000 {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <3120>;
 			stride = <(1440 * 4)>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index d244ebdd17be..5f7ddb2c4076 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -16,7 +16,7 @@ / {
 	chosen {
 		framebuffer@9d400000 {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <2880>;
 			stride = <(1440 * 4)>;

-- 
2.53.0

