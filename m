Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F9D3CE498;
	Thu,  5 Mar 2026 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731732; cv=none; b=De5ryY2t85B9VFfg3jN7Q9HaFk6vLfpQrDtbSMd6CLApRez8UmUMLe7jbteU/rb0bR4SoIdQ1rB5rk9nVu9xo3WVP2jl5XFp2el3SHa8N2CSVduV7CE4mz37x1is5RCrht5o8tLEBSi/batGLIfOMUF+PftGS/diY86jLeloNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731732; c=relaxed/simple;
	bh=ZPK2VT1HFBBm6ahy9ybaGuxsK2/a/XNZLCQf575gccA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRSEGvvz6IcaQMGzRwE3Ke3uaiMzLYUGyJ3HMmRC7COsz+uXcVXmxIDyMP/YUv8TDeGmujycImi489pGQ8NRXn5tDSx8OKAWHHNvhNPeCZVlIh+VRoxfO98iR7jIacQ+hWYt5wIjTatCh5TMXAiBoch42/XJNp2h8ReYr9D5U+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UsGAkVQk; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cX8enkkK; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UsGAkVQk";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cX8enkkK"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731728; bh=AYxYY2/zzt/6fBHUnJEllfl
	xkQdpqVDfE8pDshk7bPY=; b=UsGAkVQk4x7G1ZNDkI5rN0xDOgFUk0eisZgYMHo/OTeTfM26eX
	60RWpovoKWXoveOh6cRiRLSQrAiLh8+rSK5Fc8fsKLYM0UFFk/LGeoLNkrjoViMklVZ4z7FK0V6
	diLBfyGaXfSS8J90WtOu+pf7odFtyfGYwBgjlIdTz4FU1YdlmAXn66084b1u4ZONjbwiUmjx1xw
	6TbyslKqJvqraDTKGaRkwxEId6jkW5cgg0UFi7eTEj8ZLj6vcZOCdC6S2OeVBdX8ONrikJp2Lti
	EPP/Rqcv4j9kxi5K7JVHCp9tO/zwP3NZxkkIjtqRg2gP/N9i/0h9FLH6rI/EZlujpLw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731728; bh=AYxYY2/zzt/6fBHUnJEllfl
	xkQdpqVDfE8pDshk7bPY=; b=cX8enkkKnkMcQe/AEyy6kQrPMIN8OxbOzPoKP0HSJzTSy7MLnP
	d2PTIJRaNmKLihk4+m7Ow5ZyD/yD3dmj3vAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 05 Mar 2026 18:28:34 +0100
Subject: [PATCH 2/5] dt-bindings: arm: qcom: Add Redmi 4A
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-riva-common-v1-2-436f1f4b7399@mainlining.org>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
In-Reply-To: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772731726; l=652;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZPK2VT1HFBBm6ahy9ybaGuxsK2/a/XNZLCQf575gccA=;
 b=eZLcqu1sWfWuqMhkf0AiKgmZcK242z7eMUGZSIBEGsO6ANBbCjMGIZCnn9lK/ofUGE3P3gLbe
 dUvPlYHERfDADxgmgsyeY8WJwbcAmoD3UNQLapaCNiCemVlsSf5zFW3
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add Redmi 4A (rolex).

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 153664da91d9..456c1a382cc2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -200,6 +200,7 @@ properties:
       - items:
           - enum:
               - xiaomi,riva
+              - xiaomi,rolex
           - const: qcom,msm8917
 
       - items:

-- 
2.53.0

