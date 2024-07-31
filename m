Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2E31AD3E7
	for <phone-devel@vger.kernel.org>; Wed, 31 Jul 2024 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722423951; cv=none; b=Pm+zsw3Xm3aOaEacXptGjBmXQQJ4JTiRNOaZQ/pKH+r44HXPsaO+/Y8rgb/uq/3LY465tFI5gHax0fmPFfYnP6nZPIIrDQ6xCMzRBylOlZnzttzTyiX6j/860k3zpe58SVUpQOizctQS1Uzn8immUYEb4AwSdhG52oU60Rp3a4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722423951; c=relaxed/simple;
	bh=//GSB42wgXP39sk35xIC+sgfbAdG/9SwGHKDomDs7yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRXYDIM44F8ls6mv5GhfhiSCswMTKQjocDZdLT7tqWcEi/bUHefywok37xcgqGpFMqE+hbfqITtN5WLAfdb1kvQ7jfSVP6YjNORjXQQhXqY6aXgctk5uRLvUxw3St9gAhgtp7n4WfmSwBhepq6gMdUlf/hCn1lOfDVIXlIScECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMUQ0ECW; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMUQ0ECW"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7ac449a0e6so448020666b.1
        for <phone-devel@vger.kernel.org>; Wed, 31 Jul 2024 04:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722423946; x=1723028746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zHZhqSVXf2HkABk+DZ8Q5SgQKd9H1rooCMpNtitq44=;
        b=CMUQ0ECW1O6OxMwq4nCRki/FnGv8hBkHXp07aXvuiPbggwu1TMFwar8YOdMvRlwJTp
         PAORXItAzrRn9n9Z3Bop4P63AFepqndYfXVAItolmrPmnQw+d/IDOz25LrTSZgYqU0Gz
         I/f2ac6S8FuxrVUcLQFO8j0W+Rpiszj1Mf50Uj9C0kIvtePvYzDg5u5i0lElFi3EaCV0
         rs5yEjlXKvWxRKuVggj6Ge9QXwg7tpAYKdPbap5JGLeM8WMM7OXV2nREnXuG65mIlIG8
         +VyyVIPMR5t4WifqOZ+rayuFajMwyDi6UZ66VBnvFHdjsGmIuYk8kiXYdwL0vhecxsFQ
         bihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722423946; x=1723028746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zHZhqSVXf2HkABk+DZ8Q5SgQKd9H1rooCMpNtitq44=;
        b=EGF4SIiWUsp5NVY63VsaVZadruirna5OWPxXoSHg0jRyS/olfoKhATOIsDE7/+LPjh
         8GN6prNQgYLpiPWJl4JIE3OzfFL5rnPXBQmZXHnNcuVGSiA/SDFIaweUZhBKjlCR7r0x
         syMYN4Kp+hLttQGJXl8jLhPTED0bk7wpb1BVdy9+mM0ddPMmMrdXKt+pqiyD8YZv9hX3
         JxclqMah5Ij2BVyx7zH5nZj5aJfYn73jyWB8Rdv75xxifRdhKllxDxELtEVvE6Hj0lvd
         JHjN6DSR1dcNvgqIU3ICQSdfbIk3QDVQx6l3GwvcA5+uNl1pWU85wvTbPZgpGMruRDcm
         hyzw==
X-Gm-Message-State: AOJu0YyAUuaggc+E6ZefkNqt+PMNZp57CX4kCrJp0HAOcGlif213yPZQ
	T5fIcD/I9QtzrDh2FRaoaeUv6YTrX1Zv/2Fkly6dfzeJ7JCjJ/VpePhstFVufnI=
X-Google-Smtp-Source: AGHT+IH2oR+s73uziggKv8cXJAHk7fi6jbzfjUJQS6p5k3kcmFCpvXvLtedygEiSA5RzC1zNwUhFgA==
X-Received: by 2002:a17:907:2da3:b0:a7a:8378:625e with SMTP id a640c23a62f3a-a7d4000978fmr1114222266b.26.1722423945989;
        Wed, 31 Jul 2024 04:05:45 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::7424? ([2a02:8109:aa0d:be00::7424])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acac60f14sm748502766b.91.2024.07.31.04.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 04:05:45 -0700 (PDT)
Message-ID: <ca130fd6-b885-4bbb-9f08-676af8697b8d@linaro.org>
Date: Wed, 31 Jul 2024 13:05:44 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO
 Expander
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
 <20240731-qx1050-feature-expansion-v3-2-b945527fa5d2@riseup.net>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-2-b945527fa5d2@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/07/2024 08:18, Dang Huynh wrote:
> F(x)tec Pro1X comes with PCA9534 IO Expander, it is used for enabling
> touch screen VDD/VDDIO and keyboard's caps lock LED.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> index 70f479a63f2e..47e446249af6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> @@ -70,6 +70,23 @@ &dispcc {
>   	status = "disabled";
>   };
>   
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	/* Clock frequency was not specified downstream, let's park it to 100 KHz */

This is the default, so you can drop this comment.

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> +	clock-frequency = <100000>;
> +
> +	pca9534: gpio@21 {
> +		compatible = "nxp,pca9534";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
>   &pm6125_gpios {
>   	vol_up_n: vol-up-n-state {
>   		pins = "gpio5";
> @@ -89,6 +106,10 @@ &pon_resin {
>   	status = "okay";
>   };
>   
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
>   &rpm_requests {
>   	regulators-0 {
>   		compatible = "qcom,rpm-pm6125-regulators";
> 

-- 
// Caleb (they/them)
