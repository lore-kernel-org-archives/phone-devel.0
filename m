Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22BD37BE80
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 21:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769558; cv=none; b=ey9rdSD3UrdxM4fRAs1MnD1Hx3HLzTY8fqigsXoPMFrXHmKn7stXr+YglC9f50VJycG8NKKJUbsMNk+I6m2I3vZWhrI8Fahlxf/hLHf6q9UZnjB84oMdy6eeEWf7h21TzlNMPodeCZIEu4ZT99OBtG20ADmc1U+irFKQhI4OyoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769558; c=relaxed/simple;
	bh=mODmq4H6SoCNyf3UBT6H3NMHqjUgUOz846A6SMEVURM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNTNvP91fAvbNkFOOOOHWHx4r3vyXglnwwYgqPpegQjejBpXhHh0gwRKUI1S0Z5nPeWjhQcKf4F8DtQqPW/1XMJ+bO4FcNlWnihmh447XWyf/3I+bcKl6Lpm/8YNBWMhPbFCKrm3FWfLl0zKFVCOeBYHj64GMtmRdlX5iL6WlBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJPpqDEY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJPpqDEY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b983bb07eso835973f8f.0
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769555; x=1776374355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbiKzNLvIKfJ8UIXfw+cpWEfdIwdStkgczF64B3I3a4=;
        b=XJPpqDEY4fN/jtsQ0M5VZsyY7BnXsw5qX9RpwxFALPgl/t2YSIFU4P9iKCYCHGMwmg
         W0BBjgtFYaLFf22uOGHotgnwmnK1tqbmwujVLkrb1jfziJzA+kMqk5yT8Ku779l/uDWf
         r2PIUbH0qEMhT60UXvIZx7GlTSlcdQT2PZuQd+slHeb+wQutPZVzqjMvTJe60bPQPg5+
         vVFVixeWJWons7HaOM32sQlUhJvUkeYSp7Pq3kY78+WAu0IwN109J6f0TylFP8vDq/cH
         aPCnxEbFV6V720WZAhc5aRrPbYvKzm6M4GW/IsQFouZYl6n/PWn+BFnsdcY/4AFx/faN
         BhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769555; x=1776374355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pbiKzNLvIKfJ8UIXfw+cpWEfdIwdStkgczF64B3I3a4=;
        b=WfHUc9u0m8JNEfrM3Oi0voOud9Xu/P2AS7jkdkOXZ0qPwYZyxPVHDdBSXXIGAnDA04
         Bd5j99wexOT43qwWvuUVbD3it3v9dVmk8/Sseig4AdKnqrO+J/eTHd/aHgXCbmtnJa7c
         BNNVjbIPM2G9rUroBahCskA18xzNwhOp8RWKxKn5d6BvVVkUir6X9zd3P86pWEaS/Qxm
         6GlCu+4t5ZNWv/oFg78bw+thOKIWovXwFG43ydL4WFF4UEO7xAsC6g2gIYNFRztyhqEg
         zn8imVMtuqVx8uyh0Jk25vmEZnMkXpI24QpJFd+7gAC0dzVXaWw562YZ1p5Os48g3K6o
         uPcA==
X-Forwarded-Encrypted: i=1; AJvYcCUH3/eOHEUN5Dso9C93dUBDnRmZICceqo8hBRO3emys2LRvv22HCMS9vmlreaGF9Lj5cTsGEQ/Cg6Ac2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxevyLcW8mZr2CWY9L+5tm7Y9p4n92/xZdxCis4M+cJhfr1hHl
	DoPim4XbOoIcBWqdCxNsf9EdYAsee9EKohGNc+nuq7YpFpKqc9vucOmo
X-Gm-Gg: AeBDiesmsTnRW/g3IgDnv22iLQtOXJjlc/E/s2ggRf6Rwskyc9fe9cmTx5fcN3nabQE
	ugqWKelXhfUzY8vawheyRD6wXjJWaoGFPSvGTkaTk7471spZTJlEugFIOHQDeV0wpzUrFjN96kH
	x82Ner4kn8yOuztM3KI3WNO8rOC8Fu0hWZd4sK+W6mSINGLJXRxZthfMzlzuFqQnl2oYbqjPeAJ
	vE3hKqT/GccdPbHSCmx6rWr4i6JdJMvtESN25fDRPzk1UALH1jgfUhCLAKFKmiF/Sm88QLB3UX+
	I3zZPWjodSPU6Tp1gfjmqIq2MYpPX9qWpGuCJjyiqvWcUhMy5WrtAcigBq2FK9yCDF9xXIdjhyX
	OUO73dyEFwgeWpnISWJzCRdEcAWtybhKr6RvK9nlSdPHeteMsRQNbL1UtUkFhHpsKcasx6JYUmA
	vnFEv22RTc8GF5G2nsQ5ICbShi6Luws22oa6DyHLQYeqWN+3TYgTj1NZvfYNhSNMqpE7eizM6Cj
	2578I1LglG1E/8gyrULAx8=
X-Received: by 2002:a5d:584b:0:b0:439:bdba:56be with SMTP id ffacd0b85a97d-43d64255118mr872547f8f.10.1775769555043;
        Thu, 09 Apr 2026 14:19:15 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:14 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:27 +0200
Subject: [PATCH 4/4] arm64: dts: marvell: samsung-coreprimevelte: Add
 missing SDIO properties
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-4-8df6f88942c8@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=IiMoWzBxuRiuVp1uFOQTGKCJN8g8DoQRj78HlpQTisk=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ++FLCwqSkgRu19bOOxPAkxfyM911kzT9VYu16Jm
 sFS9su4o5SFQYyLQVZMkYV5qdwlvtTwiQ5Ftkkwc1iZQIYwcHEKwEQ4wxkZzk1U9vLy/qQmeMRR
 Ov9XWvX6qrmL4wXtfZ1vLXu0v8T+IiPDlwu7rGfvEBRbkhJYtN2+q/lq1RyLLPGPH/Wa9+5WUFn
 CAAA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

According to the vendor device tree, the WiFi+BT card must not be
powered off during suspend and is capable of waking up the board. Add
the respective properties to the SDIO node to reflect this.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index f71bb856f1e7..6ec899c427e1 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -524,6 +524,8 @@ &sdh1 {
 	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
 	bus-width = <4>;
 	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
 };
 
 &pwm3 {

-- 
2.53.0

