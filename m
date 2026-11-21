Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279777;
	b=DThOCOvZMns6TjL5TlMUNGRRAI5vBhgmSrerizjHPFGVNgUSMBJP8rDTuMsLhWfsC1Yw
	 1CPMvYouMQGwlGMJZygiz0EPo7fj7NB3r+qCSglKClKb/+K67pDaL2AduoHeSvVaeEf25
	 2HBYjaXWrVibCnm+9s6frA+onxmmu1r32hXKlEj1UgYo+10QO9iGMbYdjkNh5/OytJzoU
	 ZEPnjEHD2kfXorLsWUy85bxfrk2cItsfbirltJ8ffCpYI5usK8nPZikw7Ch8H8LcNaMwF
	 MvBKG8HlXdFBRstJwVTqPbHQvqls4Vs7nvR6RUma34KED8FbtDUZtm+wRmrXgXw6w5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
	b=Xot7E8DQqy4uMpDWbnWc+Mh4DlO8mi5fYtV64S8eBz3UEDj+t4hT+cJIivu28HzE18ru
	 lbl8ag7N6uPfuf9+L2haGLVIYnQUalbLesT14h/WRP1ULLBeCJwsCNyc/M9yUogNNNUMg
	 OqkjKR/aUWLH4XZ6+im85/iscP1HBqd/xS5+zyC5RZpy3UzX/G3yueQ86PjAm1WJlAs5C
	 krfe8UMJiifmy2F/IswI92DUsTRlnjXH/80igU0m8rBEqrNjMZLYLG41vXFIHr83V1VCe
	 Qlv3b5suoOQdXOmc4zXeonr/bHNCGEZuljt9obLkFO6n/GOr3IU398HI8+tohdgWC9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NccJw0;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92003606A68D
	for <phone-devel@vger.kernel.org>; Sat, 21 Nov 2026 16:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92003606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NccJw0
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1530300f8f.0
        for <phone-devel@vger.kernel.org>; Sat, 21 Nov 2026 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279776; x=1795884576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
        b=S1NccJw0Ms+NHuzySD+H8dg4z2d7XLQp651/mphadfSwCAJxOZksz4J6/G7lFu4C83
         wgvpoYo8mezwD2HykkrtAatmVDpTlUPXyfM1Yk47PAkddq4KmODejoLVmjmCXBghfPcz
         G7pJ2/mggW/ix9QBknkTXUrLaGIYZLl/RPYuF+Y/e/rpjiiTKMMkAQRBWKKGcm9vw7of
         IGzhEjSSAM/t8gK86Bjv4faIaACHEsW9crqzr5bYd7Osv/lYXikDK0+kwJ1gZrJMCLWm
         4mkUzKSqchtA5U96FxEN+CPjRFoJOlv6McHzoNFHIx6SWGeuYuE0DygUOYEwmwMAKTwH
         LY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279776; x=1795884576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
        b=sHom/lRZx/8N6S2SQXO5oETCXBZoko/eiJMV/93N2qd/2/VxV3dZmiU2BcGv3cy25i
         D3uPbYL1Ib9Ucc7pwDVxDnx1C6JBTQAq7CDnito1RH7c4E9kzCfzsuog8sd6f4EP4Dx+
         kDEbdBpW8DMfvv8rAzGOTwCSFCJdVbSWQ45DgyjHnekdDyLJVdmNQc2xNE9mmErAuuDX
         v/UFCXZdfJHWWwQu7/xh1CNMwxNL6aw3TucJZprJoANwefWO5+BAdqnNWA3dttTGi0gL
         TF82ABOMBst1psdKJR45uNhqM10CJ2QljQUM/Bx+GWXS31c7TOCPdmEdKy821Pq4cTWZ
         1b4A==
X-Forwarded-Encrypted: i=1; AL+hErEo/DFH+PYr74vnykBEz7/wAWjrGJEVIKorPJ52MHHg405SK/+q+GO642vZxvqekX5qnBhSAygMFQol9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/KrtZDsXpn2+7NsbMh/yWcWmx8lFvZoMLxzxnFy2t3EDou9uSX
	OtIe/GJwXIq9M33Nadetfr90sjePGdVS7xWHKzadOhz5Gi0MXrm4Tv3U
