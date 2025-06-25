Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ECA29B768
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843103; cv=none; b=cvQyJhENcYSAb03T5GOUHr1jmmEVcbzl7VTu5mlyS5ivFiRUOzBUB5twSeVdDW8xPoaqu4f18tasTcRz3cyOuuMk5wa0ORYruryi0OBlD8UswzVyIh20BPLcutAz8Dpg7tUyBpgwNgyXjLecxWBmUx13yidlmMpES0UGDKhz/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843103; c=relaxed/simple;
	bh=sSmNKlCCE/hYQS1Jt6CmnYrp1DfkuQdAFvrOaZ47sRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IsfLohMhgPZmEA5igcjBebaI3rOOLlW+CiEHb24JrVfxynp7JeP/SI1C6x2PNhFxGS1mm4ocwf52qbYuqkBW91TtHD3V0WXbgcHgkSVTxt1LuSlumYGOmfPrO8RI7U6vJsb4I57ZUD7M1IsNpDS6h+/U7QuDZwTJ/efsthbvgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BhyqMgDr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BhyqMgDr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade33027bcfso204184866b.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843098; x=1751447898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwBID1vXAAf3T3W0EWW5L2l4FPlZyUrP4RIEpnyDcSE=;
        b=BhyqMgDrb25kfEYbrTlforw2e8wQkPfSCGBUhthr3Ap0KLQvDHGsAGo2PLfudNqw1m
         ZYsp5/y9ztV5a0zmBRTPCMaMdphUvVOlcdMIzYREUSyM8P4gprrQ1etRmYsEq1yqvdML
         4CH0KPVhdgGR9EaRGxgXURK9cVNxa0TTK+jFUXPq7YITw2sygpLcNrGWMx09aJX8s1DI
         MfYZevV9nMOyijbtd9gl+Ppj+j/W4ybirIzsHdupcyX+f7CpO5TrJZxqb8uIMoeASxvA
         o0THv3iibcswFhfWLJX+wt+wR81FC9mLclumeDxYF4uk2fwHwrDoj/ClCEeEIr7ThxK+
         vxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843098; x=1751447898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwBID1vXAAf3T3W0EWW5L2l4FPlZyUrP4RIEpnyDcSE=;
        b=O+iZfl9JG4xUZB33mT06ENFwWthKP8ViHsawRt7b6nezbZWm3XZjIWncHHjUiluSM/
         S/OWAlm/yjblNtba5wRqPThAzeQz2znSgt29hi5DNOULNWSbKP5wQ8YNJc3BJlLosEI4
         BRoseEwSDLDtY++ysrCUDK9gzNxUoPmfibmgTNSeF37Sh/zu0kFKQZiP1H+sz/kUAWK+
         DBtIQIxjVJxsljPeSuY5/cDk4XCd5FHaqn1FRDlC6VMx/Ce9sicJ1MIgsZN42rePCRTo
         k187kEfFV2QCyj9LR42mdvPop29ZS7rSVDEFjL7x7vgdVKfri5gbX+1COZtHActrmeEB
         Frbg==
X-Forwarded-Encrypted: i=1; AJvYcCUUdsKLYmlraCTcmRCU+frMB22s/uYt5cOaLYf+OeDd0GrxAxNUlV9OORaX2pn06pNE8AviQUmbfRGG+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTgg4FRKfNwG7otp9E/cCdDL/YlSMZqRI7oWzAlvWoAiHtW8qx
	VVtBV8xCVAPKVNFuSUTRQodEtyL3Oz4I/vYFjxkvsDO7+lYTveWv+YO0nYi6FKuT//U=
X-Gm-Gg: ASbGncsLg93PVOem1tVZzqmrNdJ5gLmrkDKEf/2nvxcng9MPDpmEEvV7C6cFXh6k/Hm
	itwmqKpbEWQyyYEu9p6lGKg4OW+zyzHgeoCBSLmriZdyxXBPQpOI8ZWxZfq3B+u3mEnAOC1Emml
	pcJXynMGNYdUecvycQxh0qVPWr/Qt9vzpuTKyS1y2gsKtbhJtQpqX6UaAt7yEk3uJkHUwzma68q
	87QisvGuMPV50C9OIKY+sD24ptLMpUTS6gyl5jhXXI0AP2bLlSKgHyoY9PrA/A71oW2vgmUu2l6
	ySZUFy/vgtYgSoCXVf7SNXx/gDTK368GOeqcMW8dS7//nuiMpoDqWFRdFAu0Zhi64R0QdLnUi/M
	693qybDxCQ0cSZ+QL7kBPptsJ4bNhQWPR
X-Google-Smtp-Source: AGHT+IGXwkSlAKfNfKxCHo2TaSnK4jfPfpaJp+4WHyqX+8p7y3/Ix0pLmryFCKMcp13ni53P6h1WDA==
X-Received: by 2002:a17:906:7956:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ae0bebe96dbmr228885766b.3.1750843098321;
        Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:04 +0200
Subject: [PATCH 3/4] pinctrl: qcom: spmi: Add PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=1029;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sSmNKlCCE/hYQS1Jt6CmnYrp1DfkuQdAFvrOaZ47sRM=;
 b=Wtzgl8AnylHE/Muz8JMpkBz/7QkNO1Nv4Q+it2k8m7CLdbsR8TK5aaFR+PNYbiVtqFwEyV+Rc
 tDIWDZ0Wk59Bn4ywu31W34TFp4IabNCSPn3e1d2Cucs3b4xsLJNi5dg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

PMIV0104 is a PMIC, featuring 10 GPIOs. Describe it.

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

