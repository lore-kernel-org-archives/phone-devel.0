Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF6350834
	for <phone-devel@vger.kernel.org>; Tue,  9 Sep 2025 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429723; cv=none; b=YkZcQCcV7XVqXfnuM8pbFRZgnKRC/sO+sordUS/eT6qtsGwvF8ke69kbSs+Cjz28oLnYkh3315P+sZpsoMDljIatJ0xtkHqNohx3BXwfcvDP+DBn0q+UbVO4Riu6FOGkpSATsWxo4VTuGAKb343qq3s6nN5bS8hJQhlnjxvnqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429723; c=relaxed/simple;
	bh=bsgY7rh+gKwr5R/hRyfwd6HenoPcPxCKRtCRo0sUJEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8xtEkeKaKgrzDGpLRJV1jctF1WvQ2EwDE0lua6nlVCdo85RkxsFo+qsILiOgc3LF4WKf580VMS2I/W1VtaywzDeiK97YS1FNylQNp/Hr86INP0Z/+lYK4i8f9B4qnZX67JRByOxhtUclVAi59sNroU56redTQaGBTubUy2KnSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIRRQXuL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIRRQXuL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so12974925e9.1
        for <phone-devel@vger.kernel.org>; Tue, 09 Sep 2025 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757429719; x=1758034519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh6sICtpOni7pPHKwy0WScwpr7pBDIpBX8GW9PQZ/sU=;
        b=UIRRQXuL9wQLBGLSUR+My4eFSRU/6nlGfVjTZYzPi4kBt5Z1/IF3+2hrIek/QmqIqY
         Ie4dOcjzFXDHQz+7pWXdaq+ooNgRSb4qp7K9eOI55/cfanrAifPPJFK62XmJUG+MY0Zx
         VNZnlcp18wD41JGADESJ9Hd3CPr1ldMAHKEab3Mirht2mbBFPqQHIuXa9wOjwKwFPdKN
         BADYACdeHnj2DkKhfswutgQtPaQTV/hftPSDZihCML9YnYU6cnqK6Q5HFCdxqH2Nim2k
         MAc/yEpVXGZ84T0ZpWvi6JrUb7eQvwwqNkoz54UokePwilmB1Vh1lzL/ltKoopFw9zlD
         DJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429719; x=1758034519;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kh6sICtpOni7pPHKwy0WScwpr7pBDIpBX8GW9PQZ/sU=;
        b=esgBnAnR14YZSQnmXFy322hr/PUTjc4uOVhROTe9+Uq3r9zNSV450z5sDYBDk8N/MU
         FNAZ0DbfDus5ipak9iydnW5xuKsXU4VAPPn133i7NhG93lqt+WJvTZMw83RODC4gyCbR
         9mTofJiKt8SKTTQJjQSCYJRwF+3npNDAxgcZwWWwjmf8LgTRzO2mf1DLVUAua83pcmrs
         rFazhEAKFRet3VMcX05nd51KcD6L0GwTXr0kTKrqamc2JDZK6MDwUeMO0FN8R9tDV04y
         MdrGlh4gaUzejtmTSou3ZZWkSWePXbCItwM4d7Umc014FnMsNWOcWts3pm12QXt2rXiC
         QLsg==
X-Forwarded-Encrypted: i=1; AJvYcCXT67oXI//+ZDwmwND/zT8ILcgkuDhtn4L+ugGPTTlaB+bnW4GnpdmdJH0b7v2ZtvxUyTQ+6MHEWWUm6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUx/PI9FJAOjRnOhdfLG1gUKJgi6SSF8sdRJ23K2havXEOqG5A
	zDsKWYec18vPPpXQUGbFf1bjioWemMS92m6cUw2oeoHEhG/ovjfCpzFsI6POUNIb1QA=
X-Gm-Gg: ASbGnctnhaqBVZ5arKoANT5EQHTgWXTI0y1e1Zvz8hmpVvHdiUY97jhFXza/8o8HmZs
	a5prxjOkjotA1/Cbw64NTnIBBnepGPdpbhqGgl3DYRbCsOjXF2J2UbTiu9BDrzJU+VEThog9cVA
	b5jMn6JcpW6Ho6wDGFXgdFpYsRfNBF5dyoKcdp8Mi3KxkmCPSuAio8wymIwxbAF8tpiv4a0ODCS
	fkkpLkFTgxmWmGoyok5bT2MUIgzx1B0swR9tmC/YKHiUSYByG2vMQOOy++FY8kKhB3XMQ7ZLJhq
	JUZMLelMnJ+5IkUVyfX0O2jbwbhtfz1+xf9kBTZbZ4L5sS63T0fb9xYfkYcfPXcalQwg5uSTQdt
	D40ZKlD+na8HQkeOmPFhXgRoG8EmuKYlqCtEn1xA/EoXNse5d4+7AtSPVMwMOgJlVQcIEJF+M
