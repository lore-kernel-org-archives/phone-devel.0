Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA5628506C
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773180; cv=none; b=P0wi/sb3HKgFq9a61EKhSakatGOBENt4jn4IxTSAFMmrq+FF7oBABCTZNAR2jzvGBASAKqVYyvG8Rg23hslZ5BWjw0eSKtLNA7xA1xeywbElwbz581erW7/2Pi9vi5xMkwh9L4gUq7D6YMH8iM6xah/SfX6lmOwd9bkmaPNK2vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773180; c=relaxed/simple;
	bh=L7zFGJrpp7R/1SPywgnVmhsEuokhe1Ahx7lfge1c7Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOQ0AoTuibvl0Pk0QXypI1QsHDbNFteeaXys+zwaQD4oMlpElr5gSWDM1vjFyVDp6LMsOIVjV5pS81fOWag3upCrc2JOxZ3Kv1rr7R4Gm/h8RMUZ/3ZycKxubvwfHOvzfSmdqf0NAo/24DphFuVmq0ZOzfRQH5ODJO9WMrPqxY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yOUquAeM; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yOUquAeM"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso2490344a12.2
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 00:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767773174; x=1768377974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UL8Q3N/uuYGWCPQc/j4tS88zUzpRBU6RKL22PZGfA+c=;
        b=yOUquAeMLkJU6uZY0YiZ34jH0yuh/C6Zw6cOkDeHep9aB4S6ONvm3ntE4MsenvHf//
         eWAAipHCFEUecfM6GQ7KccmGJT/i+S3SZB2ORrr0MrzRLamvqRhCMOYfl5SC/spxYPIb
         bjuEAumSmu4PUBVtcblX+DB2+QQbbUDbbkkheXTOHS85B+Bum3MGSBdPV4rDEs4UNqL+
         Nyb3TaepcMTp0+XnM/2yL0EATTYa7spQCflMjfhLn9mp8XYceVqWNkGKBoto635yJqxf
         it3Yrd7wOz0W/+chFFPNVKEI+2Gd6suS9cVe0emF2I8YnnrJhLvQ5i50L4d5qCtfTHwH
         1Ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773174; x=1768377974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UL8Q3N/uuYGWCPQc/j4tS88zUzpRBU6RKL22PZGfA+c=;
        b=eBvJbDeoGyD5oZNMmvZS2h7SzLTBbrgaIrsP4LJazBBcze8l79vOYfLZENNS3JZk0X
         RXc23TDPrVMCBbSRsJaX/LR54XjiBzXfeAxEeqXwBSC3hOos8t1faRHVDaPcqWKyoSQq
         RqrtCenYdhK53rcd4pjL7V03uLjtTisqJVEiPrreTdh7ugPCMQx8OBXf3faO9CuRHLvj
         gcoZ6SehhjPkcZ1rW8pqdGHZSt08ysEF8ef6wcVcZFtGBPFGoNkRRIVIGL/te82C+uVH
         Wfk0/l1I6RYfJqYcZrVwGPvmDPnU616fwdq/6qkbk15+TSlhXQGs/Hzp0ZbpvMjEJ9yB
         PxMg==
X-Forwarded-Encrypted: i=1; AJvYcCXIaeg3pr81ATBk1EHbsU3vatN3FYXfELhve1471wrPG7YNTS/i/zbf5+m3Vb8R4z6PnB5ctqj953X+HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzykq69T/1DWoGuVNJFEX3c1FdEK9JNs2GwMlTDhO0SY2jAByGE
	7+KvqP8TGzUloxZ1dQa43JoqV6AmcMe9bYrNOMjCTbch7OWsLtYETaoIsuyapBEe5EY=
X-Gm-Gg: AY/fxX5IVjE0Lrkk6UQHRqp2LpTdmFdWahweYcM/xdI19x3N/wVVtrZwjnkbf/PYKoX
	WwWfBhmB+fbcC/kG6qsuWn60JEqbkrZKlXysuaQ00NEbAcRuY43rkCPvkWk7kgqdIg47xTHJ/7h
	cFjcJH+OKAtMFUYTKxW3qbxEDCLBxVGAJz7i91psQoDwQW7BFoxrPwKrNRp/Q/w/5IaiTcVCvru
	k9X2UrkwRfWGuTMO1GmW3SsOlkt+o7lQz3L1YteigZj/9SYsq8Qx+opeaTcG/wnY2iBukXcgqtY
	RuYrKfCKduhMyeLEcPW7bx5lAVzGUNh93ISW5V7V4bvR1IqQU6APQCOrpRdfNWOdpGYjVnrCRRj
	wDnfSiQbzO/3ucs7+F734D0RN/89Mf+EoUbeQXzZfx2Sb+roPYKhyP37sOY0f27e5A3bnxK0qyx
	Fs3RifPb/dDrV4ZG1xtUV6ywGngw==
X-Google-Smtp-Source: AGHT+IGoNwL2Ad4Wf5/kMZtYwloqDC2nclTMDNUXOI6+OkN3PNK9lgubRfkIS9pWfU3l7el4uXNpgA==
X-Received: by 2002:a05:6402:1461:b0:64b:63f3:d9ac with SMTP id 4fb4d7f45d1cf-65097e50cf1mr1240312a12.21.1767773173934;
        Wed, 07 Jan 2026 00:06:13 -0800 (PST)
Received: from [192.168.224.78] ([213.208.157.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm3941299a12.33.2026.01.07.00.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:06:13 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 Jan 2026 09:05:53 +0100
Subject: [PATCH 3/6] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document
 the Milos QMP UFS PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-milos-ufs-v1-3-6982ab20d0ac@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767773155; l=1131;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=L7zFGJrpp7R/1SPywgnVmhsEuokhe1Ahx7lfge1c7Lo=;
 b=Fe5DRXgl1tVzMTAcH+EEUjx+bRFHCdB8IT+CJt8zvyJkZSSz/OKPkBx4UBM89cvHuO6GsOvMZ
 RcQEkaJMVezCF+L8auF0yI4aw/Rt9ht6yq2/Dx/32t723EUyu9KDJbr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the QMP UFS PHY on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index fba7b2549dde..0b59b21b024c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
           - qcom,sa8775p-qmp-ufs-phy
@@ -98,6 +99,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
               - qcom,sc7180-qmp-ufs-phy

-- 
2.52.0

