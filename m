Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BD4192B8A
	for <phone-devel@vger.kernel.org>; Wed, 29 Jan 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138637; cv=none; b=W2cv/EBiKnXxlMHq7qmLFAnkBYwT0lEeBgjuD6iSyCfRyKNeq0yuwJ2vAvoTosMl4lzdS0I6SwXBbBQGMWHeQn+xufJQLu1GsW2Telx+o0OIOpEpLz0Z3cIBXTDYXL3K2rYtUrV2pxlHBCncpB5iEuu9NPnIZl/6vx1lJYqunLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138637; c=relaxed/simple;
	bh=pr1H+qOgtFwlwxokFPKqAcNjsp+sUyK9zu3FmkZcpp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgCcPSphmAFCSET7k9oVwbl3/d+Fh08sbDgl9pi9wHJq1x6qaBX2wVAEoDLDZJGaptDT7W+eV9d6NbzZaSFX951Prq3asw5AG95MMkbTizV7sn2Gj5UCWvBkYzrDx/c8m6B9Y+Uf1z1KtUp3m7uZ0F7cxJfKr6/JUg/TOTHCmqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBkaxvLB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBkaxvLB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso3582048f8f.0
        for <phone-devel@vger.kernel.org>; Wed, 29 Jan 2025 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738138633; x=1738743433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/+D0OekWy0GxppkPj3fPY5hpDHIrRe8OroWwhzjF34=;
        b=HBkaxvLBJhMmCK3yUgCz3m/QDVXTid8Uy2V8IfwlzGeweJWVgITLHkQONXC6IsGcp1
         2BwOrb0ECzoqkZoAtcspSuNrDvSMZn/WvE4Kf0K5wXwr52hMdtZnzuIcSfwKa1+F3ywQ
         a8mgtoW3mrs0mXywpeWVNxnwFV+w0KB9liW6wNXusDw7gqxvY7CZ7fr6rhFw4d0i/5Z1
         Vo33bz1TVX7FcBBLb95Dd0HUky6tzy6eUU3CDPnmO8Boju/LBrVtO1Z0yilyxSrO7yfx
         uo8o1NlExBLObaOV6SWt0zRbnDYcehD+UgaWdEwXVm4zzf30GZIpJouYpkp7vIef8Xen
         iP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138633; x=1738743433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/+D0OekWy0GxppkPj3fPY5hpDHIrRe8OroWwhzjF34=;
        b=i9b7d9bLoc+sEqbYTTXcHTtfd0uHXXT5lvs7nomINcu9VFM2CGr51d6IzhN5QtyBRP
         t2Jh7+q+pqjibePHFFRP8neDJaeQEGe+2ewtLw+I1qqXSInzSV1WIv+Be4ucg+guboNh
         i2nDj/uKUZnIOvP3YT/lRWczw4NcElxfhsAnd2kcssF3I2V7wM9NYreSO8I1XYBBykTJ
         qv+eRFUGAjIXVn8MukElfZXGs+OC82etUsWQNYljQiIBkgKR8lJSYrzLGm4HdZBmDteK
         qRa5lnGEOwwNRniX+vMCB/DrUOcWWp62umYxvoGz6W6vvaZdIiruM2K3Je+IE709AtJA
         dPog==
X-Forwarded-Encrypted: i=1; AJvYcCWxwOzGDcDUjcA6mEvQHoFKV1sQwRO6bNWKwDV0v68inivIDrnZXShcsMhZW1JioMqfHrMOAaBl65SVNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXhFLzo0X/FELDfAe1AM8dsj6LLxKuZ0967v6tA+zyEBG3im/
	ZDs9WYoJspOcpNFtIoy6SQt+Z6/NyEtX0sLrOb6iybLoABlgmEvaDtEpVJavX+I=
X-Gm-Gg: ASbGncv9+Cu2tSfLR1KTlrFfclCkv/ydzqDcFRJxrGSxSAQfZ/Y5D0KSTxywR00j+8y
	SGmn3FC3wfGXK60PZV1Sl6p3JsRg7aPcVLS8ObT0G6oZncYDXPBSxAQ/PTUG5ZsMTGUehnhPxm+
	SX3setOvtS/2tRr0wfiNLinplMDbgJ6wpO6AQCFTYIhNJdS/HKp+/yV9aBTMGKTdY7EZHGxFjfG
	7lBZE+HEIl2XMx/d7wf3nPw4kHVrNgfCFiytkP9HY7vkMSstyoPKpGKk6F//Ge2cRWvfF4uHCBa
	PxZuMNNAR8v9wFqicLe5aA==
X-Google-Smtp-Source: AGHT+IHpJGqcr8Tk2T0wQuKtYNeP2wWRWN3r3xQi/6+WJha95RSeRs0NLgQ4Lr414eJF3CjQLmMLnw==
X-Received: by 2002:adf:fa8a:0:b0:385:e1eb:a7af with SMTP id ffacd0b85a97d-38c520be00dmr1356231f8f.48.1738138632801;
        Wed, 29 Jan 2025 00:17:12 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc24d51sm13637275e9.14.2025.01.29.00.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:17:12 -0800 (PST)
Date: Wed, 29 Jan 2025 09:17:05 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8226
Message-ID: <Z5nkARIwmd3tBypA@linaro.org>
References: <20250128-pas-singlepd-v1-0-85d9ae4b0093@lucaweiss.eu>
 <20250128-pas-singlepd-v1-1-85d9ae4b0093@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pas-singlepd-v1-1-85d9ae4b0093@lucaweiss.eu>

On Tue, Jan 28, 2025 at 10:53:59PM +0100, Luca Weiss wrote:
> MSM8226 requires the CX power domain, so use the msm8996_adsp_resource
> which has cx under proxy_pd_names and is otherwise equivalent.
> 
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: fb4f07cc9399 ("remoteproc: qcom: pas: Add MSM8226 ADSP support")
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Not sure if Reviewed-by makes sense if I already did Suggested-by, but
anyway:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 88e7b84f223c0222a01e2a246a848f2889ac00b3..aca44bb6522f00cb525c4b816040445287444434 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1319,7 +1319,7 @@ static const struct adsp_data sm8650_mpss_resource = {
>  };
>  
>  static const struct of_device_id adsp_of_match[] = {
> -	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
> +	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
>  	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
>  	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
> 
> -- 
> 2.48.1
> 
