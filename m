Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021561B041E
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738050657; cv=none; b=mUCZCbIZk7+Fl6jnXq+wB5Z7FBDWAkcgG6lqh73mK2I9/9ii4lvLUaOnWC4E/TNQir25CJlN+FDtQvctmVnGZCWoRAPWu51H7QRdZxJfAlUQ57LcC1shIzUqexzX3/pRHORa8KD4KZZa8RxNnHBjsQZi/veboPirwbyLtIakLBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738050657; c=relaxed/simple;
	bh=MG/KEyTOG0beHjj5mCVZXamfoSVAwhsFi+qnKfCiLuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5gtdxdtYBi9VASFhH6FkAa2NJscHESLEUIuGKHNfiRmFx/FAH8k7ZxHoq6jKfxKWEbGy0CD43/zRnBTOK5zw4oOjfuBj4OyOIU0fOiZtPgu6U3mOKjZD0UJC7Bqr7kadfqMeFiPL6UuftJTjS4Wy5f2zSrDlqLVGA3pmPnOnLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDZ1cQuv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDZ1cQuv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43634b570c1so36949995e9.0
        for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 23:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738050652; x=1738655452; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOFb7y58tFNRPYqhufNh7oHByxu0C+wf9P1ANbJwftE=;
        b=tDZ1cQuv9BKmXJAVxOdhgQhxiX7Pw5qsFiHwmqdu5q2HOdl7/UDlqZayLjPQ/9JUom
         hc1ooSXbpOWJ7fnG+AfII8Qb09ecsNarL6XTl1WPn5FfHkq0cXVrghlI95OzSFR0YYYU
         RH5LhOrb4R7LZTcxyCKhwgZfJbyVC9kKicJ08gQMR1Oxgaa9/aBgITH3bWaAexlfFpq4
         dpQ+MZevlLN0odI74XeO/mXsxTl/J88lu9KLOJxjzBcK9LEtFJQZn4+/nIIdkKvjlkzA
         fANbnvoVdaTfYiwyd29UWntAqUtlBb0ZPyY6OcmgAWZzMfBOMxhidPB6Ivo+LVr8BMQ1
         qhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738050652; x=1738655452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOFb7y58tFNRPYqhufNh7oHByxu0C+wf9P1ANbJwftE=;
        b=LZW2/j7OLf4lM+AzSlauL25lxfPU3NyFVkcSUSZ31pE4e7eJEddIA8KQiejj8IBvq7
         ElO0sPzPyXSuz5sJ/+C9cBFaQMCK+arD46LfEYdeSNVj+VaUTZdmR3UUjemZfh1DVHux
         4HPvduM8Sq/s/rKm6hwdJHf01RdNA9vVzITf0ivR2QvDHTFMnzMdei6miEoc2XVT9ifI
         Tzua7tbZJb971cSMfYVYREZM+7hnK9jCakITcn9foJrMc/91WYxYAKBvpLNofRkUHLL0
         ZlfsntFJ4MaqG6slXuRqG0ujG2rx9lbMGnABvWST8gklEVgTe5ggT8yjaIoSZvvZmnl9
         YK+g==
X-Forwarded-Encrypted: i=1; AJvYcCVGD14ORoaeE1/QGdsdQjVm0dzXsK8/qYS1wKABaNMSnMaO3OR4iACD1utdyMDZ55OfgKfNuMlu7eN1DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhmPJ9KZQEdjbfw/NDWRNSzZyP0S/W1XVC/w45es0hq0gC0ypP
	lp81AiuIFGw2tiylq5B5w5qQ9u7FvEqlp3KJLPBJIwQdJoQ5IIWQI+FGUeT/Rnw=
X-Gm-Gg: ASbGncvCTJ6gzbsFw1kWqoc30zuvsmY64g3W7MmRFexWrL7tvNu9yOLCyMqARwn6u09
	UM7b2O4BVg7VL65ZDvg5R46ikCCCvV7ZuaC0X5iCSmqVbXWCalq4fVZxDJeUe5p+bQzp6Se5DZn
	1+XojpVdj7bkdayXvsGLF4UK5WSnRrinvl6+J1rCQD3ZCHq7sfF8E/b2e1gcwKkFjTPhYMRaw+D
	9KVrzsRtwI5y3t5puGnUfpSyil3wr/xaDQAEjFsPFON3M69HgHKYGlN8FL//JhvlRrnMCNurGKW
	hbKuNnJTw7Q9UWuWP/z7uG16sdI=
X-Google-Smtp-Source: AGHT+IGvcHuonreYl8FJS7BEfENZ3haFJQtN4o/+9tZemilFpHlPJ4n3jAOU8QPoqoIMrygq6Dv8lA==
X-Received: by 2002:a05:600c:4f16:b0:434:fdf3:2c26 with SMTP id 5b1f17b1804b1-4389143a124mr366293885e9.19.1738050652198;
        Mon, 27 Jan 2025 23:50:52 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd50233dsm156321715e9.15.2025.01.27.23.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 23:50:51 -0800 (PST)
