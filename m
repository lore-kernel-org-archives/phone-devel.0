Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157B379EE2
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 21:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769556; cv=none; b=lmHEuDMTPJIx7BNrIT04HIS6Mt0zGb+y0j/kdrGidJ7UhvFwMFMigVzTcGAlRN7hnmxRryfh1ux3cEBszUJDl2JlHkzn3YpjbxYVljR0z3z3AEP+nvmLaQKjIQYXPCdRDqqEMrjGJXzZPLh6jZGRTPAkQLIn8UYc4ww0+0z8h74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769556; c=relaxed/simple;
	bh=UKLJKkQ2UhSeb7yseVCro40ZaxivkC5zuvxOc5ohWrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKf71mu6H/9cQORor9sJDkY8po5XcYtRmtyx65y+ZUZpRGkNzSwARlJloZwQVpyC2r4gTxyPns5vrSSBtZtBDbrt51oUxVGlNh/2hIs8A1+A8EylKboReLluAg4qEaP3AeNo2a4RArpF8A2ZjdCpT7hy3beGd/Ta4LAQUdhgNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2/m/sn6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2/m/sn6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfce3a195so848048f8f.2
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769554; x=1776374354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oe/MTWFayud1NY0YJxHA7yEna0urTSnBL7K+MSPYxmI=;
        b=r2/m/sn6O2kZgVTrApyH8TxQ0TEToNCW9EfYuUbCJBlBuMwo4zQyWd8oGUYCCfnA1Y
         L3I8WRciXrJpp5C/m85dlOEjLAABtTfh0lYaTleCBs1YBz2XBpZfnIafHAB26NOAsq0h
         hGwKKy59UNaoYYxFexz8eDZGf/a8WFRCWHA14+KtZDnOG4ToaZnJujnIK6VsFvKe8JJB
         C/CjVnFgU4lkB+7MOCC1oGHxK7DfyjDR1BnoXMCf3P4E3qOODOzT+U7ZBOekYsR4ZMla
         90AXKcIcIRK7OXLNkQKw7fLWaqKEUl+JgN7G1/cjaB7QUD8HYXDzt3mCfM7mEMJ9zyxu
         Wetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769554; x=1776374354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oe/MTWFayud1NY0YJxHA7yEna0urTSnBL7K+MSPYxmI=;
        b=he3KgFqNcaO2GhM/gyrWpNZQYXsre1dr7ntLKcmXkfeAcI0pTR42jDswCAKnnM1EYU
         VLwZZkahRhwPZYudTKBTUuulqvWAh0gyu/Qf6jIXBMf5L4K9JIBkz6OyreHirgRqCb3b
         E0QuSFvS8irKorB1exJl4xdNW93h7izjizGNhdQPUTCbPS5/ImS3HMkgxor2fHMZGITI
         YrLmUoqtJpX/PIIq4QZcR4C8IbAaGYWaHRJGJ0vyCH+RSNYx2tK5yCOYDDd149QddPrx
         wPl4A0EJViThOpLqIgOkldqrNViEpBewi6zuW/cVFWiPstbTSilLt9T7dILT38dbTNjz
         r3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhriYqOu/Na9TDII1DtEg06TaPhNSHCcG+Ka6YXNY68DKFTGYlYEYhNHcGdJ08LMHFG+GD40fA8QAyzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdG/JGVq8D0yz9A3rl7cNRQgBGKXtHobTaKlBpqn9nhCTjIYR
	59XJFAirnX3Si0Clm8zP8fu6Cw7eYRBZ0SaV8wvtSu0OP2zHV7j/EdMe
X-Gm-Gg: AeBDiesOlDDQXg1jeQP/XLTv4rDTRJvdLSdT82oOdKRKBLrhlvMcWoXfAcmDXGVO5ah
	vkWznMT5bX6qAVPfu53dYL/hI9EKLOu3QAEjA0oKUzLwwDT51DRU4Hl+6iqu7M590nfITJCBixs
	xcdsF4TGtoi017tWjt0GtnKoxkXT4L4/rFZl+/NvJCVypSp2LNxTPo0ZE8NQsHIbyuTsiyLyDWR
	eHqFPDareyJPgmzHYDl3JSYDCSz1uLgoIc1ewLLw9Ud1IhU7qtZNSyp5WntYoUN3/PieodzTbZ1
	NYyWUjUuiKVqxBbND8CSeQhC1zEVEi1xc3HlSe4G8Y6/osn0ClN5PYUpKqBz3qeV93xqMGpKpSx
	tmAKxXBckc3W57Xj74+TqJrdG7Ys6+VQ7LDKi1e5sRj4523Md/GbdrKooM6IPf8ZpI4QTjEu9u/
	Zk62U0+tUkFCLwE5f8yS9+mCqUjV6aLepAdKHyA+EGQZvF/5GicV3LvmnDU1IxpZqtHwyF4oA06
	sHJSkBWcKgdbvpNZIfsRnY=
X-Received: by 2002:a05:6000:24c2:b0:43b:8f30:39bb with SMTP id ffacd0b85a97d-43d642ab9a7mr780950f8f.24.1775769553762;
        Thu, 09 Apr 2026 14:19:13 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:13 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:26 +0200
Subject: [PATCH 3/4] arm64: dts: marvell: pxa1908: Add PSCI function IDs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-3-8df6f88942c8@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=855; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=MMbB9YOuhqaE8RLCQwY45AbWteQXOQalzkmQpnFItKA=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ/ecbjQ9/faCaqFghxca78cPM0b9DRBf8q00s0CA
 nvSG73tOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAExE+g4jw+OfC2tVnzFktjBf
 MI2tb/QtNL51YcJZI5+trcutJsskyzIyrJJ6IDcpqujYk3sOs46dTNlgs2TxPH11aQnfvNa+Yx1
 HuQA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add function IDs for CPU_ON and CPU_OFF from vendor kernel source. This
is done for completeness and to allow PSCI to work on the occasion that
the DT is used with an ancient kernel.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 5778bfdb8567..91022b62a39b 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -55,8 +55,11 @@ pmu {
 	};
 
 	psci {
-		compatible = "arm,psci-0.2";
+		compatible = "arm,psci-0.2", "arm,psci";
 		method = "smc";
+
+		cpu_off = <0x85000001>;
+		cpu_on = <0x85000002>;
 	};
 
 	reserved-memory {

-- 
2.53.0

