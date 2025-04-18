Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C950277800
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982417; cv=none; b=BUdGC4ag2K4IoscmQt+729697FGIsOplbIRibChCBdl7uIepy1xOzF0Hku3PZR1u5KtWPmLtYfT5ZC1uNE4oXsGp0igFkiqYlECw5R0rwZDrJYUmV4rXYB6qcY77sXO27w2nvAkcpS5+4XHsUb1l9GuJi5azvj2pGdwcA05CgaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982417; c=relaxed/simple;
	bh=b5jeH9RfjTDXcfZcMSWZB1gj325j1QVlUQZ24/q2PO4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gWwQi2Weq7TsudVewSYdD8v0lYb4jTD4GaYyNm3H9AY/0D/BhBFoXfOO0HGXVs8BePUM5BepBobRH8m4SxUrBeRECTQg0990+s1wmv3Z67TIKlzDfAYJO7CMSxJj6zXZIy7Ka4Lgh2BMCHiHPpDtPxEk0kI8JSFa0m6t/Bz0GHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M62bv4nK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M62bv4nK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39149bccb69so1879284f8f.2
        for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 06:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982413; x=1745587213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlCq1wzYbj7ZD9Rq/YTc1zUdp9qyRnppuYJZ74zXERg=;
        b=M62bv4nKGBmNXcvXESSWzM3X1nHS3cnrfhodg9imzGBGzstZboEwUq9uQjcn7Rg6z3
         TWSTuRh1+eexDYYSIZ5R6whlQWokO594ZXWEqkiPqHifoMXm0sHpQpqNoj+79b3Yc+8r
         XNrJRqXGLNarDXhVxDACf6cfZ2cDh6XwdBeVclIK1wLL9bwa2zGx3QxyKbwmbhgyat2J
         jQu8YMjlQnTGju8JSM4FSbX11YUAFviebNLpo540J0xo3TPRk65OCiDMEHCKtxqVK2lr
         H488iSK5jvt+BAYEXQBnrK9mobs6KOOFKAPKh8QIJ/6hIPQycUO35uXR5f1tNbMAgMeN
         4L+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982413; x=1745587213;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IlCq1wzYbj7ZD9Rq/YTc1zUdp9qyRnppuYJZ74zXERg=;
        b=t2NdvQbr8p29dBjNPKbnFiy83iJ0ArEwqlKG8oxAVQFRZsF1xIuGUUvlWbChnU9WTu
         nSQwxURtQIIq/lICM5C4K1xgKbLCkGK3SO83WCjFHNpskER31fh6j0qWouVWNvR93QYl
         T4ATz0oyG+X1/SINoiyjXlBKTzFelmcE73z7fck86Lf3n/qOFlaxifWwzwb8ScclvwHZ
         KX02J9PGySF89p8QaWPko38vi5gxsEozQcP7jTlVuwFjVAx1Swk+h/W93fg16bXjAF2c
         3Cxe2RCjQjz7YB732wFD6nRSXQLdOSbNZf48e3/Xdopf9NZJf+sR6mgD+CKgMIp2Mxc/
         eDyg==
X-Forwarded-Encrypted: i=1; AJvYcCV8n7CVzDqBnN43UDvk05MHSif4OMHJh4bValfBkeHbCKLCY2B0VZBZanoF/15Xeh6HBwqpMdmcw3Oddg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAr5yJGVLibHROjc1Wgsz/JwwWCXHnRAY3ya2+XHiyC45JMWw
	MmLKARcRXtlGx+hb4usQFz6fVcnxod4YDQWCLw8mKDJSJmpXFYt1PtIGwA4zpGI=
X-Gm-Gg: ASbGncvxJ3OUvWwwBaJQu6gmFSh0UxuI3dv0etEs1s5PKyTBYV/pNFmv3T9AYkWPABw
	NUE5imoBunBlr7zde82gQoqOK2/BaXTZEqs0krPrA4oegGjEEIwZEz/k94gy0+Ov9BYZs8wXYpR
	udSRkKj+4QPPDjTzTVkqOGGO/9qFUm/nWVV+gQjHkLv7aBl/2eLOU6IlpBrBY4CkYWrZqdpBG9X
	q5ujreymuIGp9jk75QNgP4nviMmfBxegLOIOWT0ZhoMru+9NXflG/+b1/pJ+/tEA6bzASuy2Q6P
	uiPiNSGloBaxtysOGjU5PXFaOIM1nhg8A4+sB6lzxvYuwAgnM/Fn4VaorzeRgtUEzgx6w5RLIYb
	oIKl5MmHzK3ZMqOAMc/VqsAzDRbny
X-Google-Smtp-Source: AGHT+IGbBFeZOLZYbp2zUOGKIZnaoUgakmGI4693FYmJp7XCaEK+0cCe61fN3YDSelUXfVPQxuwn8Q==
X-Received: by 2002:a05:6000:22c6:b0:39e:e682:e01f with SMTP id ffacd0b85a97d-39efbaf10e8mr2139190f8f.51.1744982413311;
        Fri, 18 Apr 2025 06:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f8ba:7c24:7066:d010? ([2a01:e0a:3d9:2080:f8ba:7c24:7066:d010])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433104sm2764052f8f.29.2025.04.18.06.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:20:12 -0700 (PDT)
Message-ID: <9084b75a-b4fa-4159-9246-824723df657f@linaro.org>
Date: Fri, 18 Apr 2025 15:20:12 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
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
In-Reply-To: <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 15:13, Luca Weiss wrote:
> Add a compatible for the QCM6490-based Fairphone 5 which can use this
> machine driver.
> 
> As a note, QCM6490 RB3 board is using audioreach architecture while
> Fairphone 5 uses pre-audioreach.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   sound/soc/qcom/sm8250.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a..ec5372e18a9c9bc6a80412adcc5ec473e9730620 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -211,6 +211,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id snd_sm8250_dt_match[] = {
> +	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
>   	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
>   	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>   	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
