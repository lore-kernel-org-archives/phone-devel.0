Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7301D6BB
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112218; cv=none; b=Csbd4Q+HA+RKrAq+wglURNAewyaYLG9ZugeoDC8xbQ3W8Zk2yUejFnPTgDCilbD5w4gSymwKpE+Z4SFy022oQH3ryOVfc8vieLpJ1BO6i7wODl80oI0UiJKyYbCkJM5dSiDa+eriogwqpmQeoP9zt/Eu47gYSp4+IMFdeEqUwBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112218; c=relaxed/simple;
	bh=YL8boRi58Fb9HIAjBmQGYG/fPyUD+EmvR+sjd2urFWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0ShKnMhD9RvWWE05kuILx3dUGQZxki/iDrs0rupktEDs6EFTTc9/NoCvIYTo6n9KpX+rZMVT1l+a1dpZbHhp+uVjC10UopiltJ2ICobDXGhZW1EwTZpCed5XkreyxsZURejgzHRKWN3KtpyjH1gRVk3w6iWAHszMaXvGfBhpPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=h9W1ehdU; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="h9W1ehdU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775112215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dN6n7q9aSz+JAAiiGw5b3hzH3XbhBiH8W3rSEv/bZPw=;
	b=h9W1ehdUXuViIQE9bKvqB393DInO896IswAxVFNKb4NDayFU0Haz3kTOdLn0f+/diNxq5L
	wrScnM8xumsWy5owqF9ISGAn7+HO1NS1mFcrDniGl0G/JIn3UH33Q85oGPlQTcGgPJJkTW
	TpNjbXdtEmc1+PvNcgt0Gg8iKbPcOZDeCxQyLOU1J7MEPpj9zm8Jib1DqqTGaTZPjgOEYS
	6eBWsC49i01qt7b6UXwLqxsJqMveaeKSgicppj7fj0ainos7cnNMPheiySK5Kf43DWXpv4
	y6yXtVfyhnj4vix1c8sMO2Tx3bFc96oEI4PI841ketexSLGYs6Pq4k07lCYw0A==
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
Subject: [PATCH v8 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference memory region in fb
Date: Wed,  1 Apr 2026 23:43:04 -0700
Message-ID: <20260401-judyln-dts-v8-15-cf13065e52ab@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
References: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775112053; l=2103; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=YL8boRi58Fb9HIAjBmQGYG/fPyUD+EmvR+sjd2urFWo=; b=6IbjJKoo3wZPGYtTsR4lTfSkowsGV2h2BAtMhGEmb3RKwtanprYFJVF4MWDnyAggU1fvvi2sV 6mUPomKyNaLBndw29Tp84fuROJ0M80y7uwQSBpQ9LK7Kq7XtAQf9i5s
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

To prevent duplicating the framebuffer address and size point out the
existing framebuffer memory region instead of specifying the address
manually.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

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
index adf41aa0146a..349faa123ff1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -14,9 +14,9 @@ / {
 	compatible = "lg,judyln", "qcom,sdm845";
 
 	chosen {
-		framebuffer@9d400000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <3120>;
 			stride = <(1440 * 4)>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index d244ebdd17be..44e762f78e95 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -14,9 +14,9 @@ / {
 	compatible = "lg,judyp", "qcom,sdm845";
 
 	chosen {
-		framebuffer@9d400000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <2880>;
 			stride = <(1440 * 4)>;

-- 
2.53.0

