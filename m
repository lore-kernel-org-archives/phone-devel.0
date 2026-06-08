Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB8C34751D
	for <phone-devel@vger.kernel.org>; Mon,  8 Jun 2026 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938059; cv=none; b=DBxW/2qcu7XPOvsIqQUNcfUzuQWjrx+TcGxzDvNQvSdiF5RBvAc14/8V7pykJrWODMwWIgW3+nxw0bW3dTVTVbeaQyLHNP2Pc8Dk22+dymbu/hwWMi7Ge/+iEYN5Js5ctPCM0VOdKWiR0ZWlK8fw88Hd8YUaqVJumQqW6WX8vPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938059; c=relaxed/simple;
	bh=5mvOFr57QdmCOZIH10NBkLPJN28o5FUmRnig68cIKyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zx9v4AgeI4VxNj6b7vbygqjo42tEBq+G9+Wd71WDHCH7zkP3QZKoGhjllANODJM4wmVFaDgajx6P7Geg/RUReiow25v6BvJgc5WWWXRdfYqOClGcRiUijMzLLfQrdC06YTN5yCdah6MGmOttLNbEcgK0GszN2wnspa+ps2VNwIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ud0bTWau; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ud0bTWau"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69170548d0eso2860911a12.2
        for <phone-devel@vger.kernel.org>; Mon, 08 Jun 2026 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780938057; x=1781542857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQdKRDGLxWtcVy3dVG4sqJ3R7C9ssUG4+sQ2kF3IHpM=;
        b=Ud0bTWau7S3BJewbN5Fy5qTvEsIOR/r7cZkhaC7o0VW4/z74Ppt5tjMTUgfDX3AeSW
         dWEKRrMC8Rb3/2OqbsH280+0OxDEHe3RMkfJU+QLhz0n5QdXM5CJoNcZ3lrD51xO54Qp
         /9BB6mCSUdfqT1G31t8dIXyFL4q7MRyRkn3LkVO6jIR7NgzB4pMPRickZdvVHnd4ockx
         cY+Eu4U8PTuXVHh8R9oPbEG700qTTo/ml30aXVgi+4XebMoI2GYSpjwL5lWxtIQfylV7
         B3V7MVftMt5folgL0NJ6vUcD2E87CJe3JgIOnAkq/QhOF8j/G/qJtv/qSfriNgnOwaUt
         V1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938057; x=1781542857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQdKRDGLxWtcVy3dVG4sqJ3R7C9ssUG4+sQ2kF3IHpM=;
        b=LIR3dTJQQrG9p0eUgZiNAUK8vv6xRg5RKOaD5cBV/0RZxJOifGqduyBasXSSE4pfl8
         MVKKUD4Mon56F6M6/2HSY+kZ9zmzpza+ktGIMZVExb435rzlGkK6Fg9N8gt0xUT6s+HM
         xAOgEW6sJsbcx+wQPmEhYFXHrZe02ihGEJZDsp6oENFwf/kRYa8P0xvhF9p++F945me0
         AmpzfE7uUxqeCbtT5pKGijhFUkpcLoYAUQ/SYlAkIp8/VGdpULL7v0a77ptKsM0QUjSw
         BvmLdjd1sQnEcxO120DTEa7JsVAQ8zUOcWesoMNzMB/S8WkzsdlOfN0pl6fQGjxT3OLK
         jadw==
X-Forwarded-Encrypted: i=1; AFNElJ+HdkCsjI8d2XlZTNGn2MStWtGyoVI96LRB8cTN6dxtXWJ4DCdX3E5vRXARNzY77+pYRfK767K1Sod+yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFBTrijaeT3xbcF6r00xZhuHOmZxdc1KVYddRtbphagpzq6REn
	QjfqsjpVWVSTDl/vxx1iI1Ii1N98l9H3qq8jJiDVU4dTENjDewAwRCTFIIkt+vn2d8s=
X-Gm-Gg: Acq92OGSU1RYHS+MZtx5D/wqkTnEmB+qDKIXOF7gqtGdluqP+AMwsdeMxgbvCE4pJtZ
	g5n0Nk0RK+hXBo+CH6QAiZCQ0Jn33M6uVUeN1Q4rDHo98ezce/qwNfy7gckdo5xLdfAQvfQVuF8
	EIVysUp6h0QYopr6LBS+Hmf9FViIguAJLuf6V5CcKEvIpDA9Kw/G17i/mOwdZNz6ChIvpwPHlWC
	zFhr1dc+KJ8/AcOu64LuzQN26vpjKM0Btbcuv+u+2h7adxWF1ffAuZDT/LOGozb2KCIw1+EDNr/
	3JHcyF/GaWvvTs3PRn5/dlEQefckYGaopq8xHh6uOA5pZJJbkZkT14xU6j+C5nYkVlo/nmOnbIK
	2wBayXOcy80AyiqHBhYUvUzlzagWS3izniatLZgv2nFLIV833IGc4CB7KdO/J6qrvmbv16f2GDU
	VQCOGw/VR4GZDUruika4AZTZp+S009ekOAmCysyPD1orfd1aY2q3KIJxJAGnoW7xdavv1dPB5/a
	Q==
