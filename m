Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375DF342CB2
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 21:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769555; cv=none; b=RHwT9lPz59DdXF9HDM+kzp6608W2SYw8IWOramotHMbLGJeQIwtpynsjXF+5HdLPuj3COXqSilMz976wyFxXrKWS2rrWYHDY+a/nf2jBr9bLqQYAIWqhOqlFigzsAN8Uyafv6w0UCCvV/1XY3KIKlROZUHUUyBsB1XXnLgot64E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769555; c=relaxed/simple;
	bh=xa7fPQRR+EoQQ92DvEQQ8k69TQ2SdmE3MsiMExxhmfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NgtzAmLe5CChnmT9l8N6/1V50N1ysShdZQH4bBPKRobpV9ZQeeLaDOgOgHK9/BBu/RcRn/SWu8nhYsFNTCZvor0Qn5zR5lUvFW0GSqMGswRBOq+9CQSRgj6pYdNErphHevYt85P+zh7S/i0C+1s2FxzKl6tfAHG5kvr3aqGAiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGT3okxJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGT3okxJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a041eae5so9684865e9.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 14:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769552; x=1776374352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg1DaVL6nWUYFSlhuDMyvflwk+IUOSESUOpmdy0y/Sw=;
        b=OGT3okxJLq5GlXxMvXV2qwXo9g67my8fAIDMh9egTme6dNIxcs18ZBeAMTssTxw+3S
         meREqOvIpirQ1SuWcTzecr2n3x0K+/NSUd95e00DfSVaKt3WYhdTAlfndtVCi5cpfhcE
         YMyaQo70IxyYbA9aHaWBkxSPk0NzVlxPNd8+GoWaYqrf4Y9C4dWXXEy+X0K9QQFp1nJy
         JNgQJa8XVVQyXprW8UIIqyhfkGTcY78k44XSbKkTc03Ldu9qrDl3Q+iXhX+zalIiUrWa
         dp3kMjJVFV7LMrTX56JpbLgi0QiTBiM5ewcKu1uOho2hi4KV05YMFZXERlL6JRHI6kNw
         hJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769552; x=1776374352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cg1DaVL6nWUYFSlhuDMyvflwk+IUOSESUOpmdy0y/Sw=;
        b=HWG2t+12KUQZIcJfuBKiuN4d13JpDRydcFPlCj2nf+ZUywMCl0yPCmel2yvzQ0P8fA
         34BGRhfDf0/8gK2UFhM1swzBUgG+j9ezSKiIiJ3kaUnCI9owwbu2qUwb6VujyiY6UqSt
         rfpMZgPmg6LsfXkyuogJ5ZmsgTC1ZH/7SYJlZj50lSKoJkO1JQ9AheaX0AgfSpPxhOE0
         JFADs7luKfAUHEUzp4cfNnHPD1QrahSJvz9npEHuJpVjehLCI3Le9qIWJlXz4XeVJOoi
         dApZo8avwoNbx7w4JVnj5ZgO8jbOEQarCQQPHrxd0gRXhaMIaYGiePx9l7mooN4jvnuK
         0Pvw==
X-Forwarded-Encrypted: i=1; AJvYcCXAslpGVRM7A/9o4zV3LHdke7YFaAomGIR0CntTJCh5B9nnx0pLXuYEhj9gfZRBiBtfp86sA2qI2xL1sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTYdo06OIB1D/SPXDVMhSmF8QJWuqHHinwsxgUJqH046z3ZFgV
	z5NNig2pMTXWqNmh0aNZbFg7t6t683XKw9qssfbi6ZN9TCkpXYuB7xsF
X-Gm-Gg: AeBDiet4YHjDlXUHIibrXCz3rx74myXlifMmGMSbztx+Jg5YaRZfa6ZS3y4tNZstGKl
	ZXPbITeZIDIjo+4ggEc5CY3nMJJbLT1Wuz1FGbPr8l8hO3rlnuP68+hhzhsCBs/7MgOb95y0hD1
	NB76fVMc41dwZZurvdnTDXzj7s7oWS1jMXYAp5JmQNZvObxk3MRuLsMgp+wvN8B1xnUjUm3iKtq
	EmoYDu0hVYALAErPtunrnJ1L/ZhKIwvysbWfeE3/TfZhy5tHL++DZ199apgWp7INdYVu57FG2ik
	oPe9qEoZjClWEVKm4Nj6lBEVdVtZ9aMLyMxRoJE+6kxRgyUbexvEIRgVk1Eyxrf4dl9U/QdwnZx
	k762VEsO7jHJctf8YCFiXHj4SuzmuYqq1+RVDpbzVSqpjffF/Fi607Tit+VT1WKCJPkSdqxoqj6
	XncwRR17yu+EUlsW8F9jlgHw+SwaUt2KCB3iKF55LJbhJmv0QWcxgOFhO1hsp5AJ1s9DqegX4hk
	zl6gpb0t0YwTTQeywl2ZmA=
X-Received: by 2002:a05:600c:8883:b0:488:b87b:3052 with SMTP id 5b1f17b1804b1-488d689b400mr3274635e9.29.1775769552285;
        Thu, 09 Apr 2026 14:19:12 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:11 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:25 +0200
Subject: [PATCH 2/4] arm64: dts: marvell: samsung,coreprimevelte: Use
 memory-region for framebuffer
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-2-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=KI7O8gEqllNwm8OPBSd2QRQJEz2ZYAYwoNkY/8tsJRY=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ92MpTbEWxygW3OvB8c4aveK2cmv2d95V0Y89By1
 w89657ajlIWBjEuBlkxRRbmpXKX+FLDJzoU2SbBzGFlAhnCwMUpABNxX8fIcFCZcc4Gk/XKV7ev
 nrJfpFXP9Eb395t1h7ccqn10W2r/my8M/wzeztC8/ebvsiTBc7IXrz5ZzmquMm3J+kt27UXnfbT
 P5HABAA==
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Since the framebuffer resides in system RAM, use the memory-region
property preferred in that case over reg.

Also, testing showed that reusing most of the region (excluding where
the actual framebuffer resides) is perfectly safe, so do that and save
~22.5 MiB of RAM in the process.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index bb0a99399624..f71bb856f1e7 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -23,7 +23,7 @@ chosen {
 
 		fb0: framebuffer@17177000 {
 			compatible = "simple-framebuffer";
-			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			memory-region = <&fb_mem>;
 			power-domains = <&apmu PXA1908_POWER_DOMAIN_DSI>;
 			width = <480>;
 			height = <800>;
@@ -48,8 +48,9 @@ secure-region@0 {
 			reg = <0 0 0 0x1000000>;
 		};
 
-		framebuffer@17000000 {
-			reg = <0 0x17000000 0 0x1800000>;
+		/* The "active buffer" is at 0x17000000 + (size of one buffer). */
+		fb_mem: framebuffer@17177000 {
+			reg = <0 0x17177000 0 (480 * 800 * 4)>;
 			no-map;
 		};
 	};

-- 
2.53.0

