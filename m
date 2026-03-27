Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A7347FF8
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627962; cv=none; b=DF5AkiIH+zd/PeAPtcqLZ53CXh45G11y3seI5j1lVaEi5E3V3QsoWihlxYamRlOSQ1CnQfg9CZJtPVWdV7JKXdeEx9Nsyr1VO7uadC/A+Y8MmqpejQdGYi1M8YIKsajxzPUCIdcURzZ+bQNbmjRBARYe+C7dRcB59h+AV5vLsNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627962; c=relaxed/simple;
	bh=toygxQND4Dvsy39S8g07OI0f5dr6V9bZ0QRD2HmiADE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0PWwKxZ9Vbk+BWQcubRNcFkRpBtOk4OBm5Fagod/H9mYvt6QAhXgiFckRP1dJeZ9Id49a94BFkSP20LSGbRRYFGuhxYENBiqfPCd3DSqBJhLMsNcGmO2iHIIrhHoV0VI0fPBGdzQvSHeCa8wRsLHU+1EiqV1NEO8sKL2LXMfgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3cHS9G2L; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3cHS9G2L"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8d7f22d405so377044166b.0
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627959; x=1775232759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCn+lBmcgEXVlegTG5stGMNFyfFJRP/RG0o4ix+DR90=;
        b=3cHS9G2LqzlmXga/sudQKfvId8kdyE2BoH7vpwO9/aSmOBLhz9b1Nu69x0/zZ0vJQp
         0ZFZwCo3GrEHvr/FkT+KH3E5V5l4uQJQLjdNAHjg+tSdQC+CyeTYZDuFkhd9758IH4Ov
         AnwlbLPbezSXCr4OVDSCFKEWXoXutQwvS4qyf/UgQhyUzBZZsFN2/Qn9ldeUuLwK8CcL
         T5f400Mg8q0ZGzsHKGLK69nOgwAGLbhv4ypu4Z2CJN/0pUqGhU3xqhoBR+88VANypt5L
         u7JKO6Z4IJBwt8VdXDcOSFHKuo4MYRtMJMAvM//8qM6juyKECiHm4JacLkfhj4LNwesY
         d7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627959; x=1775232759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lCn+lBmcgEXVlegTG5stGMNFyfFJRP/RG0o4ix+DR90=;
        b=mchmXelIpm7PZXHrpyLygmQg9l68GMynovcyVkwYnn6CzyunX/xEXpo705TnnhyLiX
         x0GmS1hjPxqyw/KzVGifNGTaKGmtD2Xu8yFmjY9IOFoF4zcKkWqXgkJDnv+TNMNxRaV1
         k+NHrIamRlV9r0oV5av6Jc5lK03aJDtPoT/oMlIkBVt0xjTgafJeKEUVRwnd3ep/ytY4
         BZlmeSpbI5O5ys35h70fPoepfxhmO+9hLV7P83BW/6CgDxu1B47TYU5/s5mBBDLmXQIt
         uBLEPYgCGBY98n2AvRJfKQF+4DlN2kVNQnu/03QiRafFAoB4q3RBBvncR6Bw3ZVq3pmL
         nXPA==
X-Forwarded-Encrypted: i=1; AJvYcCXisYEqmkq9KAwlIxfJMyQLh8HI/PmsVcYEw8b3nsoolW4FOvuiSNFD0udKIM3l+w4gObUvweKDoZxE8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxdHqwg15Y6qmm4oJtpwVHIaERhb03H20e4fkQjIHESf8AgR3
	IzopNxtlANFyL00B9xMxmpIZcFtZHF7MRVNMUwQtfDJMvJ9ymTmZD2BstL3T3e+SB40=
X-Gm-Gg: ATEYQzzOZ7Nl2Q7CMZFuns404EjjDxxBkOEdQ9DP7Vy1c3BJAVsW8SHZsneLnxIRiKf
	bT5XFZqTSCiRr3VgTLYiO+NGlwv2Iw0Ho2EuDGaqGBTwUD4Ip8sj6M8XliSvftAkpM651Ik333s
	vPi+CSF8NKM6Pc6L4NQGiWvvgyaC9TLG1bU8XeH3Ry8avOyp3Sk0mxHG75CCiqXvPCrDOogcka9
	0+o4VUDNVfaKkEV4NgXGxSrzrtgk/FGHfHleneAZ+8fgAJT8NVZmSI25Mk3EjhCwBta/8Q22/lT
	wNrpQ7LU2vDHtJB8B8fLIl5M3SpBY54MQ8CmXo0ym7JH4553BSiApJmq6UTNcVPI3qkz3RLRtyM
	ArfiQjM9nRs9SBlxevVAfVJiFeYDByjzYSJENjw8VrsIlEz2gx7jargubi3/tAElwrIqXdaIeQ8
	NIxp+wyszSjuR0fy6YIyiZmFXXr+wBNN+PGb2LIgWDdQjcDpNO8yXOx0CkKtmtswMsXCxhlsNif
	n4K8A==
X-Received: by 2002:a17:906:4795:b0:b97:2a5:8a48 with SMTP id a640c23a62f3a-b9b507b0eb8mr213828466b.37.1774627958502;
        Fri, 27 Mar 2026 09:12:38 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:26 +0100
Subject: [PATCH v2 7/9] drm/msm: mdss: Add Milos support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-7-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1279;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=toygxQND4Dvsy39S8g07OI0f5dr6V9bZ0QRD2HmiADE=;
 b=MTo0qnVzdsDxWJw6LPXjTeAFhO1XjHbxDt9eTdhNKswtYL3oWLKUwMh414oCixoltSCdD3INv
 Ta4gVCK2Mt8Cy4DLoMIVZZLGJiG+ZtoSJ01hm9y9sRRduDaP2HNEDo9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for MDSS on Milos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 90c3fa0681a0..754ceef38717 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -550,6 +550,10 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
+static const struct msm_mdss_data data_14k = {
+	.reg_bus_bw = 14000,
+};
+
 static const struct msm_mdss_data data_57k = {
 	.reg_bus_bw = 57000,
 };
@@ -571,6 +575,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,eliza-mdss", .data = &data_57k },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
+	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },

-- 
2.53.0

