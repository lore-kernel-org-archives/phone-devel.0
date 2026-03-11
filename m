Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68B282F04
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 02:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773195911; cv=none; b=u8DY0kKIZnCS7SMvTbNSJMkhDKiB7DbhFrug1vKAIHhuENcTRKvDIKF3odBEtHe93OzGKjTNCCZAQ+CkH3aFzZ/zqx2rDTCI1jD7KfXgOdJnMc87pFRfeN1qF0yjfEd8pyhisnqTMwJlEm0M6g/gG3HJeoK76EtfESGhUOdOvbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773195911; c=relaxed/simple;
	bh=x3oA4b9XXpfnN8kUiNhtlS/tc1BuEX7AW97CTEgFyIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBUH8lZTUR7eFzJmqeWi7XP/PtYiHUXpKBVr3qIApOhYHTreodXVP7v2axmEOiicL83Sknhx+o8BYebmP2pzfDke7CPXilsZIGpJFeuKe7EiBOC6WnPzin5gCrBI1DcKQ7JR0cmvY8x+HI1KCOh7gMwpY8E0Qricq2IP//kk+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY2bT0go; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY2bT0go"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd7a75c680so47763685a.1
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 19:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773195909; x=1773800709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdOODwOyqf2HXTJor8x6+j1U0inwH0LLdlGvfoS1Vfo=;
        b=FY2bT0goJi+eGxVKUdDcVzRwoQgrQnVLnDcA7loJJil0P4Ni8pMG46aYtZLbnzYCmL
         ttG0XvTy8yd/gnIaI7o5qrih4Kn+rgjI47B8IO3PTeKTbFI+kHx1XjLEs5+eaM4nB2e1
         +DYVbLzQRgvKCQr8i0dsxeA03Z3dbFuQyDMtV8NIGYZCX5VpgkgYDtaWauNrOv9jXteO
         dCe3Eob7ZRKNsS2XQ4HujfFkZZBi7CuGsR+y9/w6OLKI3CM8ihaDROZVBmSR5h8CTnLN
         rWHfL7sy3cHpmKkxD7DcXmXWeaY/5qn2IElaygmHlm3aEjYk5glgV5tSpCh9/lLyx5P6
         It4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195909; x=1773800709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdOODwOyqf2HXTJor8x6+j1U0inwH0LLdlGvfoS1Vfo=;
        b=sWzZkRDntM+cVqJJJpPAms3JzXqigglducgANqPekogU26M3AjKIo9jLdtuBB530uz
         QGbx5pUk0znVa29J9dSY53Gib/BJffxMsDTQ97+QqzjaO4HkDJJo4gt0iqN9Y0EFtt6L
         0wvnsLrptxr1eJsM+ucYKurpFkVpzEpM/jDpJXQNneQ6dcdnzEaBxfkMRMdZMDInCIDU
         CeFwj2odp8PFtMVwpHO/vanUr/5s4o7itqZBS5/M07V+W+WD1PmVlSnH2tFJUijw7MKC
         7OPANzXa5laHNYHH4wkmdYThn1X9OEf0ioOdHPaj8BW9WwXWqckMoz8NWMpnXjkF9IKV
         pYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6rkzRE5u9WmdmcIgdQ4ZwGYVR7smmYo6IjwwFCyVl+y/ymdpVujAnm4sAxTVA6dOUhfBrlw9uMFCYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuQ1CJ13kglErDKuFQ7F8YsUtAPtZ2HMe5o97P62TX08qoBGn6
	Vt64SZD0dd2Zq0N47RXik6z2tXLktNRsNTNzoR9BdzxeMWhMWga+rc0c
X-Gm-Gg: ATEYQzwEt75AM4rgieM+jEZ3S4EYYXI9pgoO6Y2OvxSjoZrdQF1UdLCAcByPTktWi1S
	0roH6r+hsezykd0DxDNcwVKW+wN1roTD9bFGy2SzMge/8THDDxphv4SuEwruRLGPtmA/lGblFU2
	2rekxXkZ0z+x5bHJ2mqf/pZ9rECWmN3UDyicP00strKrniqfIQbQPD2p+WDL+xURl67cs3LUYRe
	q8KwXqrNgGC13DzvNUScQaLsuHcXiMYTTVrRoOb8qquNSwZOkKKu+7576qr7TB9jAqnAzdCMnvn
	0MqSFMlRE/XRIgmrWdZD2biGELOu3OjjN8EhII8SjlROD+KjP9t2B3kDvwoQpoUg4YDIpQ5ydEL
	7yBsiBxQ6DD4VlSpw/CEDSqT/U/WZmMATdjOUyWs/0sS+ISjeaVHtgo1+7pL6cdqki+OHR7bkEP
	8LcOZDI3qPXzZcWiNYOakATImWhg==
X-Received: by 2002:a05:622a:1111:b0:509:1be4:97d1 with SMTP id d75a77b69052e-5093a19d134mr10124061cf.34.1773195909341;
        Tue, 10 Mar 2026 19:25:09 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939ec63d6sm5194251cf.12.2026.03.10.19.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:25:08 -0700 (PDT)
Date: Tue, 10 Mar 2026 22:25:40 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <abDSpE3BNb0jFrqx@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217002738.133534-8-mailingradian@gmail.com>

On Mon, Feb 16, 2026 at 07:27:38PM -0500, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
(snip)
> +
> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&cam_front_ldo>;
> +		dvdd-supply = <&cam_front_ldo>;
> +		dovdd-supply = <&cam_vio_ldo>;
> +
> +		pinctrl-0 = <&cam_mclk2_default>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_front_endpoint: endpoint {
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint1>;
> +			};

This also needs data-lanes.
