Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7390F370D74
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224524; cv=none; b=PIUstwz8AoOaxC7WA+oLFkGoup7ZWh1mPogI0a/wch7lwgzOUjpa7189F8YQpgMjCxRXKJWTTG8LTgUv9SrJhEmcG1rIIXgmpwwETGTU56X1YIIQqrfJ0+Q/iSutckT/Dek17X7/CN7ZQUisuKIMAEV90lW/+YH4V68eP6pfYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224524; c=relaxed/simple;
	bh=v0N8xo6MFWIwVEW8StRaWQk6fHZBEqBZmxy286b/97Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6e1U7svR2auwVAs2W7OEPbk4BssQucX/Kj/4MSL+y7C+ekb3wJ8zBX95O/blQSvgJmRYOtifglbaP4LBWztvsK1w+wR3rdjgRmBdfYJmw1VWLVGNsHot3nFDo3I4D23mYDHdmKgmB1HIW1M5dAaFHTLaY83JQFiARbhn9d+1TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pitMKBff; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pitMKBff"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66bb6eb28acso3599452a12.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224514; x=1775829314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=;
        b=pitMKBffVYy8pS3eVc2jLbEX/YabbXEkPdmH3+7Bh0wvmHVH5Lx5UqB0JyiLfRV5Xx
         gyb4BVZJlPZ42jWX1Cg7AlUIMGub913rXtCxWz6CwzAJ0NYuDKH3zxo76LIz1aBxqD/8
         r+FJswYi/uKfh7LO+qGKIS/mCccQ0OQWapV678f/NPyiBwjhfpSilCaBOf15iVDIK7tH
         d8UTXctvWm21Z9uVUDxUFIm3NsQuXfrd2OCOge4EiC6JsHDOPizkPJ9I74LvvWZPilQ4
         G6N6PfN5NL+E/YSry+SEI3N/NiRkholMSOzxdYHv7MkciFpqH7VZC6+DJWGtoSr1YdyP
         JIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224514; x=1775829314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=;
        b=Jkn01j/4e1aSPKjt9iRMBeKIX/s/6zqz39Adv7Wkvc7dJWnWNOBubtPRQu0oDU9Ijg
         0W6kWOwlm7jqza4NIfdpULAEjgw3pqeWHKUKznaVKSMIkxEgQ1oZdM8plG5Wnynd/K6k
         JzW3UrSmD2GIJv5EBNbRKSEhoGDPJc7tk03cZwHhnHg4FH/e3O1Us+9JaHSUV5X8n4FE
         jLChkkvPZd1nYrjLTiYtrPFA58R1GzdNdNiRzzETMWUa1lwW8HyVFprpUWIPXI8324TY
         7aOz6AMmGCaz9dCtJz8jFji8c74EXFdFS3STcoefFEfqwlYHW5ybFCWDljI2znXQgOoL
         ERrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrYGRAsmSDmd1rZDxZ5QStVJrf+bN29J/tqFmKfBoWYK8qrYhvDdDZ/TLGAVy5fjjJMHeADAJmqEI9LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9aOk1CTkzmvV3QjBsS6OtGiDB6fxOo02XeVOjoikvL9IJqjl2
	UAJtXJdotcAsoN+F+Y08uSJAAUj+Ic76aoKSeqlWaoIgk2jIRuUjLAv6aKLjNdzoWCA=
X-Gm-Gg: AeBDieuj5aiDO53bTsju1t3PlkavnCgvGi5ESesHzYRzADO2p0uomMYKpthCnDKmGwH
	JigHcE3wICSDQlgZUnetwXZH3kfHCND1h0T2QGbX6ALB4N6BvNcrP21SlLmkRRJ8Y0U5bTgOh4k
	cRRtG2391plMC+IPCrW8OUKUd++Jq8/KhRHDXJdJUWnCItfcfR1ZYZbxwcf4uCy+gqC2kIqEiKX
	xGEELjVG/j4UfhCIloPA+OMRoO2ym2TcDA+DjC7pUjYm4Yz6hYS35bOAnalnrgtVbPgyQuMhbQQ
	Hvh1bdaZlCRz9QH0YDK41p/nkTDn2JNyB/mpYaP4A188a+AGAzRXovcdv3v8BH8qKzH7FA+SPcL
	n+fYTlu/g3FZ+xeP38OusmzM0wOFHLq/RatWPTsAdDrvfMyLrivgqwnbc3uguI5bWua5cnb3mTa
	K+VyehGqdsnXqj/+MU03v6vW1bIpA48ZhbWKJ7erMm1StUQmNLiyLZU45bHMPqau2ry2JVdZdXt
	tJoerciddRrb1NsYKEsTlXUHxlM2Mg6m7QMFw==
X-Received: by 2002:a17:907:d08f:b0:b9c:10c4:e708 with SMTP id a640c23a62f3a-b9c67a34a9dmr143022066b.42.1775224514386;
        Fri, 03 Apr 2026 06:55:14 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:47 +0200
Subject: [PATCH v2 1/7] regulator: dt-bindings: qcom,qca6390-pmu: Document
 WCN6755 PMU
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-1-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1270;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v0N8xo6MFWIwVEW8StRaWQk6fHZBEqBZmxy286b/97Y=;
 b=lmSluzrxl2IvHohqbLRwM8ZeK0TA0Y4HsWh+y4B3jOfVOirTRYkehiK7ceZ42CboR9e5Ts5BN
 rMEWV8MPDVyDP+/ux64qnG2NCnxwOhrrXEqE51f24EPFDrswFgQmVZA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the WCN6755 PMU using a fallback to WCN6750 since the two chips
seem to be completely pin and software compatible. In fact the original
downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/regulator/qcom,qca6390-pmu.yaml  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 47c425c9fff1..105174df7df2 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -16,11 +16,17 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,qca6390-pmu
-      - qcom,wcn6750-pmu
-      - qcom,wcn6855-pmu
-      - qcom,wcn7850-pmu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-pmu
+          - const: qcom,wcn6750-pmu
+
+      - enum:
+          - qcom,qca6390-pmu
+          - qcom,wcn6750-pmu
+          - qcom,wcn6855-pmu
+          - qcom,wcn7850-pmu
 
   vdd-supply:
     description: VDD supply regulator handle

-- 
2.53.0

