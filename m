Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF7B36827A
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805672; cv=none; b=PGjZ6FtL/uB3YrhbwRkfj+rnKaKOLB2ZU8g6xSWbvTEsFzmcIHfvrT91Qw/l14mw5IhPCTZ12se2uc84SVFz8CCjAfBHaD53gSRz1eAwzzxXJajZUJnvlZifg1TmcQ70nVzcFzWigx76ilvc3ejTFATNRVi1lfCgOORNzZ5sE0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805672; c=relaxed/simple;
	bh=81k4vDNl2gcK2y3l5OMOHs+wHy9IM6fpjbVqmXKA9Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DFvxywCPsRc/ejcKZW3tnHiXCbvUqdF5jVBx76ueCiOrh/3nEdHu1k8+4Rw1m5rV1m39McFqwPdp6l2YeybpNSnxsC4AR/53L7ZThowXhVPNc/xwbSOiW++5Bnrh9PS59wr724czZgcRLFeG1aeukCltaYYyO2GuKXluYQaNCQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=V0bB8fsn; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="V0bB8fsn"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b8710c9cddbso580613866b.2
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 02:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770805669; x=1771410469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBzLromM8fM+G/3XeZ5Gq0URj+zbmif8mTrB9fiboAE=;
        b=V0bB8fsn35jFn6xl4q1t917TvmoMTUX5M3DMhisfkFqsijVFlNs+c0qLhnyrymJwUd
         IDOD4wK7uRyEt6Rms+daf853JztUT1NYmR7OB23cBndBzvqPxlQG66SxmQWtGzwc6FSQ
         dLasFBLr3c4qXPvzUzOLNAPdvGzB2wSgT5Dgl1cpw+r/+k0PW+ZUh9X/IoM3qS52t/Jy
         nbQIbUmXhhS2VGTfwZ8ODPMJKGcrA+2+b/GwYbVJ6ac86Ybk4JW8EkNqUAc6mihu4BZ0
         N1NCcJ/pViF1iRb/oWQZd6Hb68p/6RXBZUD6YJHtUn03CFYzyNCdhEf59R/Y9X/jVjqe
         6gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805669; x=1771410469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rBzLromM8fM+G/3XeZ5Gq0URj+zbmif8mTrB9fiboAE=;
        b=SwoOl4C5Qpp2P3hCth5HKQJGXPHCA0lzMm+9++TlmiaseyYfBxKwuUbT/pG8dIcdWt
         ovbdMlCT+031pI8ls5bwMuNITcrxhLT+t+MpNAzCfhppl3JqTJz9WNWeNN7wtPUneUu3
         4vDrvzXQ/QtbDRGv8b9m3jr4AscVO918rFm2Cn/Kd71JVgJZtGLzk9GujHZFsqvjQ/+8
         29TbsftLJOy3EktIapTz5i+YubTbJpgS+LfXLEd/nLijPevfaZNNk0UF9WenJb8zRTYi
         5mvn7AsAfWXugzkXioHdtt7ydH9q2LP1OCRtgChtQKgeqleSwwCe2wPzF2Mqv3ttCbFc
         YGGg==
X-Forwarded-Encrypted: i=1; AJvYcCXm2Mg1+chg/GPWsnOQfaA+5pNRbKrOEkH0H0Z+abGEwDLsJmPUrMBVGrO8AANycVOnR061obOQEjLaIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMDT3EvpPs2xIf7iWqZLzqAEo+mVQLQ34Crk04lG1YeJ7YYQH8
	LMBXAXFJYwyEnCoD+LzwfsvWC9yICm9uvfCWEtxDLtuPyp96a6xIqtMuyIYtuYiAzpYuFxMJlA0
	WtSR3hI8=
X-Gm-Gg: AZuq6aLDMzyvJLQ7vEA+jkrg68ycxNkNwKn27iOx0E9j4Z7THOO9mPvUbbm7bYXrn/Z
	SJbT639evVBFe8sBgt8qv8Pxu9na1bS+JI+D+/qH/4OHUvyGWet4qOSqZpt6BbQrkDs1JPuvhLE
	mOVY0j/wqjL8nm09M3DwX39QSNvZUbpajQ8bEPgUGsvtA81oEFB4IIh4KXw5KoA4d33gsTDh7hu
	lyL32pcCtbikk0BZUgMWloHwfB7+q8m5C2JhsX3CNAGH9WYMbkgNpRd2vqwxddYNOrq5P2Ch8hN
	Uki5zVLQIGRuh0xilDJQ49KrvJvcJsFvpJK+5enye4yiuMCC3fn4I/NbaqLuAK0SRnzJ6t0gixf
	wP9zgGiTMemTtX0iVj3XzNhuE8gq467K8WI69fwtV5wdNUIsGGjA8AY8i6NYZjvAZFsjhg5qzOx
	c/x+Z4PDLR8jbYjw2/h7zgOTxrfwauM8+QqFzCw5ECzZcDeT0P77fBb1dHifhCCAeHxtyGBIRsf
	3MK
X-Received: by 2002:a17:907:3f86:b0:b87:892:f440 with SMTP id a640c23a62f3a-b8f6adfa879mr131503966b.38.1770805668927;
        Wed, 11 Feb 2026 02:27:48 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec54925sm44296266b.53.2026.02.11.02.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:27:48 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 11:27:33 +0100
Subject: [PATCH 2/3] ASoC: dt-bindings: awinic,aw88395: Document
 firmware-name property
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-aw88261-fwname-v1-2-e24e833a019d@fairphone.com>
References: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
In-Reply-To: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770805666; l=1023;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=81k4vDNl2gcK2y3l5OMOHs+wHy9IM6fpjbVqmXKA9Io=;
 b=+TuqGtOHKZbjaHLp9RSffmfo1Jo26IZ+ZHUsmxB6KmReKvO8wMOW/FZJTG9rdaSCMl90jfaEH
 oA8dZV13TgvCVcuXWr6ktGI8W9pKs1sPbXA8VJJpqU5TzlZQ+RkFJGI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since the aw88261_acf.bin file appears to be device-specific, add a
firmware-name property so that devicetree users can point to a
device-specific path to not conflict with other devices that might also
ship a aw88261_acf.bin.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index 994d68c074a9..b9abb10942ba 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -35,6 +35,10 @@ properties:
 
   dvdd-supply: true
 
+  firmware-name:
+    maxItems: 1
+    description: Name of the *_acf.bin file used for amplifier initialization
+
   awinic,audio-channel:
     description:
       It is used to distinguish multiple PA devices, so that different

-- 
2.53.0

