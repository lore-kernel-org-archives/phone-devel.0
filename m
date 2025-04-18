Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6BF277003
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982042; cv=none; b=AG7pXF73dZnM+UMMAVi7yUcEUuFcsWHqemjvnp212iEp63yksiV/RPnV0WOk3DXWZx975XFVICeyqEAEkEeovgBRCkob3iRTpHxjjUuFcM1Zv79nkW/XsfJBaAKfS775oDeNaCl7KORdwm8gSB/EbO7JcP9BAn68lWapnvforYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982042; c=relaxed/simple;
	bh=wzHHP2feP6wHuqFLANo3CTLOjrw0/TxeFUFRj7B0ILE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dxY0Bb+2UZl9bVp9Z74T37eVpSFeNTO+XfE/31WyQs5xVOsxSESsG3cUgaflOzcgOeqxq5MfE8dGSnHyPkv2nqzCDo2jN5Zgdi3Oeq7RAdfyvS/rsnvC8sGyT5nuphZ5DK9eQi/8bV144JIdhTNo/RVgAoJmODfAoJy4HGzGV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lRXLUmeE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lRXLUmeE"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so2892494a12.0
        for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982039; x=1745586839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seRyYYSYhDxZAINukYkT14l+opP0XSBbrpJYZxHqS48=;
        b=lRXLUmeEL5AQDEvjNFCo7nX20BT818ObDRsW7bNGHHmmn996HXjOSBgMA/gX9/4QXY
         ueNyKPDPQjb96TUsxT6bdpoEMWkoD4REzIe1WonQlqiiX6RbyVKaGJgaw7XGEl2EZNLV
         R+LvQzeUTGfXEo5xY+ehfFIshlJdnYK57PeaOH8OMRIZ8S5IsfwoXGruvPanWVZTXEkG
         hmEi3bdMq8tCr5A7nsHmItE4B+rQj+d/S/NmhfjvoSARqiwtMBRDihgaPPWjJYY8Z3c6
         fAmwRKI5JlEM7tihczRUbWnbPufqngK85hEgSsZXl0MmTiKD12iIu8/JIfDR45q3fKXa
         mUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982039; x=1745586839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seRyYYSYhDxZAINukYkT14l+opP0XSBbrpJYZxHqS48=;
        b=Ta+7DApWyzf/t+ZjyfoIBXPh/6RGEXnDdWrgsy/m76IwMYGrLuBSpiKq3cD6KxgKP2
         GEqvlESuzr8gcc7/4DFTupLo7C/eGueu61GMqVCZC2U7IZoJxsw2Y6jQZy2SXkNNQuoJ
         D+UVNW+E8JYVnPRIqUZtSowpq6UWpumyXRu6kRwdRx04V4+PAybtkM7lSBC7Lit/8rhO
         j5YBOQnbYwmbYRCbRbyyOwLPAKq9e0pAj2q1xOKZBWm+UWeNqYvORU8FJ1RzRAIjAr+n
         2w7BMXUgaTYsycxjTo6SfUmdgs2dS3TBr8hP0fMOcceGAEhCE3nVDNosrhViQ5IfdqVy
         Su2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhTHwwUenydSqL1y3eURsd9PhkJKAJbUBFCdnu3tyz7UJ08jkvUdGzJ6Bn+ImqpA5qr1RapT/n5zDG9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDft6+eJGUx+DaF+Qsz22MDETL0g7IbG2ktljVgJxMKY3eHy2
	LCpZ0GEf9MDBhx0E7s9oxr4n3CPqDjZf8YkOaEFqU+CgOkyhQh+CpcHbZwbMOGE=
X-Gm-Gg: ASbGncvxUFTFCrzVQSoBb/wy+OOhhNXD6vDwYZpE0oimaJFKvAmFu77kFAmKIkN5FtX
	oUndCMYL3I6NQUkt/YFQFVwfr2QkFRK4qm+dCN1Pfj+8eoaIy6WFL47h78aAN8D+eF66fTKiriN
	aHbkZnNCpy9VY3+kJcCQMlljL9wKInOMOwQAcYXd2O/2bJ3sXytxPnXSEEO9SUDtgtFkOdJ60Os
	hWfvOUvmcf25oGZ6OJQ70z9ZCq6diVX3B49xsMlbPIy4e08mQrKqUmzdA/SQNxwUpTFcaliRZPx
	BD0Tjq9ljNW/tzCn2sNKYfElbwM6DW2lSuV04cx+AGusFKeeq1/MspmBL1Eqt69eFNhu2DjHmnI
	D9ijgQZOoXsrIwg==
X-Google-Smtp-Source: AGHT+IGK0w5o/tIazZ37+NXFgqNftZQkULjK7rkiUpRoTJsf3DztGjPOr0fER0jSN21I7Sk2h/cvdA==
X-Received: by 2002:a17:907:7247:b0:acb:1908:6873 with SMTP id a640c23a62f3a-acb74d65b95mr270159466b.48.1744982038650;
        Fri, 18 Apr 2025 06:13:58 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:13:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:42 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-1-05d65f084b05@fairphone.com>
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

Document the bindings for the sound card on Fairphone 5 which uses the
older non-audioreach audio architecture.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c61adfd4b687227038d275f849480a..57f62a228c262f38e703816efdcf443355052619 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.49.0