X-Google-Smtp-Source: AGHT+IHF//r0eZuOxdds4J0jqsyuvOe+I50SRonaJrToZTRbRRX30MnSgC/CHqLYpSg+fAK78OdeXg==
X-Received: by 2002:a05:600c:6289:b0:45d:d1b0:5fa2 with SMTP id 5b1f17b1804b1-45dddecf665mr106302705e9.19.1757429719382;
        Tue, 09 Sep 2025 07:55:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:25ab:4e12:265b:4b6? ([2a01:e0a:3d9:2080:25ab:4e12:265b:4b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45deff68b43sm12681405e9.2.2025.09.09.07.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 07:55:19 -0700 (PDT)
Message-ID: <f865aee6-b9c9-432f-9db1-1ee9576ced98@linaro.org>
Date: Tue, 9 Sep 2025 16:55:17 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] Input: pm8941-pwrkey - Disable wakeup for resin by
 default
To: Luca Weiss <luca@lucaweiss.eu>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Courtney Cavin <courtney.cavin@sonymobile.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Bhushan Shah <bshah@kde.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
 <20250909-resin-wakeup-v1-2-46159940e02b@lucaweiss.eu>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250909-resin-wakeup-v1-2-46159940e02b@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 15:23, Luca Weiss wrote:
> 'Resin' (*Res*et *In*put) is usually connected to a volume down button
> on devices, which is usually not expected to wake up the device from
> suspend.
> 
> On the other hand, pwrkey should keep wakeup on. So do not enable wakeup
> for resin unless the "wakeup-source" property is specified in
> devicetree.
> 
> Note, that this does change behavior by turning off wakeup by default
> for 'resin' and requiring a new dt property to be added to turn it on
> again. But since this is not expected behavior in the first place, and
> most users will not expect this, I'd argue this change is acceptable.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>   drivers/input/misc/pm8941-pwrkey.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> index d952c16f24582bfc792e335a1fc954919561fa87..53249d2c081fba8b8235393e14736494bf9b238b 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
> @@ -60,6 +60,7 @@ struct pm8941_data {
>   	bool		supports_ps_hold_poff_config;
>   	bool		supports_debounce_config;
>   	bool		has_pon_pbs;
> +	bool		wakeup_source_default;
>   	const char	*name;
>   	const char	*phys;
>   };
> @@ -245,7 +246,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(pm8941_pwr_key_pm_ops,
>   static int pm8941_pwrkey_probe(struct platform_device *pdev)
>   {
>   	struct pm8941_pwrkey *pwrkey;
> -	bool pull_up;
> +	bool pull_up, wakeup;
>   	struct device *parent;
>   	struct device_node *regmap_node;
>   	const __be32 *addr;
> @@ -402,8 +403,11 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	wakeup = pwrkey->data->wakeup_source_default ||
> +		of_property_read_bool(pdev->dev.of_node, "wakeup-source");
> +
>   	platform_set_drvdata(pdev, pwrkey);
> -	device_init_wakeup(&pdev->dev, 1);
> +	device_init_wakeup(&pdev->dev, wakeup);
>   
>   	return 0;
>   }
> @@ -424,6 +428,7 @@ static const struct pm8941_data pwrkey_data = {
>   	.supports_ps_hold_poff_config = true,
>   	.supports_debounce_config = true,
>   	.has_pon_pbs = false,
> +	.wakeup_source_default = true,
>   };
>   
>   static const struct pm8941_data resin_data = {
> @@ -434,6 +439,7 @@ static const struct pm8941_data resin_data = {
>   	.supports_ps_hold_poff_config = true,
>   	.supports_debounce_config = true,
>   	.has_pon_pbs = false,
> +	.wakeup_source_default = false,
>   };
>   
>   static const struct pm8941_data pon_gen3_pwrkey_data = {
> @@ -443,6 +449,7 @@ static const struct pm8941_data pon_gen3_pwrkey_data = {
>   	.supports_ps_hold_poff_config = false,
>   	.supports_debounce_config = false,
>   	.has_pon_pbs = true,
> +	.wakeup_source_default = true,
>   };
>   
>   static const struct pm8941_data pon_gen3_resin_data = {
> @@ -452,6 +459,7 @@ static const struct pm8941_data pon_gen3_resin_data = {
>   	.supports_ps_hold_poff_config = false,
>   	.supports_debounce_config = false,
>   	.has_pon_pbs = true,
> +	.wakeup_source_default = false,
>   };
>   
>   static const struct of_device_id pm8941_pwr_key_id_table[] = {
> 

Thanks !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
