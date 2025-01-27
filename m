Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9781FCD11
	for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968790; cv=none; b=RaLlvhWt7p0yB2bDaf/7KDOu3cBLLadjSuq5+Vt1X//bf6x31RkMSkxsiP6O7GfvlFTcR8aYwyMCcTdLfvI5tOl4XT2HfZIOe81ELpf/y4DJ0w3k5ANpLVbtr2Bp1QzTvqECNefQuEDBBCjSjr887v87yFT7rOgqt7xWWoCVE18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968790; c=relaxed/simple;
	bh=gO3d/4mrWXGze06FTi6Z9lXpH3hV9B3qsDLKjVLRQjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3Q4+wyYR7JT+eG4AGxhmd9SR3CkLdOctxddq5ry6rhC4129LPuTTFsiVbqMxo9Qhoy7gJlxTSjUdn30z3zj7aJfyRe7SB5zKQjB5GArdQTjeaiTImqZdUpeWA7W+i0x93dcw53KNXPh314fAejdY/20dgTOibqtn3YxMYF7mq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MWsDLUNS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWsDLUNS"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab69bba49e2so176351166b.2
        for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737968787; x=1738573587; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ru5JcDXJ0V6EvEX8QHAyIUNaLhSujmRQCuu+cesIXi4=;
        b=MWsDLUNSCM7FFWg3dm7Qh6h//hk0sxd67bjvyUJoTmIzDbKOSt4vs692c4lO7XI2B9
         bMZazHztRfBRHD7gBAP5qwhxn91kLh35Qaiff6aUetBCoyOSQtcH/VmqXZEdnWosOQS5
         93QlyNAus1jgT7H0DXk+2K/C0fc9KnTXm35Raspw971doF7jupyEOKHu5O/qaPgcIFVJ
         CYnzFs9IOeGH9dJ8Pi+F9CDNDpFfnluV3n5QQb7sp8tOlCPILsdS9zC5NmX1voIfKUKT
         Lc4x0fMOVjYXqdazbUuwCeQ2Mi+69uf6lA/bu+ALAKM53mooEXAK7O7FnA1iTDefKsPl
         1NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968787; x=1738573587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ru5JcDXJ0V6EvEX8QHAyIUNaLhSujmRQCuu+cesIXi4=;
        b=G9OkAI8KHsC+g278Kw4c8GDDlXLJrHwTfZ+hofl3zWJTJa6b7lSqzqDSgIV/yiz+1c
         musEDE9EFKfj1hqeoRBD9km4BY/stplNJZcWg9JmGXlKXi0L3dL64suFvBz3Gk3dcyrn
         v/xYgtOO+ru2pblcvV5BrMQ7lXS6zejstjGChbEmF43b/W0P25QPKKXKFtGtH2IsIjfk
         wtLJYVz8TAVpGtkXX7gdyrVvJOqL3WCAqskicMMMFNHaCOfPaUH+zSCKjhVkoh604Enk
         Psz4nraDG9RMWBJ1tGRe0AgpwiuWKN3A4bdBLd7TEf5cB9VKofrNbGkCqz+KycSdW4hv
         TCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO1y7JZC97RfmlmASZyBoYcc9QrILvki3LEt6pKVZ6knyg+aYSn14qjYUWbg8myO1GWTbW03eDbLv9Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPD6f50iZXrY7tnwEJY58jTcCnR5aYo14XddyEVDz4bviiH6L1
	FFvVclKT6jhvIqRSXafsK+ogLlY7cg/4D4ee/B8uc7cPZETQPyk9W5lUMA5wFuA=
X-Gm-Gg: ASbGncuxmRKvo1yc/RhB07Xa5Q+binmgdv3caFLXRImo5SCQGifHfZC0a4JjtxCioov
	O3WUgdaGQPOclD3gxfKfEk7uORYr4pPhIfZlMIJh7Bks5YLMqCX1ZUjSo4kEZFNRkWVTqOkRzht
	HH5NOA1QWXYRh4kbd2VaQFMksBU0ZWpDboKcgoVV/UfZS3l14Qz7sirK42Ove0mQwjKqZsNBPAU
	++BWEpQreanu/mVEgd0GcNdBUW18NsSjdZHrJEr/gtOFucxs3+7oafHAsKoZoccSSM/1nyMWyx/
	MTWQQ8KChTW4ZA0C
