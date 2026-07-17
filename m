Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F4F2C3757
	for <phone-devel@vger.kernel.org>; Fri, 17 Jul 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295262; cv=none; b=LIeq2alapokODnyxRl/Cl8AbivpB7lku+2EDUywt66DI9x99ZrCmcyGiT8/MXg/1v4R+Hbq1wBECYsZU8hmpHsK9GBOWehNXp5vcvJDHNYvRo+6gOa6UkC2JerqZb/CkMXb5upV/LHjvcILAXsKiaaBYr7hWBYNGPVhZtzK+qoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295262; c=relaxed/simple;
	bh=HFSTrk43zyzNsRY27xvVNkH801KFPO7/o86KOmtZ658=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnjvxVKk8gavyilpMezb9Fkq9nxorJRzih5CHzWsiSs3RZv+gMhaH3tIRRHd6BhaMaHwZ2r2+AoNBSjO8Sb89BItzw7toG4HJArAOlwTV2wEgW3/XosLbwMpk1hNPDrrKMI/p0dLE3qULhn41o+h6gWNfPKq0jeJLKbfWCt1vKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u1XAOXeu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u1XAOXeu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de008b020so1229200f8f.1
        for <phone-devel@vger.kernel.org>; Fri, 17 Jul 2026 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784295256; x=1784900056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaEStTJIwB/dkXeiJZfpbyBGFPs+1/VB2GuZupuIQfc=;
        b=u1XAOXeu8ZemaSc/EZLGbVVnPhLts63CFqmQmf9M55vK8AdMJWqPnwJQPaiDebpQmM
         F4fvLLtnJBEPZGxNZpY6uC6uLTmyVdyMhBxZSwCjdh3tLi0W33S2NqA+bGL5OPkeWI99
         /gy/s4a9sXSC42IzZL/aRkNNacp4E59OlGNi1SzmZz/6xQ63bGMuK0mHd7PQOPFkpisP
         5KKyBxUTrczpu1yzOA4727wyT6FeZof+AbAcuaLJU/sUGdRr59yiiATtUH1Uwcc8x3+S
         AwLdV7zZ4vgid0pC1gq5tE7JwN/EWYd2yq0rW/8YNw8Jij57z62XCg9NuONtvFsC4SrO
         9UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295256; x=1784900056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaEStTJIwB/dkXeiJZfpbyBGFPs+1/VB2GuZupuIQfc=;
        b=o+3+74oTFmiLvVnwviyXqGcSNae0NYg/aXrKBaH7unM3Zapwvta34Wux/10MtTzXHh
         QM2xu2asMhPbpmMsGl/JsCwc1lyoor4yWpDe5rfQAcT4r2sdDaXDmKXMSrjV0CNI/uuJ
         CQ261VIyOURXoVY0twmk1+rHZrTzRAx6j4Fk0oEDiT+4eTHaM8AiO7DbIfx3YYbmp1k1
         BxYIQ4JDUx/VNpBnllT2a4HjPvuf5IlkmGoHgED70VWVCbYLRJ9xF2jv4cnkUKhgvQ97
         yCKxaRr8I6EB8/w8KCBZeQ5n2JoqlCko0fvAWyGbJ3cAjccTFnWQ+3v9bXMjqniXFj1S
         lTSw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/6F1MPvE5ct7wy2xdyJbUrdVdLp1RREkCmKuNHnWivQEDRmE2UluiAvgzzY5iJDygIDu7uvuJMTMaOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySA9dtqd1OQsLefL2RUhEDV5EY8IdBrNyb/5LTH9DjLglHgCkw
	gzCGB7tIcvA4Vmp3aC3gnsy4oBgn7/p2ynljQWYCTCumBaqFg2waS5Brtiw38ZdlXkw=
X-Gm-Gg: AfdE7ckY/jBzUw2zx/SKmm5x/dEWL4U5bmeT3QCX6uGaRaXlYAmrwI3pdSCKucdH7Oz
	UUvxQZN1pYQBwL3iobtXGCemQfOhQ3WtdHei+bUC4ANvj2YEFBGgo5/9m7cvmZooLTkjc9iPi85
	Pbm1lYYSSO8xSH1+BZCM2JweePVWtUf4UT/qJIxn4rf+6Xwr11Ytq9O/K34ETcM8ExOelqmOYIM
	vJTcJ2l0JvQr26X6UUjC8t8MPYBzG9BrQBPpZ05+XjvxhsWhtYq5AErLTC6zwdF7/ew+WTaZo4c
	XeyREK+GRXK1sGAdFelnlDpHnwPSebYXd5ZfkPYvUDCdgUwbml9LMi0xZmhyboOg4/rtG87c2rs
	ODq3H90WW6bAgf1BzIN2rIdyVb9DBrlMkfoPXbKlAqs5bj2BExFsn3+THf9D7d2OJx2pno8rNrM
	Vd0XJsiDvkY4VVqj0=
X-Received: by 2002:a05:6000:430b:b0:478:3df9:5d8c with SMTP id ffacd0b85a97d-47f5a4197e4mr9380422f8f.2.1784295256462;
        Fri, 17 Jul 2026 06:34:16 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm4361547f8f.5.2026.07.17.06.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Jul 2026 15:33:03 +0200
Subject: [PATCH v2 1/2] dt-bindings: interconnect: OSM L3: Document Milos
 OSM L3 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
In-Reply-To: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784295239; l=893;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HFSTrk43zyzNsRY27xvVNkH801KFPO7/o86KOmtZ658=;
 b=/t1sZp8Zx+PC4pDijJkMxs119lQoymRHzjhpNhzRRiFpi0uwSLJpXkz/a+ta6tM0XuibepT7N
 MYF66BCUTRiD4et4OkbzF1uWI0FnWLHu1kL5k7/8Em3RM//kDbGCyr8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the OSM L3 found in the Qualcomm Milos SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

