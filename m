Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718F30F949
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768297712; cv=none; b=a6WXY2TC23skc2ugeKVbOconadRDIxeHMNex5ugszJg1dWVM6Iig9wzZ3iNDEHlbbVhkyqYkY01+s4TCl4v9Wl7qNiHXW1iQ6hp0VOIJyg7uWcMsxheUrfbnw1UHY20mjmqvaO7U78pDNBv00J/te01WsyaUH0j2XinD5oCdJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768297712; c=relaxed/simple;
	bh=V/o5Of18SvRD0bKbXw4V0vOAcDQ8q63HXxcM8v84mKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sO0K8LdmCaHtWd2XG3PEpbKVDKY0nzPkBDSxmWgFlWqKnl3Dw1J98gRTpph/53EGzMdCHlpFscb6qsOez6ZrsyRqTlas5XHtInvzLptFVG7vhd/rnnOMn07dvie9+KRrD49qRBDugEbg4wx82V8EMHsQtvT8gWPU5wOEom1wkiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkWag/L4; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkWag/L4"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so5447706f8f.1
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768297708; x=1768902508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2Z8ukA7DGkNaKMh98IZliPoCFBW4qyMMOnL2mucm+s=;
        b=LkWag/L4hiNvT4K8JRD4bDqe/MEbdVsbCBECkNr+ogHEqsMRY9Pe0vc4i5xIU9QdfM
         hHBSh5NRsrXAM/ApIN4zBnJ4NX+Px+nTf9oJa6pRVwohx5HF2nxhHKIKThRI3JOBlrxR
         0RJ+I4Gyd/yK24FuBKuikqtkcgcmfyChEBbsPHJM8ceG14OQg3eYlm6NMFuhssRKCh+B
         vDa6ySGevA8q9bRNVFiHH+m/cWbuiAs4u48pJbGyxQkah5387L6jaABGpAwz70Dvbc2C
         xo6OHXRAxv9v5h3dDnVp+qV0ccJDOqPzWYpRxhvuVhglib0fK5SlVSkEZ6v+nxFmg4st
         NN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768297708; x=1768902508;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2Z8ukA7DGkNaKMh98IZliPoCFBW4qyMMOnL2mucm+s=;
        b=BLh+9TFq4FGtrGDEzUg4jd2eliN4nYNdh+NJ92Iu2IFxyrSpzaH40G/rMC348YOHfu
         jXEOt9UYpnxVaxKNkqWR7D5r6xEkb9uBTSRwtXodPfkgu9hyM96Szl/slgSslWTamD/e
         +oq1ktSXkg/QZoweATzuXwz9w+PS2pOhodYtHZcy5E0H5HkxWUtVqaQD0WGpbqIhWXBg
         +7EMuJvfamR+7NPlfWnDBTGmUTJcYmdsq0pAnWI+5V/Yychx9jfpadjKYwQCqrR8cSW6
         wH8QbCxfWtWXrO6GsUbEz6ShISL7htloaVAa7yZLtPEQGG9HBGTUF5gt2ykBjMD7D7SD
         bfAA==
X-Forwarded-Encrypted: i=1; AJvYcCVbhOriEhyF3RUJvWJUCNRDlaVwCovaasXvBV0f/69Hurg2o6fagei61TMWk7QfilCW5jnDSELx3QZjPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo4YvcaxsIM3/ucSPvUWRJ4lSOENrRHh4ME03zAmZXyPbL++/A
	+YPFAqg77tVDccHvmS9P6sR++kkKeo6K7jGKtHOCg1xHltYgIDjliC3719vDatv5V4k=
X-Gm-Gg: AY/fxX5R0M5YvKR0wk61DpVPIL3LktKBWRm5EQEJVN8tfZL5eTLea8w0CRuaUSr1U53
	YYQJU4Jt/yoo/OUm48n6SZ000CJ3P/RLqIJ8N8HUv2Cv/hvKa9uH7mpbaoH6wQT6WlV4Z6h9Ru5
	Cpdr3oOsrXNW+n5cVe13W9CNcep655rK/R3aJaD/fOGHimRZ+nzO48h0OlSv5W9AVIGruRdQQ/D
	NjWO/nFQA2gYHSZYPafHzVeyuR1R1MoXu5iYWRbuTex5YR9OK2CsKXFjwIMZGaA8pu55lksjDWi
	FGG2V9vS7n1DwEH0wqWWhp3nCKNt55abu2ZF1QrxoEU8v9VJ2UHJ+Jw2RCiQQhhAB3elCM8HWEn
	CHtUFNU9nfr76HBSv/AcPEmHgmk1ny+58y7pEqQ6cn2VNV6XrZlNH1VAlp65FEZII5gJPDkHOc8
	T9ybekYllEIUAfN/hoSuGxAJw4AZFXZ7pIRTKoEGw=
X-Google-Smtp-Source: AGHT+IGumc07cnvuvZdEsZ8TB8xHT4uCRSU/r+hnR+gIj1yD1e6AC+ygZlvF1UnDCBE3zqYLhlTRvQ==
X-Received: by 2002:a05:6000:22c7:b0:430:f255:14b3 with SMTP id ffacd0b85a97d-432c379b302mr24048605f8f.43.1768297707921;
        Tue, 13 Jan 2026 01:48:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e180csm42176801f8f.10.2026.01.13.01.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:48:27 -0800 (PST)
Message-ID: <bfe55d1b-1b45-4187-84fe-9475cb90b00a@linaro.org>
Date: Tue, 13 Jan 2026 10:48:26 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] needsreview! arm64: dts: qcom: sdm845: Add missing MDSS
 reset
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz>
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
In-Reply-To: <20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/26 13:33, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> If the OS does not support recovering the state left by the
> bootloader it needs a way to reset display hardware, so that it can
> start from a clean state. Add a reference to the relevant reset.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> It efficiently fixes nothing for us (at least what we're aware), so I
> assume the state left by bootloader is good enough

In fact it does even more, perhaps in your usecase you're not affected but
it permits resetting the MDSS while switching the IOMMU from bypass to translated.

In the current IOMMU implementation, there's no current way to keep the IOMMU setup
for an SID without a cut, leading to fatal IOMMU errors.

With the hypervisor enabled, some IOMMU entries are left to fallback in bypass
when switching, but in EL2 there's no fallback and the ARM SMMUv2 doesn't support
mapping _before_ attaching to a device leading to:
https://elixir.bootlin.com/linux/v6.18.4/source/drivers/iommu/iommu.c#L3046
	/*
	 * Drivers are supposed to allow mappings to be installed in a domain
	 * before device attachment, but some don't. Hack around this defect by
	 * trying again after attaching. If this happens it means the device
	 * will not continuously have the IOMMU_RESV_DIRECT map.
	 */

Sorry for the digression!

Neil

> 
> I sending this as a something "which seems right" and works for us in
> sdm845-next tree.
> 
> David
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index bf2f9c04adba7..75c192eddc57c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4550,6 +4550,7 @@ mdss: display-subsystem@ae00000 {
>   			reg-names = "mdss";
>   
>   			power-domains = <&dispcc MDSS_GDSC>;
> +			resets = <&dispcc DISP_CC_MDSS_RSCC_BCR>;
>   
>   			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>   				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> 
> ---
> base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> change-id: 20260112-mdss-reset-06988f05af96
> 
> Best regards,

