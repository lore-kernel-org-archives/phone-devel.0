Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C85311589
	for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124074; cv=none; b=rAiBYV0BzhpqZOk1OExe1xxf4uN4s0nMOcQxwukz5RDufT1ExbuXF2cqnaEF38gc9muigqpanzLfAbve5t0F9c2jTOGeudHmu5xwYRfYde7WS4/MtrRhbUhUjbouN43Uh/PsrumZrbRfDsVstIT+9l0v7XHBFmLahxSPaZDa+m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124074; c=relaxed/simple;
	bh=CK4ye5gW8ZQIbFQzPoD9lWgtQo2XoUG4XijMpi4CeCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3wrF0rOGifDZnQb/45y4jIi4DdoHOjRtmu7Nc6Ovb9RGG/YOQmpqzy22ppY2PSD+yKtEzC+yJw7bTD35Nf7zk5VUH0aaPJUiFXqgx34ZZw9/5Kko6y+sX3fU7Sud6XIVKut4/IMhzr2uYV2aHEchSa7hkdrCi43aqiR951pL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vWkTnnCx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWkTnnCx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47118259fd8so41107795e9.3
        for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761124070; x=1761728870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1flJABJq76WrUF5m9yiOezJjduWZm513fvxhMdJAqE=;
        b=vWkTnnCxDGCfAS/HR102S0nuMNvpFa6Dy96qaXniOMLn31UI/w2ZA0Ur8BsqJHghXh
         Hbo/lR3O49NQbfQQR9Dcp0txzX6jrXpmSMrmoHZIsjDbbsYC4A/MQtvYJMW8Pv07G8kx
         eMBsSMfGaoyOIXnrqEY1wIzaPFfQIP3aIO4LoLVw2Uqdh4G9x8tRoEXODXP5j0tEh8AK
         tGmEiqM2YFf5fEDW58NX2O+3DnWqr/dNrFI4OoKWGfaM/IYtx/01DcJESJGnfrQTjsuj
         y95avoxVvYDiSolnHWBud9u+fJav3g97IrACeAFWBOB7u7Q/tMy89LauCaRdbijgOA1e
         fVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124070; x=1761728870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1flJABJq76WrUF5m9yiOezJjduWZm513fvxhMdJAqE=;
        b=Y0w4qNEm6nL+D41zh1yXtaFR9v94rfRy4iRYDZIifsej+dOjJnQDN3GLu++/ue7/9n
         cBPQd82BCa3ec23YJEnyqtZ7XUW1UqTSWEFkSvShPuJoyrc2TS4oa2/IKPdEQ5Hk1jeg
         jfm+MSrRAjpC/RSckhLzonWK3L57YAYzbuDtguOTGV96SnzlVv18i7Gy8/gpzl0HgQnJ
         RvB+AIv3ni5HcelpsMC+goZq+MmnVQprcEB3Fc6CxTxkt7PUBcM0SyN3G1/X8c5VIub9
         JjB8lL8O1ikxFPTDd6WSRaxnZaWVdpVZDQeZ0XlDEYdtHu72vXYP05WlW2gub6e6AXWY
         D1cA==
X-Forwarded-Encrypted: i=1; AJvYcCWaXJGvFnXuc4+u2OyS7Jf1Dk499jHQk8dzmHN6di9d9A59+hElhXPwxm/EQPh2Y+Ekjv1jb1u7gGTuHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMdFXPVdw6G7lKBDaqOZaLj7K4Oii0/0oiHJmqlxBwnIHYICLk
	KRWY5GNUI0xJGuQTwVGkhceVk9ZGs/NgdgYnnOLJoIL+UicTF8EUPKtL7Wv9BwD3B+g=
X-Gm-Gg: ASbGnctmQeQ6E9wH8MCwhh+sfIkvTjIMpSH2M0KkoZR6djYi5uFECeD8QN61KocQXmj
	Bbb0QC1mQFKcyKX+fEOSrDLjsQo9pVMVS4Odq9GDKDeGM2sypYVgQqaBzXS37gQWwZ5oZVtM4af
	X2Tp4Wonpr0Gjx/poCvh4Mr4jB3zZbJbwbAZX0ajTUH3HWYuKY6sGEhQk8XX7x0uV0jKEZDeliF
	epjDMVLZG3TvtFKErBz8NSq/0Uk62bEGJIBZQRBDGlaw9dfEKydIqJoRUSd3+4tiICbo9KoUIAc
	d1jooCnqscscgXjrmsyjqvOHwceQh3O82/Xne744l9NiY1CQtS5LgaA2qbDJWIeQJGnVVFT9Je7
	lTO1NNBFZZDilXMuROYvMt3NmC5CesVpifl+metmiH79XPucbomSym0lyo2HOg+81i8q4xWev
X-Google-Smtp-Source: AGHT+IGFFlqpwATAAZ2BKrCrVb9D7HfZ5rwLRuh4BV5B0Yi0YMlAwBYfX4e0exoRZ0JufSPaMzAqQw==
X-Received: by 2002:a05:600c:3513:b0:471:1415:b545 with SMTP id 5b1f17b1804b1-4711786d625mr156848555e9.7.1761124069502;
        Wed, 22 Oct 2025 02:07:49 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428a16bsm38447755e9.5.2025.10.22.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:07:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:07:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
Message-ID: <5j7dxbp6biaweup6k2gizbx2g5cf5kzf34jx7mhukrcto7mkz6@3azkzkr7bioc>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>

On 25-10-21 20:08:54, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.
> 
> Fix the config so that the PLL is configured correctly, and fixes
> CAMCC_MCLK* being stuck off.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
