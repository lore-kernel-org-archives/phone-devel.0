Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74EC2848A3
	for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 21:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798495; cv=none; b=l3cgtUJfLUsC15Ohfh/sbBXgLtjO9kqwmZSpH8T7tLkfsvFfxHvide0paeq2DQpYfGetaK3V334fWTVLML+MRvtswwFJakBPWTyqAT7FfNCnsDDa5b6FaYeH2XENWX0Z+74vRix1MKciNBSxT633pS7nWGX5jr6hU9j3RIEzwPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798495; c=relaxed/simple;
	bh=igZli3gJlHsl2PQpYXr93eQBHQb74b0WC5i0KG6a+VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jkXF/orlCCoXogJcdSILKqyVIwMCoVfSKATO5nxLWtHHphhX3W2sZJNxTpRng90S5DBHI+hAqEPD7NXYB8VfNgrK6u/Inh3e9BadmiNQnu5+QmkpNQ1BJnZa8urWNAXgVoSMeZ9nJehMtuwu3PuuRNKeWcQOrwNGWvBiRZChWhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WISYPIM8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WISYPIM8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso18597355e9.3
        for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798491; x=1758403291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxWfkQz90C9L6MSNr2+XH/iEJ/4hSdL7W7krVSxEuE0=;
        b=WISYPIM8mjaQ7/B15WUWZ4dcQzMDqFFYp2yyof9DSjPkItZ3IrjgxWsGmk60KrjGNU
         2uNMNwF+Bfhh/shqswTN6ihMacTzhMbc7zQ2UiESkyZRNlVnN152r8PLRT6ai+lAv7ph
         jc2EDIufFVWk3NzHHgyTifKT6N42uRGTlxv6f5tD9ADvLABsE9AlpjNrjBv+USa051uV
         MXeiWco4c/EB10kfREiiCloov1zgo44j8d86v7GylhDZf4PspY71DColscl+5Lkzs+8H
         FfOH0m6FLYDEXxWQweUYcJC3gNnZapbpaT8Vnc3ZV6qOOyGHOxPZXcDM7hoduN7vbeY6
         SVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798491; x=1758403291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxWfkQz90C9L6MSNr2+XH/iEJ/4hSdL7W7krVSxEuE0=;
        b=AkYicYBUiFwfd2w8pBt+TknFdQbLOmMq+r/A9xjODI6VgKsDOwMiLHd4QjgLDsx+w+
         2JpOdvk/7q0shApB21j9OhXoWk5SzApyXhZyynL+7m7fPRk6ZhsQKKgx6Flni+hK58di
         Z/7eYp0y0zedyurEg4yQAZoaXqeyYO0NLLdjGYOmApDD273s8ZB1IS9MkPMgAF3Rqd6P
         awxpqKYPBK+yVrINA6XwMAyGDSIMmc0YO5o7wOI4i0Z/zd6pazqra7O5HQCBbChjWXxe
         qNGPuI9V3v6IbvMkWt70e+cqiSbdC4x9oiXsHmYpyoHMU6qmKancJGJqPnA7nPK+YWIk
         hsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOUiSUQwzSrMoBFcJ/Dn2IW9gFQxGZ7jp3ZnlnMTGX9Ep9At0UaAEcWB1vWxVRLNCejUECGfRPjferQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU1CoIYWAdNINM70ORJdi79ls2ieJro2kUJOj7WJqRsopT2GzA
	KKvlyAnh8KKvo3v6NQ94ZORah6ajmiZ02s+7NRqGUlB6zPBW/0Eci5oA