X-Gm-Gg: AZFdTZdBG2+42BMy0Yw/UqqEg9oSER8m3cLxBJaOHs5C4g1ZnDwY2fdpKmh4jr6Mmkz
	8o1ROSMO0zXWOpNR3iQZVEs/5c7NXTqgdTKmwSvMZDp17OjszvDjtPdzZl+3rZ0RwGfAvyIjhOM
	lHgYYtQxLSnTIHQr2uFwG/w3akNBBpwHh21WVyeQ/vaD8s/lbjRJhiNoosk0SDwen+xSaCTlyZk
	UsvWRoP7CxM0jc86TfE1zGCd57WAx9Ow0vwII6f7yvavpt6k8TIDOkSp4GXNDmiMNUzjjYGqyG6
	eOH7jSfdA892X4QrUt7ByoeW7JUfhdLu6VA8LSOf60lWDb0biKkj9FiXtg2WPouwGBvLsnb+ZmM
	mdZWL3j5L3OvKPAV5k+7Zxw9vgOL8Lj0J0cCQGgcF/9TzpFrG4IRZeGKNagOlmOPJQawuwXsnV5
	MpYPYoeMIkjqUCFPTgYRTMSuAvJLPL9LLOYsgX+/tfMgyx8c4jqDVwAM/PSdk76PQgK/QiOnn+x
	XlYqXj+LWiIFv43OEZK1QmMR10E5a1+aqllR6QDTvI8OHEq8ADf5Ol/e9fdSske68a9VgJdNSVR
	EwvYZVSsYzCqH4nORA2GW2ywMZkC6U4=
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr139557955e9.2.1795279775875;
        Sat, 21 Nov 2026 08:49:35 -0800 (PST)
Received: from unknown.local ([2a02:b027:11:696f:25b0:e663:79f5:e891])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm9761749f8f.35.2026.11.21.08.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:49:35 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Sat, 21 Nov 2026 17:49:05 +0100
Subject: [PATCH] dt-bindings: media: i2c: dongwoon,dw9768: add DW9763
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-dw9763-v1-1-f215290602f0@gmail.com>
References: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
In-Reply-To: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795279770; l=1908;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=qLwwZ3rP/fjc2JAHuzzvcKw4S3Ep+DNYoDcVGI1KFc8=;
 b=FXcyCoVTdSrnvMx/FpFgdpHcR6SnrRAqBrBe9xrqyPsXhxCW27B742B0YYg0QtpySDp8a7kv9
 f7/o4C3koqzC44B2qlmfzILBcVcnnUlw6PFbYxtNUCsJZL6+gjJSXlJ
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The Dongwoon DW9763 is a 10-bit VCM driver with 8 KiB of embedded
eFlash. No public register map exists, but the Rockchip and MediaTek
vendor drivers program it exactly like the DW9768: control at 0x02,
10-bit DAC at 0x03/0x04, status at 0x05, mode/prescaler at 0x06 and
resonance timing at 0x07. The chip ID reads 0xf9 and DAC writes read
back as expected.

The only register-level difference is the naming of the 0x06[7:5]
mode field: the DW9763 calls the values SAC1/2/2.5/3/4 (0/1/2/3/5),
the DW9768 AAC2/3/4/8 (1/2/3/5). The encodings match, so the existing
dongwoon,aac-mode and dongwoon,aac-timing properties apply unchanged.
The dw9768 driver's settle-delay estimate assumes the AAC4 multiplier
for mode 3, which may be slightly off for SAC3; this only affects the
wait after a move, not the lens position. The eFlash is not covered by
this binding.

Document dongwoon,dw9763 with dongwoon,dw9768 as fallback. No driver
change is needed.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
index a0855d3b7..386352f62 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -20,9 +20,13 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - dongwoon,dw9768 # for DW9768 VCM
-      - giantec,gt9769  # for GT9769 VCM
+    oneOf:
+      - enum:
+          - dongwoon,dw9768 # for DW9768 VCM
+          - giantec,gt9769  # for GT9769 VCM
+      - items:
+          - const: dongwoon,dw9763
+          - const: dongwoon,dw9768
 
   reg:
     maxItems: 1

-- 
2.56.1

