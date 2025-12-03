Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487E92EBDF2
	for <phone-devel@vger.kernel.org>; Wed,  3 Dec 2025 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754975; cv=none; b=Q35UmrgGcBZdxbD4upaGK5s4Phf2vkX1Mzkda3gtMefBwascy4dyVrmWhudDI+yrwJN7yG4ByO2Da9HyjWr3Y3PanKQKYtnbvc43nY1iVUuoPbDIlzJBAor1j2YvfF90tLcB2NuFdm5udxNQOjos742I/Waza51qwwERMJ80tlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754975; c=relaxed/simple;
	bh=TZ/qzHmyomjfRELtYl9aiivLFrmu42zjg79Z6Ox7wVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9HQQzib3N5V9LNLJOaWP3pkm1vJ+FmjyZYJjSn5bxOWVsujd23RwG8kbrf861cgu59Ha0cJ2tme5LsK/rQBrs4j2Mz+48hWzhgbwS7xeOpgemHS/yIebxroJG3vUYQSzxu2t9ii4RURlWQTRlZIpWnuHiyYb0OV91XQIOe79EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pSS7IDXK; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pSS7IDXK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gY5XInM0q/UvZEMt53Sph/f6jCFSFhWhpI/uLzw0IiQ=;
	b=pSS7IDXKIOlj2wtBpZyo1c1h/7XwxMplKcL2FE0KwpnBWPyiN85CObfDIQJ9abQkMkj7Kj
	znsD4rme/MWcsu2FSkWPtyGBulb3O/KuHBYdkc97YdR5716LJiknCelOmsWhNcxgmK4jsG
	zIi9y+PBvaiA0sBjAfxcl6wHC3Rn1JjLJwrjF5Cs18rHThMHLQeYdnn7OD+wKDTUwuC/oO
	n3FH1PD2iK7O45Tl5LSzpT8rYyPEU/qBY/aVIOGbPVfXAcEoRLbzG7T+1hcHIo5/RCNgN+
	pX1y2G5VGwiprGBIMlCP4BvsM25tU90jk9j2qwoo6NtZas2e7yLnBf2PJtIxBw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 03 Dec 2025 01:41:01 -0800
Subject: [PATCH v5 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-judyln-dts-v5-12-80c1ffca8487@postmarketos.org>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
In-Reply-To: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=918;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=TZ/qzHmyomjfRELtYl9aiivLFrmu42zjg79Z6Ox7wVo=;
 b=Hx15hjzEhzEJQuVn0hUo+CDXDhVjKfm5JFjFR7efpLZdnhw8MdptmCwQ0d68KW8hQzZrvDjYz
 uBtEScHhXayBxOTeacNLxaltGagqrmbSinsX1slpJpn/0ThDo5gzn7P
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

It causes this warning

[ 0.000000] OF: reserved mem: OVERLAP DETECTED!
framebuffer@9d400000
(0x000000009d400000--0x000000009f800000) overlaps with
memory@9d400000 (0x000000009d400000--0x000000009f800000)

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index bfa0ecec82fd..5946d1e60b6e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -98,12 +98,6 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
-			no-map;
-		};
-
 		qseecom_mem: memory@b2000000 {
 			reg = <0 0xb2000000 0 0x1800000>;
 			no-map;

-- 
2.52.0

