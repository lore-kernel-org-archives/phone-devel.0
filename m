Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77151917C2
	for <phone-devel@vger.kernel.org>; Fri,  9 Aug 2024 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192457; cv=none; b=cvb8t0LMDJldimNMPIn9PSmkyZ7k9ALbRaURj+xRobURxW0zMyHnlHqWhT1TaOKO5dK3uHLOpYzxQ/XtKb2/uesExfT7QN07PoPhjKzkrUtQ9VkGpWK16b7k1EPy2lvDelI+Gp1ZgqVlEBsIPygVtYCTjPDb9XXGUil7ZogW/EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192457; c=relaxed/simple;
	bh=iQCCZNb15xA7YzIyMpV93MbfBBT7xhwt8+pmmQPh75s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsvGlNEj9Tm5wbLbFxXUVnzjIR+4rIWVXwG9oNpBa2/E5IAVb9RHQl0c9XzZBUYkM7DRkHdvOPpRqIUvy7ozncdhSQoW/3phec+8fFoTomTlJrHGBI9pdokae5ymhuG9cKkVHsVZjWUWjwa2n6R6XtPsLS5zNqS4MFw6/bm2o9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DBvKK0It; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DBvKK0It"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso2317988a12.1
        for <phone-devel@vger.kernel.org>; Fri, 09 Aug 2024 01:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192453; x=1723797253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM2zQn5p3FDpIYaXA2RbE1R8wZYvgZjYLsbkdX740GY=;
        b=DBvKK0ItIeQByCnvUTZlRhEHosMiiyEUGqiWz727zqIuuPr1ttB6QXF/mg0tWmMK2n
         duDvjou8rw+IEDQBZUGRZ4Ryq2bqy2Hr6iCI4zTwJASueJwfMv0ZXByqAgGamOm+Jt/k
         iZhXxwa/JTmBHDbc7Fvv1F72GU/H4w+KALmRAo4Y5KH+PFZB3B9cj8MnW8s4HZmRFesN
         z8wK1SIPagr0DMsZGKq7fff+HNVvmLezy/eJnzv2kZ0Y4Fixoh5lWbGrpHfE3aQranvI
         LFR7Ms4sZrRs2JddMPrVW5lFCOZtP1BSHrrInrkVKKY88NIT2uKKlfhQ9Z44gCOyggKy
         gUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192453; x=1723797253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM2zQn5p3FDpIYaXA2RbE1R8wZYvgZjYLsbkdX740GY=;
        b=l4jS9G4nndwCwG41YZASdOx1XRZY/CGlCQo15kcpu9OAD4SKTJRo30it3IGH8JaXqP
         lP51YTf5PGegnvEVGjNitotcnpsKdtvj+9Uiex6Ev20rBrPtyFyKK7I+FlYVLQpKiBaT
         1fs1+aNNKLLZHVfDXHh/XZaviU+MbYq65+F4z7OW0GDhQwDiRj/IX/LShz9m2ve4v/k3
         9zpGaf9o7tdvj7Iy9buICoW3Vq1Neywl/s30yIj+SrXMi+UnlM20ZsBdvpEDM4GR7O0I
         +P95ikl2nnC0IMHCA4l04qgsY/cABEkcXnrfff8WSKdTebDBcJBYCDLt0B+nWqfYM716
         lmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD84gxjUlpy+3Xv2vZbek7URxdzLAkhC5TwR2xFShyh4i7vlq4z0D3/dT4enRZCkexTcqpo7GQqQ8/qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/tE4olJRXJP0c31CZ5m8toJhu+sdMnpFOwLuAGdb+YYByX/l
	SCGMaiKONs5Ca8eIVbXbMcEi+RNo0ODuCGk9MjVbKWTCZ+tHv/pxRJbRzU7TMtI=
X-Google-Smtp-Source: AGHT+IFCpnNxr3OIcmfuo39c+nNlT21/T85VjYH0R0lGnoZyeMzkVNE10LVLArSs5TAUEYYxuW88qw==
X-Received: by 2002:a05:6402:3548:b0:5a3:b64:3b98 with SMTP id 4fb4d7f45d1cf-5bd0a5a5d44mr558924a12.19.1723192453020;
        Fri, 09 Aug 2024 01:34:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Aug 2024 10:33:58 +0200
Subject: [PATCH 2/3] ASoC: qcom: sc8280xp: Add support for generic QCM6490
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-fp5-dp-sound-v1-2-d7ba2c24f6b9@fairphone.com>
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
In-Reply-To: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
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
X-Mailer: b4 0.14.1

Add compatibles for sound card on Qualcomm QCM6490 boards, e.g.
Fairphone 5 smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 922ecada1cd8..385e902944b3 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -185,6 +185,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
+	{.compatible = "qcom,qcm6490-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{.compatible = "qcom,sm8450-sndcard", "sm8450"},

-- 
2.46.0

