Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EE138423B
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128633; cv=none; b=uNr+qu0A8HUoZAVIoF/UJzb4mQld19Ct3g70VJ6tMOMcIVP3OD/1XHpa3ZxdBdZS/xPZwcBdFDQD77UMk/9LteZNGXUDByxCoxsRYOxOkucqDITiNW5GajD2g2tlXRSl43Bf/+nGSvs9Q1mcA5Z7+QVXL3UEWthuVrpOFSSnxuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128633; c=relaxed/simple;
	bh=ZTxCNY3HZlQxWzT/XhybbngDtPXeM9/mHZE+xe6f8uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCk7eAe1WjsXXtrIH822yifL0veFkn8m5jTzFI/lP77x0WBsv2empWy63B9KEfjenoSWBrst/T+xLSfjYqkwhthqRxNlUZuIYSl6fHEGvIy0YW29T6uFHhqQCc8bYfI/TgLomTyag1HRsFlwbvP0d1x/1iRIos9KkGfDsquMuHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nx+uhBkZ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nx+uhBkZ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a3be8a59dso542061fa.0
        for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775128626; x=1775733426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CTLIiuy4GwEXuXqqFRnPUythaJJJv+IJU5B35u3XdE=;
        b=Nx+uhBkZdOtyYft2LbXPdI9r1V9PPg3MUbkuVjvMcYgfwgk/m88qHa7tr+LobkYGXW
         br3QTQD/bn/1XxBJDibpS7ToCRAbaqgxmZIiVz/hdp93W1iGMrFc5WPUnAmVkUvPznVp
         ZXqMjTImnRlJh78gm348mvqD2s8IvNMJKWRy4SuCBaJlnhPMR9ZQyTtov+I+uRWPe/AS
         rtCbCIM69oDOK4TZQkZCeF2VPVJA60BZrN+1JR4I0rrBv1uiakQyQO0RQx5plaI6cgZr
         zEbNd0vBf5dq//AeCrt82PWnWXTm4DHWLANE1VUsI+VZ7RED1CKWGWviM/T+1xg0uXEJ
         xtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775128626; x=1775733426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CTLIiuy4GwEXuXqqFRnPUythaJJJv+IJU5B35u3XdE=;
        b=YtIpfgdMiUsALDLBRl2MCGF6RRJOJOGFWkdYXS2UbiRXoYQZP459lKmORt/lM4MgOE
         s2gcXGNisaBBQbHgBOy9Hj+qT8O+4ISxGPa1mC6MzKZapKBAJtodmX5n4fZ9tbS2RoeG
         54YT/q55rKrl/f6x2TmYGXSjtiwp/QFTg9ktjlwntx3rcH07GJG02DtOFanx/QHFwmBn
         ZEqwLuflxRuk6N8HvsYx7NoirEvUR1+K07wN98PcR/48efMSYslmkUtQGwIK+gVX2reM
         x1FiFaojViei0ZPoPNzAq8adlYPcUKTBd24Cq8Y2CwtpLpQLjW7biTa/KEN90lr/7NgC
         MDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmrDCfW9XFccwBDMugcW+FcK+x2HTbG35MbNbI/ePOC3Vzk8p8mdKtuxx6wmGpvbkjum7ISN8Z/I/VkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kRpq40LSiGSEIFTf/6NKmJc70/6AZfZ9tYi4PplKfoNMNFL1
	L0jyGTCTfkgsoZnnsheHrMg9iFvLx6lXSU/aDNId4EIkuy/nwqSpF3t8wsamAwcqz2U=
X-Gm-Gg: ATEYQzxQyeMpDYuCQn66+pNxXvv6Qb3gglRWURQ4lG8a6ZWQQhx38b037HV6iduLeD0
	koNPO1ItPI9c7N8tf4N8JosuYQcm1TINwNHAwLWVWBfmiDplVSRq7w0c5IFYCKoxnyUQbYiTsOM
	TX8EME7O8Nxd2k1S4kFiwNuXKKeKl8BN/n71xd7v3zSK+aWAy13egA8YYorI8Nb5hBnxTJufYuZ
	37SUQ+YmoSEyPZ5D9UjAHq0tioqnMGKDmzJDKThtZJzDcOubL+zAEAPJ0YVW4KdV139Cs9Ax1In
	wGJYSv2kO3C1Y1cuRQJLQSIjImsxztFiMXA4+U5qnZaWLHOMDGyhY+UBfvcDPDAuZLo1a/a9W5p
	3Cfu6U1VC8GL661IG/sDSaPWhjbDqs1PK4Xx2EQO1UqOi0zTZBu0/UbVBMBnkjRHQRI8SYpOhQ+
	oqPshyb2gYC6ask8ZPOlXUunef0n1MzHzgN+WSS6mxq3sNAqZCut4MBkfBb+7LPvOpe4o/PJKVT
	fff3A==
X-Received: by 2002:a05:6512:39d3:b0:5a2:b53b:a457 with SMTP id 2adb3069b0e04-5a2c1f27b2cmr1333288e87.3.1775128626156;
        Thu, 02 Apr 2026 04:17:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc8417sm617709e87.41.2026.04.02.04.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 04:17:05 -0700 (PDT)
Message-ID: <c099bf8f-7a29-4138-85a3-e2669807aca5@linaro.org>
Date: Thu, 2 Apr 2026 14:16:58 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 sdcard
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Alexander Martinz <amartinz@shiftphones.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
 <20260402-axolotl-misc-p1-v3-1-8934e9db6831@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260402-axolotl-misc-p1-v3-1-8934e9db6831@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/26 12:54, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The SHIFT6mq features an sdcard slot, add it.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 44 +++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 740eb22550724..b05f04a621e5b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -600,6 +600,24 @@ &qupv3_id_1 {
>   	status = "okay";
>   };
>   
> +&sdhc_2 {
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;

If card detection is broken and disabled, then likely card detection
GPIO can be omitted, no?

> +	pinctrl-names = "default";
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +	bus-width = <4>;
> +	/*
> +	 * Card detection is broken, but because the battery must be removed
> +	 * to insert the card, we use this rather than the broken-cd property
> +	 * which would just waste CPU cycles polling.
> +	 */
> +	non-removable;
> +
> +	status = "okay";
> +};
> +
>   &slpi_pas {
>   	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
>   
> @@ -609,6 +627,32 @@ &slpi_pas {
>   &tlmm {
>   	gpio-reserved-ranges = <0 4>, <81 4>;
>   
> +	sdc2_default_state: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			drive-strength = <10>;
> +			bias-pull-up;
> +		};
> +
> +		data-pins {
> +			pins = "sdc2_data";
> +			drive-strength = <10>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdc2_card_det_n: sd-card-det-n-state {
> +		pins = "gpio126";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	sde_dsi_active: sde-dsi-active-state {
>   		pins = "gpio6", "gpio11";
>   		function = "gpio";
> 

-- 
Best wishes,
Vladimir
