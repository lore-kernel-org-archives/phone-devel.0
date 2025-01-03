Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD981BC07A
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902727; cv=none; b=SKcHeb0f9d0mVM8cgMhGJoOJI8eh2q1/37SOJ+eKxonbJVXhGVEX/77yc82+3adJ87UMCGrRSdJe8lx5YQtU+TYZn1B2Vw0iDpniR/BS66lx70kZ5cEWTSICUIgmEOlwS8oW7dyFQ2X5llUElVrFiSzK3BW7JrDEouOycJ47EMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902727; c=relaxed/simple;
	bh=V7LLzS772JzWekboxc7ic58WU1/YMCue2Pnz74JgmzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bo+HZzklLD0FTtItOM29LVTMU1QYFbFZ1hPUZb3TPx+/Tursxfg3sa+/+vzFx78cAMaqQ0F9h2IZjphiWlSUIHeyGHF5FS3e01LworTPPLm9BulclHWvIyQOKjRPox8zToG4A6bVcX2X2/SC5epsSzbbNXHa1razAbvojaJD1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4f1qIQud; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4f1qIQud"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa68b513abcso2258932266b.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902722; x=1736507522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZ0KxM+G6NVYDY4yC/WE/MAo3QAuIiwCharn2GxEX8E=;
        b=4f1qIQudf5SpQOkHhLxSF5i7ihOqy9Ood4AOE8BeeCrDcqUTOQ2J3pt1x/3xrNNvKK
         nIrMShFvtyZVoQ+K+XozR5tKu2cHsF6JGBgGtCcHmMRafp3tQte2PB17SY8BxfszUz64
         9EbC2AIluJN6YyPSSe1UyuEN3ORvouDn7n2bk9dnBESJKfmmlADzurnrNOXqwCJ0qKIB
         okRQ1Upmga0l/skQBErm/BBzcBcM406+wCeCi8dUg4/GrIjCcPMzt9C0d4gVTwWP+ONk
         Jufmsnjv/I7xvOwQgfKZ9nlwb8qTb76fmcSB7FehV4N9XVM+mbr5R68v304FjxCp1YGa
         fN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902722; x=1736507522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ0KxM+G6NVYDY4yC/WE/MAo3QAuIiwCharn2GxEX8E=;
        b=pVQKqRK91ice8Bimzwvl+M1YEBxgvTFJOdmTA9GovBk1Fq4diAovepEyjMcYab2ioM
         ifvAqeQX3CxqlMOiSd16IHUBynFHhyS0YK3df0PzS9DdzIc80Ruujid8D2gTb6gZ9QO8
         QMIFitc10s0nccOA3qF/6HMqkKpsrtAp+K9PyH4cmBO41dghrQ97X93B24Ihy9dDCPfp
         l833ClHEMdsmzJlF3G47c3++Q9IqtE1zFAm8DAX8qz4oCvjkeuFlanGeXRoYMISlKe+f
         rcBcoXYU57yd6nR3sl8BF+En+01yKt5VMuuIoTY3nMLwdxvKxnySVCyTuw7J7ZpB5dRH
         wYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpQ6uAbNJQXM2CNpXkDOFydgs8NHi/9rcnSNQSMpwUf3RWhqW9rIOHd7sGE3oMqpHjNelAl/epoPTBVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxgi7SM2cLXblygorEv4pXKP5RK6M6SbyWLY0wWqbKDg5kXg+4
	fsQhBbuWjjQCfFgjW1WpxDM8TW0TIzZV+IZ1WVjKvlGw2e1Ffzt2o3PBFa37tTY=
X-Gm-Gg: ASbGncssRfsVEetMpgrnpk5eIM9v8uXU8n1SRYU0bKpuxkYN1yPAq5eYzTfnUh0A0XA
	mcr6WaG/lKDDwTajkJPwUl1pa6w3hT++bTXf4M3O+wGzuTRRQVVqPAh0/Yx5ppnLv0AJihM40cd
	LjDLJvl/UNVv2Kl39uqtbra1pfdYbDbVGayQqNgrjW41WUsUwZwwqHyU22p8B9GcN6+Y+Sz3h7d
	3RIfXEFD3NQBRl4f5C3lqQb0TBa1l2VqSIjEb7NZLFIaq3xf5Hfpr3dQ7f6PFe9yB/igohqHtd8
	wbe4s9toGj77N64h6b1jNrlsSg==
X-Google-Smtp-Source: AGHT+IF94pkNvH7h3XHPLp4HlTKDGRzARv5cgxdc0QFDVdciNsmjQcTgfzogxJGqFhNBU1VxR2h4OA==
X-Received: by 2002:a17:907:6e89:b0:aa6:538e:a311 with SMTP id a640c23a62f3a-aac2b28eee7mr5003930466b.18.1735902722233;
        Fri, 03 Jan 2025 03:12:02 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:58 +0100
Subject: [PATCH 2/5] dt-bindings: vendor-prefixes: Add Puya Semiconductor
 (Shanghai) Co., Ltd.
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-2-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the vendor prefix for a manufacturer of EEPROM chips among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..7e743a9f638dc9623f73a31cdc4b6cc899cb3320 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1204,6 +1204,8 @@ patternProperties:
     description: PulsedLight, Inc
   "^purism,.*":
     description: Purism, SPC
+  "^puya,.*":
+    description: Puya Semiconductor (Shanghai) Co., Ltd.
   "^qca,.*":
     description: Qualcomm Atheros, Inc.
   "^qcom,.*":

-- 
2.47.1

