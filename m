Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ED61C3029
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896112; cv=none; b=NSyBBeD+81m1F1ASfz57Fs4/MBMSejqWDxDoObTIu+/AivaOuDqxMJ7s79nqh8fs1wjhONxZd7SABtGCQiwFR0dqpaAFWntNCsDPSIdt+dQAcR3H6TqPlU6KhBC2HFGpxnAHz258u9/+o8l64e92A58bleSPyNAqhjCbF0CSIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896112; c=relaxed/simple;
	bh=Cn/7/TPNYeOE+2g/2l424KGbAevrj9ZsheolFBBsRSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKkYkVlY4Nhvnp/bHPwDtzZKZPdO1ke9v5tfSE8H/maauqt92hqOHxcdeWWscKCk3h1ObKnUhxHIqLXOeovbUuCV8ktPzDD0+Ip5MlhPCes6y9b83CiUGxTAf/tFWqvWwp6lJkIDJoREqSAsEu4T7fF0bxeq6jp5wGoMTp95hVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OE7msc0t; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OE7msc0t"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so1732259166b.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735896102; x=1736500902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVDJte8gphg5oXk1BsgnY1RJiMM2PoJiarukFRgU+Eg=;
        b=OE7msc0teW3tzudu/hjt3cKTved7Ivx9UhvVNK8LkAY1T/qz4PjMxjg891RTucFn03
         eUi3DXvwcUDXjEkmFEgy4Zx4Ve4pDdTZ0nr7nLqRI5aIcZzryWdEQPoQXsIKVlfPVhzR
         96eLIi68QrgPUZd12d+3jRSGy52kOHVawZr7ekcfKwDo5ZWz+5zP8e+m8ZoXwywt0Vab
         pkp5pwfC84p2hLRjCyOsCuTPcloTuY8vB4KX9uApbiLoReCKbsOrt+SxU4cke0ZUYS/D
         b8r5c8A0oxSYKCTSWso/SVntBQ52VW5II0I+a0F+yVqRjHItYfdzFVWW0WwlzTWGDh7k
         YcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896102; x=1736500902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVDJte8gphg5oXk1BsgnY1RJiMM2PoJiarukFRgU+Eg=;
        b=TL0QCCNI5N80uySG1FutCZ0dO4JxGs1OY4pSZ9ZKqP1uoPnjgb8IgkbLBmQL1tclOM
         NMm/xilScHMfFFZmzLb03YhuLy1flphG/ULokpMv8N1R6dMzyGbl1PAaRXqvGsb6chLs
         Oo8FumiAP0UKNw/NTEWeIlAKRYZ680ZyMkRvBkp93jNZjtaaw/cqtQbeocl2V6lx3QHA
         1ZPRaiggNF5WjdVPsp6DqrfyRlo7bSVeyzUMr69FE88HxadYMWyzfI2ohQAS9zCJZ1lQ
         ZhVu6Mm9HW/1ZSlPZwgM/p9FqxCycR+objwUEp/L1kQ7JU0tY+Jty4mEEGROLrJDxZtA
         bVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL0ODKcy0bdtoNLk7eQNSrjzpPx0kCpYirv+Htiq8ecVDKITndbvmjPvOXDgldkVVu2Vbz18zTy3lJxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6adMPulFJp8YwBLo7Z9qBAGfPbLiQwnXdJM6OvPgPYBWJu6Ij
	Zmc2fa5CUyQaLO2Buc5vlQ7eFkpWnWspd7zcKNaifLfir9Y/J4NOEUKvhiZ3B6Exicg1n8wyKIV
	P
X-Gm-Gg: ASbGncsz8pMr0bXfTQNH278EykGFTvdvptEvLlpOMdY/K28kCwYO5ANkRHZJwP0+4yi
	V5TjnfuMdp4f5KQyLR4IrkmHZHuUWre8wR3OvpRbd7jLIKTT2hrKMWYrw0jI33v9MfDXAY6q+Mr
	u0JRay6ZZ2aM4IBEAqSxrtR/5voY+Ck0tM3go6u2gQwWh6ld4O3X1nJyZ+i2Vx3lj3RdZLPN3if
	o5fN9wtQI76RWbgwC/PaptyOBpgkO8zyidFIX/DKkvZlpQWOCQExlQl4ZeH9d7ynJGgWZj+1iE/
	F0WiDr02uCx4rPW/D27oK8w1ug==
X-Google-Smtp-Source: AGHT+IEP0pqzjNcKpMLHv58TycLuFbHDFEPtWZPP5wVDvFEESvjEvQXGbmwzN1VeN1K9zq9lytBpOw==
X-Received: by 2002:a05:6402:4405:b0:5d2:7199:ac2 with SMTP id 4fb4d7f45d1cf-5d81dd83e12mr112825622a12.2.1735896102436;
        Fri, 03 Jan 2025 01:21:42 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f0e4sm19235306a12.42.2025.01.03.01.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:21:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 10:21:35 +0100
Subject: [PATCH 1/2] Input: goodix-berlin - fix comment referencing wrong
 regulator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-goodix-berlin-fixes-v1-1-b014737b08b2@fairphone.com>
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
In-Reply-To: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
To: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jeff LaBundy <jeff@labundy.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Charles Wang <charles.goodix@gmail.com>, Jens Reidel <adrian@travitia.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

In the statement above AVDD gets enabled, and not IOVDD, so fix this
copy-paste mistake.

Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
Reported-by: Jens Reidel <adrian@travitia.xyz>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/input/touchscreen/goodix_berlin_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index 3fc03cf0ca23fdbe36028a6228030d3ffb8d3a09..e273fb8edc6b92bcbad0fd35223a841d7da7d671 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -263,7 +263,7 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
 		goto err_iovdd_disable;
 	}
 
-	/* Vendor waits 15ms for IOVDD to settle */
+	/* Vendor waits 15ms for AVDD to settle */
 	usleep_range(15000, 15100);
 
 	gpiod_set_value_cansleep(cd->reset_gpio, 0);

-- 
2.47.1

