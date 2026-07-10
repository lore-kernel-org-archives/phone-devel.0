Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29C13DCDAB
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675379; cv=none; b=LCt+B/rkXsJko8AhscZRqZR/2/KofA9oGYJQ17olwtdi0ZvqLatL9yg+uf0baUrceOv5SobbaloC/xGUCFzp5hP8N13In/JrDhmETLJUkQWRkL0GD86KeRJMFUo1PZovXnzgqV9usD3T9kwU69B10aByoi5VkTqUtMqxgnbb/Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675379; c=relaxed/simple;
	bh=2/pH/58ZPSVPRJvZYePDwwn0y2ezcvuAOg6I4e2E1hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXfZsJH5bY2RNt3SsP/IIE7UIv6hIwRkjVjUQIqFvvGYvwJHV5I+BXvNk8EKrLLGWNMDOIzTpU44j66Anpzq1r5BwHxaBkg0X3pEDJ/ixN25wJ8QLAEn5dJlgjqnKq3XC7o0/xRMbkBiOXXK7g4HKt2UMVYIbAGjVdJX5+I7yDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5rRUqhHl; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5rRUqhHl"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15f6de6cdfso112193966b.0
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675375; x=1784280175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUnfFgpx3dZdJM3zV3PHug4HTfilmgNZwXGP6vHMpiQ=;
        b=5rRUqhHl7SM6pxnfM1MmKT1RlmNQ6e8/fPiixj2PM+RS759VgmCUgz82HvjEiDJN4Q
         a2R6Bp9FMOv5V/wR0mXIC2HvuxYiJdoCuMSj6sDP4JKC9TGAVXqG298w95aOVBJSKuLK
         G9IN8aPfrCIEyg6RO/ISWneH5hFVJ3Qw4vJpQM4RljnZVLyiJCeabLL5L9djMp9MRvU1
         y3xrV2ATEzr5pvbrD3UWuR+eRqRjuIqjnpKC8JoGi5J2j2tnn0YqwcDu2Emd/AN+ghDa
         9lFM7o2bA1DYBVCyLQ1qeTm9RVIupGVHPnW1c1yy1CPy7MdoTfPvPrlSqiQVd6ofAzg2
         Xg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675375; x=1784280175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUnfFgpx3dZdJM3zV3PHug4HTfilmgNZwXGP6vHMpiQ=;
        b=SgO5ZqsYw32Wv3uuTGZllA7LaQSJOgiXrc9CDChi5k4nD/GIHD2hqaZL2DUUITE24q
         C5zHUw1XcPQyVSW5N27qBbtrxjvM5kGPJSp8ZSvx9q8Rd++oXmCAb++dRmRaoIrSY/4h
         eMgDza79HlFlIMcGGcStLGNSxNRRgTJzbfZ6nmKdJ5ZKsK3rrJTAjUo3dr9s871KaWsU
         OuR0XP7cySXyhV1gWXO/bk0wn4gnUOPvHpy5ymJswmNpWJT5CV9UJ99C2QpHShEvplc3
         5zzNdMhUYVJPUmaNIYR2Zs/MGGtbIbYEKOsPk7W702kYOZo6SR5T2TjAIV1pjHLGs40L
         KqSw==
X-Forwarded-Encrypted: i=1; AHgh+RrXkx/7vmtH5v+XemwtdgG/FFlVUiUfcDtVH75QunqRwbiIXtPzUpod9JRLyBmm99IS7oMI6aJhJCxKSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwINNQg9rerZOLDRBMWGzTkt1eRbqTOWsd6ZS+SFx0CLLHN2TbB
	1/W0sfiK1li6rWAkpmEeMkLsHKirGKm63xOPwLE0WaPyx+LOWbprVZs75eiGUFIMjXA=
X-Gm-Gg: AfdE7cnk/7fSiRXDXhV9DvR5AFt6rvIH5SYpFln3XrU9jdfn/doe+rN6fgXMq1NPnhm
	fBSh1V2X/6z/qUayZj6RuFxG3dUVkRtfuSBLJF+4Ve1BC8EC014g4ZU1VmizaQXtHdQLlyt7vi2
	cdPgjYuQ4FxZT1S6v5AIvWNvRpEhYoTalRibDpl3+Wg+ujMykgS3E38MjorkBoXqWBe4Qa8FvLP
	nxEvU2Nw7Ku42GwqaGa8d3w35e8tb3CICxzlTuXPre83IqeQZY5DufNTY5meDtWimb/5KvhfPQV
	TcUjLbcbD+ra7TuJaS0jtJlkfuyOmKUffnbdf6bLntTcVgLrRkFEQvhehVLZw8wBB0iHwWH7lJd
	Xcyz6EhU+SLkrS9sVlSveRdAe4+eG8U443bDH0/PyBTt83/DvshTAMq43YFupsPlqSAXWtLTkx5
	Jch84J5uUWH4qjobVJsN6eQhJurxefjIu6Xb1DhbpK1v2IFhQ/IPOXo7uz5NJ5qb7/Ty8=
X-Received: by 2002:a17:907:971f:b0:c12:7f25:cc59 with SMTP id a640c23a62f3a-c15ce0ab923mr383566866b.16.1783675374892;
        Fri, 10 Jul 2026 02:22:54 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:22:39 +0200
Subject: [PATCH 1/4] dt-bindings: interconnect: OSM L3: Document Milos OSM
 L3 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-cpu-opp-v1-1-ae7f4b09bc77@fairphone.com>
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=823;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2/pH/58ZPSVPRJvZYePDwwn0y2ezcvuAOg6I4e2E1hc=;
 b=mZje+eL9LnFEwjHLlmoyphuamb10BC+qArdJFGRuLfUvjg0fKeVUXAEx0HydxxY9D0RU6A61U
 iSsZJ2nnMRAAkMGX/QEf0uNPmQyplh7YaCMfQrso3oCzBoGdCKnf6Fp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the OSM L3 found in the Qualcomm Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 41b9f758bf8b..17690ff34489 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3
               - qcom,sc8280xp-epss-l3

-- 
2.55.0

