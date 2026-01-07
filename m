Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C241D18859B
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773169; cv=none; b=fSfsZHRh9zqfpJkDO4In8Evyffo9mL5pqGuenmIfiKdgDfyrq790cG/JuZPPaqUdKHlO2QgbyQaGZGrWT9ZOJChPN0lFHtAd8AEjtie9yatEVcPAPt9sH/sxdBdpyXrjJ7pPNJe0ee6liltNcTv24FLBs+UtEAawHhbpG5QspJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773169; c=relaxed/simple;
	bh=+tKKM8eQQWo+yQ33MK7IDCfz3vrpdNi8mDp5L1/eT14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMReBy9bVPDRzQ5HqtHAi85liM13u0mLn0Db81ZE9gYmTdR+bKnf6Hj/FuRK85a2KKP9d/e3wxeMJ5mTcULl6uj2ywVgxbLrGtXQX2TpEl3WEe21Kp1PRZJOCmetKyTJKx0OddHB0k4Ay7mSXS/wXtHOABYhZ/zsKwa8gAglI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oV9w+4nL; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oV9w+4nL"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64b8b5410a1so2449476a12.2
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 00:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767773166; x=1768377966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GgDJ/Fmj2hVxq0kt+KlgzxSiJNW4ugYNOpHPzq6Zeo=;
        b=oV9w+4nLjPZ+/SE24E/8IcOnT/AM+5PAsxwDhVFE3uGTGYZGUqpSqknrfSOfXEf/lN
         vJrmlqQ/gw17JQH8JOO5fc0gkdZD7Mjd/NUXVCuZIkajk5IZx7YTXa78XVcWIE8d9QZl
         CCvpP6nQSdwzWsMOKo86Usg/BtWct0GSG2DIcsyNpDdXInfRhbaPZM2aWSFaRtRq4cAD
         5VPcA9APpl4Iy9fw2UCkp8B+TlgLQ78+a3DQUpdieOtopJU00m/0MeiFbGrAgscw6nwU
         SLb4+L7qsCBr3ogBfbIj0ztK1Agig655uo2uifdEnd3vruQw79Nijo1DFZualc0fqOGW
         IO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773166; x=1768377966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GgDJ/Fmj2hVxq0kt+KlgzxSiJNW4ugYNOpHPzq6Zeo=;
        b=FXLxA3G6rR3w7tvNyYvTS95iPkGmPFkSNDo3bFHPiespbMBJ91vQavTnmQ5f1x+HDh
         htKA0GwPzkZUSxcUijhZE4qI7tp03MhO+aB32/8oQIg8agRSjfRUKaNEIgw7kGEQURSc
         yuW29GfBN/WaAixWC2fHXTTbh/LpHOpd9+WaRmMBN4gfNex8G6bj3rsdDDtrD3/WDAEF
         g09W7yQJjBN3LwPMQIeSt8z0SylIgu9GTDxAmIx6h53fDCSubLkyhq4BSj4tw20S1gs5
         vdZiltgkEV9jxOyfAeFhP2uKlV+Ds4hsnfjJacM6V0v+NeZqsuBeVi1GrH2+LcKUXg/v
         +jmw==
X-Forwarded-Encrypted: i=1; AJvYcCXu8vl6VLq2TR9+fOTvd9ch0NbyumCcazr+G8GTCRv69tG0cjO6gcVqWdpWXTtH/JWtEhJUC1Fwm7bhqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGc7+CPFF/ykWFTXE7QjWSlN2FrmfTMCKgj+dRsJ1EbN+cNbiu
	xFpsDZmIuud07tqSVTNliFbo6/hJ0tZxKChelYYcZhKtALZ0rpxduWdidEUeULrQvjw=
X-Gm-Gg: AY/fxX4wX9fadU0ZS5YcakeSodqbOeZQNuIAOUWTVq1uIctEu+6eISTNbJoPgtgwnhK
	Vg5DF/x8LFzvHDGAdtYyWn2Mrn9IBbKmBQtsvq2/obeAnSDvJe31lAkzXaoVAMJSFpxdYZByW3C
	BSCtoJ8i2dhRCzVthgIV/DlJ/l0hZCTZczgjEJHrfj4T31tvPmiXM2kx4hqhxNrA6qlt3PuWz/j
	O/3uYsB4NfASjnZNQ+eaWvQRIc64sYUW8a9/aj93Z+sN1waYNxvt0OZIbgqsDix7PKeENA5/C+Q
	ohvdgwO5Gk/Z0m5ROcSHZktR5ynd6iMangwIa6vf3oggY6O3w6lkSKVh1lZpUyAAqDBeVkP0bWv
	RBmX49ilZLyG8xSSuQ1+0HwaxN70fARrYXddUdIuo71tUkOrz9dfClj5U4NHzVRQoYxW4aRnJVI
	8n4r9Abef3gwFVUnz2LaAxoJgx1fiZTfygOUB1
X-Google-Smtp-Source: AGHT+IHPuKMiRpCxNqWVDZ6u4OSMQLbl2xruzqTtEZLMtSwwNhXW3B8I34BRmOAoeN3Blb8BbAq1Ng==
X-Received: by 2002:a05:6402:3546:b0:64b:4720:1c23 with SMTP id 4fb4d7f45d1cf-65097df5b56mr1391779a12.13.1767773165260;
        Wed, 07 Jan 2026 00:06:05 -0800 (PST)
Received: from [192.168.224.78] ([213.208.157.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm3941299a12.33.2026.01.07.00.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:06:04 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 Jan 2026 09:05:51 +0100
Subject: [PATCH 1/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 document the Milos ICE
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-milos-ufs-v1-1-6982ab20d0ac@fairphone.com>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
In-Reply-To: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767773155; l=908;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+tKKM8eQQWo+yQ33MK7IDCfz3vrpdNi8mDp5L1/eT14=;
 b=lQ5mBpA+U7bYt0gJHGAAKSmbKFboogIa6LHo0xKezfRR8+VQMi1EJlEXC2zEEHIUnQXS6NZrt
 md+vcvmtCvgChFgL0K/iZrrR30Ruj3ZvPQ+/W60c/h1TrJirgsrRBca
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Inline Crypto Engine (ICE) on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index c3408dcf5d20..061ff718b23d 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,kaanapali-inline-crypto-engine
+          - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine

-- 
2.52.0

