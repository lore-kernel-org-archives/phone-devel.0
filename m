Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E636A2874F9
	for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798505; cv=none; b=DKSPktckSbiMUCTGx6QqhjOdNWHFlsjyKEggZg7kllxq+kskbIRys5pt3uylFewbY33v9DPTH3Y26HyyvDT/gmrmj/FKdKjFlHvmnvMBi2mZst0W/H36Db3U0QBHYNe6SKHs5poXv8/U4ce4LWXcrmcQ5kRmqrVZGdJGuvOX5zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798505; c=relaxed/simple;
	bh=bN2NtU1jMjlIDsytJCAkaK3wY9kweoygfyCb0yYoCOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DeUSJZApxVRTiBm2Xp9CI/RBhI8JzDX3FGBjJFqB70L8XUVP47z2OPlCqAPjhJMJIX0JGMtlR5Fo7LrwPT/TBpkdg2wLRCoMa29nNELcph79b5bCnpChdQ8LlTGJZ8IJCXhB7hssxlmFc8qSruiO6b4p0s2Jmlvz7XF98Zr6eyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tv7Ro6Bk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tv7Ro6Bk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e4aeaa57b9so2621160f8f.1
        for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798502; x=1758403302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGIDvsaWCo8xv8p7HWlgtVj86XAI/5q9CVA6cYOpa5o=;
        b=Tv7Ro6BkwypAfhuJGLmcSeKbCifraTZKELC3sfmuEXSxxpkIUZRay8vMcA0+jV4tSU
         8PYAcJPnyhyv5Bvc+I1Y3jSn7zJ7Tw1D1+/y2H9YqvWfII+t03MOhAhqCIqIAQbBCRUN
         Cw0LJBmGlxXI6owlce/TSKK47caDYfq1IpmHnJGUsA9ZioqdWyVHoPMEM81xucXgAM07
         LlJ+dtSfrglG+QKr2drMFPrVMd7uzgTHytAmVbxOwEdzb88CXBYn0g6KfVi4Zzorih7L
         JUtIYtrdSSlAllqoS2YSOItyf21a5QbBFQJjNac6uVB2jz0ITmb6k92eJ51z/9VLMHXj
         3I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798502; x=1758403302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGIDvsaWCo8xv8p7HWlgtVj86XAI/5q9CVA6cYOpa5o=;
        b=WD8d+6Zsh8tHz6OXseOo3b1If9xRnnVFV5OMX1pgOsviCzikgGCFnP+6013HkXobIC
         2s7OTZ+qeNI9sP54n6H6Aycmi9KQBI2fdJaHlSncZE23yf3t8LhYFWl3pTM/Wr4lz6P3
         rDZL0kT2JNru1rviTtbn4TLWqIYzEMiurHdsnoPcGkBjNBxgxRdJYblAv3mWGy+qRC0j
         SBxxhQ4IdhJ5BHKg7gwoRoSoNywsN/zGzQPX96x1iTM21lPxPFSAUx9o9QK1nyB0Pwx7
         Bgy4Fwola44oJaZiu+pOtE8zSyFb0qj9LelsxCspQCpBzFK5nnYn/WkDuIHTvuTsh7Sd
         KNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT/Y2f9Yw4X1eVEIfpiutJ9skHpp5GXS+MALypBcx3BcH+J9ECtYcfe5Jg9NB3g8L7qMLHvwlm5rliPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRiAWKMry0vPUDr3sJucrVTnnqBC9zrhNik1slZnPeoIvU1sYd
	zo0wPpHVdQeg4j2GlioC9O1SA3VBBcbIMTfPIs7XMoEjMBfeMGJDNrBt
X-Gm-Gg: ASbGncsyQkeem9kdmooguVPINb/0+EncG7C9GcukzsdrUsCA21PdLwZvb0miufKBjjn
	oY6jY83ul9Zov5uYi6qNjP4fgE+pMV7j+eLy5a8bYDiLSFSXiklDqA8+KG4BEiJ3NdKd6SH0135
	jxl0vrvdinWlU++090niUP1UDGdgPVAtK5g2RBPrMShlykBQPddiqO1iO0Eq6VKRSjeehgHl36q
	Z9+H/TiJHXhTNPQ65c630h9PFO2y+6BWVTuEHAJqToLd/U15k1CXxMlDvyMGDceidDZn9EoeSYL
	+TZLWbEVizYzXxqa4RPrb4TpyC7uskWsvekQ+PW7D+/JzsVsLSRj7DsoOcColXU93kHADhafH4W
	yT2kfyd5ZIj3zw3Qwcj2VFn/caju+9p7YPIwSMAHyYg==
X-Google-Smtp-Source: AGHT+IFmY5THLm9dS6Ltyl84/gJeP6O7MDMN8wq3OBTV4vsimxgGIeh5PeYusAs8d7qMKStK/tRNLg==
X-Received: by 2002:a05:6000:616:b0:3e7:41ac:45f8 with SMTP id ffacd0b85a97d-3e765a227fdmr6279358f8f.55.1757798502238;
        Sat, 13 Sep 2025 14:21:42 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:41 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:10 +0200
Subject: [PATCH RESEND 8/9] arm64: dts: marvell: samsung,coreprimevelte:
 Fill in memory node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-8-8120cdc969b8@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=nM2aOAL4Rd5X1oThp5ECWAxcNFIMgGN60dxwZOl4zsk=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/jHnzbvid+8/4WqqeD2tsaqOVVzrW4dMC58tePCo
 R7OvtSNHaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjARFgZGhusB+x2XswWu8b3z
 53X0TMVnDvZdygG+SlOKT/IdFw/uiGBkmLWy9mLEXqMDpzo+7rnl8nit1aT0YN05gZ/uzJ9mF2/
 LwgwA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

The board is known to have 1 GiB of DRAM with the first 16 MiB unusable.
Instead of relying on the bootloader to fill in the memory node, do it
ourselves.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 13a726d86e65ad836166325e0958a6ec3e6d022e..b3741389e2ae056714ff4235b972bc72b5560455 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -30,13 +30,22 @@ fb0: framebuffer@17177000 {
 		};
 	};
 
-	/* Bootloader fills this in */
 	memory@0 {
 		device_type = "memory";
-		reg = <0 0 0 0>;
+		reg = <0 0 0 0x40000000>;
 	};
 
 	reserved-memory {
+		/*
+		 * Reserved by the vendor bootloader as a "secure region".
+		 *
+		 * TODO: See if the responsible stage of the bootloader can be
+		 * replaced
+		 */
+		secure-region@0 {
+			reg = <0 0 0 0x1000000>;
+		};
+
 		framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;

-- 
2.51.0

