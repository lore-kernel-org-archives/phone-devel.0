Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C4232395
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568457; cv=none; b=KNWbmSQLwmx73Pp0Oa9kLNxNZrTNNhDpppBrxhUjI+s/8IEri1fGJXnNK704Iqva9JVkJwD2h/f7r2lIOmhtrXYYyJwfrb9IiJAcQbXwYhupXebId96tKxk5IJLd19c7aWT82AhzNd15a9Kd59xmD5Hq8StA3tm1K1zq118utnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568457; c=relaxed/simple;
	bh=t2UqwPYP1B9XN/iC4TKLlBIAancDyLL4wrE626PGHow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pq0/XSHJStfESb+rw8te00Gt70DEcdZR78dALvvDcSlb6kEijFRvvQa7XKokVBehnAjTnmRtHH5tM2TkmSLsr/2RRd5/4vX+yDpu8JWaVgIYXQxX0f3wGJtQomdQtsmnFLVEhNB2kxFAFB7sY3GxJ5RrQh+ixPESISEE1WYgxzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E/ZeNWO4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E/ZeNWO4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso18380025e9.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568454; x=1746173254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF78VVS1a3vgPm4/yr7suBZclt6DuZ16jbZS8capHhc=;
        b=E/ZeNWO4NOjvxBEyxrMqorhodK7sD0OA8gGwrzWhSZm+/Eruria3SxiWJoJC1dI8lk
         0qe2/F8iWfyDpJqHMckbEZtd510KWYkbyUhUbS3156V4Z2ZPTyV5OUtcUsVArq731Dkh
         +3fohrEDKlc6iTjK7AsMHPVAi44VjDgPIFQ+bCcGCbtCGlrJz9dgurhjAGYHt2UYTfvM
         VnBcMp52NSfSs4ffnjBfE6n7DFJ5Pf820fh1f5O8G46UBDBqRXl/3AbCqYVjwkZNOqWM
         xFLWhIfGezYoRtQjZi0tbRPWK8MaGYVIVoLESQxGqkMa+ViFlwhYGSiaZA+FAv6EPLYN
         FwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568454; x=1746173254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF78VVS1a3vgPm4/yr7suBZclt6DuZ16jbZS8capHhc=;
        b=KHPHKFUfx65G4ziH9IWVm/pSV9JHP3ew8AqWJH3l1jJo12X+myOXYUt5NnnBh9wEUI
         ukkhw1urj07tQHgdFhKYeVO1uIWs6NLPM2znJX9Y41R3UDCo4QbwuXDXXwoNZuO5s5Yd
         vkDeJo3zlZxJA1cNnBI6uYifyhm28ebptXmmj4LTOHy0nm0pLF/odhGHFUp8JLm1bnW1
         NlGM3MCs4yqiHZ+F5UCqOfF03iXZtOM0aNEXhjxme3vLWt8rIbZ2ZGlucnNikpl2exdM
         bdcYTpxftbRWbsfNlP1Pq8EdTEm5KdjxrgtobzpBaOa0MxcNXFlFjrk3GlTI5aTGp80Y
         h6PA==
X-Forwarded-Encrypted: i=1; AJvYcCW74hchG63lgJkfTRv5WdWQE29K2prvtAlAhuVMZulTsbiubM9fNDa9nBsBaxKUdH7RVfr/5V9Eegi1Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw3MHA3xPlwXK5KmLf9u50jeOHI8P1dOMGZRPa5RzuCei18grd
	3daXmRN9XBqDfCSVT6jWX+ovZEVsM5HPBq62kQI7oxrt88CipzK1nbjxFmnOvPk=
X-Gm-Gg: ASbGncvFrqBxNtypbER1iZhcZJuFVdqMuzg00ho3pwqK6OUsJYGoyUS0WXjuU4+7i/3
	rE8cqFySicWh5ezOW5YexvtAx48uv5gs2CLwTsHfRSWTLB7ALS0T2Kud1cdoea7lFzEW8TpdEw/
	n5ar+PEY+qqBbIB48Jv155tGjMO9cXeZiwX8Z/+oz5Fp1ZnM1E2VYfTmSfmuTSCwYubSdaDxcVr
	z1198q13Mp9msf+ED9DuAc/gkM3WT39VfgZOg5rvGTOzCEr1DqtX6Tu5v2PBvB0ALW8fh1nbVEN
	ZD+6zbdjQxQMS8Yr7X8Sd5+4DUIY5fZv5VA+82Bb8NAo22od/ZYEU2XsHbFoSS2hoMxZV1aR710
	8OphF1ecb2b/6VaQcNwrMFacrqJITk4DkPNyOVNlZJIOU0+jiZ+NtfGCn
X-Google-Smtp-Source: AGHT+IFVDfaMfuOXmMfOCltuXID8xfqxstRaUVHZiIEzVJ71LDPZOd47+6G3giv9YW3kXwRnEPBUTA==
X-Received: by 2002:a05:6000:1848:b0:39c:30c9:815 with SMTP id ffacd0b85a97d-3a074e1e7b5mr964843f8f.21.1745568453788;
        Fri, 25 Apr 2025 01:07:33 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:26 +0200
Subject: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