X-Google-Smtp-Source: AGHT+IEoku4hVU1Bs9oRO3XcssM7g6jlT/m4SSLdEG1yw4hlXESz6xS72CFcZgRwwuOZUWCMBW5YQg==
X-Received: by 2002:a05:6402:518a:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5db7d2f5ec0mr98139827a12.13.1737968787049;
        Mon, 27 Jan 2025 01:06:27 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18638ed2sm5138630a12.36.2025.01.27.01.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:06:25 -0800 (PST)
Date: Mon, 27 Jan 2025 10:06:24 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8226
Message-ID: <Z5dMkPvhjCkb9e9w@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-4-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-4-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:23PM +0100, Luca Weiss wrote:
> Add support for the external power block headswitch register needed by
> MSM8226 and some other qcom platforms.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v2:
>   - Remove cx-supply from MSM8226 "fallback_proxy_supply" because it's
>     always used as power domain
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 117 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index e2523b01febf393abfe50740a68b85a04011293c..ef85c9843a12acb0e4e9ee6167c34d4981d4dc8a 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -134,6 +134,11 @@
>  #define BOOT_FSM_TIMEOUT                10000
>  #define BHS_CHECK_MAX_LOOPS             200
>  
> +/* External power block headswitch */
> +#define EXTERNAL_BHS_ON			BIT(0)
> +#define EXTERNAL_BHS_STATUS		BIT(4)
> +#define EXTERNAL_BHS_TIMEOUT_US		50
> +
>  struct reg_info {
>  	struct regulator *reg;
>  	int uV;
> @@ -161,6 +166,7 @@ struct rproc_hexagon_res {
> [...]
> @@ -1871,6 +1897,36 @@ static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
>  		dev_pm_domain_detach(pds[i], false);
>  }
>  
> +static int q6v5_external_bhs_enable(struct q6v5 *qproc)
> +{
> +	u32 val;
> +	int ret = 0;
> +
> +	/*
> +	 * Enable external power block headswitch and wait for it to
> +	 * stabilize
> +	 */
> +	regmap_update_bits(qproc->conn_map, qproc->ext_bhs,
> +			   EXTERNAL_BHS_ON, 1);

Nitpick: regmap_update_bits() doesn't take a bool (0/1) as last value,
it's the actual value. The 1 as last argument is essentially a magic
number here that happens to be equal to EXTERNAL_BHS_ON = BIT(0).

This should be

	regmap_update_bits(..., EXTERNAL_BHS_ON, EXTERNAL_BHS_ON);

or even better just

	regmap_set_bits(..., EXTERNAL_BHS_ON);

> +
> +	ret = regmap_read_poll_timeout(qproc->conn_map, qproc->ext_bhs,
> +				       val, val & EXTERNAL_BHS_STATUS,
> +				       1, EXTERNAL_BHS_TIMEOUT_US);
> +
> +	if (ret) {
> +		dev_err(qproc->dev, "External BHS timed out\n");
> +		ret = -ETIMEDOUT;
> +	}
> +
> +	return ret;
> +}
> +
> +static void q6v5_external_bhs_disable(struct q6v5 *qproc)
> +{
> +	regmap_update_bits(qproc->conn_map, qproc->ext_bhs,
> +			   EXTERNAL_BHS_ON, 0);

	regmap_clear_bits(..., EXTERNAL_BHS_ON);

> +}
> +
>  static int q6v5_init_reset(struct q6v5 *qproc)
>  {
>  	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
> @@ -2021,6 +2077,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, qproc);
>  
>  	qproc->has_qaccept_regs = desc->has_qaccept_regs;
> +	qproc->has_ext_bhs_reg = desc->has_ext_bhs_reg;
>  	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
>  	qproc->has_vq6 = desc->has_vq6;
>  	qproc->has_spare_reg = desc->has_spare_reg;
> @@ -2079,6 +2136,14 @@ static int q6v5_probe(struct platform_device *pdev)
>  		qproc->proxy_pd_count = ret;
>  	}
>  
> +	if (qproc->has_ext_bhs_reg) {
> +		ret = q6v5_external_bhs_enable(qproc);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "Failed to enable external BHS.\n");

Since the only possible error condition inside
q6v5_external_bhs_enable() is the timeout condition that is already
logged, you might as well drop this error message.

Thanks,
Stephan
