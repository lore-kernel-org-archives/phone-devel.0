Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17B0278161
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982046; cv=none; b=rnTctPejWV7VOxY439mHdMwkxyXXmxUgotU53SQykj5SIXl+98+bR/Qqd7nIjIFb+RC5iGcYVr1kR82eQtOjzKkQcEYra2buviNb4uOSr6rXK238ROtqr85wignt7jM7/AFyQcKgJzLGuXP8kzvBxZ5sQEIsCKKwYyJEsWPwrWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982046; c=relaxed/simple;
	bh=m+PMYJAHzPiWvmBUN7s4MjbXhEue3cg4fhj99Fq5amM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBXPSN+8zF80y9jZKbS6CyqsbJy6yDUBo49qayYMuWlNxXAPkff7Y9ORy3DxziCe+97IO0Y4V5oEhWNVQQwHjT9qTCxMO4prvBsCWDJWR1fck42B50YzvUoXerK4EdCL/4jG43yNuJUE74sz2J9TefzN4dkV5IKyxXVlZoJi0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yO989wWw; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yO989wWw"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac289147833so353779166b.2
        for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982043; x=1745586843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCvYbcr7LrU2lgzZsZvyD/7tb6wHoKL1gjL7KsvY9pE=;
        b=yO989wWwaqXWZeANO4cgUBdurOAAhBhva8LIB/3AA0+Jo+/sB53Uf6hbkPjvq38MFS
         XYmEfeW5MBr8xpvXF025xW4ld1DEhVnDDM1/pbDq3sOhetI50ZYISVnuus0KfQM7NoGV
         RA0cwdiUPZEAwfI4E1FRTcOffPqOGC1XdDwWloERpAXwGRqfKDGV/TClbCTjo7pXlfAk
         gadrFufbSHXj+1MvB99P0PmROMvTlYTGmEy/mP5NxbUTHNk429Yt8PZSObOmSZqFzrPk
         nFEqrlRuYuWcwKIQCt+WuSEZnTkfoN3SQGq87gDq0nqwUVzaYHQsI/54C/QVwE1Kr0GY
         T0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982043; x=1745586843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCvYbcr7LrU2lgzZsZvyD/7tb6wHoKL1gjL7KsvY9pE=;
        b=Qq3nhZ2jkv3Js6zkY0e7ngC12OwXBVUe2xHie9JDlIVtR2F/mPK3MkV1HnrymkZhmw
         CREXk7HYLWId+PkzwJDYrP7t0zMXYmri0QyOI2D7u/1D8xziKw3AY0VihVfz4fLZWFze
         CTXGBj0IQzZfIgipY/ITCKNjlIVt8rc93fGOS7sbrJhAn9Tp8+HMvXdL5UCQ9qQcUYsD
         /buJdDxu3hUqwYsMmMuOGP592AsAd6QXbRzsgz0VZiBMxkkT9qE25GvjQIDJW4rg+jlU
         D6PqjObIpBk/rEYVcfjeOz5VQbkJ7KHb4Ny1fexg6HBq5CSf3n4cQbaS6IBtX5fMjmkz
         nRGA==
X-Forwarded-Encrypted: i=1; AJvYcCU2eM8tr9PHmyBV2pYNxeaehde4Sxi1gZDn4681hyowN4OgEkQup79Hc51pTKvLVHIbgfSQPQ/l4bOggQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU1GpTwriwS0DJcjKY0LbyIBjQ1uPgqKIZdOi2rlFUi5BAw4rP
	6VzAhT1Ma4XJmAjEC0jYbnFT92Mf/MQ5Np2tKHB+AXGEfNrHsTK2Q/7Hq3Hyl9A=
X-Gm-Gg: ASbGncszNub/MYA6CXYBN58+VOwqv498qIe8HH0ZZOIKq0PJyVR0dgRPi9aatg+tMxF
	zHPd2nrGv0E+rhmvp4Dm/wMealRHcVNrDENbGOsFZAArzBUlm/x1sCR/V7C2qK3S5R6JgQosJGv
	uW5tFPxGQGvDD0jVWQRWYZkNXWixfc6Dz4r/KNfuVJEx1jnze71xBiNfT8SxQ2lTt8LIQfbWdV4
	LkZJuDiALXvKzQAmcuyh0/Vtg7JPP/VTkOA3yCVlaruOWwASsXfFmffVChdYcDnuRQC+ShDu0I5
	a/7yuEBPbbmF3BRDGWr4p7QEv1jWR74oTXx9GhBEuhtcGF7ssCx8l55dlsPcp/eM70wKFI8m6E7
	VCQOrayagXwzeOw==
X-Google-Smtp-Source: AGHT+IF9i+qy4bQxvdAhaulCC58fLAGLSGbyOONZRqFPtLgJ+j16vp+WVixcc2FWtwJrg/V/6FPSZA==
X-Received: by 2002:a17:907:9712:b0:ac2:7f28:684e with SMTP id a640c23a62f3a-acb74ad7dcemr235285266b.6.1744982042862;
        Fri, 18 Apr 2025 06:14:02 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:14:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:45 +0200
Subject: [PATCH v2 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
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

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a..ec5372e18a9c9bc6a80412adcc5ec473e9730620 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -211,6 +211,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0

