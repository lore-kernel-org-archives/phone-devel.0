Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FAC1FCFE1
	for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737969568; cv=none; b=Y1yPrfjPpaUV+7Su6+Rn6Cj2zfRT3/HEjbY8qf+qSiwbH4Q4kksh7vSK0YC4WsD8e2dvImT72a9LXgR9KVguMvIDj0JDbwvZhKXWi/wEjCJaq54JIKih7q76WvLbmac8LsIgjTz5Lbv6BPUje+IwynRzw+ucQ9ro9IVE+sS9pGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737969568; c=relaxed/simple;
	bh=9/1eFkMbhlyNzQK0zxHdGjdZ45bU6EV3bHiGqfEX/FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzPlxMdmGyjHMUqYwjHb+RunU/Ak2t583XHcrH7jmlePj7fofN7PR2uc5Tu0Uo5NB/X7xgbLfTruawQmK/Z9hOvihJ6XoyhIquR5+t+JWfum1f9Sj6RVssabfkacuoqWtTeWuaeW8/zkGTxaguPjzipsAla23A5ylbXdN//kQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imBng/mE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imBng/mE"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa679ad4265so1040250666b.0
        for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737969564; x=1738574364; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ns14BzOZma5VSqqkVW3NbLI19BCWZa5f2OVnRE8Ni44=;
        b=imBng/mEX8u/CEUAHp397+i/MTeFHQHffShS83TNkL+V1qi/i1LAnH2CN5Wmav/9vM
         Sh8/ZU0t9PpCnQQe5Ero9sfwpys5syi+8iIN7LIsNm1CrILb5mmx3inZxu7oJgH8lukH
         shJVJqwl7V0JdBfYEZtkL4i4qplQWFXmtrstSsMXeRIVLGbqbY8T6gpfA6juSWBi8zQn
         y9KqT+JYYCzvx47uMDg5ifdZHEMZfRqBPmenHjjSrq4Fs66dQnyr+QWF/XLnfPyFarW2
         akt6gQAa3laWhc8P2O4w02ZUt4MLdPBUolz1Iq76MA6yptkFpHA8q7354vucoZ1p8zgA
         3K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969564; x=1738574364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns14BzOZma5VSqqkVW3NbLI19BCWZa5f2OVnRE8Ni44=;
        b=LEdtYK4KNo1cVyCqk4Eoyba1IUjK0yADCbuf9Wq0bFsoMe+6CIH/8Co3UGwZjsKEM9
         WdKECUQllXeoD3XJUE2lkW9vNrJCP7kikh4T0X3NV43Jv3RhfAU5JBBj1Y7xQBOlFIVn
         g7P5kqwKlSYfMOpTthJfviWu2oSr6uhr4l/5VJh18FJdOJvsT20ZhZ5Ligkeasdq3jfU
         eIKVcXFUCGS7hxruPnxRFHri4CuwMgaq4I7ZUsQhxMOZ0vLSess0NrzEFl7CSYbqVuPP
         T6Z8FoP9qUHD8A3xoyR+78/4+UrHlmZcKhINt2yT66KHuzD9YnXp+m40Ze3iRuA4iACW
         vBBg==
X-Forwarded-Encrypted: i=1; AJvYcCVK+IdkX6wyB5NVMU+xIZD2bDl7dFa92N5b7ju8kFbHrggUGpbP+8vg1Qo+MnjAt/GmyYp4Euh4HNg1rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgY1YVnlpLZ+ah0rBtcOkNMwg4ud2rH7Zs2S4i18yJIQBcxT8u
	6Kld8SbPrSjaQFWHSryMQGUFClmmenEsJTWsB7o3vCCd5mFSzn8Xj/UIM9L6VRI=
X-Gm-Gg: ASbGnct/DOM5dLyu9mitKUzTkbK3nQutqGWccHPZXy3R+M8l9NnjnJSIoEtoZR8iOdM
	UXip00/ExLqafrCgtZsSg5Nruf8CZIzYVtYDd0HNN7AYI2vhTDnL/tgT6bcfLnJRIpabSu4o+PE
	kliKJhlghnPG0q6B35BRWZ63/HuPT1h/RGwqcwTLA9VkHNxfZ2gikhrxhK13j3FOsXzAfk85IPo
	c+cyQ43mIDKHtJCYY1hKPNP2Ri7gvsxv0ipvxJ7pd1iozaSdwWDCtg5SP6ooglzxIJe9y2f9UBE
	TUlzyA8CQZmgT06v
X-Google-Smtp-Source: AGHT+IGIbWOkeOIH+HEPI6RlesPzjwtnrNcMXE6wlcMy7kUftKsZDhvi22QvFpKQMEzXkFkXiKQDTw==
X-Received: by 2002:a17:907:72d6:b0:ab3:4d1e:4606 with SMTP id a640c23a62f3a-ab662910720mr1514830366b.3.1737969563971;
        Mon, 27 Jan 2025 01:19:23 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e8b01asm541488066b.84.2025.01.27.01.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:19:23 -0800 (PST)
Date: Mon, 27 Jan 2025 10:19:21 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] ARM: dts: qcom: msm8226: Add modem remoteproc node
Message-ID: <Z5dPmbZY6h-7LGqS@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-7-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-7-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:26PM +0100, Luca Weiss wrote:
> Add a node for the modem remoteproc found on MSM8226.
> 
> For the apq8026 smartwatches, delete the modem reserved-memory again
> since they have very little RAM in the first place anyways, and all of
> these devices don't have functional modem firmware anyways - these
> watches don't even have GPS.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |  7 ++
>  .../boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts |  7 ++
>  arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  7 ++
>  .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |  2 +
>  .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  6 +-
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 80 ++++++++++++++++++++++
>  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
>  7 files changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> index a2ca456012f1a070afc2805ae71ddbf6f5aac607..816b61ea504ee80d86dd4ccd1a15db687f6a91ff 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> @@ -9,6 +9,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  
>  / {
>  	model = "ASUS ZenWatch 2";
> @@ -82,6 +84,11 @@ bluetooth {
>  	};
>  };
>  
> +/* No (useful) modem on this device */
> +&modem {
> +	/delete-property/ memory-region;
> +};

Rather than putting /delete-node/ and /delete-property/ on all devices
that do not need/use the modem, I think it would be cleaner if you make
the remoteproc related reserved-memory status = "disabled" by default
and enable it only where necessary together with the modem. The &modem
itself is status = "disabled" by default, so it makes sense to use the
same for the reserved memory as well. See e.g. the existing usage of
this pattern for &mpss_mem/&wcnss_mem/&venus_mem/&mba_mem in
msm8916.dtsi. Then you can drop the /delete-property/ here.

It would be even nicer to use the dynamic allocation
(size/alignment/alloc-ranges instead of reg), but I'm skeptical if this
will work properly on such an old platform...

Thanks,
Stephan
