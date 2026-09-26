Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF265231842
	for <phone-devel@vger.kernel.org>; Sat, 26 Sep 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432905; cv=none; b=PwA1zTHvMfkWFSDOWeOk2Zl8oQL888/Z4ZEGLk+meVUeyDUQedMEO/uTty94qMpklLSZnOWL6ZryjBomyOZ0tatlT5Y6v3I7bn8RrctTjTWyqysYdXuaEiuqvf7qu96B5UrfgWnCg3NV1oEHBMtT9bhah+9BsBSrUASyrWspICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432905; c=relaxed/simple;
	bh=7vUh66oXceOvBZh+BHUwEREpPut071+FDoigXD4wyck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUkLi+nE15U/7/pqqEFoimtMGH6QhjcBcxGhXX2f4lVmmH9+4wHKBE6YERalHmFwA0V/UcYT/+6CoJPMHnhyYzHRVaKpiH9U1ArHwZrwuk6bWEQU4pP5tBAXu87irSGgFJgLiPDBMh9zLixcRsbS28469myRM7nEkROjCux/nhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EKyalSxv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EKyalSxv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso964925e9.3
        for <phone-devel@vger.kernel.org>; Sat, 26 Sep 2026 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432902; x=1791037702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRyn178SjOYN2ExubyMZSe0BAzVjg4ClqLKh84+ypJ8=;
        b=EKyalSxvq0hBxCCIXaymCWFifaWylDdddOEbRxrZiziaYkZky1xJTW9IL3rbKuo/QB
         /S2h5nDhk4I9Y0Xf4OwFv3P8bAHzQVaPOyuTqSNe5iM+tBdzn4hK43R2ckKqC40FOY9U
         VMs59fbopJ9IuxAOv4dTpXeQSKdsWc7AgHKc3wa1ZTwIneNplp5bOBeZmL+keLfLK3+P
         yWFMbpWx+Zi/CyxScfdOPeHMyJEWF8CpEJQt9J51hjZn2Fk1EF7tk0IRCH+PKci47yzB
         ve2LhHsK1tNbA4Q48iHI/1+gJ2c/Xqby2UeoSctSgEd8J3MvSvtYq6sQC3E8qm6W9nFk
         kqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432902; x=1791037702;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRyn178SjOYN2ExubyMZSe0BAzVjg4ClqLKh84+ypJ8=;
        b=1cB5IKP5yA167tzJgjHoaeIZ51Y9c9zv05wEWonz8FOUWYmxz5XcZ+zFOdIOimCRmN
         aE3bnCftI5pbVcubeZlest/YTclqol6tCLUapQFudfJmSjJMz7WzI/JBiYAXoxRAGOZa
         +q+PvqhEylFiiQNFjGhUgZScpTbpc3B+6rdwGM35+U+T88AYQofK2+5YESRsB9/kNBL5
         UfoFqSgz43d/oaWgfDCTl0KjKLhoCWPuHqI/NdygKEQ/wqCxh2Shs/ZLETIIqnTOrQwU
         WKgm9M2RqnJbk9u+awSkAC5x5sSUgDP9ikXosIXOWZkGd+mLQBtKsuN5pokzrzdCe3po
         +Aaw==
X-Forwarded-Encrypted: i=1; AKwUvBybemG/y/Asb4nkR+cc0u3eDdnRP6+g2vZ4TqB67Frwo2ZTrNXDuaODGaG6IjGmciNKhh3vBPB3WNLgVw==@vger.kernel.org
X-Gm-Message-State: AFuF++k4znG99VqBUH5xC2RNs2DB1omsISXgXW3libDEaEsk7BANEhoX
	QhVVuxk/zaD4aiM3ous/1MCJH4NgmcEWacTCa9cQiO30SiOX+D6fbQTM78IAH6oLoNI=
X-Gm-Gg: AYBFou3Xz4w14yzkHv0awvMJ4Ekh+Dtb0N4gsHxaltLuTqGQfu1U+/HKw0/yKGCsHpH
	cet3823IuLaVSr/AtzO+9aUjaO5eFhcD2pjTYJgabddRMgE2gqr9I2eOOeNAtfR56rLcTEN1Hx6
	WyNv4Ai3JGbrBvuQZETlEcU8LuLyoqau8hYUpxicSfvWdb79x478vP7CljyRbErz9vxqee5JZ6T
	1YWImCuPzciQr43KM11MkwGm6FP6LRwxOkUrSgH+YsnuxUpAJYnu48kVOZ1ubPJqtwob9k3advS
	EQaa/AV2bfOMwLAhcRZYUYcUvhPTksXsJJ1w0J3dMFVVvq1qy0SIJD0rv3GlWBdADPaAFPSvJXT
	CUdJHTsYVAbfYzKCiFwV90Ija5oHff4/gtnA2QNZQ28BmgiKlZMX84KxhToT2BpabRktayJljeT
	H6c26cb/2BN+ZT6O8Ut6fOBE5h36+HyyjqhbS/WcTNbrJTkH4oYS9bGsEP9pscw9Yo6nZOdSvXj
	8Nbbg5Vs4ddX4N+wVhEkg==
X-Received: by 2002:a05:600c:4f12:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-49fe6700d0cmr169059275e9.28.1790432902328;
        Sat, 26 Sep 2026 07:28:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4271sm320463865e9.5.2026.09.26.07.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:28:21 -0700 (PDT)
Message-ID: <d2a29116-967b-4ca1-a6de-510d68afec0b@linaro.org>
Date: Sat, 26 Sep 2026 15:28:20 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/12] arm64: dts: qcom: pmi8998: Add USB Type-C port
 controller node
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add the pmi8998 Type-C port controller and PD PHY device node.
> 
> The Type-C CC logic is at USBIN base 0x1300 and the PD PHY is at 0x1700.
> The node uses the 'type-c-change' interrupt from the USBIN peripheral
> for CC state notifications, plus the 8 PD PHY interrupts, including
> fr-swap.
> 
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/pmi8998.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index cd3f0790fd420..878e577c667d0 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -24,16 +24,43 @@ pmi8998_charger: charger@1000 {
>   
>   			io-channels = <&pmi8998_rradc 3>,
>   				      <&pmi8998_rradc 4>;
>   			io-channel-names = "usbin_i", "usbin_v";
>   
>   			status = "disabled";
>   		};
>   
> +		pmi8998_typec: typec@1300 {
> +			compatible = "qcom,pmi8998-typec";
> +			reg = <0x1300>,
> +			      <0x1700>;
> +
> +			interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "type-c-change",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +
> +			status = "disabled";
> +		};
> +
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

