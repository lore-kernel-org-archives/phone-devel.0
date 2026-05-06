Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D27235E92B;
	Wed,  6 May 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778102644; cv=none; b=jtpjcQGZrlFUk99XBwdvCd4GTrVgcCwIdGIcZljBK3PdDLCIv6ejJbVryv2DlNAoU+H+zsxCvN+rc0XJFD62McyzlV061PgC7uJ6IYG1mrlp7zOoGVFm4nEFcLn7vA0Y4pSA8x9MiQug52seOnFzSWdES4CtACJw2ap8+MgwGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778102644; c=relaxed/simple;
	bh=bOp/XnzpWg6Okv/XKeNm3o16G8ypAnd1OT93w+aI4pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZXkah2zVBBnJhh9QZ5U+tJ43+KAoXHD15kIuUCD1fbtXJcfDHSoJ5Ih5rGPkocfa3DUBsh1V+ifv5p8IAOoipd6tE5f+GvVTpzNGC8cBq6iGC8BE2fbKn5F/C6N80saN0rNO5EhSibjw4WWnQ2zOe4EHDKA+YPgoXVzG2BouZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=jv+ylAOW; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="jv+ylAOW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778102631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=27j38BQzRRUufIyWGUwV7rnv6ZNf4FgzfmGcfX1k3Vg=;
	b=jv+ylAOWBLap9D/0r+8+x7AYFnL0FRgbCOOuKbs9bgt5YkreYKlrB2MdARNJ49hH5H0ZtZ
	YYfNtkiT86WWJhCY57qU0aosKLfWw+GRimHGIYz79CszB95naPbHU4zIryE3d38ulKavfJ
	c7M0L9mJXH5tK7vebjuMKTgDxWSr5/8EKPEkCyKKILpdTzJZA8J0mcvqK4iAJi9o5SgZZY
	L94O/39H+pCTGuXJMuyJJsstu9iJWlVzoKbW4qaaoZp2TOp+/VNzyFNTqm+uemp7SBpeFW
	U7pLqI1Zds6Fx7BOIEM6nyfL0AvqWr4uQu9tHDyijnhlE3Ms1qE4PxF3gcw8mw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
Date: Wed,  6 May 2026 18:16:52 -0300
Message-ID: <20260506212319.682749-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Motorola Edge 30 (motorola,dubai) is a smartphone based on the
SM7325 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
v3: no change in this one
v2: https://lore.kernel.org/all/20260403054417.167917-1-val@packett.cool/
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..a5117d0839db 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1040,6 +1040,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,dubai
               - nothing,spacewar
           - const: qcom,sm7325
 
-- 
2.53.0

