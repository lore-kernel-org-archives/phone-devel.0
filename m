Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEFB25F988
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271987; cv=none; b=t/JVy23Qsp4JGrZDGj6HLsatcUSpGcdZipYHIm+FtZFzUkn7Eg0wniXIvj7CGO6Ff7XL+u+5yxuUF5u9o0HfnOHJdo2GJbuFAsi3oF9EbRJinmPrEfZRrrgtTlUq0zkmVmvpOlagXpsK1YR03gpuLmTm6USj4Ro4vx3bfe/oK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271987; c=relaxed/simple;
	bh=f8j6pTQh6YCRHfsD/tvylB4gaZX50h6BTuMcY7i9jI4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ZUt6ERtJQrb6Mk3DSnOJlRioEsMJEePJR/toyk2N/em3m03ntJSCfJ2EKtN8KWmMw6O2IxCoFAhw9UrrhXzIRh0Zb5boNiT0+kkp0Mp8b9kqr3W81epAljYhFhfkXc/kfjnLtLdjEX7/QMpZOWHqyE3OO2yen6aFZGmQrNDgCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HT4Zui4c; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HT4Zui4c"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso2307913a12.0
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781271983; x=1781876783; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylCRDVWR0E0OMduxXy2JHO34dLyiiO1L7Ze1awwPVa0=;
        b=HT4Zui4cT3cg+FG7kaRP00saJYnbrMS/19SeAguGZ7ETq8q0Tk9oZaYh394GnqrXBH
         RtqLYGY5DwGolK+RPfqJ2GZ3oBKlzDUOBY/Tp+/Pqgx4t98CBuGErJVKJRlSBNloLxCj
         UzYOeFpFw+7VUNatoVt4m3mcbEAdZgUVOxPiyJVO6DtnoOXAmJ4RSgnI+iqC7766FuGc
         peaaujGXIRKUpKV60dv1PclYlk14kJZn+wEH+x5w9grmuqz7x9OtBEW8FCuFDJWWS3cs
         u7JSg3QWP+ZuiXVbsVD/LMmkk18ZknbTR9bcqlhB3FJbVFDJmG2tuodiY7wTa+9wJ75S
         K5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781271983; x=1781876783;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ylCRDVWR0E0OMduxXy2JHO34dLyiiO1L7Ze1awwPVa0=;
        b=LC2TfIXUP959J8u0FahoWOHc0889UBqDQJQhCf5q34Sr8DBvI6shMLD5kyZLhSvWDY
         Q5Iw14GR1Z0QQ5RDi/hsqbvqCdEVZ1AFGB5gz9ztlWXlmp2Pt/VKQX2SqShDHFO+H6cj
         bAbCjaMkcL3pbb7DF9HXcNlescqci9hGwS0o1tl8GuAV3XWipgJ2Zbmr+x+uMZ3iivyp
         lZxzPEQzPs5jeODQU3Tuzs9nKWzT5ESklzrBP4Nmmktgy1GOTtIcAO20jQUK61ap7B9t
         FNXQerY4p1t5hCGixSkOoVlmh3sfc+R3lcMYIoZajxX/u8HI2+9H/x6AqmD0xdGhHOWe
         AJVA==
X-Forwarded-Encrypted: i=1; AFNElJ8UHQMUF7ICvrV6QHoXe8f7jmhts8N+5kQ020M3ik0Bt0+o6VAVKLgZdqL7uh4lesI+DUlXT4fNIe7W0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Sjgl1PIcAFjizhRS4sSJfdWufaD54VCdURHIPRXfhE8mzskF
	v2Zz4Z4kXxWnpKjaswz0tGlQjG52MmQsII6AB89oLrdMYQkpt6Sgo1yiDfS6vSCEkVw=
X-Gm-Gg: Acq92OFTp0P2HusfZTlPZ9t1SxgDEUbj4DxihKe0fSw/nuf6/8OVI9s1hK7StU7N7d8
	uV99T73xIAIHycblbiG8M8dldireLnhW9v1xK6TioeNBhBTd85TQ3Metx8spDy8zK3G6iXlGuW5
	9XL4UQLjt4Y2Ow3JMslTP/yjl1nNz9G9jkfV9QcRUGRLJN7bzojS7cJ0wEYoyLrehhnIYl0uew2
	6oSiWJAinXtiKQIfo8BaRXHE5hcYCKVECwVHEHoDYeLugE6P42rDqTMU/JjSQbPr1+w60q2xH7/
	zGjcwBgpIb3CjaPWN9SpCMggTIwwtmqZNk6in2BkE83SX2aPVU1xKRYg3UI7ewngwJWCQftdPNp
	z6kemKRwHuQE1VBNL+AhtNwHBVMggxDfk8aeSHFitFvOmbq1fW8DxOniRcI7q9nEHBd5gd26eef
	lX1YbvDUZR5bXGmjJC4GfnzP6wODEcPEaDJCAGd7+FoH19Kq2T156QG1Z1uM/z5L88vaD4E58kd
	iqZAVeKccSf3fHbbzmqotZU6zrTqiwF+m+A7w==
X-Received: by 2002:a05:6402:1f06:b0:687:2ab9:f4a0 with SMTP id 4fb4d7f45d1cf-69378daf678mr995497a12.5.1781271983463;
        Fri, 12 Jun 2026 06:46:23 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm682580a12.23.2026.06.12.06.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 06:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 15:46:21 +0200
Message-Id: <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
In-Reply-To: <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>

On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> kodiak.dtsi so that future additions can be added at the right places.
>
> No functional change intended, verified with dtx_diff.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++----------=
-------
>   1 file changed, 691 insertions(+), 691 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index fa540d8c2615..62daef726d32 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi

<snip>

> +			qup_uart12_cts: qup-uart12-cts-state {
> +				pins =3D "gpio48";
> +				function =3D "qup14";
> +			};
> +
> +			qup_uart12_rts: qup-uart12-rts-state {
> +				pins =3D "gpio49";
> +				function =3D "qup14";
> +			};
> +
> +			qup_uart12_tx: qup-uart12-tx-state {
> +				pins =3D "gpio50";
> +				function =3D "qup14";
> +			};
>
> I understand and support the intention to keep this change non-functional=
,
> but this pad "gpio50" is for qup16 also, right?

According to my QCM6490 data sheet, GPIO_50 has these functions:
* UART for qup14 (OK)
* SPI for qup14 (OK)
* SPI for qup16 (no pinctrl)

>
> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
> for qup16 function, I find all of these are missing on the original list.

GPIO_54:
* UART qup15 (OK)
* SPI qup15 (OK)
* SPI qup14 (no pinctrl)

GPIO_55:
* UART qup15 (OK)
* SPI qup15 (OK)
* SPI qup14 (no pinctrl)

GPIO_62:
* UART qup17 (OK)
* SPI qup17 (OK)
* SPI qup16 (no pinctrl)

GPIO_63:
* UART qup16 (?)
* SPI qup16 (lane 3) (?)
* SPI qup16 (lane 5) (?)

But the GPIO_63 looks weird, is the data sheet wrong?! Where would
UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
then SPI qup16 ??

Can somebody at Qualcomm please check 80-20659-1 Rev. AM and maybe make
the apppriate people there aware?

So yes Vladimir, you're correct. Some pinctrl definitions for those SPI
QUPs are not defined. And the datasheet seems wrong as well.

> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Thanks for checking!

Regards
Luca
