Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6759344DB3
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599358; cv=none; b=cPlMHzzOHN7JcFG49iWAojEwlNnen27lKQ0li/6AwYfHZErSy54BWmrh+ITsrx3BQt9Ebjowz98qErQ6xMEv4mZg2LE3pWKPH1EJ6rw3Gb8CokqV+FRshV2o9GDtbOIiLE9/xi7bI8azST4r47HWEeIraY62p5yAcs9OwjMxYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599358; c=relaxed/simple;
	bh=q977yKz7zQ/PFR5OpD0DFq5KMw+GCR2Fas1jk3OALOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ReFzxOcXzBisPvrh9nAjM7evjJ8F7Eh6k9D3/KmuDTTbIDrwxELTBTAr8rpLm9bdyeIyVePJU/BuiJLprA77N1ILl/r1gIHzIn88+UivNJxQgstRvQp6J4K7vFK8Ov2BN/cbEBmpKD9A6EWWTt82cWspWijtnGgSy0F2LITLHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tExHgi1j; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tExHgi1j"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-382fe06aa94so53419051fa.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 03:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769599355; x=1770204155; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=202w4WqqYho9WJKneX2iwEgQBvnIKInbtC7YMNyp//c=;
        b=tExHgi1jzCM47oOLrs4mE+YuJ2LXMVSd6TFTE45ChnVqqdaVZpTjSiUPd1jMqTVP7B
         2t3tNkGDS0Y1c+B+sutu73+ZpM4IkTj27ygUNz9JDWg6p6jgNGq/LpJYaDqiAyfGDnlW
         wFJzhcImVJ8opPMHL2fiuBu2iSk4m90vwfw2N2u8orhfvrUSOtc/JBY/+xJgtU+xaR9x
         2dHogxZG8qooCyqGS8cF6U2Yl8iXlVEgo+mHDyY3o4HZOGeyQt7Z9YWWoOrZOvg5gqks
         mghP07Oe2Gk/y+qpThn/qbQwQ3USI9nA+gCmoG46O6pMRR7sPS6+uyCzp0Ffu5bw5YjD
         kYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599355; x=1770204155;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=202w4WqqYho9WJKneX2iwEgQBvnIKInbtC7YMNyp//c=;
        b=tH1E354hMIFuAHzJ7tmZ6JB6h2oGQzNhIdyAJLZYIlN2XjTkxyQt3UdxXFZKmctBhO
         i3sQVR9hgNJDj3EJI9mViGAefFp+Wx/ZlTk8Jec/3mqf9sTxks2Qjst511wvr64xYCrT
         uHToSVmzbnZCc71W+yf8sr7Yp4y8BFdVaZxqmOXLsEJPatoTnaUTMnERNcjnaMw+1+Yi
         JIloQn+ZBjViRr17mPM9dzGXC9b3npBb+dTynv+bz/MCu1DQQ11BCHBT/X2KLkr7vudc
         2kJ291VWrK/j9nXIJIaNhN5LqF6ErM4FaRegRncLWA6L1kLtUlONnYw7Ixbz3VrPr+Tt
         qA0g==
X-Forwarded-Encrypted: i=1; AJvYcCXo7pAXVZNLU0BxW0ybNvMoW9Qbo0i3i4JI+2/OnTQATcLQfa3+WQ0j2TLkqzbCFcad3ryOZ4GJEi+WGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ89T0BGedPGuO9t7ceG5FVDJDmemgjcN4/beE7rnAuQL4NeK/
	Gu+UPZbiu23tFZZMfjr6c7nUS6YKudac2pSXFUfPdBRrmjPDt0xlVSpxKcVI/4yE224=
X-Gm-Gg: AZuq6aJ5lc/gRPNSNWLLkgqwl+CGFDwGcf8EQ6XXK0DaCZb0EeNbh3nMByJWMkOxdMI
	/9dyMqpC0QViVfWqM0gUZm7aqXwsMMTy62JW8b5wLVG78YZAxQe5fVlYXySDRoKNcUfc6raP/ko
	K4VWdVAQp68Qxh19Y4Jp0hY4GyNux+RoY2lqS+l/kip3Ree291oe9EFR/b36Iln01WTliVqpWkv
	XjV904i1O+rzFbQ5fEAILvhr9m4hVJsHtEtHI7fVA8iUsaYt7ulbRPLLKWUAbDYUpbw3K9CcTDm
	GMIl5dtzQ/9obF9+KPnXsXF3gjrRjksA+yidd0LtG4GxoQhg6bOfznUlMtTkQ1TcDNSPrHR5xLa
	tOOyjZ2YsDp2/gylUVs/ovH6ciqBtD7zaSi0G2wZpAMg+6GcbJs3DqbAsRm2y1cccDS9VaCdnec
	UjaAXiB4itGHXdt+sCiw/DKRdJtuinA+WF9BR6fPiPVjgq88JOQAnj5V/E1enB8eLkWg==
X-Received: by 2002:a05:651c:198e:b0:37a:2d7c:3ce3 with SMTP id 38308e7fff4ca-3861c8645e2mr18910031fa.14.1769599354907;
        Wed, 28 Jan 2026 03:22:34 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38627876ab6sm3035611fa.49.2026.01.28.03.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:22:32 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 12:22:28 +0100
Subject: [PATCH] pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups
 definition
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3eJcCyNTA92cgsTiYiCZqZuWWaFrnJRsaGiUbGRpaZKoBNRaUJQ
 KFAYbGx1bWwsAEYfJvGYAAAA=
X-Change-ID: 20260128-sm8250-lpass-lpi-fix-3bc112c2994a
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769599352; l=1316;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=q977yKz7zQ/PFR5OpD0DFq5KMw+GCR2Fas1jk3OALOg=;
 b=vZmguXgmSeyKMY7oO9jg4WybdJYBewOX24i0DxXIPG15y0dDTH2ULOm4clo6sC/Mskzw7voWO
 jvGqemt5B50Aymb8YzFBSGLsqCgwl3TcIajjPuEYdLAqI1a2nDXOUNJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The i2s2_data function is available on both gpio12 and gpio13. Fix the
groups definition.

Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index 64494a86490e..c27452eece3e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -73,7 +73,7 @@ static const char * const i2s1_ws_groups[] = { "gpio7" };
 static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
-static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
+static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
 
 static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),

---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260128-sm8250-lpass-lpi-fix-3bc112c2994a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

