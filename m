Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16C367F42
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619740; cv=none; b=DfFut6hJcFKdtg39c3bFHuvf/w0PV2Pk17eP7iydBGRQUPRfuhpZH83fUn34MfARhUHgcZJWwxVdjKYlP/VuusG7XS8E3PzAOQptMVidtcgu54V6KkmvEmO/+XgLkUaGjWb8kaExYrh93/USpDeVt741duZoQ/kViOb6Wuhhmms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619740; c=relaxed/simple;
	bh=Z9bS166QYqGuxxGdDpSdVqzIGY06OJ66UfzmgQnotbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeEs8EGfZ/xtAz3636Bw5Erg1prd5kqWGJie2PTryN+W5cdmVV4S6ablCdMlILdkEgQ/fxcl1Zn77jFVfEvNBjnzdRKkUyWcHqzDlNRQnL3zbXQLIlM+Ih+tYIpsUw5XBrUlBWrfyWqUznztSN0mv+qeHRfoCeVe0ckUikanvLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CiZxJz0+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CiZxJz0+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso13938695e9.1
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 00:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619737; x=1778224537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsX2W4L4Pc+PK+L7HBoqtgzXsJuoR5ute9g48CW5Zxo=;
        b=CiZxJz0+43I2lr87aFzDQpqO1wbMvk4y0PAMyB6d13ywDOpqR7Qn4xmLDv2PCnwKwg
         c4TpgH3UaZCtgVhKEggnhDh9btuWfbZLl6RdAzDo6c8jeUFLLeTPXNIIJ78Bu67fgJ8d
         vqQRWH/AwWs63qEDiYtqcIUXoZSdAHeuwZsd5z7ssp1y9gQxK30O0x+8FrZlYx/6LVpl
         1argW3M38W5268SzUqcjJgcFp6QE0SVgkSejlYTyTyYAjrRKUhWA+wY7MuU661g9uGSB
         5/sByTJfrW3jzSOiYVDY2zdEwFkfn3FdVTL1zcL8j8YoeAHHc/nJ5InktEXlJurTtUn9
         sw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619737; x=1778224537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsX2W4L4Pc+PK+L7HBoqtgzXsJuoR5ute9g48CW5Zxo=;
        b=jwV5ucDxXcH4dnXEjmUzMF0+HD4rJu2DPgefksXHUgsmDxMzK2omRPHCcxr0j2PGzY
         Zy3hvxvbhyr8tMlck3iHQhsr941Q7nv54iZbsmH7N0hiW4l2Nxy7/Z8cFkn+OyknU7m3
         ZfwBrOfZGF/RrfNufNOhGJ2iscfVKgKIkQ1ORk/HM8xzsFDHt/z76p993RTOCea1DrZ1
         zuw9+OlBRtBOQ/rMxOeBytgZqLAV+7AWq4/rSUUMNsabD4AtZpw69GHzDQFAn9pIibmR
         FlSLHV25aOnjur8umhHMqnDYUKHA5ZFIkn41Ycgg/8j0LHAN41sFjOAbPGSO8RVRG94s
         T94A==
X-Forwarded-Encrypted: i=1; AFNElJ+03HwZjBOuMUzP8tvAQYP9ksvBFmRYo3khxNwf4axm4Z4Vh5eGRmEMlulA798fMb8IHV80FiniLOglRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHtv/0uTBRlQleIRDEksfmGXnAfN29Rp/+1PNFLVH/hAubuBL
	V8YJUuO1hzu4Vbd3ZhEtTO/62Co2F3Wxo7Fg8AbiJ+b4qqJ8sSoNiu+2ATvdL6hTPv8=
X-Gm-Gg: AeBDiet7wIS/BfWDzlswe7yMiVrQzYucZSNzlijgi+j20dpdD6WGCown6bkcQ8FyPRJ
	yqRLBeGK06dfNB74aqUBthORz+13E/G2dtsfq7GKna5EJEZPqQhiJuqBq6eWpJazMZmIALRz9Ka
	0Ocpj8k9jNR4sDnt9gSrO0leJip00447QX+Gl5HNaPAw9NUTTu4Aa+Yw8FkKEg7gfIDh2fRPRti
	UxSmtbHi4ftldmq8O9ceL24nTfyrwKYERjDP9TnX/2TUkbEWNC2Ryo9K3j3IGFQ6G59vqW4YJcF
	7OVtSYUKZCnrwLHjlTRfWOYfLfLnKfoWPIx1Et+KC3XrjqJSF/s3uO4LkfrQbNV0XC/mJTsd/yZ
	AVBsEdAcLbiAq9qYtUBHmbrCRtWHH7JZPa97J+0YCT622XnoFed0ithCFMiSsG4MV+LAs6ggW9c
	CQUzBrEEaIEgGGk5YC0QaLxG17hAaGiM5M17H8tbCdGa/kDoekS0j0mK9fnI2C7NLftUHrIdj6t
	rdfcNqZ
X-Received: by 2002:a05:600c:19c9:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-48a844526dcmr98733175e9.18.1777619737268;
        Fri, 01 May 2026 00:15:37 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:49 +0200
Subject: [PATCH v3 7/9] drm/msm: mdss: Add Milos support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-7-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1279;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Z9bS166QYqGuxxGdDpSdVqzIGY06OJ66UfzmgQnotbY=;
 b=JpEHF1l8ODIp8MebnEB3AbFVnv0KVA+IcJJ32Mp5KyhODYhgLLQWK9Ht4vJGZz+QkWSZhhF6T
 yXb6WAD8kMuDqu9cW70IpWCOT1FDTY49lbMcQvuFFZ1fa1WcLUnHuMw
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
2.54.0