Date: Tue, 28 Jan 2025 08:50:49 +0100
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
Subject: Re: [PATCH v3 05/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8226
Message-ID: <Z5iMWeiZKFBbHPLF@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-5-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-msm8226-modem-v3-5-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:37PM +0100, Luca Weiss wrote:
> Add support for the external power block headswitch register needed by
> MSM8226 and some other qcom platforms.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 113 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 0e1b0934ceedd13d5790b798afc95d68a8314c75..32f35fe89416f167fe49be7ca02a24af842e0073 100644
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
>  	bool has_mba_logs;
>  	bool has_spare_reg;
>  	bool has_qaccept_regs;
> +	bool has_ext_bhs_reg;
>  	bool has_ext_cntl_regs;
>  	bool has_vq6;
>  };
> @@ -180,6 +186,7 @@ struct q6v5 {
>  	u32 halt_nc;
>  	u32 halt_vq6;
>  	u32 conn_box;
> +	u32 ext_bhs;
>  
>  	u32 qaccept_mdm;
>  	u32 qaccept_cx;
> @@ -237,6 +244,7 @@ struct q6v5 {
>  	bool has_mba_logs;
>  	bool has_spare_reg;
>  	bool has_qaccept_regs;
> +	bool has_ext_bhs_reg;
>  	bool has_ext_cntl_regs;
>  	bool has_vq6;
>  	u64 mpss_perm;
> @@ -246,6 +254,7 @@ struct q6v5 {
>  };
>  
>  enum {
> +	MSS_MSM8226,
>  	MSS_MSM8909,
>  	MSS_MSM8916,
>  	MSS_MSM8953,
> @@ -1750,6 +1759,23 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
>  		qproc->qaccept_axi = args.args[2];
>  	}
>  
> +	if (qproc->has_ext_bhs_reg) {
> +		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +						       "qcom,ext-bhs-reg",
> +						       1, 0, &args);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to parse ext-bhs-reg index 0\n");
> +			return -EINVAL;
> +		}
> +
> +		qproc->conn_map = syscon_node_to_regmap(args.np);
> +		of_node_put(args.np);
> +		if (IS_ERR(qproc->conn_map))
> +			return PTR_ERR(qproc->conn_map);
> +
> +		qproc->ext_bhs = args.args[0];
> +	}
> +
>  	if (qproc->has_ext_cntl_regs) {
>  		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>  						       "qcom,ext-regs",
> @@ -1871,6 +1897,34 @@ static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
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
> +	regmap_set_bits(qproc->conn_map, qproc->ext_bhs, EXTERNAL_BHS_ON);
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
> +	regmap_clear_bits(qproc->conn_map, qproc->ext_bhs, EXTERNAL_BHS_ON);
> +}
> +
>  static int q6v5_init_reset(struct q6v5 *qproc)
>  {
>  	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
> @@ -2021,6 +2075,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, qproc);
>  
>  	qproc->has_qaccept_regs = desc->has_qaccept_regs;
> +	qproc->has_ext_bhs_reg = desc->has_ext_bhs_reg;
>  	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
>  	qproc->has_vq6 = desc->has_vq6;
>  	qproc->has_spare_reg = desc->has_spare_reg;
> @@ -2079,6 +2134,12 @@ static int q6v5_probe(struct platform_device *pdev)
>  		qproc->proxy_pd_count = ret;
>  	}
>  
> +	if (qproc->has_ext_bhs_reg) {
> +		ret = q6v5_external_bhs_enable(qproc);
> +		if (ret < 0)
> +			goto detach_proxy_pds;
> +	}
> +
>  	qproc->has_alt_reset = desc->has_alt_reset;
>  	ret = q6v5_init_reset(qproc);
>  	if (ret)
> @@ -2143,6 +2204,9 @@ static void q6v5_remove(struct platform_device *pdev)
>  	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
>  	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
>  
> +	if (qproc->has_ext_bhs_reg)
> +		q6v5_external_bhs_disable(qproc);

Sorry, just seeing this now: I think this is like the "active_supply"
you just added for MSM8926. It should get enabled when the modem is
started, and disabled when it gets stopped.

The calls to q6v5_external_bhs_enable() / q6v5_external_bhs_disable()
should be next to

	ret = q6v5_regulator_enable(qproc, qproc->active_regs,
				    qproc->active_reg_count);

and

	q6v5_regulator_disable(qproc, qproc->active_regs,
			       qproc->active_reg_count);

, instead of being called in the driver probe()/remove() function.

Downstream also has this next to the regulator_enable()/disable() [1]
(drv->vreg = mss-supply).

Thanks,
Stephan

[1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BF.1.1.3-02310-8x26.0/arch/arm/mach-msm/pil-msa.c#L71-109
