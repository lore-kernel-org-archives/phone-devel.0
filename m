Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BACA2D97B0
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061612; cv=none; b=I30hEtnPsE8rJiP7U0XC5mm/g6B+wrfh3yQD3D0eHApWCuNxbRvdOiq9voF9b07kTIGRwmr4CJENhVGJDUDkQAe6q++tkAMTBrCBzJYRXdWbVLF9Ec7FvTYsKV/G6gXPwVUzU93AZEl0L132Rg6b7SsAlL+gDzQ+N+egQybtvmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061612; c=relaxed/simple;
	bh=q0f4Kt7CB4b+gGrecsM4LRgCLVf+5IH0ECZJniU0Rsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIcDoYaQFtE+jAPPDdLvN2HfRM7cPCxVs4qshottxHLx8UOE2eG7EeY9ecMIRKklhs93kQFBv7kK54ZEBG8+WppOR2MXLLtPhyKITaaYme/gtdVicZrtESySCgWpuQt4yYtA0dF1/4AEFBZu8xheg/viSfq4bnBhgq3WLHjxdHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p8rJVdMv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p8rJVdMv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so8860909a12.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061609; x=1752666409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mqaqbmx0aerFIcDameI20v5fF8h6z9wFPaN8VWktnrY=;
        b=p8rJVdMvQqD67raf2TgUtXlA7ZLdTBcyLrQ4CCF4cOj8UIq6S/Y0SYJPVaZnf2kdkB
         /8Ov6vbmgDl6dn1F85LaR0mA9V2QeaqYdtOffSN8Y5H03HaoOKblgHpsw5VzveRzi1Uc
         tRzeM+X1Fzi7My+hGQzGOCg1LwuaHXJI0JACfIwj77TIeyc55T33+UiXzEkwC/0S+uYF
         32G+/XlO9iXwBliesJUur6YRBI/PRw9OcV6SeOvdXqPJr7MCbjd8EeLBjnHLMh2oTEei
         EEom6mLKUji5guo11YFku3GFZ2hM/Bcwjm3PU9seRzIwDbUFX4C567Oir0a7pqf7uRr+
         89Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061609; x=1752666409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mqaqbmx0aerFIcDameI20v5fF8h6z9wFPaN8VWktnrY=;
        b=HK3kkN0oEzilv+XTuB9L1xDsNrOVO31uXjG5LsZ69BYkzlxDphNcfbtZAR5RAQdK2r
         kKy5dZAeXTnMa88sKUP1QI35PViFvGcIVSuBfkmyQekEJRWnY9SYaZtt4cqhWF4OG868
         v+wrZcYB/dQqA1Z/0T+HHhpmPy0NFgclQ+D/EhImBtPFsRPwtIJkxr41H9lGnySP/e5w
         pCj9NUF7OFutIxe6nv2CUCK74pJF1x5lCVzUFhNIVftFVEz5HChGOoT5Yyi5Wi0T8wpT
         hyW0fi6mTQR6dLhz24+/Biglci+4NF2faFdC/NiIDYYOUUVbGmVKU1akRR6F5D4je1nP
         W/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn4V8tPMzFJOIdwbka2/abWGuglWVrLoSezdt60pj49X4JDXglvmy9LnqWxlW7WQqGOe6FCM8ovpq5CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVI4Mz7tQcwJVoU645OFe+ii/y5Ku7eduKLkCYypuOmPNZM9Ag
	rxXsSceGi1g7Xljwgmy0P2vkp8YPqMit8yeKu3koQYg8dtYGAUFpyq2gaqRlfubI6EM=
X-Gm-Gg: ASbGnctL9XwFB4fBF+FBjesCGVqHze1a9ai9D4su+Jc0KO9d3HwP2JBNk44uxOX+Lky
	gkQJ/iqYAbxCLitgxaNytV+59Mb0aS79MNfmyFZl11Y6QzLQGL8xJNaN9H3u2KnM/N/DMBk868z
	SoRgHfyjFJstVUokcXC8HYF5WHBPp5ku3gD6aX4CgECDFRWWixs7v+DTxEjY6ICojiJm01ySyr8
	gXz/xShJCozW7WfBaO33ysVEeeTFkJUbVD5HtQ95R3hoKLO8qSRZ8RRBmDrSVGRmZQi4j16eB00
	umf8ucXmGs5RaWDcHNMkjXfAssMgYYso/9kBxdaWDOFU5rmeDPjIxIO1piXlvw1mSeyFVqUIhYp
	ah5ntI9mp++WjtN8BwuMwmAHy6x7uRmGE
X-Google-Smtp-Source: AGHT+IGe8ifQK3zKlm/INbNEzwNqGtIX1dU/rXl+zkSfPoXCoNmj/1eNhP01t/aTJ30bcZIwFGeScw==
X-Received: by 2002:a17:907:a42:b0:ae0:d78a:2366 with SMTP id a640c23a62f3a-ae6cf64081dmr276746366b.4.1752061608819;
        Wed, 09 Jul 2025 04:46:48 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:35 +0200
Subject: [PATCH v2 4/5] pinctrl: qcom: spmi: Add PM7550
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-4-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=1016;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=q0f4Kt7CB4b+gGrecsM4LRgCLVf+5IH0ECZJniU0Rsc=;
 b=WK2/spcTGkOFsA+I8ICoknzdQfJloKrmYS1KluZTLN+wJZEx6G2GjwtphGdFhyMYagAJEI+dy
 z9OsIl9SHyIA8x8M1W+KJQK0AAL0iP5G0eSLD+npYZDzmIPE5SPQ1MJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

PM7550 is a PMIC, featuring 12 GPIOs. Describe it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index bc082bfb52ef480941e1804f1142496e1db6413a..da62eadbe1e97bde0bb56db8c07182ad5c6a4162 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1206,6 +1206,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm6450-gpio", .data = (void *) 9 },
 	{ .compatible = "qcom,pm7250b-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm7550-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm7550ba-gpio", .data = (void *) 8},
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },

-- 
2.50.0

