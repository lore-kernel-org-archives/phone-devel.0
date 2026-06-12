Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E593E639E
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269330; cv=none; b=J3vnauo0hlTmjt5Et325yXEcyJ8DdYb0UERUYmPMFbwQyT40PplRl6QB3YE4SH/Q2gex39B3JAchHQJxgJC9r3X+5fVmbqBQzS+BVeRF5MQiagUzua2zO4bflYUlO9Q/bDj5zJY/8RMNyt9Z1l06oD27IbWVLVtQlCYfXuq/5O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269330; c=relaxed/simple;
	bh=BqUHj3OyZ5XxeRrjjNn/bQIx3mif9N/UHlTx3xGLarU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzowmuA6a37bzLlZCki1LzUTzJPP/K60V+tWxvvee2EOvvBXwJlvtJ0s5kcBerjYKUyN0nZf3Ix2p8OagHdGMVueL8nKeNLORbhLfC3vW+7GmCIgYn1pFq54S2oTHP84a57bWm3VrKJKyormbBzX6Uzjpl5KxkKb1JgAcWasRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3JrJzp1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3JrJzp1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa61284d58so115274e87.0
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781269324; x=1781874124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tJu8lRphXkXqJvq1i24dWnhS2R0S2p0Jn7kZcCwfdk=;
        b=d3JrJzp1rK+pYlXEoYfHHrAZrrFMeLEyTBdbfZaEj4PXKE6JhOgLNin5q8VAeUN0jk
         8ltg891K+veWmUjaztQQk6ms/FolX3DODDJw72SOQM6FPI4CfuNsnElI1xG7fXjcdU5w
         nT1ffqD6GaBj+OgK4gWnFWltcgyNiXqUlmRUuEylxP1ykuvnJlJR5QF0LMC3oWJB9Kx5
         Pc8oK7Mo59lxhbTQSwuC671tUTJOLufqLhgyW1CrhDYxO/lIt6Hwde1gU9xp2OdConkQ
         UZ8FuTHmwkTfp+gGRfjONWXVz6DEiFDn7uS4hYR4NuyLVDHdKVcCHjwY9SdxeifUKGM6
         1thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781269324; x=1781874124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tJu8lRphXkXqJvq1i24dWnhS2R0S2p0Jn7kZcCwfdk=;
        b=Bmt1RYDM63TkwP6eq0B9yhTiKRgB4jmzpdDjVc+QRLDwXQBRU6rr6dF+bYD82Dt3hz
         2gOebAKS1Kd4Bs/HGer8pLvpzv6pmDxsFx4jQBZOiTYXbExbohNY1xzTjDVgsXZWDW1b
         9q0hcvRw/6iUquBLdmJzIMMHPN36qmmth0TG5JXW72lYCHvXUBMynwSImQwM39xBKhHZ
         Zuk5tlsyya0okfm1uTwmKX2XZ7Ta4a80S+X3lLDIRByGErKM4ejPUnEetRriGMunOpy/
         KymJRpNpfSFm/Xkx/FNPpz+C/G9SYWn/8lXmhXJlZbjY2nsPzJb+A1ZHNFsA7nBkFHhm
         1w3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8K3XYDU37enn2y8rlwP/jh8SC558mfj1BQq69XOTFn0/HmK+PCGQaBaLfgU2/fke2JQSGZgj5Sj9ohaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB2EQY4WN0iZXAgxDK6K+bn6jUxC5jD6b7Nx3j1HCtwGjraiTO
	k1icWcXCw8kEkKiPVm5GMfXhAurfiPSbS0q0IZPD879xkM2+1m6ePTDN0Lgoc/KTYjc=
X-Gm-Gg: Acq92OFeZylorALVt+UB6k8KrC2tjyqUlhFL7rmoktbvJ4phLJWWR8p1DERU72bdXYQ
	6OpqWikc9Jjg5yRBo4HOKsr5ZKRYgkTveoyThWXi3DjVMWnXXcd9FPegCWxV+XcfsguGweiN0I6
	Uz7jwX3Ce8LkZIErtEfU5LFgS+RRneBCp504//c+ERNoPJE3qqfdA9OAioMPl5H30WaJ+eGlkXe
	5MYcRUs/5o++AefC5UCm2K1lD+Iw7PENxstujJjpNvT8JaAsw7ySXQ9609+qumLszBr+vg+rAta
	XMu4jd+O/O4aYJ23EuwdXP9BHAi9uKILzSvPMI1TRNwNitOnJN4lHxwXWN0B9SWlEKIHIYM/pli
	HHJFCYpBvMXvUWEdOths8xbvDtN/1EODkwUHDWB0Xi1gDYT+FDDC8zJFHN80dH0p7eTiaVMN0Ro
	l4xcGxQtaor49a1voZ93E3mWnQsI15gaQos4JpOvEwElefoLbNLwxz3nOmrxvHHvaUDjY+FaTJZ
	A06dA==
X-Received: by 2002:ac2:414c:0:b0:5aa:635f:7c08 with SMTP id 2adb3069b0e04-5ad2db710dcmr281855e87.7.1781269323606;
        Fri, 12 Jun 2026 06:02:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e170d4csm538304e87.33.2026.06.12.06.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 06:02:02 -0700 (PDT)
Message-ID: <ba610863-cd38-4c31-bd6b-0748c86adfc4@linaro.org>
Date: Fri, 12 Jun 2026 16:02:02 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: kodiak: Add camera mclk pinctrl
 definitions
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/26 13:55, Luca Weiss wrote:
> On different boards the cameras are connected to different pins with the
> cam_mclk function. Add the definitions so that mclk0-5 are covered.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 62daef726d32..903937947811 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -6505,6 +6505,27 @@ qup_uart15_rx: qup-uart15-rx-state {
>   				function = "qup17";
>   			};
>   
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio64";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio65";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio66";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cam_mclk3_default: cam-mclk3-default-state {
>   				pins = "gpio67";
>   				function = "cam_mclk";
> @@ -6512,6 +6533,13 @@ cam_mclk3_default: cam-mclk3-default-state {
>   				bias-disable;
>   			};
>   
> +			cam_mclk4_default: cam-mclk4-default-state {
> +				pins = "gpio68";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci0_default: cci0-default-state {
>   				pins = "gpio69", "gpio70";
>   				function = "cci_i2c";
> @@ -6578,6 +6606,13 @@ pcie0_clkreq_n: pcie0-clkreq-n-state {
>   				function = "pcie0_clkreqn";
>   			};
>   
> +			cam_mclk5_default: cam-mclk5-default-state {
> +				pins = "gpio93";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			mi2s0_mclk: mi2s0-mclk-state {
>   				pins = "gpio96";
>   				function = "pri_mi2s";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
