Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6033DC87F
	for <phone-devel@vger.kernel.org>; Thu,  4 Jun 2026 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604377; cv=none; b=q+4+0KBniCObCkLj1hNjw95NLUwSw08IH8a4OunvUb906D3tbMZ3jtcmj3alv+DzuBOzFRswjcXnsus1Ih4c12JrJcTowzBo9adCOoMfYr9Wf/luWHQ4NsPHvA0XbKhG0Z3+bUkjkIgaBWA1UdYKZRtuPJGVktW4SilhB0ecYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604377; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM9L+LCXPHHU2ub+mdSYg+2BeewQp1tWKMEC5ktf1IE5Ma9EuY1yD6D4Bsqkk1+VOWkwlDg/IwH22CcFzX9F/wMnoKNnkshyi3n66SKQ/67ahOKT3rbPx0u79M+Ul5SMrz7z6GFCFTjcgxyd7jALm68gtr9fYKYHo5lBMhjV3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlG4kX3H; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlG4kX3H"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ac10e337so8370085e9.3
        for <phone-devel@vger.kernel.org>; Thu, 04 Jun 2026 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604375; x=1781209175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=QlG4kX3HDQtzP6R87peAQ21KOr993NxCKGVCpGVHz/k/W+cjj9OU6xyybsL8jdgd/f
         ZC8ooygv2/aHWQ3A1o+i4Dqgb6WJGQUbboSV6NQU5YvoPdYMPxDnw9e659GuxuW8vgXD
         ioiMvivzpl9AUVE3sBnejtnBkQXqgg/v92mT18uZX1hTKJwBM6FkUySfMv/gjdzhHFeQ
         LrrjVK3oz6bfjASBKVy7M3fl+3CtJISOT9MUHAYS2VDDy/dHjDnTHjIWLNoVDeVljYU6
         /1U02SAM1eT8USoScBbVddnb/EufZ6LvVTjBi/W6XjU81cfZRd5SlpGc0eeDIjJ4XfqD
         841A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604375; x=1781209175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=Z0GRkkA6oVuFVfgHgVE/I9sEG/Hyi45UHgAZk57hS4xraTgWGggZPHws20uqSI5/xX
         czndmqbrkLRq1Z4pKVyOJLLJz2GieLPDB08SNa3TcmxN2R0ZXMQgmsN3UUpwzLHVHUN4
         fFrTgZL4BaQIHnuciObyjHl9w4KPQYTxWnLj9k8j/Qv2ANsWpkMojB+5joEapGCECTQe
         lIAXpygyxj4Uo8affsHGdBwQkyL2QdW6SQMXPBu/a9OVHpCVS87FVfmxeYKy3ELKVXjN
         goqH4qB8xXOwbVGF/nMeozpNwQjgyzFxwsXLM8kD31Yp8+MGNJ24F1IAdlxHbRNRpgXv
         jdqA==
X-Forwarded-Encrypted: i=1; AFNElJ/Tp5kPSD0d09pDCUbksbh9QMAJpNSWAXEb52pMYxD+Qa7SiECAYll1jAz2UE6HaShTjQK4GT4pAic5lA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5H9xOKVOwB+INeRDrbJBdGrQlkNIn+F3ZTxO8eH5PP4rWEOVC
	IjQlORqvbOjR9j0uvv5W+z7ETjGyauz/PgZcMtKoDe3EBFGwGDiv8i7u
X-Gm-Gg: Acq92OHhpxg8QSxW9P+iBjB9P72aMpJ/0Zo2EF7gCJ+t+M7yxHck0Uj0Kzvs6+PKv9Q
	FGkIFQeMK83Wl63clO7KEERPf6W9xyde6+HuPmSi9DOV836BHjgcqajjBWyAfXop5e9CBfUvv1/
	hpndKEiOnGa2IEqNdfj4iBKNkPAz4ObR75L+iGEXCFaiX4E3FXeNzPVU65iPA85JszCM6xPAYWf
	jab/oef0l3x7EsWPNBZmgyOgsY2vxytZws2aWUpS6UWLVC+1FcfjHm6DknIWrnP6aDb1nM8Q5fX
	g+qCDjmEW7xHUCEjtmod62rwJhFCxkBrE2jDI1oGyZxmT40spCZWfg8FaODFhHCWDUzHxHkkDJ0
	IFpia2q94od7zAOZj60X3VqK6dJMW9fsUTwGxgf7l6qOysy8VFOuX8JFf0tGl+f1WRnqA2DhgJz
	bFM5A7PnpsYeOHnkAQ1Y8sh8hcvx7SRKyJOfwqRA==
X-Received: by 2002:a05:600c:1c1f:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-490c2598382mr2038805e9.6.1780604374641;
        Thu, 04 Jun 2026 13:19:34 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm18999748f8f.18.2026.06.04.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:19:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 04 Jun 2026 23:19:27 +0300
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-yukon-eagle-v3-1-9e3b57d306a8@gmail.com>
References: <20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com>
In-Reply-To: <20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0

