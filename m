Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D24286D71
	for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798502; cv=none; b=YxcjDstVQzK91WHKf3padn/WxHLqbWT6WfjBg+SVY4EFPswBHuwoMoXApC+0z6eQrg03OtbGd5gk0sfrblbOcyntxjtVJpzt9uikQAuvmxXMTBTarXev/xYVSFyq4NzpRGUV57bAPBLdbd7nmHWKEBT+xcM7xvIfLgBQmT+JP1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798502; c=relaxed/simple;
	bh=VK1bOHyM4dk3WD+AO5ukhkRiS3HMe+PUonIyaKPLvqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVR/k/JEtYRi6OWKZ4t3xm+BCK+U66hr+jsyqyDhTBemHo0E2n+oDpk/HHnlXAbF9xv8MH/7ox1qUdPzotI4pGt1Ec13lq5u5EaUCCEzNe9MheRs7OvhweZSBPvEN9Aan+8pwZd+3KvsRQ084PTxJnV2UEpqZVZOiMXKi0UjUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MB+hpxMA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MB+hpxMA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so356476f8f.0
        for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 14:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798500; x=1758403300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpVtTH4bHBYzIxiNrmk9dugn8tPCGekUmbNjeMCfqOI=;
        b=MB+hpxMAgYbvm43aiXxBRzlWD+2kIJ+JexrcqExZk+3odXkn8Mx5cUjahGyyOv1Hya
         ptmtCokREHC6oaRngJBC6vYwhhTUenhCqJuOW+O3msFRjmBUxuNPPdyzEhYYIhqI5Ebp
         zD2PH/J9dRn/u+jlAm/Tf/0/Zmca8OlQWSeEgnqNhvZIUBudCCZIlKCLQGGkhHvfOxyK
         RgNu93EFzY1XjZnYATLlNz8eeNpegrBg3eLqtt6pavOOpHL/i74IlhV0BQp1hiaI5m29
         lZ9Hft1AHeZ1foZT7b97+OGm6oeH4a0a8Rb6fqe9WAp4dRPKdV/FrzhNDjZcWh4KsWUg
         bbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798500; x=1758403300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpVtTH4bHBYzIxiNrmk9dugn8tPCGekUmbNjeMCfqOI=;
        b=l/yA7v8QxW5ts31rjaAFrnvOWa3b9tzFuhYE95oTqeekN5tWRv7B8t29tUlDNhVRQS
         g1BzP5snNFq1C5VGL+mRFSx/pV6tvqhGT0V6cSYv97VLAIlWp5NV2xiEoPtH+zw7mWoR
         6ra/qF6knOMrF9l+3JPF/hLSIU2jRJr98kjt431vdqxZ05KO/2iyTTpElkR5L14Xm0x3
         iPIxPbE8YkxQBnmQiXkAitLKwxridRWlJmXqtVS30GkcCnN9Cd98eJFZkQRKoAG3T6ds
         YAsDLfeTbMw8EOQAC4z5/4jET4TAuy4bFKARZmC8DqKNY5xoL1nnp3YdzOTbOr6hVrpM
         rWyg==
X-Forwarded-Encrypted: i=1; AJvYcCXj35vr5fDycQznSOLuv6dKez5lBoXFhWOGrPus9ucfcfbmOJKDLf1o3afqX2SitKVKocR9cnICLWVCYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgJ9oMi5ko8OIcZEhuAPAOrqKl/qnT65d9uXSBpyPXk4hM3vJ
	rZmGnh46quBw9zkXPpSEfguZyXJTdD57l3gAM3N1S2+gHrwmH7jSrmC5
X-Gm-Gg: ASbGncuQ0+0egi3y8KTq2sGBuk/xqobUsFP1x2xZZirv59JCjrs2N+mZquSIezDd7nI
	PQlqfYdH1UEPUbWjoYZzj9OMV389cqusop6L8BRVWy+YbVRNsPrGyA8KHTZYSJeHnDkI1PH4FIH
	tEzG2Pw2UwbCnGzD76VxpP/QXaGUEB3UqfUGUJ49R8ALpLXy0ORroZf0LgIIJ3zG1wSV8vX02y4
	LKUt4OhcgRCthpj+GgBrfvMTbljHX9pM6nKhS87vpQoWT+erGSPca6M9ttJ1Hqn7Zy1Lu/WjhPj
	PKZX47kGSjM/wkRnw7aIdDOiZTmjol1fU0yerdS990LMHTuwbAtXCl1urQxy8Q5B1/IGJ7T0NGe
	cypK4glRJ+MHvZN0QkHJGN30swPBY/bplCBj7v1QT96ksdsT8OsRU
X-Google-Smtp-Source: AGHT+IGQbeLuYMGr75Uv+t8fAINg0m32Go0SXPJ3x4GDoXlXLUXrQPT9iD6lPWsbNXLMr0iYh+onNA==
X-Received: by 2002:a5d:4b02:0:b0:3e7:f044:2860 with SMTP id ffacd0b85a97d-3e7f0442884mr3036887f8f.7.1757798499546;
        Sat, 13 Sep 2025 14:21:39 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:37 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:09 +0200
Subject: [PATCH RESEND 7/9] arm64: dts: marvell: samsung,coreprimevelte:
 Drop some reserved memory
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-7-8120cdc969b8@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=AOTuIRkZ7qxukusobcqK/hGoYlqb/lfC8O75aryw37k=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/iHWezr+Ji3VcW4KOXAtNRPH1Ked6kyHNpyev0K7
 ZI7nzLXdZSyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBEvrxn+J+u/WeDhUtCgUiZ
 Ae9bk/sdh/Ofbw7P8H+yrM/g89cdk28wMuxnMjui4BTafcogPXb64b3WtlFnE26FcS5d8PHaod6
 DmYwA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

Most of the memory marked as reserved is actually usable. Delete its
reserved-memory nodes so that the memory can be used.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index dc58b19ef5d11c69f52ea7804323fe2fb2257ca7..13a726d86e65ad836166325e0958a6ec3e6d022e 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -41,23 +41,6 @@ framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;
 		};
-
-		gpu@9000000 {
-			reg = <0 0x9000000 0 0x1000000>;
-		};
-
-		/* Communications processor, aka modem */
-		cp@5000000 {
-			reg = <0 0x5000000 0 0x3000000>;
-		};
-
-		cm3@a000000 {
-			reg = <0 0xa000000 0 0x80000>;
-		};
-
-		seclog@8000000 {
-			reg = <0 0x8000000 0 0x100000>;
-		};
 	};
 
 	i2c-muic {

-- 
2.51.0