X-Received: by 2002:a17:907:94cc:b0:bd8:f4bf:76e2 with SMTP id a640c23a62f3a-bf373afb82bmr653512366b.48.1780938056680;
        Mon, 08 Jun 2026 10:00:56 -0700 (PDT)
Received: from [192.168.1.36] (p5b29e032.dip0.t-ipconnect.de. [91.41.224.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm7454030a12.0.2026.06.08.10.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:00:54 -0700 (PDT)
Message-ID: <9883eec4-84af-41f7-abc6-46531e44e926@linaro.org>
Date: Mon, 8 Jun 2026 19:00:52 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: qcom_spmi_gpio: move PM8998 GPIO from legacy
 pmic driver
Content-Language: en-US
To: petr.hodina@protonmail.com, Sumit Garg <sumit.garg@kernel.org>,
 u-boot-qcom@groups.io, u-boot@lists.denx.de
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini
 <trini@konsulko.com>, Rui Miguel Silva <rui.silva@linaro.org>,
 phone-devel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>,
 David Wronek <david.wronek@mainlining.org>,
 Jens Reidel <adrian@mainlining.org>
References: <20260605-qcom-gpio-v2-1-c34093041c66@protonmail.com>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20260605-qcom-gpio-v2-1-c34093041c66@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/06/2026 17:09, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Move the "qcom,pm8998-gpio" compatible from the legacy driver
> qcom_pmic_gpio.c to qcom_spmi_gpio.c. Enables on PM8998-based boards
> (sdm845: SHIFT 6mq, Pixel 3, OnePlus 6, Poco F1, Sony Xperia Akatsuki)
> the Volume UP gpio-key.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> Move the "qcom,pm8998-gpio" compatible from the legacy driver
> qcom_pmic_gpio.c to qcom_spmi_gpio.c. Enables on PM8998-based boards
> (sdm845: SHIFT 6mq, Pixel 3, OnePlus 6, Poco F1, Sony Xperia Akatsuki)
> the Volume UP gpio-key.
> 
> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Casey Connolly <casey.connolly@linaro.org>

> ---
> Changes in v2:
> - Reworked per Neil Armstrong's suggestion on v1: migrate PM8998 to the
>   modern qcom_spmi_gpio driver instead of extending the legacy
>   qcom_pmic_gpio.c.
> - Dropped "gpio: qcom_pmic_gpio: implement standard pinconf parameters".
> - Dropped "gpio: qcom_pmic_gpio: don't reset pull on direction change".
> - Replaced with a single qcom_spmi_gpio.c patch that claims the
>   qcom,pm8998-gpio compatible.
> - Link to v1: https://patch.msgid.link/20260601-qcom-gpio-v1-0-e24bcdb35da0@protonmail.com
> 
> To: Sumit Garg <sumit.garg@kernel.org>
> To: u-boot-qcom@groups.io
> To: u-boot@lists.denx.de
> Cc: Casey Connolly <casey.connolly@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Rui Miguel Silva <rui.silva@linaro.org>
> Cc: Petr Hodina <petr.hodina@protonmail.com>
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Cc: David Wronek <david.wronek@mainlining.org>
> Cc: Jens Reidel <adrian@mainlining.org>
> ---
>  drivers/gpio/qcom_pmic_gpio.c | 1 -
>  drivers/gpio/qcom_spmi_gpio.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/qcom_pmic_gpio.c b/drivers/gpio/qcom_pmic_gpio.c
> index 4458c55cd3d..6215f794e09 100644
> --- a/drivers/gpio/qcom_pmic_gpio.c
> +++ b/drivers/gpio/qcom_pmic_gpio.c
> @@ -344,7 +344,6 @@ static int qcom_gpio_probe(struct udevice *dev)
>  static const struct udevice_id qcom_gpio_ids[] = {
>  	{ .compatible = "qcom,pm8916-gpio" },
>  	{ .compatible = "qcom,pm8994-gpio" },	/* 22 GPIO's */
> -	{ .compatible = "qcom,pm8998-gpio" },
>  	{ .compatible = "qcom,pms405-gpio" },
>  	{ .compatible = "qcom,pm6125-gpio" },
>  	{ .compatible = "qcom,pm8150-gpio" },
> diff --git a/drivers/gpio/qcom_spmi_gpio.c b/drivers/gpio/qcom_spmi_gpio.c
> index 1a7c7c48dfc..8c3323b23b7 100644
> --- a/drivers/gpio/qcom_spmi_gpio.c
> +++ b/drivers/gpio/qcom_spmi_gpio.c
> @@ -751,6 +751,7 @@ static const struct udevice_id qcom_spmi_pmic_gpio_ids[] = {
>  	{ .compatible = "qcom,pm8550b-gpio" },
>  	{ .compatible = "qcom,pm8550ve-gpio" },
>  	{ .compatible = "qcom,pm8550vs-gpio" },
> +	{ .compatible = "qcom,pm8998-gpio" },
>  	{ .compatible = "qcom,pmk8550-gpio" },
>  	{ .compatible = "qcom,pmr735d-gpio" },
>  	{ }
> 
> ---
> base-commit: 1f89ddd61cd8c27a3dc1fc7edbeccb55d424eb72
> change-id: 20260601-qcom-gpio-98e85ab22647
> 
> Best regards,
> --  
> Petr Hodina <petr.hodina@protonmail.com>
> 
> 

-- 
// Casey (she/her)

