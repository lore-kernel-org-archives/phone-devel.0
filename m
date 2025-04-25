Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC024A063
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577989; cv=none; b=qk8pk8KQ72NRDBOLzjjUjE49EGUPOqOMfFsbxNQAzDmTgXZNnMi0dT9znbnpyFIuLi6yCjrXTRTLcgSTVigm/VVktNyMCkD9xibjIKX3SR5b76S6wjms8rGNQU/S+9w/N+TVXb1oWgcNLgQ4Du0Md2EZFFBznmVxburDyEuruGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577989; c=relaxed/simple;
	bh=RHZ+nVQR4jYnFcM+6sz6/jx39wA7buQUvA89B+ozHbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAbqhSOeov8CDwH1cyboEyy4kDkmaUzhdStPIQEmLTL2ItuhtK00bzzYHQKxBYX/ZN4kq1vmrLkBA+o6jK1ckpDZ11xKN4FWCU8slHPoh5aNeMyNfll1MntbI3sn+V3NZDiPPDTbC1YQgeRaAmKKAKVSyFGBcd7eLYUSEv4LR9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mrudBh0s; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mrudBh0s"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3b12e8518so374062066b.0
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577985; x=1746182785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75uO0qnYhcwp/9Ctw5vuVScHSNK7KyN/uUVAzxbVZk0=;
        b=mrudBh0sff7oKJ0LpIKCnqAWZuJl10v1fkjVnQ4/C/5WNlTsZiR7+zLL7Dvqrh4yXz
         mB/s+RNKjRySQN9FrGONStrVkBzw4g54yhgLRlmxjwP1vZ/VyYWd8Th0qxZjB6ZvnWHr
         Bh1+JDX1f1diYAS+D3GZ8kRj0YBkllFJmUqZazlwUzJgrtPygcjoKeMnwaOQSiGKo5mM
         Ynmn5hvyc67wVOuzN9N3k4JuaWHY5YskKsav4O8m4+3k3UlM5XeVJq1lMaFofJ68ef++
         OUOJgZoS5y99zPwLLH2KMx1TXoulKbpIDefwteXMohkkqdS8pqazsLmj+ZKYLoLYcLz4
         o01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577985; x=1746182785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75uO0qnYhcwp/9Ctw5vuVScHSNK7KyN/uUVAzxbVZk0=;
        b=xEIdcBFKkPquornu2mOzF61iaYBvKSslLoa1HMvYmtVvRIzOxD85LXH8pVxt4QW8l8
         C5wzYn9yeUC2WMXdvwy4mXF6f0IIthrHD14XLiS035uq0XxOLyRJFgWgLEWAla0qrKNu
         SBoB0CqAcmIMAhTPM4Iu8o3NkNFkqooxjm0KJFQ4ZKZ/eiceD//A2K5ud8syNIEZJ/vs
         hWs2xC7eadlyI1f8zChg4p9mXWRDFiEDrwFnVBlM+jLZkLC76ZMRpIlQWwPsjqrbEDNB
         wJseNN1eFnzn55GzCbzrKWlLSNJT/pBvMkD2Av/AEIcj2kXXrfKrE8/e52n8xI+bbS3s
         yZNg==
X-Forwarded-Encrypted: i=1; AJvYcCUw9indoKTST9g1WhxDf46n7z1e086jlhMBdVg6O5Qb7vgxgdIX0837rac/ogkcypPUxSoyox8wf1+Ssg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkh6ATVJJBWbswSVUkfbPjXy93DzMV9i/81Wjc9PyI9mwAnKk
	G3obgefG6OzQWPZNS9k7ALZEDZgafK8IFmN7Qi7+g5YZrE6uvp377GWVU6ZOXTQ=
X-Gm-Gg: ASbGncuuoj8XxFH3dv9A+yXpTLJIe4FuiRdOZNX41uhVb0U8cYAuaPq8Qh9CR8zdM1G
	WbqwtljxZEKDzUvtg8k/LSsbWn5goPYmEDn/1b8oMHqymXlnnjOHXDfKDssoIvRfhMuExE6FJxW
	z67sGGo8E9EmXAB0ydfqgdn1GCymBZ73yogXFKBbml0L4O1Ff7Zd5raXs/9SB0kGYS+8n2FKF55
	zSIVhWr0CpYlao3WBDlIma3W8HVAiDcd1M4wrAe/7u2gOWdoR7dBNDas4BMA5ziZnYSh1hfNa1P
	XGeW3R/e4kbpPix66O/mGQ073N6q/MIs4BwntMgKXoOg5lneVObIO0neJzNOM7ARoNk8fB5SCz5
	HOkCk+7jOND2P9a01MwvUyzLCIRr3iAAyX15nWo7v30WFCyX1Z6Zf4c0g
X-Google-Smtp-Source: AGHT+IHVMEndxh0XKCZm79DiwrttbUOJ0EeVVGzRFO8YMZeacxUM0z2X0Q0OP58ATSu1eJXn4Hqq4A==
X-Received: by 2002:a17:906:6a0a:b0:ac7:9712:d11a with SMTP id a640c23a62f3a-ace710f03e9mr179888566b.32.1745577985179;
        Fri, 25 Apr 2025 03:46:25 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:54 +0200
Subject: [PATCH 4/6] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a compatible for the SM7225-based Fairphone 4 which can use this
machine driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 43c93e24d77259f232062c7e4182a39151111c59..0025c8957abddf54d0aab6eb68acc79f031917f9 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },

-- 
2.49.0

