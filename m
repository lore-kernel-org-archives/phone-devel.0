Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33F2C028B;
	Sun, 15 Mar 2026 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773592000; cv=none; b=DdfWpMmaqBj1TkwdIKWYkAHPoKgvjuuPGYFo5MTirplvrrPqzU9seZNdgjyMG6WaJptNKBElIoGJwoiD6Ke9gRn9wIscPBNg+20zB2wQp+xZ59xhtRPjRLBzjqq79oydjdF5gU5e0mGsM3qjxOB7DELEovwbJYKLkRdM6d1VKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773592000; c=relaxed/simple;
	bh=TzsVHGlSCoBbKSOPs+fFU0nWBXCQdGT/XXZxOtpruB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKRowsAigqurH4UgRS27t8e9GbI7SGsptVQArd0N61NUbpfJpGRKYfvXBIzyrzgmdvAxUxwiEpyFlCMWiEJ+JKuPYaV+a/Efr/DTlXD4CQvc7eK+bF//QXNWdvgwkwBaJTZ8KvKZR4B5etBp0a89817YD/Ov2iEePsU/JPfmKwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=M3hQPBwN; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Sda7y1RN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="M3hQPBwN";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Sda7y1RN"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773591986; bh=pruZLXeRhOoythzHmsrVYzI
	deJBxXFqU4MKRcDB+P0s=; b=M3hQPBwNl5uj2V7yEbfdrQG1nyYJwUlT9p2UuH/ilZ5gWZStIk
	w6w76YotzI9QaW3gFvB7orekYXm6P0HGNkg30+JBwaDX/0Ym8h5h1zBAEKlvxQflUODFRJWunom
	qfF2HyyuV7BOwd4Z+orEZfBh5gRg91lg/6zVhwzTooqSyjZ8wd0y/nMgTUL9fWxj9Z6f6Uasp5i
	nEtyELyrjf30USZV9ftHc+c212DRuajH+ys2EDmXpEDLCIcGxSKt1FPan1lNRQnV3XPTf5gEfQL
	5dVdv/EfAlLG7O3Pc0L17tCRFiQTe68DbRgAqG3eLHMfBChGORSWKvvbdpmBnuc02jg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773591986; bh=pruZLXeRhOoythzHmsrVYzI
	deJBxXFqU4MKRcDB+P0s=; b=Sda7y1RNVpee02RumUwKUFs6y0v5PqQ+yE+eF9VqPag2voSjUH
	3k9nEnn+OqbvaIWtxbSX3CEL+pP2Nxw4fBBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 15 Mar 2026 17:26:22 +0100
Subject: [PATCH v3 4/6] dt-bindings: arm: qcom: Add Redmi 4A and Go
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260315-riva-common-v3-4-897f130786ed@mainlining.org>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
In-Reply-To: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773591982; l=776;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=TzsVHGlSCoBbKSOPs+fFU0nWBXCQdGT/XXZxOtpruB8=;
 b=GVbgGdLenWZHAoUYkmcNFghoWH3nCA7nHpvB5Mm2LgkPyNLBf6sq7WBqpPYqBTbAgTMppHrEr
 eAULYlWc4qmDFN/k57u+ngOuLs69H/oCDmQxuJokWflU4jUEwwwi39G
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add Redmi 4A (rolex) and Redmi Go (tiare).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 153664da91d9..1bdf2d8c9b47 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -200,6 +200,8 @@ properties:
       - items:
           - enum:
               - xiaomi,riva
+              - xiaomi,rolex
+              - xiaomi,tiare
           - const: qcom,msm8917
 
       - items:

-- 
2.53.0