X-Gm-Gg: ASbGncv1amtIWz6EwtdFMlgBuvtUgC4PmUGaeNe5ZZCbWWXxLhN06ZKM2Cyy8zQ8DYn
	RV0ES+JGlSLqsrhZ1z6QjC+i+ipYXbe/VSoYd+ve6YI6t55qKIFXJVv2SpUpWfrTabLwGdDnlqR
	4YRgilh/Kixy7/gXKcQ6cirZ7JaNjLHE8GZJOXkzhfOpMs9/a5b9Gq4VoZ8jdVAuToL5egdM3s5
	qnhzCed/h8dovBn+wbi4Y/Ou9zVKvwihAVgsS16gTeZOGlKz1XF0qiemr8ge+kLj0t9gvzOQ2aW
	/nwKQ9YdH85rUweMlNPwR58JL81ixM9OLGC/mQyTWT1YmFp01UHHHf5cdz79mP7mKqNMMowjAF1
	rnmybB5IoBpOPUGH/GWMvhhU6LOTlNAFWFOOm4eTcVmpVSygo30eT
X-Google-Smtp-Source: AGHT+IEs/fk+jCkMcX17PxuJzAl3BMnHRPZjZ8PBJFXUcfnuVJskMnNC5koV2QxLjtd7wZEjTRjvpQ==
X-Received: by 2002:a05:600c:45c5:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-45f211ef88dmr66556345e9.11.1757798490854;
        Sat, 13 Sep 2025 14:21:30 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:30 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:05 +0200
Subject: [PATCH RESEND 3/9] arm64: dts: marvell: samsung,coreprimevelte:
 Enable eMMC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-3-8120cdc969b8@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3698;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=8/peqm48tCTiEczHfDYZk/YBJQovtzWt9KQ0JhK9ewc=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/iXbxO44VcrF9qzRXLzgmz7d28d/yQ4fUguaD247
 amSxPXTHaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjCR8B2MDPvn8IomPP5QfVl3
 86QD/VOXm555zJEWyxtWvVnu/v1z8v8YGT4wz157xuv64fv66QyrH351u68YtHFzhVT8g1maq78
 8O8oIAA==
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

Commit a41fcca4b342 ("mmc: sdhci-pxav3: set NEED_RSP_BUSY capability")
fixed eMMC probing on this board. Enable the eMMC and add its pinctrl.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 79 +++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index aa161982ca43844287d212e8a24884d2b8440fed..78b7bccfc5f299889d1b9a8fd2c08554f17eb147 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -292,6 +292,79 @@ sdh0_pins_2: sdh0-pins-2 {
 		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
 		pinctrl-single,low-power-mode = <0x208 0x388>;
 	};
+
+	sdh2_pins_0: sdh2-pins-0 {
+		pinctrl-single,pins = <
+			0x24 1
+			0x28 1
+			0x2c 1
+			0x30 1
+			0x34 1
+			0x38 1
+			0x3c 1
+			0x40 1
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh2_pins_1: sdh2-pins-1 {
+		pinctrl-single,pins = <0x64 1>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+
+	sdh2_pins_2: sdh2-pins-2 {
+		pinctrl-single,pins = <0x5c 1>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	sdh2_fast_pins_0: sdh2-fast-pins-0 {
+		pinctrl-single,pins = <
+			0x24 1
+			0x28 1
+			0x2c 1
+			0x30 1
+			0x34 1
+			0x38 1
+			0x3c 1
+			0x40 1
+		>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh2_fast_pins_1: sdh2-fast-pins-1 {
+		pinctrl-single,pins = <0x64 1>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+
+	sdh2_fast_pins_2: sdh2-fast-pins-2 {
+		pinctrl-single,pins = <0x5c 1>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
 };
 
 &uart0 {
@@ -320,11 +393,13 @@ &usb {
 };
 
 &sdh2 {
-	/* Disabled for now because initialization fails with -ETIMEDOUT. */
-	status = "disabled";
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&sdh2_pins_0 &sdh2_pins_1 &sdh2_pins_2>;
+	pinctrl-1 = <&sdh2_fast_pins_0 &sdh2_fast_pins_1 &sdh2_fast_pins_2>;
 	bus-width = <8>;
 	non-removable;
 	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
 };
 
 &sdh0 {

-- 
2.51.0

