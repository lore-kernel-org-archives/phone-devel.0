Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E6F2EA75E
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806297; cv=none; b=uGle8p/Vv08ewCbd4grI4sLgUy2OnLd6oKO9OgjF2QOvUP4xF3NVgcpjHjCRRmc/ON//9ed/JAVI6+EZnh1iG+HxYEd3G5n95P6X+sieg8YkuYsoIQ46edFs7mI1alSYHZXLfexk7zcSIEnXEaBcv6VMo9mw7XmHNEXXqlLJTS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806297; c=relaxed/simple;
	bh=tkPOh9suv+Ph/NP6Bu3BjsLgITZxnb0+dKSWRPPu1Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cBg/J52yyZvEUhE7oEElHheiBqcy/pKQnJAt/s90rA2hsLykXTEqj/nd00LRoDxySBlNnAj7oZo4hZO3PENYnqCGzWyzuB1j4AAaqPzu0iRFmNKhuqdOuaoKrwU37h8v6VVbKrYyNaTm78F0vheDCt2ZR36lbdlisD3WDzodt60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BUnQP3Zo; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BUnQP3Zo"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66e129e457dso1763085a12.1
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 00:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806295; x=1776411095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3fsUR4mnupvB8/aouxbwBgwEvITDdKkDUtdFYBqOHc=;
        b=BUnQP3ZonzwxS7uqKSKzT7PWpNm5oBTnRmNOur4NwCtmivhYe8+pwFMOvlGDmIjxOQ
         5P9UlVLAqj4CphKRlpbQabQ0pBVih+HIi3eM70VygOUI7/hzNonXYynuPL5HSXBADmPW
         Qb9RL3axM25bAVqIx4aOLRskovcj2Hwk8bsUCCKHy15a4pfu0F8+NJr+AV2JayPZBAfX
         9HUn4Ze6TXuZ23xtDvujyOoRE56LxrE2EDg/HRM1zq2ab/zlBVtKrk7tnCMssWBW9RIY
         WA60oIWgOPC8UQO+4b8VHVDzalFCVQgaD0gQ9B3y9uaS5axzhLIDxA58ReILOb4P085X
         9vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806295; x=1776411095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G3fsUR4mnupvB8/aouxbwBgwEvITDdKkDUtdFYBqOHc=;
        b=ofwg7YIiaiExnItinx8mZaADO+PAMW2Gnb7jeDKv4nZI3TFggTo3PYop22DEyCSgS/
         jLPJxwNvygZF9dQPs3mXuq7y68ybSWHHG3VFQdLbZMOM32X30qMFSsxTnGxgnLxNprI7
         IHwhjHHxJ7cqYSuFxeB4PNaAiHlebmcJHqfFRBRbuRlTQtH2lDnAkFuAzlC+YYgqwiiN
         FEy9iohKP4xs/IJM3hieEwnBFSDVwyWRBdDf+6zj7mFWtFBTgjqcgherb85rh1w0dG1u
         Rjj1VK30NP9rN+DyEoTA1Fhhlx2/gwArhVuRrkAEqOgptBNGGK+WtunNjHRILlivz7S7
         CLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Hxo3gZT4I3xg5G9TFbjGlbh61mNhcgyUFw+44xllDSqtcVQcDH43TPb+LQ8wuNa5skQ3UOvImdao4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSuEufpjWjeUVt01wZ2aGTbbCN7i8Opbx9r+bWKza3/cMceL0d
	TP9JmhacdYmQIH5bcCruAPeXLA+IWFkVYHZhGpge0JKE5V7HA34Q64JtsgOK2EwtFAc=
X-Gm-Gg: AeBDietYD+bBW7MQbFrbFVqBkUQd/EBjOzuL3pSIHe+qc+04hLvMyUUjlxISCuEf5ja
	Z0LBURs/GJTaEsJ5n6VtWccVtnMls2WClwjb9klirERFNmMfDbwmQqBlChPRtr70JkojcMunMzZ
	oiurdE1oMfFFPEFk/rX6a2nI+TJ+tIORJuSGC9GrCNmH2QrHtlmKsMgbDxr00ijAJ3rR6NQiPET
	7zwwcduo6KDf/XWnZ6bxxhOuoHD6G/uu9iEPAlW8dEGGZ94IXOkFsag2OgIcXtqZmMGI2j69LVQ
	KW9I14Edo1rGM6grmCadwjC7aTq2FwQUvUH/JlFRl5SLuUAJeGYifgOzI+HqkFU0oDcnNh50csP
	A3VwZTtJsafCm46HrAydgzREbSB0OKJrqQ/t/ZTcSPow/6yzA///PRifU6VjLwqh0xmDbLzSFMA
	YwyNlLpLqwM9zcZ8wj34Z660Zsb/eMet7v47xTlvzO6vtgabGAOJKbI823uVU+iYWLlcoVY52We
	zCLig==
X-Received: by 2002:a17:907:6d1b:b0:b98:8e42:95ee with SMTP id a640c23a62f3a-b9d729cbb95mr121173566b.46.1775806294635;
        Fri, 10 Apr 2026 00:31:34 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:31:06 +0200
Subject: [PATCH v3 1/2] dt-bindings: sram: Document qcom,milos-imem
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-imem-v3-1-d215385fa5ab@fairphone.com>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
In-Reply-To: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=774;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tkPOh9suv+Ph/NP6Bu3BjsLgITZxnb0+dKSWRPPu1Qs=;
 b=F+NUXlBrW+PPfsNwaVjZbDJTAQnbAlz16g4OOgr4LBCzuYRL/9RvYgSAsOpfQGu/+MLzAIfh+
 F+yPaa9U11oDLIxs21F+PUDFqGkAuJA8goCbn6GYwGXh8+3/Hnl2GJ0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add compatible for Milos SoC IMEM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index d9a1da12dc66..d5955fef53a4 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -35,6 +35,7 @@ properties:
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
         - qcom,kaanapali-imem
+        - qcom,milos-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
 

-- 
2.53.0

