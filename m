Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9186934FF5B
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320149; cv=none; b=XQOhnHo+SESh+JWDmOudmH4XR2L4SEtytgb3ksoxK2RiqfHNKPXT987GWXAiEhph98x7R/+AHkrJy5pEsWLC9BCZ7zolaC5qLVsxe7JfMxo1BxOyGP+EDDk6ednSd6Pm9MJtn8KzXY9IfZoKWTDev5dTYYNMBdNmJbuTmtTAcZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320149; c=relaxed/simple;
	bh=RUiw2Q2OB1byp9EOF6jHqzUwjQ5h3z+P9Nr4olxtWNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rw7hy+sWnGJKfr3qO6yEe8rsFnVvQc9x/5Pfm8GAMjCw6Gki9qiMa6NgwvfWnQmEtFh4hjujuPBv5SWYDVtI26jdYNdDkiSSiMPpau1KBSIk7OPjz7ExF/TiyPfIEiKmjuCldRQs7x/Z6iSoHHXedEj7G/Ia3uslH8mrsyVoQfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=oKAXn6wb; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="oKAXn6wb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774320145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWLN5Av+VMlDdVPrcuA63AX+y+DyqkSpI70tfT6DXfI=;
	b=oKAXn6wbbZtQeEiNftGy0EOney9Dst/YE1tiOqh53HyimfqWI9XhHTZWF2LjE5QibBGFZ3
	3NtS87t87hEsOM8e9d2zih96r5a7GrKJdUsl2Z6pew9grQise4YPFP6hMt8NctY49ejG8n
	cXmKUX7MPupvnPBi+Gz0wDBv9a6EWY0RyGmuwBK0xFU9mTwfKZQGpTehD96YUSplxSBsox
	Sq0pKXUqeRXfhqq8mc1XhKG4WFPrgxNyRnumrHKW/feyJuM+Qbut2TYea2XwftrEcsoCFX
	oD7P2maJGdD/17yImx7ptFxgu3JND0IpQi0Zpj+GVW8XPF7Qzl/NPh7skDOf8g==
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
Subject: [PATCH v6 14/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}: reference memory region in fb
Date: Mon, 23 Mar 2026 19:42:14 -0700
Message-ID: <20260323-judyln-dts-v6-14-d89f07897283@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774320090; l=1909; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=RUiw2Q2OB1byp9EOF6jHqzUwjQ5h3z+P9Nr4olxtWNw=; b=rBVPtk6TTQ4LcclMwK9sOh4mQIxqRAk4xQYTgzMqCYP264VoSuxxmwfA3PIRGTdsu+1ZfmQIK or+fj04ThxLDTIYxrte/IKJLZ4pn7YhXe938t4ip1Yd2O1bFX9lC6N1
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This cleans up the node a bit and prevents duplicating the region specs
in the reg field

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 51fc1735ff49..f42800dd25be 100644
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
index ffe1da2227f0..ae6cbd132949 100644
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

