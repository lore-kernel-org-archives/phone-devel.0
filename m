Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB2127700D
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982045; cv=none; b=J4ebUqYOl9vJdldHQVwyVAHE4ygh2wpUFQdXhoebEc3pi240Nga1hq7IoeuowClegs1HB0UvUtSFr+TjXAY9WacCSmdkK7pj0ZA21/VXHGV16ZSI0YurbYrDzr1+NFioh+zJOx/jXfczi7b4Bvm5FizeASUkUBn6AhxfoV1ujRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982045; c=relaxed/simple;
	bh=YzHH+rPNmlCw7nAjTMSEOMMyWvfPWgugAOZbphqTg0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUX2yUXTG6Nl2QYtaksXY45cwzKECFY01NPOQMpmgZ2hK44+5CSDZCxKYiAEVOvHNorijgMx4NRrvFSea34XV0j1HCiISp/9u3T3qnyKwpEQyZ3QdH8jci2LfKzN9TMTgfXPlLx7Msmik7tHkSCpI9jo9gWgD0oW97XSD7oGPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vXG3U9ER; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vXG3U9ER"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso338688866b.0
        for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982040; x=1745586840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+iXn1oW4dzOU1w6dTTVa2iMvBmWei5kk2HA1UjOPDk=;
        b=vXG3U9ERiw+gC5ee8RwFhcBpnEsu9oKkfl9Bjrp/STu1WBM2yM4TNzZhwWvCYBkRgE
         nrAocFoK9oqj1zSglBMf3P9OGIwlb9xVq/yVAcrPmcIuYowihDt0VqwXVo3H+jxF6duY
         BUxP8+4EHZYLVsO8l7ylAJMJ2a+GxRMZcomqkz4mnCFPo9h/OBXm4DBbhUJ+6R60ZhtH
         9s7pb+LKYvLoL3gonwJYKVKaAlJxF8fuDkhny83cFwLBNHQ9pwMM/NO2S8MJhnAMx4YE
         H4Hd2uCCvfhGzrgGljqH7fBMfIAz8JnYTSVllcf6X2ZpqxG/83Qbvuu5+sILdFwMXB0N
         LXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982040; x=1745586840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+iXn1oW4dzOU1w6dTTVa2iMvBmWei5kk2HA1UjOPDk=;
        b=N3G4ALEicfpEin95+ak4+FK7xUI7XHQlTmL47llU0cZAY/Iybed6W28BigR3S62wut
         vb6vThdbhiugDolDwpOEOtbAdkN7+1EyuQP0mUAFunF08etN3Y3a9W7VoW85ncVwi9pP
         Nd97pVIZBNmWMI2NjzD93B6uYPc5mhFDN0ixoO9ipq71znNTJeGOTiraOseRmMwAI6+C
         /ryBqegDDo0FE+uRgXtYymIOdZ9zb9fnNp+DF6Zr09UP1NmkXCNDCq0q06DBeo7C0IPr
         ZBQSlLGQ8gGIfN5LrnPy24k0LwY6eceomitLXUo6y4/ny9M5GAYShZ/gsyrgskc7I6Sq
         RDBg==
X-Forwarded-Encrypted: i=1; AJvYcCW69KDj1oDnxI0/NLt7jSrBWVJhwnXS0A9zTqczwYEhiVFphSZTjILfh/VdlRhRy8fIHSE3dIj/3NzGBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymtNskFLF/SZUpp2/MAOr/arKcUkOFNm4tx7+faOzA9bqdbONu
	B0v0W+aIR6v9ZCiea/ZmAIE5BvTCfipgK9PoEoZvrzGPZ6g8EnDUd0Fv06c7qn4=
X-Gm-Gg: ASbGnctODCGvheFfGY9Mfz4HuZBV4jpTMZJSuiWR+hU7Q1hygYhKHRaXjN5kqwJhRsM
	U0F2tCxqhfekrd53cghoPyDxp9dr2pOhaOPsVF1FeSpjZq3uGB0Se+Ct+FTZ7Z5P0gRL+TxuRNa
	u78q1weJlCCgppsRz3V9CPa9+XhDPzpZn71gny8P+6nZmJZwU1YhrnZijamRuBZs/fK7jFZEOis
	Izq3OQue4JHkj4pgiMg+EQ/6Hbix2GYR3RppKkQKB4zp+WtSN5zGrT0DbTMbV4pbXJLXm6IK6FK
	potzdXkyiu6VlxzLpbLNkUEY/Kr4de5VEWfNujspBK8NgTbr2S8mcKql3h6tXxh0lqUIM/b83mv
	WLxMMvwkR+Anffw==
X-Google-Smtp-Source: AGHT+IEvyHMxyvjGL4iGOJh/qfXqtVq90WdGbNIlyJO0slfHahtv2sJybNJICOISqOrAqVq+TJLnEg==
X-Received: by 2002:a17:907:6d19:b0:ac7:33d0:dbe with SMTP id a640c23a62f3a-acb74b8e568mr220791766b.33.1744982040350;
        Fri, 18 Apr 2025 06:14:00 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:13:59 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:43 +0200
Subject: [PATCH v2 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -16,7 +16,6 @@
 #include "usb_offload_utils.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
 
 struct sm8250_snd_data {
@@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sm8250_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sm8250-sndcard"},
-	{.compatible = "qcom,qrb4210-rb2-sndcard"},
-	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
 

-- 
2.49.0

