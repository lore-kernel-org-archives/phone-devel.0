Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2793674BE2
	for <phone-devel@vger.kernel.org>; Tue, 11 Jun 2024 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718135813; cv=none; b=H0E0Wprz+VyOKezbs/8V7d3WA6uNUaJwDsq+BjagFKMDHn5D/CP212wPiR614hGIuo+x+fyRLxtnX8+RPaAw657pZTXp13ZWu688g/mmciDKM3VjkET105/VyzP6qaPCd/h11ufIDYHzqrJLytMKc8FXDh3NFQ5Qlp9i+bKTbTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718135813; c=relaxed/simple;
	bh=f52ZfaDJyYfE45I/t8usiFuaWQE/tHK60yXBoddILOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRXsm24jJsPeLlvt6yntKktLLkdMUTRJ5mxohaF/2KMdbBd+4J6sXSleGvgJesFAIADkovIrlkU2bzP9Lp0/gyG4AdtOpzZEBlYO/w9z5ZDNpCqyknlJxpnXcAbU31MUtKyvvY5lIWut6J4j6oTyw+Qp8wgYjD8OQRAeuP8g+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PxG1MlA+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PxG1MlA+"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso26715011fa.0
        for <phone-devel@vger.kernel.org>; Tue, 11 Jun 2024 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718135809; x=1718740609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EEPghwR2XmpVCR3o/1blYpkcLH7773zRI7ZULoFlz0s=;
        b=PxG1MlA+qIMQ2WxfHlqOv20aeM7F5dXXlKw/cC8lS7S66c9psN7hNEcrZQ99hWWnUZ
         lFWQycq1NoarAHLiCyVw7iA5SRSNk7qfgMIIjnHsMKM+hiDnLt3OYkA6pkdia+lxZvJO
         y8KIRa7NPRy/tOUGbVHNasMT+ybir6qc26UAEJt5pIHxdVCLMm++SYuUMPwwS2J/CUGE
         D+bWVaZr4b0C/3Q+PjAl0weqnF6EfAAQjCfAGuDT1yg5nE4uqywdUPLAFjvHl8UqiCyV
         ULSbjc1EsciQlwzl4GGbZGqV8ncU9aTwPfu5MEYl3gKohVGSCHnTH1aA48hzFGbMMbsF
         bBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718135809; x=1718740609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEPghwR2XmpVCR3o/1blYpkcLH7773zRI7ZULoFlz0s=;
        b=cOCmbwj/q3Shrk96mFTVGDwpHIwdxtEV1SgtkR3YgIWXv3DRJ5RidtTDvtscRbjN50
         9E0I8hRuZBaJcgwZ4BRxZH43gu4urk+4px/MQYdSKWquHbg/WmhMUgxZYYJzW1nPo03H
         prqwaYclr/YAlG7R3mV70mswffjiUXO4Q5I2J0R5QhD9U7v9kHfgjWm1i2oLCIsoYzUe
         KwG4kVW8nULdVz/JwcIpo3EQgf+UFNtXZTkiFRRlBnGxeoR5wqpbApHwQL2nXYtF3NVz
         oSKhf8qdjBXZV54ZQRxcPDCRb0yzT7AycFIkvyfn1DNn75yoGHFWQgLdqIrlDU0B0Aph
         AmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2uWcYeIIfHWa15luoGS7CtuonS/uBKHhwDv4qSz0Z9umPrOG33HDYi2DSmObnnZFxNmojRkh87pTiitg4PMYPtwoefCB/Inng0rQ=
X-Gm-Message-State: AOJu0Yz3Nmo9d98F2cVgKsIVQTNgFYmiPiQTZTrCEvCOEWVv2tFdeMwV
	y1y0+x7Ig7O04FqaTMEY2Hj38hV1fbiWpVtjjw1i87yOIGA80nQzeyNdXHbrbRE=
X-Google-Smtp-Source: AGHT+IEr4GTdU4AxnL8+UGYWalCBdzfI2Rw2hfJifpjP74yQ2XM4sfXmhKiwG0IruqyzDVD2eeEfRA==
X-Received: by 2002:a2e:be04:0:b0:2eb:e365:f191 with SMTP id 38308e7fff4ca-2ebe365f2bamr53815041fa.15.1718135809150;
        Tue, 11 Jun 2024 12:56:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ebdaeac43esm15379711fa.24.2024.06.11.12.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 12:56:48 -0700 (PDT)
Date: Tue, 11 Jun 2024 22:56:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Caleb Connolly <caleb.connolly@linaro.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v5 1/2] misc: fastrpc: support complete DMA pool access
 to the DSP
Message-ID: <vrw2v45cjem4qzhwtvapwzyjtq42dzkirkvxajgfd4retvmjyw@64fnc3ewjlnf>
References: <20240524161423.15392-1-me@dylanvanassche.be>
 <20240524161423.15392-2-me@dylanvanassche.be>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524161423.15392-2-me@dylanvanassche.be>

On Fri, May 24, 2024 at 06:14:02PM +0200, Dylan Van Assche wrote:
> To support FastRPC Context Banks which aren't mapped via the SMMU,
> make the whole reserved memory region available to the DSP to allow
> access to coherent buffers.
> 
> This is performed by assigning the memory to the DSP via a hypervisor
> call to set the correct permissions for the Virtual Machines on the DSP.
> This is only necessary when a memory region is provided for SLPI DSPs
> so guard this with a domain ID check.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/misc/fastrpc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4c67e2c5a82e..c06667b29055 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2255,6 +2255,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	int i, err, domain_id = -1, vmcount;
>  	const char *domain;
>  	bool secure_dsp;
> +	struct device_node *rmem_node;
> +	struct reserved_mem *rmem;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
> @@ -2297,6 +2299,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> +	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> +	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {

I think we can drop the domain_id check here.

The rest looks good to me.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +		u64 src_perms;
> +
> +		rmem = of_reserved_mem_lookup(rmem_node);
> +		if (!rmem) {
> +			err = -EINVAL;
> +			goto fdev_error;
> +		}
> +
> +		src_perms = BIT(QCOM_SCM_VMID_HLOS);
> +
> +		qcom_scm_assign_mem(rmem->base, rmem->size, &src_perms,
> +				    data->vmperms, data->vmcount);
> +
> +	}
> +
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
>  
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry
