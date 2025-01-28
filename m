Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133BF1DBB19
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738050963; cv=none; b=PPlqtZ106JrQgcoIowqCEjuyW7gJ3iJNpSqDJA9ec5piNzbZOt67CroWLGGEFQVlS58GKlnlMv+kNRzMF/xKPiYR+9NnkifBH8A3t4Cpr0+Mv/I4Vz1OzTzagiXQzrNV0H57Ox9YMEt1zC4zVAnc6gQF5EwSFaR3o2VsD1dp/zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738050963; c=relaxed/simple;
	bh=dyJMWoTyFqDpIWaShZkM/vjq7+zr/o67BwNI6Pz2B20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiOrLoiVQoJN45usH18y7ywXYk321lE6Ug1HcnOch/fcrTEuLBo+aF9plA3NyBCxHbsvyJepseFDesLOeaGpKI04ib6BtXL1O1hs3N6/PtWP7CATeKo6LuripDoJ7QwngaHu6LxD43qsbKzwyF5uRojGMcuwsRCtgoqoanibedQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zQ6+2S+x; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zQ6+2S+x"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso5932999f8f.2
        for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 23:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738050958; x=1738655758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SeMt2qiOiq2TY1WkHPRX1449FB8tJAQ1ui2jFxzGFaA=;
        b=zQ6+2S+xmLqrhQgJIPFz7SSY6iWUngl9Te2n9CzB57z4yXUuEFv2UdFPJTAVFY8UXQ
         IC1qh91CDFQIJkGNTCvx/ccJ4xVYP+BWZLY8kr1TltMhteTatznUJg/pzp2MiE4C1Fzs
         zcudldI9fHkYmJFjvn4sS3DhEVJCuH5oR+csslYjqFugpR1v9lwtvx974oAwVN4rl4lE
         3vn8o8bvgtbKSS8lLZddGO+PTRQaR8R1tm4BHl+/8BWS1RvIpkaZf0f8m4R75KiJAh1t
         JT6cL9Xarl0Hp5yxZCoN1Bc2QbC+T28hjHRx+Aia6i+zRgGPxJeHRKt/G9Mavovw/oRW
         DeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738050958; x=1738655758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeMt2qiOiq2TY1WkHPRX1449FB8tJAQ1ui2jFxzGFaA=;
        b=FtlQRipuXlT1IzjUOdkwquMNgW2Ca3/r0bQgXzVJ3BL8RXBFbKu8/wNIiVGlr+ANh4
         Wh/eGxfK0WiAsyIAk/srZEkjTFhQZzXOmSi2F4Ap3Fp+fdd+aavkMUSN0mUyaWfvCwHG
         raka0npjkjaWTbZd32wUTL3jysWs2OvYm5ZXXgwglRFVXMVebLFin44ixhTx/pNepo7a
         /qAVlX5jh/rg+cc3Rkzzz8gPsELA9d7N6im2ydxEUlIxANQ5XIyLCrpEaot7svG+S9B3
         ZW3ZseaQ1lh42B+6X5yMpBHgaSqNB4tRUDpiJyliq2aQ6d+pqP+0BS3/DI5mmkHT5nLg
         bc7A==
X-Forwarded-Encrypted: i=1; AJvYcCUE8lfAxDLxnALLZRLWYN2WD3peQwfzcmy1Tqsksfx+n2EhMPdx2yCMO+637F+j00lwomnuWlJa2g6Mbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMhmZU5opyDLXjqqL3gF0Z0++Vh+0TSkoCx2CiohqVAWfdvkv
	GvpFnTxRQP6CC26xO6IeyBDJcXQPIARNybxNiGJ1v7beSIoxgGN98QyjLtpfmyo=
X-Gm-Gg: ASbGncuBP2u2jcSUg8plVCk28zzee4JjstWN1EnDAuIZkU58FwPei8Uuld1PF+MCRsE
	qHwTKerEwq8nB2WKldndyWXXmMJ8zYTVMKPiGwFxIEufkrDDHjFCLg/nRapFKvNmohyV+QWH2Ai
	zb7y4Sb6ENOGb3VBGizwwCwc65+ACM6Nglb3mHF6G24PMfBSlS+42VRDYPZf/BNmKRop6GFvSZ5
	xKT/I+qxZ9nSm0dOl9g30VbNIOYfE35Q2ROSZzGC+Ww/QO81bVJ+Z41xBYw/4Ziz0jqBxJ/4GEo
	59rFvhV/+Ff6mQNbrLeNkEb6mdo=
X-Google-Smtp-Source: AGHT+IH7IH1478hNlcMLuY4hfHgnnoU18EMTRJjWDJe5Od7uVXg3AOxzEDdA3IpCgEWIWW15nNnM9g==
X-Received: by 2002:a5d:6c61:0:b0:385:fe66:9f32 with SMTP id ffacd0b85a97d-38bf57be5c1mr42327597f8f.52.1738050958263;
        Mon, 27 Jan 2025 23:55:58 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d70bsm13703056f8f.33.2025.01.27.23.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 23:55:57 -0800 (PST)
Date: Tue, 28 Jan 2025 08:55:56 +0100
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
Subject: Re: [PATCH v3 06/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8926
Message-ID: <Z5iNjMzKWG4zQkcR@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-6-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-msm8226-modem-v3-6-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:38PM +0100, Luca Weiss wrote:
> While MSM8926 being 'just' an LTE-capable variant of MSM8226 it appears
> the modem setup has changed significantly, by requiring mss-supply and
> not using the ext-bhs-reg.
> 
> Add a new compatible and new struct to support that.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

I wonder if you could reuse &msm8974_mss here. Anyway, I suppose it's
better to not allow the fallback_proxy_supply that MSM8974 has. I think
it's fine as-is. :-)

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 48 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 32f35fe89416f167fe49be7ca02a24af842e0073..cd7ea7bb345f558636f9414c43460b29b3be6f5c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -257,6 +257,7 @@ enum {
>  	MSS_MSM8226,
>  	MSS_MSM8909,
>  	MSS_MSM8916,
> +	MSS_MSM8926,
>  	MSS_MSM8953,
>  	MSS_MSM8974,
>  	MSS_MSM8996,
> @@ -2621,11 +2622,58 @@ static const struct rproc_hexagon_res msm8226_mss = {
>  	.version = MSS_MSM8226,
>  };
>  
> +static const struct rproc_hexagon_res msm8926_mss = {
> +	.hexagon_mba_image = "mba.b00",
> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "pll",
> +			.uA = 100000,
> +		},
> +		{
> +			.supply = "mx",
> +			.uV = 1050000,
> +		},
> +		{}
> +	},
> +	.active_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "mss",
> +			.uV = 1050000,
> +			.uA = 100000,
> +		},
> +		{}
> +	},
> +	.proxy_clk_names = (char*[]){
> +		"xo",
> +		NULL
> +	},
> +	.active_clk_names = (char*[]){
> +		"iface",
> +		"bus",
> +		"mem",
> +		NULL
> +	},
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		NULL
> +	},
> +	.need_mem_protection = false,
> +	.has_alt_reset = false,
> +	.has_mba_logs = false,
> +	.has_spare_reg = false,
> +	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
> +	.has_ext_cntl_regs = false,
> +	.has_vq6 = false,
> +	.version = MSS_MSM8926,
> +};
> +
>  static const struct of_device_id q6v5_of_match[] = {
>  	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
>  	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
>  	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
>  	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
> +	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
>  	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
>  	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
>  	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
> 
> -- 
> 2.48.1
> 
