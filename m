Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A48B335091
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975514; cv=none; b=eqrbE9FMiIUIgd/t5ledITVeOkXJh6D4Sg0fae2Bi8WaYNBFXe+48opPSDj1FzwPjITWm6qGnMLLOFA/dRvOaPokMoZGQZxdnDoF4v2lIcglKm1SYD4zVJw0UJO4hiqQ/r3qc1IzljxCnowqUeKRI1FsjtrHFIPFI0LHf+DdYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975514; c=relaxed/simple;
	bh=lv+mkm4sJYT6ajqGepk25l/mtM+wHW7Q1AaYtDuKe4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gpc2D7pAQ/xSgFVtVZAj7+5/FbVfzVWjJGzM/ARsEWHa3wwHZHWcOqfNE5RzL1F3MrHtj900aoOxafRbpCnej8ARUaYdT5diIfVpX6v3ihRANY6CC3KoGwBssJ5y3EUaQP95U5jlB6ir1HNfPr+yIosrOdcUo1aW4hvEx7BBMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5t9qPXR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5t9qPXR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ad135063so47735715e9.0
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777975512; x=1778580312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5OO0966EsEvo3fVE74M/tu/i8lqlenm6UmjL55zrQY=;
        b=V5t9qPXRMGvwKbgREGbRSLmVbsVtUZmFdoeI79Gtb6Bd9A+z/6MeGYVSuboT5K1Pfx
         C8By8Op6L9Xm76Dl+4ag66vYpJa0ze41vzTLWVKi7OzBHc0fXsDVW3unHVKGA/uRGANM
         juATSChf3wfD9fUATao3ThcLT1mICzlQIje32jmVLbbzvyc5HM4I45z+nbAm2Ny3O4wt
         HZj3beBYBVIJsEo6tunJh+gEA50JwIenAZ++V04yxw1lCKgxEW5iq+foFTn/8dqHgolA
         meYsayzxtRjfrvI85NgeDP9qs4Fg6c87g7MTRfuGMPJkzl745YBuEU74jcPOQ2iVofFo
         umHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975512; x=1778580312;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5OO0966EsEvo3fVE74M/tu/i8lqlenm6UmjL55zrQY=;
        b=STyB/eWUY3XzppSF1RebgxJx3ff5UbtjtyeDu9PXq3hLyNsg+p2zwNYuuXPTJV4dsZ
         YZNUiki+NDhRxqunkaQL4uW0pG0+lck+PADjd92+U6/EZ4h5D7feKdMmFnp50rkJaqHd
         B3Z9/q/rOhgNkFtaXUqGL8m5RHIz0siy0hZIcUuepsy10YJSf48QjaqAbmHf7+54Wg8w
         l5zC0BelBM2G8+/oWqXiKdEHQ+pjrTWOPREWfC8srN9awNbRCNBusLqGWdFx4mtC6dSk
         NCPeKKQXmmHUk8gQPgDrdu+LPfqqapejbM5Ckh7BfQTHRHeK0cW57P/z26viF7fMUVPj
         IF1g==
X-Forwarded-Encrypted: i=1; AFNElJ9HFHRWPFYmRvrYyIMtJEnP2IjhckG0XD7MyUmfUYrWooQ+/CBTKRlNWE/cUNQYrg32AIuFlMBtDEvFKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTltSUK43rtTrtz8mwJ3NUYIoKynVFCiUCOPWG5ebIwWJeD/Cc
	UGQWZKAF4gJQOebwy64hvRQ0YQo+tdJKcg+imUc2gziIE2XRdLntSbIulwXl6qNwyJ8=
X-Gm-Gg: AeBDietCsRuj4L+T34m5VVP6OmJTu+vZ//gU7v/OLbI4+0IWfdhJcBw0fop+XBdxGO1
	OtGGQJ4SQysdMi/yEPaSnxpZbAsfBjKNavFcnowDUQVyzHryvx8oTorbsDBtaJVzFOB9IchJa+V
	BPWDKFHsWIVtv2/reoRCh+nuudhJQYR/HfJGHA2zNR+paFHdqfczGiqkQzTfgkIC0phS+BYXWLV
	EKuM/94dw6SE9nr0o7u2EaXJjKrQpn51/X5G+2ut9MF4Eq9soilTS6Z/RIwUkjE181gmAH8cxHA
	LGjM8dP5pHpUjP3hJZG2FX//cKLiZf6dqnNQgxIIDA5h2pFuUqTWTyPsz/JrmVzws2LdHK/emcZ
	cuLkgM6Z5pTD96HbD4Q0LfpSN8WFMtErSgrRLFuVg+fp2fuqQy04L3FHvuiWqZl1y4xgLlr1EaC
	ym66uL+AUSTuLdHD5atjYxPkvKmJeI0u0ZEd24lok2ai5bUc3qDUT/BWY=
X-Received: by 2002:a05:600c:5290:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-48a988c0fd9mr243284795e9.24.1777975511458;
        Tue, 05 May 2026 03:05:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm381856295e9.4.2026.05.05.03.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:05:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
Subject: Re: (subset) [PATCH v5 0/6] Enable new features for flipkart-rimob
Message-Id: <177797550956.290023.16418895983264394741.b4-ty@b4>
Date: Tue, 05 May 2026 12:05:09 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Tue, 31 Mar 2026 11:47:08 +0200, Cristian Cozzolino wrote:
> This series enables a set of miscellaneous features for Billion Capture+
> (a handset using the MSM8953 SoC released in 2017):
> - Panel and GPU
> - Touchscreen
> - WiFi + Bluetooth
> - Hall sensor
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4b494c72555f6249331b16add879c40e920d3f1e
[2/6] drm/panel: Add driver for Novatek NT35532
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7a0dd1b5c55f73b962dfa807e726f7214def6065

-- 
Neil

