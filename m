Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E32BDC17
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842768; cv=none; b=u2FNsZGid0Z154cPmIafRSOtESL6NrpiX5pNPy522pFIgK2ir1wXJozrn6nxpZOntyJr2VhJwhvSh51TNm4OqYgdkIbyWvlYn99NS7lcvS7a9RqSEUZmltRCqZmV3z5zTkTNTMlUL9qYBh6w/fo7bV2hpMUF9CN2Gv6WTT7iL/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842768; c=relaxed/simple;
	bh=SGa/qh4yqBk9YT7vZT4NgomOg8NyvkoWxPRjILGTgcA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hFX9gcTkW/PtgQ+KRUbed1VK9+643mXojzjfRqoS2Crs3VjgklvoYlQtIBdSfLt9tPC7p1jEaPGkMuWBOiylO/Rfi9fbsb3Gs0cgBJlXsUrMB6JKawfnFRU0xqo5f7CE7ghHwm3XlSIbAKCvggUlc5GBmAh0puArtN/NRk1+BFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nn6ZUaW4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nn6ZUaW4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so696581f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750842758; x=1751447558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2H8SuiQEJ7WkLp5yCfudYKtOnP9Y7N1G4LI/FEVL04=;
        b=Nn6ZUaW4cBGupWi7NO/CphA0HwSWdqVxGGwdQHaV9XSqLrYAGwz+YGncIZgKEEiwRR
         mR74lZksxPoVGcmE37mo+/v+qY/7O7Ys3ux5SMVD95rotxNtzFBDTVu9vx+yt7a03KQ2
         JdHFf5t2f+DJE87hdJVA2baO7rmTmNFLRPCJmyK5QD0FrQ+ph7+zK4UatYvO6cMaOY0E
         SLOGn0JIboXUe9PM4Nf/A5nJc/h2CeBd46S3OsvMvjcoG2WMx/OYTq3NLoU8ArQPdYm7
         Aizkp0V+0m9izHApjGTUxcCDduRjrduIeGvbdR0rcsEyNEGNf1CdyzSaIvJYsbcfya+0
         MT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842758; x=1751447558;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d2H8SuiQEJ7WkLp5yCfudYKtOnP9Y7N1G4LI/FEVL04=;
        b=bcrTUJXmkfjGNzyBI4+PjoiGLhoMo9OSSt07SI8SCp5zLrlbrNNgD6VW7i2nXPfu0N
         2j3Dp6QSn2PRztw/d133+fObBQgrfxEaOcpLx1UTnHmwcvwbxGNoP0fYlwTlO2cKlpS5
         yoUOtu0CE0JXcYrSQoKDKP+RbpZAP8Zp0aNHD0FmtxCW5fsUeOim6seCtp8s3lBUumlA
         B+lO9s3DeMHSlgnvYf7NfGKQiPLI2IApAA8mHc8OM7jGSPpXcwvoRybnTD463XsbpPzi
         0BGCAcWRFm59kYv7CVd2+gXpw3CxwsMkNd6vR+TLBNSU3innmdxogao4GWn20G5SbtRm
         5TrA==
X-Forwarded-Encrypted: i=1; AJvYcCVaFjvgy8UNiVn+f/omgMYj5KoIXZ1yb07jyARjuP2Nvv/kI2PQXsw7n606ISR+bJ4ofT+UWCuDrjHqzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycUq9Bewq8znm+sG6I2L+zsC7g/lf6l4dj70MkokbXWvrSeqAM
	QYqV9mIJGRrj0iCtBocORwn5EsvbNtOkrtdlF1A08pgVk/7HXdcBwRnA7jFyhmyxp/c=
X-Gm-Gg: ASbGnct1ieiEcOANK6O1lZl2nQA+uAA3GkicYF+DxiNXYVSpTnrAmM3i1NMfiJewmSd
	SqQ3TeObG+obVIUg9gZSYk7bugC0E5frmSBptN4+TJI8jGanQ67GB/L1u2XsL0x51o5U3F6EMBX
	sLmrzf/EPiLo5dob57z+x3vFh3HhRyZVx4jtUYnC4PkEFh24jmMm9hx5Hb0uN8JqVBpV1I4fuwj
	4OmLCZpiG1w5urCSf/JeETZMHns556W0YuwOBcYPGljmS8X4Ir7qjb7gaOddlg5o0WLerXHwYZQ
	mCnRkpu//gX54+yyjOtshCftP+zwFOpI7oDb+NGB4hRaI2CSpQz64836jdNfJYSoQgu6rCccmQl
	Kfozr+q4E2feaql8Xqa5d5e2EnRfwrAf1K1OG
X-Google-Smtp-Source: AGHT+IHuOLH1/60wIoa8V0u6vvKa/s0mo8C3945entGfnua63X1EflGYum3E/5TURPbYBrq1UMJvGw==
X-Received: by 2002:a05:6000:2b10:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3a6ed660d0emr1180144f8f.46.1750842758503;
        Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3df:bee7:215:e1a4? ([2a01:e0a:3d9:2080:b3df:bee7:215:e1a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6fa2sm13686285e9.27.2025.06.25.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
Message-ID: <13745cf1-10ca-4014-939d-2bb4224ecfee@linaro.org>
Date: Wed, 25 Jun 2025 11:12:37 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: pmk8550: Correct gpio node name
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
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
In-Reply-To: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2025 11:11, Luca Weiss wrote:
> The reg for the GPIOs is 0xb800 and not 0x8800, so fix this copy-paste
> mistake.
> 
> Fixes: e9c0a4e48489 ("arm64: dts: qcom: Add PMK8550 pmic dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/pmk8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index c7ac9b2eaacfe6e8363448d9d2ffb4ac8f5f4dd2..583f61fc16ad570972ac166aef12183382ebb4c5 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -64,7 +64,7 @@ reboot_reason: reboot-reason@48 {
>   			};
>   		};
>   
> -		pmk8550_gpios: gpio@8800 {
> +		pmk8550_gpios: gpio@b800 {
>   			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
>   			reg = <0xb800>;
>   			gpio-controller;
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250623-pmk8550-gpio-name-3fa2e349d567
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
