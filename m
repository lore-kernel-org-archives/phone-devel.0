Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813C16FF4F
	for <phone-devel@vger.kernel.org>; Tue, 25 Jun 2024 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327406; cv=none; b=lUEqoYYtqnT7BDmlhIx8iWsfkEYIcoWMqL4weuoxZxxiJZiHsxh8gDuAzVN/FoOANf06RVzfRwqUSLIyt+2+BYV2oDP5JRPruns6FrCh/usu9JsgOsCaRWz6Df/KVU1pGZek4Xa5baL59ZV5zDS66PYSLhXRyLqgegDBuhXWFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327406; c=relaxed/simple;
	bh=02g7vk5T0e5Z8v8ECJYlSOWilAyou2KtRz8Usdht4A4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hBj/K97rTc9GtT2uh4vgNTkj7wHJghqrL50LXlOLSfwVN0z5WCEbST06/YRYqXK08SO4247zw7iDoK8AeYYfjyHhmnfhRw3g7DqZkDFDnatnM5ijne+fqhRyuUKtk0fMuI7osF0Yi7/MbGWS5Wn3RtzN7To/DJFKVWwZJK5MoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jurz5huX; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jurz5huX"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso69368881fa.0
        for <phone-devel@vger.kernel.org>; Tue, 25 Jun 2024 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327403; x=1719932203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoReR8WhxNYuufCEGKkuq94jgMfndxltW+YaaMCsVj4=;
        b=Jurz5huXlVavTgzwnPoRxb1Vdd98CJ+o81snlBedO1GEHXHC4IqIc4FlF1Pqm7t9XK
         nXP/G+69srDmRgHGjZPja5SWx0MYnge4/omm0j1h8YPF41wKhTkUOKZM+AE/022wMhgw
         B+YjwEWFT7BwIEQAN4p5I5GXH3I7/Q/HZxenDXtGG+BogDWaAyeG/rHajDcBl/2EzdAM
         JBPHkOwsq4XWuUks70ZvXa3C//3egqt61yeKNrgWyBnvN+BxvkO7y81D1f8P2UboSroS
         Bv6KYpFjfB5+QZwaod94jiqEdSgTL7tVh/U1TsntUCNo5VR/weCvdvpbvhCkqCqAKrBE
         uPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327403; x=1719932203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoReR8WhxNYuufCEGKkuq94jgMfndxltW+YaaMCsVj4=;
        b=LrD3ssx4t9+zzOvcSKJapiX+vSvJmngROcN1GKdO/YHlyzgHc4JMIuzO6Vy2meusYg
         sCm3gAnexG4PlBs1Z6RqdawiPIp/hFYTiSEx7pipcWnDGdYpAo+m74XFsnizFdP/VBTF
         8v3LJdDENllgd8Tu3Ied27xHNpR71OqmAqwsNM1GXiRRR3PtPo2Qvi448Ohfxq0+cbCY
         NSaeic8y8nHVxWazFXDxqQEZN5MFbZ7Yv5c2Y5lybRntddbKtqrxP0dZ1OZFIrpDNNZ5
         Wkwi+BKzJfDCuKts0oL6W7Vh5qtwYWCx7PyNKOHnVu9/IMiDEq6WvEctpuCJcf6ydnIe
         /6qg==
X-Forwarded-Encrypted: i=1; AJvYcCU8SlNMI/9VYUV+kOm8sGBjwF3ASPzEVC6cjUyPAZ5CMZlHsANb3VQVPehEYR/HD+8QNky4ZCXdLLju1TCym+V6QFpLC7LbHfd1E6s=
X-Gm-Message-State: AOJu0YyUhCbXCyf8f3kKPd+HCsxXKAg2AIvj6OYeOc0y9dxy9+6m0o/9
	stgCzOCtgPRfbga8sh+xDwKpHS/RufvqFfsLR3/ZjW+meK6jTyyskekxw6qNhtE=
X-Google-Smtp-Source: AGHT+IFXgEFFBEekYez/olxWlhZlgktM2joEiS7S4E8YauuUuTtTSsmoGuQvl2CGNP1XEWUsmnVA2Q==
X-Received: by 2002:a05:6512:3c82:b0:52c:dbe6:f5f9 with SMTP id 2adb3069b0e04-52cdf7e6735mr7608853e87.12.1719327401997;
        Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 0/4] MSM8937 MDP/DSI PHY enablement
Date: Tue, 25 Jun 2024 17:56:39 +0300
Message-Id: <171932736812.1437673.1282826360877883479.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 23 Jun 2024 22:30:35 +0200, Barnabás Czémán wrote:
> This patch series adds support for the MDP and DSI PHY as found on the
> MSM8937 platform.
> 
> 

Applied, thanks!

[1/4] dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c94dc5feb494
[2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/13099cb03f98
[3/4] dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/60bdbaaf1220
[4/4] drm/msm/dsi: Add phy configuration for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2df0161959d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
