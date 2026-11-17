Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917473;
	b=hd7MgkKZunr03PtRltK2/w+Tv4XXHEL3eoi0I1M9ULICmUm89rVnLwHGcTDRHljD5u+W
	 aXDDfNuZpfxaJsHWTmthg3nUcA2JgV24i7hRPL++ConlD9JJg2vTeRWMUpHUtyS8g7XYb
	 JbvvGU9eId2kxnF2bSYsbugkaAN8+5o3G/njC+qZFV7OfYx8Bw0FfI44O8mAzeYs/0EHO
	 PN86nWugUOJaV36zei7Yhred/gnnFjvh+ivN2mpgG3jwZfM2cA1xVRUsTMoYgp1CIhhuq
	 ngSQmfBOF09u+CA72lGiIyBX6AJNhcnYFYVCrLfiAIuNB88vKsY1T1RFUQqRleup2dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
	b=PKlexuealJgLarQvouENbrp4KB5P9BWseAIRwCpVZE9AhZnaxIcPRCeJRHABZFJ2DWPA
	 L/CcW8hg5jNYEaWZfhSTcy3rZRxu5WK92n5jQTb/xRUhK7Ij7erAOKc/y4DQqf5mFCFcw
	 zPRV7Si0hbqIJ8qRj35G3aJ1p2FIk4xH6vSZKL4e78VVHro/zkNL3nD/6t0HpyVE5MW0K
	 OrfVXe7x5PDduZjAd/6jhbZP/33WaEYqyQ+rDtGW0EnsP7b1Jxk6i2wph1+l8d9jWZK6N
	 mxUYX12F5AQxjYCX1jYtG7DS448R9vX9/FmpuM7vXBR2Z8T4oK3+Xpm9UMT9yaFbyug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=03gGhD1o;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61391606A32A
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 12:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61391606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=03gGhD1o
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50dd1e2f11so308474566b.2
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917472; x=1795522272; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
        b=03gGhD1oXvzdNQ6GMOGFyWvweh+BeNUIH1kjQoSj5t5WVt6fEShCorX5Ah2vxim8jl
         HZaxxotQyQi12H9UafUZsOniourPI+skSJUdnXsxuxLgXXTgKNDvqDylE6HEaWDIL6/L
         FYZ2ES5zcAVUbYujkR8v6B5sdVmJR7LNi+9jbHBYjytKkGzh2eVmTI2hmUlmXjMlN7aN
         4uVGgaJb0pn1E7+Kn//5pEJi3l1fvxcASfG87z7AjBqx2uiS2WbdDl/+d1o5mro4aMv7
         sOR9ro+k/qlVfbs9479IMojiXwNER+sdygJQwu8tMzKsAsNf231XkXmmq1u6qrDUGtgP
         f/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917472; x=1795522272;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
        b=enGtR4AD4dg7zFQq2AzRkbW92g5ejsCneBFpaNAm3x8nEhDC+hUazq1McqXYTo2qZ8
         XkeeJTJmM7bI3+FcQCT2vSAmfYbNvn/k1hlN+shouTZBPA63bNuoKvMfRoi+t2hbmeUt
         67L66F/8bXKA8lFKQdXQxSbqdmDl2jKaF0mxS7xAbbgCqmpQwiCPL6uO2drPVdJlvDnJ
         8KEVXs5dNLnvcYWSoq1SM7rXbmJCFAhsZqDYjiorAl76szz7cQzN9HjaJDdqf2Ul+JE3
         kf6kDWxCqYp2hd1O0HuV5dK5yXzcfw+UJP7obCVzIKirf+zBfVFuOV/xLj36c4wl8s7A
         kgsg==
X-Forwarded-Encrypted: i=1; AL+hErEpgCf6P94zFsJsKwyb5IoEI8mqTjzGLAH9FmRgt0CEshef4JLSiNvuO5wCT6XZzZgPT6tATZa5cHRiGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/yecxSRDO4gUj6zAxDHAxJXI+6ZNpntQgU6LkaGeCc8api7PQL
	ve1OaaNEqeWZIwAUtdG/NPJNIomEn7HQ8SGv01wUerbKqZjauFHfTn6+NnPEASM/Py8=
X-Gm-Gg: AYBFou23mUMkj8u2HRk3T7gdAcjNS42vYHs3NQGg4fMf9TN3lpH4Nev4T57tcN9X0fe
	+vDs4PyX/eV89ztXFwjskMEOlTJA+sDqCgadOgNJ6cbzQtnLAQ7gB91AfgPb6gDuNPf7zgDqGiA
	0ZYNejCjh8cpVokantaprfUAIBIbUkaY0PyygMxr4mm1OkUlS3SEXAxVUHDgDjLYDVFCRTzDPFl
	19CGec2NM5RxRc7v9YXsQqCS5u8Q3Zs8JI2wzi3F4MdCX3hzxHQF2du7daU1xhV0g8loNdb+tOF
	hLv4aa+ijbA4XLA8eat6jeTDd8J8KcA3fXCjQe58YFlXd3LnIIhMMwl6zwWTQpheqqmGd3x6GO8
	I/B41+I+7EO7bdZmRfPtbAAZEAVwjRZU1cz6c9sKEJd1DcDiDNCtEg+Hm3znaV5eZmBRKyE8Bws
	nX7o8bUsnUPNq0REAdWs30JHNJ3q/Ogp0Yh+lCN0EgYDGmQqm1FRo9HJhOtE9KljD02LWKx0YWp
	ZsNtnPIjLxoOvAjfZ2s4OSI1mBaihn0njXznue7Rpu+o7wC29SGdyAfuUbPlKhuoA585PK+VQkL
	MXMQVF5rDCSTS49pPbVGebjsohne8cr35afNsWQTnXFfcJp0UASLm4X7GyvwJojtXxUBvmr85tC
	73lbEhCt4StAoWVCuLkc=
X-Received: by 2002:a17:907:1b06:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c509633f436mr1276035066b.21.1794917471802;
        Tue, 17 Nov 2026 04:11:11 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c00fsm532002066b.3.2026.11.17.04.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:11:11 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 13:11:10 +0100
Message-Id: <DMXH52GLPXUT.236KX5W7LSRY7@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable
 remaining i2c busses
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts   | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index b19e76b3c1a75..08647584af0ce 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -438,6 +438,13 @@ &gpi_dma1 {
>  	status =3D "okay";
>  };
> =20
> +&i2c0 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";

If you resend, add a newline before 'status', also with i2c10

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +
> +	/* PN553 NFC @ 28 */
> +};
> +
>  &i2c8 {
>  	clock-frequency =3D <400000>;
>  	status =3D "okay";
> @@ -455,6 +462,17 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&i2c10 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	/* PM8008 PMIC @ 8 and 9 */
> +	/* SMB1395 PMIC @ 34 and 35 */
> +	/* AW882xx amplifier @ 34 */
> +	/* Foursemi FS16xx amplifier @ 35 */
> +	/* FSA4480 Analog Audio Switch @ 42 */
> +};
> +
>  &ipa {
>  	firmware-name =3D "qcom/sm6350/Sony/lena/ipa_fws.mbn";
> =20


