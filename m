Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0807A59
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738049598; cv=none; b=IDQOmLdjE+Deoqmc2jGaDM0LhKz1/OlaIwcdA4eXUDHXI8ZEDAhL5WtYoAyFIk6HeyuzIOV6KjZ397PI31imjeTRr0eouUsPqNWWRq80ifWv9rCyawVTX2s9AZfLGG55khHLCXcgG23xlvYJZgVCdE/5gT41jkY/TQl0mtDon20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738049598; c=relaxed/simple;
	bh=mZ2Zcw9sEcQSCVokuanSsqn7TRGnoK4f06PMfR8w5ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yo4ZOSrEwJlICMl4UqUJvcbU1aOzD9ISIuLlf2QpcLvZgAMh2mydY0TgPYj1MqWJeDDM1ZMf+reeXU8x0LpLu1GAJzT32WlwB8cDbcE0To3IH1siqJ3YWstMqBzQXHSbBBl7besQ8J8O97hX9twOwBNDE/AN+8Z8Vpkc2jtnP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YYgNhX7s; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YYgNhX7s"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so54261445e9.1
        for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738049594; x=1738654394; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CjLD05jhlX2L20PLVtgUA9DwA+HU+hAYzmi57kfqUaQ=;
        b=YYgNhX7s5CeyRdZpfOqR+xUknsVbt1yx+x86ZETuusByi3ASITNWzjm0tRRVWBtsTZ
         aQfF9f0T3Aesex7CJih+e5dlH01wCizo9ubGa8AJZm+Bafb6Etvg9ByRMMc6V1XuoDNl
         l9IghebC4xHRTSeqE+W04tw6cCMjJs2Onc+BczxVFSHOlMiZj1XaqrUM930XZ03d44qE
         NyHnmK2QAWmXtnuzu7ciCoQtHEP3hSX3SA12QK/Pa8x+aKNrEPzkTo2GCiSH4iZLNir9
         HzvYlL+ZxfYeSicZeKgzSimlb3zpTUh6o13mqPoxB/gAu/67IVNiJ/wm0vKStdLZ9oQu
         GExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738049594; x=1738654394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjLD05jhlX2L20PLVtgUA9DwA+HU+hAYzmi57kfqUaQ=;
        b=lcT2GeObVf9xKR4hSe4ZTQYjcwBrOfeOtlyEQmgJ/69VlS0F7noM107J/g+SsqBk7l
         myubCPupmSuwJi9r3Jrj1I8vaAmEI9bVLSCKJmc3CRzNIku1jCc3JqouzDg/bznD9TNg
         Z7NISKV/Rn+CvXtuPm4EVUxTXfSeRAU9L1JlpFY75JUzZbMurfeXqzlWxDSH+I0L7Y1p
         TsSVPV+mTaJqTpsx9q9HSBPy2U4jINADeu9zPutp3kMzdpKIbEGaQpF5dDptj/uVzxSq
         c6B/uuKYSy22BqPZdgQogIBFH6T41ZxSHuNTYAHT64VSZ874asHQWzvabymXrsYqQLA6
         J4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV9HNtF98YaaF0NmzPoTwN3OHPLpeDKe8f7zEq4koZFRTHzrpkPjfnQJHEvmbLjr1NhjHajPYJnD/csxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKZs+8hvIpNu1iJsuQy6XmxIbMVRUfRgcwwusjeryFuDe0iwlS
	NkIupRyX1erj/qJLvOeZgatwDkfKCEfTUJ9+WDaoGVXrCYSU7N2BvEnXXtD1VQE=
X-Gm-Gg: ASbGncuEyKWeGKMY3tzAh/l9fDsamve4qz7odZIzZnYMfCLV1zQpsiNSlD719783Vq/
	YM7eKC3TslZw2dwBWW1RFLALI7xukyeVU0HjfoHKs7eWkJbIp0WIRuIV720+u73iIz5+OZUXM1Z
	pLc8jh1d7QM15e0A2d3AjO7NjHbbAm+BRG7Ih+rmjqWibvbajGIBeODXx4lah5a3mU5OMUUBwHc
	wg4XUiikiih9vbrORGOtfsAQUQN+l4+FaknVrL0eJJf2SqLV4OhF+QPPzrKIfC9/+pzaBbg+pWq
	W7z8zASS4a0Yj9K38oRogvOdq+Y=
X-Google-Smtp-Source: AGHT+IFQeT6YG3LT6HzJnMjvZlkFsR3ltvXRn9gZMvOrDMceaV4NcONz6/gU4BThG8S4AkRKmQGQNQ==
X-Received: by 2002:a5d:64a1:0:b0:385:de8d:c0f5 with SMTP id ffacd0b85a97d-38bf577ffacmr47181909f8f.16.1738049593831;
        Mon, 27 Jan 2025 23:33:13 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6edsm13103939f8f.40.2025.01.27.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 23:33:13 -0800 (PST)
Date: Tue, 28 Jan 2025 08:33:10 +0100
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
Subject: Re: [PATCH v3 04/13] remoteproc: qcom_q6v5_mss: Handle platforms
 with one power domain
Message-ID: <Z5iINvEVTXqqdXS6@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-4-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-msm8226-modem-v3-4-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:36PM +0100, Luca Weiss wrote:
> For example MSM8974 has mx voltage rail exposed as regulator and only cx
> voltage rail is exposed as power domain. This power domain (cx) is
> attached internally in power domain and cannot be attached in this driver.
> 
> Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index e78bd986dc3f256effce4470222c0a5faeea86ec..0e1b0934ceedd13d5790b798afc95d68a8314c75 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1831,6 +1831,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>  	while (pd_names[num_pds])
>  		num_pds++;
>  
> +	/* Handle single power domain */
> +	if (num_pds == 1 && dev->pm_domain) {
> +		devs[0] = dev;
> +		pm_runtime_enable(dev);
> +		return 1;
> +	}
> +
>  	for (i = 0; i < num_pds; i++) {
>  		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
>  		if (IS_ERR_OR_NULL(devs[i])) {
> @@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>  static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
>  			    size_t pd_count)
>  {
> +	struct device *dev = qproc->dev;
>  	int i;
>  
> +	/* Handle single power domain */
> +	if (pd_count == 1 && dev->pm_domain) {
> +		pm_runtime_disable(dev);
> +		return;
> +	}
> +
>  	for (i = 0; i < pd_count; i++)
>  		dev_pm_domain_detach(pds[i], false);
>  }
> @@ -2449,13 +2463,13 @@ static const struct rproc_hexagon_res msm8974_mss = {
>  			.supply = "pll",
>  			.uA = 100000,
>  		},
> -		{}
> -	},
> -	.fallback_proxy_supply = (struct qcom_mss_reg_res[]) {
>  		{
>  			.supply = "mx",
>  			.uV = 1050000,
>  		},
> +		{}
> +	},
> +	.fallback_proxy_supply = (struct qcom_mss_reg_res[]) {
>  		{
>  			.supply = "cx",
>  			.uA = 100000,
> 
> -- 
> 2.48.1
> 
