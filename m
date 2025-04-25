Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFB4248867
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583193; cv=none; b=UDKUpxt6ypMI8R2RgY5vMZPAbtRRO8boAoQudxFaQqGAZiWwzEchmr0aaI4HfZ/CAOy21J2o6lRWVbdCRk69sYdsgjFbrIsdZ3mdmt+0du+VYeKjuGrvFJfyE45mJaxqAlNv26e5rm3b3FDXp4R8la8FMThWm1SZ6GGENx5Gra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583193; c=relaxed/simple;
	bh=5Sgz96HXWiPE521VgZZk6wufk7wy1Sa4KmD8mFjEnEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LYphjrQZewDAjs3/P3cdw5aCUEkoAIXIAR2/9/Itfq1bv9xBKxh5VXm4sI59rmwmTApeCSPTHUB2SqzXh9C9k6e2xWj0s+KAPZSNo3NBZ5xnGf1DQiA+x4NAmh7TB7uZDOprqeADPXZL9PnyMODzrhnXVsdumihfQBWwsH8HtI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pBDWhVdw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pBDWhVdw"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1613315f8f.2
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583190; x=1746187990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkenvBJAYSjNxPpsRyZb25skaBdyNzOYdvt1oK1G68U=;
        b=pBDWhVdwVLVcgqYCU09ddrTmOFlTcPKxUthqleICAMn2Oc98gay3r1kWT0tqMRxOBb
         e1v9txkoGLVnWzuZqTvHF9CUSiSafi4TJJ87aBn0j8sLwxx3eeHyRDAEyqLgpJ6B9Uw5
         e7y1O5Uw0/g903cXREhAxEsN+RVaOpOeUTA1qKM+Nc429ZpEvDr45140EastVxZycIDS
         cDIhFyuLXyouo9Dp/R93zpdHnN3vvx6zHKbGLvE+noOCLahuYTl7hl7Qs45NPJK7KlNZ
         EW4+4NofVThpiVASh0X32G+t/hk/nsEsixvRNJcoGA4x5cOIZ5H+RMBZNNi39u8Cp+jy
         ENPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583190; x=1746187990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkenvBJAYSjNxPpsRyZb25skaBdyNzOYdvt1oK1G68U=;
        b=q2OCVeq2XnCllU9g8+EfqrOsAGjzDnR/R6l+qfUazHi9yFgGFgD54nC7u6Y+7Hunkr
         tKYVP7SIQcIdReCddl6N/+QKHURNmHLlfijw8HLsARWIjMbmwsvbiQWUWp4hZ4LxRzi4
         KOc+ObZDzVdokKHfZJTKBIyIDnVwyJ5r7WpUFomi2gSzJvQ6m3eQQUIp0ceCugPwMnXH
         /v+bfI24mft4mSbaX9tamN+zRLwa+W2ACfsF/O15CqWbFvmeGURPf45Zww56hnSfN4c7
         9BpqTIyydGVVCheqzSSozWM5tSbwfHM1Dx+P6k9rj7k/HXZCARFYxkl0vXgSyOgH0MUr
         4fVg==
X-Forwarded-Encrypted: i=1; AJvYcCV5y7t89mI5pGlZvpa0L9leAhGb3ndRytqWS7XOdknFHBTkWCY1Beh9bORH7aqtjfQ3jfWFOT0r9ovVWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxVUmc770o+z2WLWbOlj47mwyUi4HohNchTfx7qFkESX9CwXx
	TBLVTbpk4dUJlWeOQztbrbUDBS9YKf0NNJwrYn0P3Xw2QuXWcANYPe6Wl2qJMwo=
X-Gm-Gg: ASbGncv2lVUa79ofOawRrCZrKSkgTm9ktI+9PWWERKRPYntohScW+FotmriWy4YwrX6
	dk4CjfDcOFXled6JQU/QvXX+1/p5DcVId5gUnNyHK556ed1aO22B55ObVJuI0FiK1VgrjppSVon
	SrAQWMTpNfsJghk/yBOmMuzKwwqko9fQ2zzhNT9poo69Qox/PkqGJQh+70pam4ZVpg8aMKJwm6q
	kigWSzkHWEalDSNGGaGIOemQ5lbBM82oEICB5h/J33PsXjqawOoeTwnTDy/w12JJklgB9jtq70P
	kZKeS5vj4zgMT71K9F64Ng1IyWilo2M4LBWchIc30sTMkY9+D6dw+u4ZeQKci3cuT4gcvv3yS1z
	VaGqRekYhsB7Wc+8U0jWXXJO0/yHO0fXQFs2fbk3AaUnm8+dC6ibqLAK7Qx6J9CFcgcI=
X-Google-Smtp-Source: AGHT+IE1MUEZ+wY7kq2dy7WUq8KFQHakKlZlBrL11IN8KwUQF/X9OnZvlk7i/MahfxdsbRyMwkcNsg==
X-Received: by 2002:a05:6000:1848:b0:39f:e37:1733 with SMTP id ffacd0b85a97d-3a074e10474mr1586199f8f.2.1745583189752;
        Fri, 25 Apr 2025 05:13:09 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:56 +0200
Subject: [PATCH 2/4] clk: qcom: dispcc-sm6350: Add *_wait_val values for
 GDSCs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used.

Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/dispcc-sm6350.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index e703ecf00e440473156f707498f23cde53fb7e22..b0bd163a449ccd2b27751e32eb17a982facf07d8 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -681,6 +681,9 @@ static struct clk_branch disp_cc_xo_clk = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x1004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},

-- 
2.49.0

