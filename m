Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EA51FCF47
	for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968336; cv=none; b=Wi3HH//E0ECiWMCGVx09rK4dEjLnt2EGWNmPJP1Jx78Z3v1J+H96HtQeePC8yS279mI4QAXcE1xwB1JwPZo2HaY/xFRHUSjjmvWzNx3YYevj0YnGAlD2LW0Q/5iZOStyhVZVdybqzcCd8Jmp4xwDwzZc4ftPpKeObbjtg83qo9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968336; c=relaxed/simple;
	bh=hPQNPdpnKb122Yk3wg35bhI+hlgYUc4H8HXP+rzOa3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxFOCIAEpT1KJx2dizrD2S5rLLDEerrgy/R3ML10ogDb69/r628wS0Rn3FyPcGjTq8tMVlO4jVFjJFtWC0+jaQpTi3RAeLxGRxDH+SuPM/imbz7DesEEzArBw7Hnl9DyDw81fPx5rW/uYUpSZDjH0Im7D1SDSyeyMUXlMbwgKOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqJ2KFRN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqJ2KFRN"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so7158948a12.3
        for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 00:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737968332; x=1738573132; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/+29q3aJYg5FUNszWdiS/6NR4U2E1gTZv4qESBbDms=;
        b=HqJ2KFRN75V7MpnJuC1MX0Ud4jnTYqVFF89PnQvgCVSUHfL1RAoUZxuvQJlLZiFUfV
         FV4XXXUZDG9h48RkEmSW2z5cFLXXJrSLteDlPV/YRV3/Wv8ARXDvkqUW67dmpjwKpF1C
         q01pa22BAu8HMofO5KZEHzNC+wU/t77IvzvS1gz94ez5/dy9JkY4bIJv22PiS570lgem
         Qgm/4PLy22uzcCKw2LLbx7H8FHCZWk39/+rg/jr4d0tmT1g8V2ox+I2Dwdck6b42sQAl
         L0GOIL9nHsS2U5tX+gMWdwp728dn6OhonBHD4nfYrduwG5Xmfzp2p4DeBajb1s8sPffL
         uH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968332; x=1738573132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/+29q3aJYg5FUNszWdiS/6NR4U2E1gTZv4qESBbDms=;
        b=Yhp/q68N/t4wF0WdPP6U8bFKBBu/qg8fp//TckqW5xseR/DzL2Xu8JSeQ5PYLowFpY
         ClJyUM99cDcZZ5tTJay7JAYLSIdbfHhiexJxsvBFL2Xexr8jK62zunCQbrk6omnlKZXl
         V25/3jObbpg2JXjEO85ttLOio6DWldv0CEntakDRhB6oMFr1Len9Kicp3RD2oFC7zTjx
         eGpipQFbASq/2J7dJxPUgDRBzHj+oTB/okOD9srj37w5D7WOUoZEgAXGk2rBsN+/CM4f
         0YakhQwckHYqtn7Hnr5uCOvTQokR/hsddWSUfG6ZxIlaiyZ1DFPLx6uSaEtUyqfVDYTz
         ZRsA==
X-Forwarded-Encrypted: i=1; AJvYcCWEqlOx/kr8GbwnYCwac373NBSVfaFXEhmmNDP2/Q7hZtmfgfhdJL1dBBWMtZboG4hATxoBf/mq5KTfOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMVsnCb7t1oVzX9rhefoTbz+HRjr37zioY8un+6nXEv/aN2pa6
	XtCvv7p3O9IyVJNf1h98ZZwy2EuEtO/0nLm71LnaoR3oO5B3D6lF+0IhByMkMWc=
X-Gm-Gg: ASbGncssCGB0OnBW2arq3L003R6ZflQbzpVnm5D2X0ZKXwveapCBH+N+OFN1vXLLPIs
	He3UV9NBOrimW1NtSoIS4f5OC4h+7BZzq5h21E/+nr0BSZKvGNPnJFSo7F5FEKD8bN+8bf4aYVT
	U+YkTHpEfYqgFr1g4unwAO7CQ+9KxaOTqu+uklM7tXw8go3aoNA9nQZQ2gnFVQTgLSSTQxoOSgL
	0zBsZ3rn5FgDvHuJMTi0buJdBA6YPQZzZN8rHvdAHFWSS6SARTTSgvJmkRSOHwgP0G3gFhnU69q
	slppFViB848/R/fF
X-Google-Smtp-Source: AGHT+IEuY2+SspxfDMaHf+BfUXNT4eZbrVPS2J6c7JmOp0oj4TXluMQD5/Otb9+8NR1ym+8zELGlbQ==
X-Received: by 2002:a05:6402:26c7:b0:5dc:101f:f1ca with SMTP id 4fb4d7f45d1cf-5dc101ffe83mr14343034a12.14.1737968331888;
        Mon, 27 Jan 2025 00:58:51 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186d8e2dsm5017648a12.75.2025.01.27.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 00:58:51 -0800 (PST)
Date: Mon, 27 Jan 2025 09:58:45 +0100
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
Subject: Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
Message-ID: <Z5dKxZ-fri8RaTPo@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-3-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-3-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:22PM +0100, Luca Weiss wrote:
> For example MSM8974 has mx voltage rail exposed as regulator and only cx
> voltage rail is exposed as power domain. This power domain (cx) is
> attached internally in power domain and cannot be attached in this driver.
> 
> Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v2:
>   - Move MSM8974 mx-supply from "fallback_proxy_supply" to
>     "proxy_supply" to match updated DT schema
>   - Add fixes tag
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index e78bd986dc3f256effce4470222c0a5faeea86ec..e2523b01febf393abfe50740a68b85a04011293c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1828,6 +1828,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>  	if (!pd_names)
>  		return 0;
>  
> +	/* Handle single power domain */
> +	if (dev->pm_domain) {
> +		devs[0] = dev;
> +		pm_runtime_enable(dev);
> +		return 1;
> +	}
> +
>  	while (pd_names[num_pds])
>  		num_pds++;

Hmm, I think you should put the above if condition below this loop and
verify that num_pds == 1. Otherwise this would hide the error condition
if the platform needs multple PDs, but someone only specifies one of
them in the DT. i.e.

	if (num_pds == 1 && dev->pm_domain) {
		// ...
	}

>  
> @@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>  static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
>  			    size_t pd_count)
>  {
> +	struct device *dev = qproc->dev;
>  	int i;
>  
> +	/* Handle single power domain */
> +	if (dev->pm_domain && pd_count) {

Maybe if (pd_count == 1 && dev->pm_domain) for consistency with the
above then.

> +		pm_runtime_disable(dev);

I'm guessing it does, but just to make sure: Have you verified that the
power domain is indeed voted for off after this call to
pm_runtime_disable()? Start the remoteproc and when it's booted inspect
/sys/kernel/debug/pm_genpd/pm_genpd_summary to see if the PD/remoteproc
dev is suspended.

Thanks,
Stephan
