Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88B23498F
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568460; cv=none; b=UbaeaBHN2MBV3itclQmeuPHW3ZEgHPSh1b6C1tNy17Cd7rvYS1j05VK0d5rabdxRyO4O48+BF14EzeEnpAwM76coqBNgsMv7my6wUGD9aSCMKnCrsW2mrj4PjLES5IQSNI2SmVdZBIY/RCvt72MTnyv5ySzDEyddRcVCpDPd2n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568460; c=relaxed/simple;
	bh=b8O4l3RSvg0fy+NWpm7X0oPQjhPePwQH1mA0z4k72Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1dqIKBxwULZdXCGT24FD+1MjNnbf4GpPoKh489tSVui4T4xtWTvsEdvNzbWiQyaBa4I9t/3uh07BWmYxNaG7vvjbxNx3nXScvNjVpvT2DUMNmreNo9jTUnBOxnEYQKzg5dfQXu3boAl6RIhR1zI9YEJG+7fmaY9I9ncsi3vi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cnlLabIh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cnlLabIh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so18090915e9.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568456; x=1746173256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WC8RFGmD1RHEB436RAA/xlbqbziPuzDw03yfjSeC4YY=;
        b=cnlLabIh5/IN79utqTu4xLOQGjhG1zVzD5iUunpEnChrCkS54opeJ5MNLkc3XVogUZ
         wolNa2kY1IrJlamFaKgMY8/+liPY4lE0njbAqTbydpBx+YcGqEYAYRr4ov4sQAe5uy/J
         A1egddJMEov0RBiuCVZlsrKv3sqWU58bQIK7VA3j9ydRcifxZcnR1gUX13iR+L5j1zOG
         0VWkA1fG04JwsK8djGuOODcPqHVPmVtJ9oJR7a0oAWlatplvwIF4ACCJBcFLIOqL3rnC
         wQ1NlA/rc/0LOjxRZvMX2muPab6xyE+5P9cjOVdSY5R2lLcvmUdd7VKTv495A9vLVNak
         J68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568456; x=1746173256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC8RFGmD1RHEB436RAA/xlbqbziPuzDw03yfjSeC4YY=;
        b=xPvokkQynVJJ3YZneCigJg3P8hX64mxYQA0F6oO8JYXT8Gv6v8G3vtFg+ovkarMXvu
         uayIJKmZOrYHurpMbL07fEl6vmzxvMTXw9R+mjbkIJchp+tamtruvWH5nwModyMtb2dl
         HdwokaT+LmiaU7qVtjT6zemMUDd8d2V4Ip6Dfho0oGYYLTMneKS3J8JnLdU/dsgicnQt
         Nl+/zL+sByKdMc6wGzkQrSTKunNDPNWPqWv2/1iuS2dHa7v0Fad92KOR+sGrbzfOnG1Y
         4VyZulx9SIHqxnNE35OZX8Up2s+M6y2TJDFqVu6LdEay8/6483Esb/USTwKusf1MxWPM
         6t9w==
X-Forwarded-Encrypted: i=1; AJvYcCUHzOGBQGkoQf+i8XI+x4UNM9JRcuWK293HPiA+FZtEcLxthfXop8w3b0jo9EgJCpgn35CDFBZKi2x+qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB4pIDxz8B43iFTRttbQoDUvK+bh/VXtXem015nwnyUGoDVGTd
	d1TKiZXRFddsCBky6Cfrp8Hta3GA5dQkbtYPc2YeuCf01h9T5GI0aYylGP+l2ag=
X-Gm-Gg: ASbGncuVrb4HN1H+nLyO2wvKE80tISzKEdbyhRoXF+FXSMpjO5FfG1h5a1BKRel4DBV
	Ne6R+7j/rC6Qk/XMrCoOvGtvAXGNDMETkhot8hKVUgTdQ4d89oFVRPRLWd+McW6MlW9nOxi3OMQ
	iUkzau3btgs/E/ZlnFmEdd4Gohr44UVlRFWBaTa4CJSSu4fcY/RozAPXIizjUHyW40xAFoscJBM
	s6IVU4XUfpEJt7E91JIOWC5WVjB/3FEkae7mwrv8Ow75k2eSzAlMtYZt5ARGSGCjZ5sFNHoDuJV
	GMp4YHsTZEckC4RJ2Z6ZTns9j37AjEoZjgnEjmSKilvOtFdxIS0AGI9aZPfq0wHEF4bTGZE7PaY
	h17p/srH98QXc1xwA0ImRVhQYcp07uyx5ednbkNUQSnOgrKHFOUB0JVpd
X-Google-Smtp-Source: AGHT+IHnGU5E9kdTmOEv3J8nz+wIEIG5a+AbZeoA5daYiMBxcw7FiKXP7Z+blV7YWaSaCVLY5aXfcg==
X-Received: by 2002:a05:600c:4e88:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-440a66ab7femr10627065e9.30.1745568456199;
        Fri, 25 Apr 2025 01:07:36 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:28 +0200
Subject: [PATCH v3 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-4-7cb45180091b@fairphone.com>
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

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a4bf6eff811ea3e2b005071cf3410e5a0410f5d8..43c93e24d77259f232062c7e4182a39151111c59 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0

