Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B14285CA2
	for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 21:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798499; cv=none; b=n7aNRSlYYXnOBMPC/oEg8tXI+BS7XI9te/pMyifLHN3ukbf3xjVUaO1NOzVWCfC8wjt06zLwX9JlffgMO7AuBvl9XEUByQI4nL86ChnAjP8j2+K7HRW+c2ohZhZqGfodH+PSPF9o6filTPO9FHVtm/MRv+fdML8Z8BkGXqp1YTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798499; c=relaxed/simple;
	bh=0y2/d70U9xnaWfeS0Wb0q41Df1I5MN62Olvm/podXrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8HOzTXbYdM1uoPECh03Sq5R8mfY7enNqV3A5LjryWXfWzm0nvh+Lu1gjBg2HDOYwKz1W0D+UkQa5ItQ1Nxe6LyCiU8Ocy5beSmUGAVv8MYaLpYBV0ec1lFZD1SVyVZi4wqF1Opn2pduFOWaoEukOD4vbTD969WAPFlyHA/R9nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HljCuZPh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HljCuZPh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3e7512c8669so1940230f8f.0
        for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798496; x=1758403296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=252dG71R8/wsuDQzak40yRZblq74Z4LJhIzW4rwDhZ8=;
        b=HljCuZPhPNDKExnMUAPo+JyT1CT6bsF6PejrPUvrdk+eNaXnwl8Ct5O46on6NFY4l/
         Wtr9fqHx2pQ3nKmineyE4qY/WFYiFZibp0VIocQu7Z670q/DKdJk21tJRyaIT8dJPY0y
         VMQYb7AcITOy8xb6dfrXLPJRDZDkE/UcJVQZrqmGKBppoXYNcUqbV49kwbGg0UslSqGT
         13syjxSEcrxqI8M7boRRU7Typh8eiTE8DrxQpU1mKoYJchMclRaDMrz6NkE997tF/7J8
         HQp9m062BEiIq7T6Yk3xit/1O9e/UQJs4sCvDrlGh5YlZ0qWfAbbaX4WqvxCxYbn1Tn6
         bLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798496; x=1758403296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=252dG71R8/wsuDQzak40yRZblq74Z4LJhIzW4rwDhZ8=;
        b=gsgRx+vlAkof82Y9+TSRxnRQJJiFk9s3jpBI8zKR9wYmkLEXiUEtYzVPkuv8g5vcHk
         zK8vccZhhBPOWD+hKivZeDP6+n6lBCNP56o2e4909TE3Ybx5Pk1DAZwZeh/PzPtFoyjX
         ucZ7iNznAdYhNOT/64cv3+DRdHDHdBCcpcE3HLB7TPWck7cVL0PQKYNG6zKxffzpmsZ6
         tIUwYo52SKByL1WEfbKt/0V07O77ZBE1Pkriey2yICtKyHMUaEv0FuHngplP76jO+IjY
         7yacqx8dMf6yK8AX9pvnOr0Ok8uiteboUBb/0W/inrPjBw4a7zeoiQx/sP5vkIPQ+At7
         CYOg==
X-Forwarded-Encrypted: i=1; AJvYcCV99w4+aeBOPAIr+JRAJz6sGDaDqAURnZG9qCEh8FFoOmMZHC87S5XEvUziruHaHLLRF6hbT0qq4+b0Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+zPDjKWaO+a1LTttnN9A+7cNlK0wnQKQ5pmvjdcU4H33DDGu8
	NmnrsI5jH8A+9yah2cXjfRPz5uk/xqKTFKP8F7AJjFOTFBX595mCi2Uz
X-Gm-Gg: ASbGncvBewU3VqWDSXo4iFFdJVB4bPpJrQj3emfly5yWF1oshEI4o0dl2wvHfdoH7tU
	c5E2qqDh/E0vJebL660+jZE4s8AZBjx9W66iGbNkp5Qinj63+zMdJwIqEb2AqjbmNFbEokS18ey
	2gRLNRbTpeQAY3XrpBcz8ZcSLJZPDp5bTCjnwL3guFq2wqSpUsmV+DePOvoLT6pWuqjaWCnlsrH
	RsKQiibAnhXEjlrHHhS0xyf7Zv3T+9fn5Sr448MQKVBVmc5UfU/rQbSVaFMT5zU3JZhg5pBQJ6K
	OnK7lf8O7Vi8X1l96iBnwQgZjGKTNJebTvLRxYPSM9PUZCCtAsU8loURAYTlksgMb0L3CSLwP4a
	rokV3N3/kcs0WzhqG8Pnpxp2Ew9BGY7SpoqWl1RRCkw==
X-Google-Smtp-Source: AGHT+IHOzhOcRmPGX9ESktIGDwB7TcfB0Cd8b/2rDPSkgB1eTEkWJ4gz/AUMS7YuUta78c/x3bq5/g==
X-Received: by 2002:a05:6000:2885:b0:3d7:b12b:1312 with SMTP id ffacd0b85a97d-3e7657b0092mr4921139f8f.9.1757798495900;
        Sat, 13 Sep 2025 14:21:35 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:35 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:08 +0200
Subject: [PATCH RESEND 6/9] arm64: dts: marvell: pxa1908: Move ramoops to
 SoC dtsi
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-6-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=x0fqWkqgQtK1SSNlROzTYDeTJ7VSRsicm6OwB8pn5ns=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/hP31qVdWIe4+l05XL9nPhHs4y+LTr8vmJd3znD5
 TvMT4gkd5SyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBE7LIZ/tkf897MIve97fb6
 6WWy7sv3iqW7X3gkNqnscovakQnfJqUyMhyfM997m9rR5dKyzHLXg+R0Pie83LL0h/SBernAWWm
 vGtkB
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

The ramoops memory region is the same for all boards based on the SoC.
Move its node to the appropriate dtsi.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts     | 12 ------------
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi               | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index c28c2eadc42cc538fc5491ecdfcfbe0191004794..dc58b19ef5d11c69f52ea7804323fe2fb2257ca7 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -37,10 +37,6 @@ memory@0 {
 	};
 
 	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
 		framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;
@@ -62,14 +58,6 @@ cm3@a000000 {
 		seclog@8000000 {
 			reg = <0 0x8000000 0 0x100000>;
 		};
-
-		ramoops@8100000 {
-			compatible = "ramoops";
-			reg = <0 0x8100000 0 0x40000>;
-			record-size = <0x8000>;
-			console-size = <0x20000>;
-			max-reason = <5>;
-		};
 	};
 
 	i2c-muic {
diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 61498fd75d1dcaf0d068943c1ac14d3e5a7ca9ae..deb1a9df27c2f7c946096c05a684c3f1f0f16d6c 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -58,6 +58,20 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@8100000 {
+			compatible = "ramoops";
+			reg = <0 0x8100000 0 0x40000>;
+			record-size = <0x8000>;
+			console-size = <0x20000>;
+			max-reason = <5>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,

-- 
2.51.0

