Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A203E638C
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839413; cv=none; b=dq2Fwm80+j2Tt2dy7IaeRRQIRWj7stujAmm0JueOOmja0N/P8OE/SiBHFYwhdLpF0EMSLXHp3ELJQvjKta37kE2e4FTBVWwi5X/7vRhWiTXzsMwmkRNObRy3iUwclnufayPGghzaH+P6UFxZSwBh4XBqCcaRgu6tcfEU8Av+5Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839413; c=relaxed/simple;
	bh=aYk715nl6+8kYbgjKWSg4YhfpDONym9S+gEFDi4xdos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRwwcpgVQSQZTSjBOs1m3vY20HDdynhom0RgEI6dl1BPhJVuYzyQmvPFAJ5v5j2WGjFWEt5+s8tOWaVafBBZDTMEFmXUZ/IGJIYGd1EkViU66xvcIPjM8KTn96dAfwGRT2mnhIXpehDa5ha+A3iglplV22KgrESdrzKa+fBemks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GARs+Lte; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GARs+Lte"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso79484665e9.3
        for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 03:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778839410; x=1779444210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVuoueab5Xq5CfW5uFSzOMqQqitlxOrW9pFKGekv6HY=;
        b=GARs+LteYsxvIF6xRzAqywZY77hif8vaduDA0o8g4lma3UxukoYipMx29kgaPsV0+h
         c4mDYpJ4K0yYmEzan+lbmevyg/SbXB8Da9H0Q0VFOoPgPvXQzt/gLvOAaVbFtkqd1GlQ
         7sEGv3ERJJJxThVvauh9sHBIv+79KgMb1NoIB3w33fO3ZsaMtpEa6mcpi2UyawfVul27
         twaECrr2BmJKPgPq5Ewg7/UafBA3bF6H8BMKjCccyJf5KwZo3K4vy2nVeTbYc5/GmS2D
         aqn39hiEjll1lDYNWo9tWEk0mVCalBVh5ijdH/Mj8PVVWfL1UGFj7HEVZpvOOMZVJo13
         0mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778839410; x=1779444210;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVuoueab5Xq5CfW5uFSzOMqQqitlxOrW9pFKGekv6HY=;
        b=MgcNAVg0HU5/7EqvrtwDChJ8mtoqPTicDS77Pr3Yueq4ey8Wl9u0DVTsPVdTkb+M08
         IrGnzm00BBPwaxFcwBQ+H+olaZz9YithiPCuFcNL+Wht+vg+z807tz2Uly6h6p1SWVmU
         rMvMPju47iQoc+BsNRUbtbXv971IqRKmW/Yp68Sb60RAaRPg9PEVnmahIAUorXElVYZV
         PiC66maHYOKj+BYGefU7yzjxxzJ2hwYSqkfyOBtMBTCtw2AoRZIZZHQQC0CE55nsCS1b
         k05nwqX8O4PDdCZK30JctR5cBlDHdzlhm0+sDVXnmX7dMmYhtrDRsp0RS/BjtOIKRIzZ
         DDQg==
X-Forwarded-Encrypted: i=1; AFNElJ8upgaDQa/IXkQha0fu/DnfYAguW8aOrB2inVYWt0GRU95GPfnf0Ttcgofrew8ZAFV+8A83fIUZazxI1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvNIdCL4rncXBVqC4J1y5Kgtjc5HHTVxWzpUEz6zqUPFVufqD
	ezIPWMvQFejh1mymY+cp4/ljjdKPBuL0gvbK1in4fp+txhDdcw+4EI7clzGw57rONGE=
X-Gm-Gg: Acq92OGvcdrV17I/QNIIQxhmRNInAqSOvE0X9sh6Q6WgziEPc/nPThcgoK7E2Ghb1GN
	2Z/dONFIyYDH4jxD2Og86bPT8bfheeKVcoNe2IcgR5HQRHEWBwDs4CiGXG2ExG41HFFi1WR/7V7
	eLEx8p0sMXTvQlKqktvtA2Yf1DTOWl7IQFu/loN1BgRMfxZmsZv8doAL676zj2tLuSO0zS+b5Kx
	shtNHE0qaN/xe0ycoVk0d7Y/9sP1eKo1WyHmAtwAbwaSBTPZnGQG6sc8TIYj2Uj2OeiqtcNFr2E
	qNrLzmuxWMTLARRkfXHPcIR/TX/R0J14nf7xalRK2PE3k1lg4Wikcss6R/WDH4uK9QOXK5LkJX6
	JJC0Si1ciMbog+BXems7xXMNkmVyMZNW2I4n3pFNnJ7E7xZL+W6ZvYIpFYPnnHxoY5vBzTp20/p
	54TDT1RAQR9JgY+tReUfSDwCUTW/FnR3qq0wRs
X-Received: by 2002:a05:600c:3e1b:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-48fe6515f20mr40353795e9.24.1778839409890;
        Fri, 15 May 2026 03:03:29 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.168.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm13035426f8f.23.2026.05.15.03.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:03:28 -0700 (PDT)
Message-ID: <b762a6f2-72f6-4edf-9b39-858679ab1088@linaro.org>
Date: Fri, 15 May 2026 11:03:24 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] media: qcom: venus: add power domain enable logic
 for Venus cores
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
 <KyofAf7-7fHuyrl4e6F6V0PcISdaPnC_KqyHb1MnejRrdC2Zkfj17Gz2_zcC5Z1ZnCvCWxJ0cSrHqzCzqQjxHg==@protonmail.internalid>
 <20260514-msm8939-venus-rfc-v7-6-33c6c6fb9285@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260514-msm8939-venus-rfc-v7-6-33c6c6fb9285@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2026 22:24, Erikas Bitovtas wrote:
> +static int vcodec_domains_enable(struct venus_core *core)
> +{
> +	const struct venus_resources *res = core->res;
> +	struct device *pd_dev;
> +	int i = 0, ret;
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev = core->pmdomains->pd_devs[i];
> +		ret = pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +
> +		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
> +		if (ret && ret != -EOPNOTSUPP)
> +			goto err;
> +	}
> +
> +	return 0;
> +err:
> +	while (i--) {
> +		pd_dev = core->pmdomains->pd_devs[i];
> +		dev_pm_genpd_set_hwmode(pd_dev, false);
> +		pm_runtime_put_sync(pd_dev);
> +	}
\n> +	return ret;
> +}
> +

+

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
