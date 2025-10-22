Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F8330F54C
	for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124124; cv=none; b=VJRzWRm643B5IFysmjrDHvAtu4fTShQ0wjlF7o87nWldYTtZK/JLE3nnrUnCa5Y3Mp14ZXJgbCjB1x6b4ylm+deoR9H3Hbn6jru5zc57eEi/rPBREG5CqAPN3cPcYpLDbZKZF8mus/kIB+HxWPNf6zNUcVEYPDEJLgXHt4osBA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124124; c=relaxed/simple;
	bh=XwI9/Pg63nWAOQs+Pbg1hKzGVpozCmZVIXWuKjVsO8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lf6NmrbhJqHqod5V3r2e1vTAvkgwE0skZ5hdtc/18PrNwDMp4LO+/3jnwX9sWj4SOCaDWUHy4pmjU2daGrFwJdB3U3HO6pJRybGOQQtAU8F8jxT3rAyUIaREV6lwO824iE/mI1Twob9WSZMehOUqCBBQypZGkHHDPpD7iMEx2VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfxh77TH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfxh77TH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece1102998so5418343f8f.2
        for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 02:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761124121; x=1761728921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IR6lsN0D+gAwku4dXN7wcI1QUBm99dnHT8qukWlDAjc=;
        b=nfxh77TH912Iy0/iwkOvfi7hks1JLS3L4Nngiy2zLqQ2uIL+gUqvJii9d0WlE5udQj
         kTPdsMRlUw8B8//+JrSmGKOfxvtby8KrqdIszPfT1WkSLOhoR3i7KxeNwnr4o/E1ri7y
         SMrYLKNj6MuaZSGlfdVbCBl5fRt30LfS6CcNoliYKj5FLXlzIzQrjshRy9p1ef3YCLRB
         ZQ2FtGc7Ovrb4QdSkOcXA+YaX6NwVFbVFGQXFy+d4iDDRPhpT0kMz19LI/lgCvd2t0lQ
         tfUgNDS/IZnF9fDM1aJhFuq/xTqX70MGSy5Cczc4niZtbWWBvTPuFULYBsWskZeUvXsK
         mShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124121; x=1761728921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR6lsN0D+gAwku4dXN7wcI1QUBm99dnHT8qukWlDAjc=;
        b=dsqH3eGENtxpioyztr1Hy1HpJQwBvlHiTplpHi84RqnIZBAMci/pVQYLgGqA76CuEk
         UDdgwkXCAdqFscAee3HTVHicCRv3WmAtIPe+QM27nKpT3HgCVaLRptGek9kc7c7REI3b
         JLSFCxhaZuZWFE5L3yaUkun3MVrkalb7C5JB+AY9s9sgwUo9ArV2gQNHs+2V6h7Bj1eb
         tpe45XBYnUmpO62bl1XNTT/pYRjVtOZel7pFlZy4p7uego3n1Ahot26z28c8w81s4Y7/
         WVrSNdsXusDyHwzdYPQSjkQ8ZL9uuXQYTRDcJW6eOkmimLiwA0f2I4PwX10kAybhUUMl
         gSkA==
X-Forwarded-Encrypted: i=1; AJvYcCWYEAdQbo4khPt78GLb80XflDpmBtV3QAPQeZtpIHej0znRS34LbGk6b9qLiN67bueXVObe63VE7zfJwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ+MRQJwhbC7utG9zTSfD5jo6etZ6Ec1nvzVidfojppOc1znHh
	kjwHob8CTzwp2iyAC8bvuZf4qcahSynsq/GrRcJjLZifB3NHeWZrw1/VeR+IH85YmtE=
X-Gm-Gg: ASbGncuPctloIs1cU1WZxStyDPcnm4/cOg6pKw/C1ompNYA3laterYUiKSat2MF/i1g
	6cQ8uxvb89x18FyKI8V+AiTbq9mxAO2azNSuUvhIIBfi6DGYp67KimQPuv0qyA6HSxRbpabbmuS
	PmLkhomzQeHn8DbRGRFieq2yGAnNlOKRoor6e36/+iG47JYipFVUqmBfFTgr+u8W5yXUeGkplu0
	usze+LTLK4SBIpxVu+G5iOIkygqd92Xat3FFbxXS/LmRQRtOKYWqseURzI/qRGqqyko9abamN/t
	7IgZMgxfzbTL1v7mOSW/As/5DtkVwS/KwmybR97vm6LtzPfCijd9M7mbyQtWrE4Ff7qOba4V+HA
	YtlZvcBqYHoomoWzv7HMwniFYLRB1Wg4YeTRDjlRGXVA1HdX5oEtxoF0J0xEJbA2kLK6OlEcUuE
	KPkXYwzsE=
X-Google-Smtp-Source: AGHT+IHvJFt8VlT5VCY364CrT9cw9v3O1vNM7YyvBOJIGj4xhlggMfEoG6gw4R5G2QRkCeX2sxlT0w==
X-Received: by 2002:a05:6000:1a86:b0:427:8c85:a4b0 with SMTP id ffacd0b85a97d-4278c85aad2mr11780759f8f.56.1761124121045;
        Wed, 22 Oct 2025 02:08:41 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a7dasm26488612f8f.25.2025.10.22.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:08:40 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:08:38 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: camcc-sm7150: Fix PLL config of PLL2
Message-ID: <rkp7dol23li6zdqaz2jzbkjntmc57lxmvxve2kc4ljh7gbu4k6@73v5d3mjsu6r>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>

On 25-10-21 20:08:55, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.
> 
> Fix the config so that the PLL is configured correctly.
> 
> Fixes: 9f0532da4226 ("clk: qcom: Add Camera Clock Controller driver for SM7150")
> Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
