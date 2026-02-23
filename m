Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926337E2FB
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884343; cv=none; b=jp4xEeMsw8w4c2neA3A7pMsaqdPMbSn/Q+rCiD9d56IGWx2nKPtKQxT3QXJUP0iT9euumJhFCDf/d1jBERXcRRfwjFrNm+V4o1pw960aBUn6kgW+1gNBPCDel0fxdPntNJbHehvtm/d6pRTKhSdFHVRKK7wAftQZ0k7GCuBYXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884343; c=relaxed/simple;
	bh=rVA5SoWALV6f1ESxH7ee7aG7QXL0O/G49eDbCuM1u78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPhJzi8o1/vslc6WuHWqjXMJVTDLI3uDSGbjGj0LxDpM43PEN2pLI6WLmti8SWMXs7zMwPGpBkIHHq6Gw8cUF6bNlOt66HGPMQeCcfPaRnaMl0yJSYGf+Dv3oZq2VIzbLeoLCmN2G+iC81a5SOz0jItTslXC1Q5q1XkoR9mUpEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Znp7YH7T; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Znp7YH7T"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771884340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqARVC7xOknJeby1cQjtxcKWRPygW6+l5hx04Z3BJvM=;
	b=Znp7YH7TgDnz4vmTIdtVH1xYAIDBUgV0lUDrHkIzgXFFgYOGka8GsQBeF6DYQVGiof+0Nt
	HgvddfQ1XP9RDdJyB2K/0iqQ/LbzLsO29+17yMbloYc40bl7MH5tqiUJqeDtJ61f/BM9W+
	nxAAX5GDdaodkuH3Sje9ETmF0DKeLQfSLLpFwT28IPU48ku1ITdUDw4lyeqwpkypvK9dEB
	sM0+Pr2jwfJj793TFda0ftL0sVQ1lleDwTFrudgYM1miP1UGfMMmaC/YXlYIMm8f6C28c0
	hLI1LpZPYmCckOVOBR9WlMrkE0i5N/uUtvp2tuRTwa6pPqhxBD7Nix4AGaWyug==
From: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Max McNamee <maxmcnamee@proton.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH 2/3] dt-bindings: qcom: Document samsung,coreprimeltevzw
Date: Mon, 23 Feb 2026 22:05:13 +0000
Message-ID: <20260223220514.2556033-3-wonderfulshrinemaidenofparadise@postmarketos.org>
In-Reply-To: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Raymond Hackley <raymondhackley@protonmail.com>

Document the new samsung,coreprimeltevzw device tree bindings used in
msm8916-samsung-coreprimeltevzw.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..58034056aaea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -171,6 +171,7 @@ properties:
               - qcom,msm8916-mtp
               - samsung,a3u-eur
               - samsung,a5u-eur
+              - samsung,coreprimeltevzw
               - samsung,e5
               - samsung,e7
               - samsung,fortuna3g
-- 
2.47.3

