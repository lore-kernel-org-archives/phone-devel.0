Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0FC292B3A
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060163; cv=none; b=UViBoxcrMPU9Iymr0HRYqKzTH6gYgpnEOSkQRvADUM1ktEWM3LmiHG3QCPVRcFwhmI7ZuVy+ZRYEqsXgX/YRTxU0IGxUG/znFnZD0sUAzRMO3NmCxU5g/WLlMOl5Ajyu0h+fxD0o3ce06UJD09NKuy125gqM9du1T7/aBm63CK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060163; c=relaxed/simple;
	bh=KV/da6xIzbVHrhG2xY2P4IEV9DKl1AvKU/5Rm5fhtk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayLpgZbxiLbAcVCBuHZii08regYW8wcfmASwg6YY4c8Q1gAXkBabe7zC3U0EpVPaSE8TpeeybU3eVHQ1TIX7DU2vx6tOA7eG+iSZBZkXAytSxdDTojzFd7oYrfGUuzqzNjIEatm9JfH3TMz/bm1Ri/SlDJkT/y1ow1x5tRr7DTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nsSYil+T; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nsSYil+T"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so8112317a12.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060160; x=1752664960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fK4ANoIWktsPShrmwGNUmQluv7mHl27MCE1eB8EJFoY=;
        b=nsSYil+T1Qd+O8Yt+BgQPYU4/pXrNW87XRBiUvhOP7R1BgXf1MekOxNCzLVQ39T2PV
         /3lo/EksnjEd1xrQT+N0T1WzuH/f6MTp4oP2pcapKRqJc2YpE4HZ01deUgJi5VvnWKSN
         mX27EK1cF+NsUlwoLL5+cn2KWPquNA4xhVF1ufNBXeIEkjP1f6INasEUVSpv8YHrlnLg
         rYDB+Y7a/zELato6+MJwQsd3DjIo+oiY7KidqSjp6SmIgAnJqL+PWOeKVF2ZkPEXe6Hg
         +i+GNTJkBt6kC6jKvd+asnO/wx1gYoL4l1KoD/3IgNRwTef0S+/InMUCaO96A/IltwGx
         LO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060160; x=1752664960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK4ANoIWktsPShrmwGNUmQluv7mHl27MCE1eB8EJFoY=;
        b=wuIxiYiYZBfY1KBE6lKRwNYWCsgNWFz9aljHQd9EvdHGAqYFVIziCevQAw2EzeGgup
         9TEnsZgjcHpl5McThtdQhqDe0JLI11uAt2eGnHfe3nj8Zls0kWn1NOJ2i278QTyr1kWy
         DIT6Icqj2ZIC3JYjlNlJjeImhs4Wjj5lF2oX2WC5FAhFM1tdphlhLY+ErV/Yk0KJSNZh
         cXHhE28o4XtMKTyMfSoqbwQxTwKAHKlv11mnmNg5ZO6f6dQH0M6fFHzGK0EiN9pHevyz
         FLAtR3UPgge9hflFEYAxiJJrZdZw4+RKFsJxuyWM6Dc5WBCpQYwkt97/xmQxQhcjwplu
         QcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCULTHYhZNzqpnlORQgHS3U1/k+AlcQmiw/JRIFKX6q8Ba7xEwGzRjmFn/Pq/uDFuiWFOFtHyfecrxna6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh7WEJq5MgrnHHy3fA4EDGzkCTkUmHX239iq2X/ao++3oOAQS7
	bKa4ZAmUIt6UWkxLt99V1NcBMBFzb0JCic6/SGofn4CFsyiqkDUVpSrb5k5qVySUzOU=
X-Gm-Gg: ASbGncuVA9sn8dOqlf8rgkGlL8t6IX/HByJ1dv8JkKDs+cmoh4J46Y7vgWZkytEKmYW
	DT/KbAjZMFPm3E1EMrD2gRenUjTGlV4pT2YKWVy3rvuKsn2qbSNiJRJAdhZMDenzGkQ6pO1bqEA
	l0rh/Vd8+4WXIEw730qfEJ6Jh/CsEv9Bk0PsNXeMYfqxDiBBfRGdidEWzfVuP2wnrKWN01L2HV6
	C1EI2W2DhC+ESHiJJxvcVLarK2pQUp22YhwovTykWj3u1zBZWUKm4ImH5FcQzI04QvMBurNqiZI
	bCPoDdkLNEmqsxmAxY0AT1Z4HPBrBoCWR70mSWWpspvbbsPmYIXbGLmj1pOw4Lj7YgXJuPw5oni
	0W7aXKarFKhhXsNfOblLjc1RTcbkVGstsbOA/BGWr1eo=
X-Google-Smtp-Source: AGHT+IHZxwLmYMHgjDd4zGI1+9Hd3ISiMtfdbCFiwSyXc9F1royVFxYLXpMSuKapmOzkESC7IF979g==
X-Received: by 2002:a17:907:6d0a:b0:ae3:6994:5511 with SMTP id a640c23a62f3a-ae6cf5d76e9mr268843566b.16.1752060159608;
        Wed, 09 Jul 2025 04:22:39 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93basm1079861066b.4.2025.07.09.04.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:22:39 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:22:28 +0200
Subject: [PATCH v2 3/4] pinctrl: qcom: spmi: Add PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmiv0104-v2-3-ebf18895edd6@fairphone.com>
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752060155; l=1096;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KV/da6xIzbVHrhG2xY2P4IEV9DKl1AvKU/5Rm5fhtk4=;
 b=xXytyaef40ZyvPrSPOwWzJfwNcIkMrPdQjGb0A6tTQU0ejQ5IAIsJ0UY+yU49mxJVPhVCpSQq
 rA33o/OJcXeBDA04u4TVHfK+ujFJ9Ntn6/I3J6W7oVdYHSKos4UDQQb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

PMIV0104 is a PMIC, featuring 10 GPIOs. Describe it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index bc082bfb52ef480941e1804f1142496e1db6413a..40de5554c771d0c034a458fb4d5e8876473b391c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1244,6 +1244,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
 	{ .compatible = "qcom,pmih0108-gpio", .data = (void *) 18 },
+	{ .compatible = "qcom,pmiv0104-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },

-- 
2.50.0

