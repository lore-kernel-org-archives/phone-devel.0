Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70362BE621
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216265; cv=none; b=SMp6YHLCEtRhZlFS0kaIZbijE9OXWt0nEB6+bvLGpI0MrjYQ8wdLA9aPoQ7W+TQyrD4BJ90uHEjbhDAmmuVeR1eClu6DDZm4alIt6ljHotcIPQQJTZxBjZEQJbc0ZvHpfgU0vF480eE5dKirQHUPG3n13MwUJ+Nr+PUksD1L67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216265; c=relaxed/simple;
	bh=khDVMinyRktjp81VmTv78vhuR5dfLwAEQX0dFp8erl4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Y+VTiKaGqg0iwp9I5//dFV4eaI9TrPwrHVO7ASDM8TODKyqN/DGaxi8R4LO4TZ+ZVVV6c7jSSHO0OfqeNG/XcWoov+aBFhCnc9xy6SY/Eol4/S39jf/hhFcuJO9ahJET76ifkscZFsrRvzkmpXRPfDaO3mwBxdlNOZ9uizMGZ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oUqoX8kq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oUqoX8kq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b886fc047d5so2249003666b.3
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 01:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773216262; x=1773821062; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSG8jCrZgvSAYH3ST0w7E15BQnOuBJZtxXBK3xYNciI=;
        b=oUqoX8kqAP89jNayDviF3q4pftyP1lM14c5hxiJpdKaU9ScxErvL8+kNw/uZrRFBFJ
         HzZWhtoEzEu3bHw/CkOX29AXUMUO1dJGGdhJ+/gEG0D9QD4JA4IVLoV0EAz/uBCRnF7w
         svTFaOFM8EMKKb/8/n1dz5/xzHbzzY6OUm7cW2rGzrk+N6x8a2QIz76lDwjOjdjaPyFW
         16PqMotxrtSDONDngnDtikJRVJaIWvQhmeAC5w/Cga0nczajBEwibTIvtDNG8zn3PBbQ
         5mk5BGgwpMGzKWOOhZ8IZwg75OKNVGCbQBZcLFrtVfGGbNrxAFyNUDKb2JAAYT4nkPB1
         HXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216262; x=1773821062;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSG8jCrZgvSAYH3ST0w7E15BQnOuBJZtxXBK3xYNciI=;
        b=CV/+AzTE/wykQXlAI8aCDsa/jGBBHTT7EBQ5/R3hbJKtl/5SgJfSXeF6N43BhS/7vj
         JaJDgI18svVixOC8KgkQMMPISBj7sMvRTNQPOm8ln75FzW7cCTUB+iFtGEIkp7TSKwm0
         zmGf1uNLd64OV63Co6yObnpPV/3n5EpNzEr50N945+USVBlgnHDY2zHKbfKWlzZSIJGP
         gZJ7MNSl3TkReGlIzs+bnTfiDr/9TH67k29tcqZz13QgTjMqRXWgnk175GUI2bCrHSk1
         8JKNPddiJcIEbez8tODTl58T6YGnpU+zBrDBxKQfJFCW0VkpG4Of4SpTgcujdiKHftzx
         DNRg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4rEdkhmD7xH3x3aIH+qGs0USpCFW9EVXJ+ewpih7Iiy6BmsBDUG9KKGkgwMWCBNkwtySF7gJn3lvcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOZVehPGXVzw6SHhh680ODkKIhrjhrZUnCd8kU6mo2GlfaSev
	Mvgy96phD4uac2JkH/TJEKCkaMGrPkQSArXmuGRTTZWCBXmTyRecHnJ75ZUNi+R3aSY=
X-Gm-Gg: ATEYQzyQCAcEHsK07JIBEqAPR9cKAyQdlmps2opqVACo3sqpqzXlLrxeSKXXY7BtXm1
	74DozBH353dUhN98bWSa15bCbK5RJvRAcpAV5YoCOjQvrKIb70cHh2imYcb4kU7Dki+jBB6Faq6
	ktT42QjK4L4BE251g+pQe7eQwPHT6dli/nxjjhPP3H3WRwIxgkFa9/eEaBY7iikK1By2FI2HKMS
	7yiuWSUpNzT1+zgRuwbxYcrTbK7MgfKxdgqKvusbkQMFHVrbyC6FmsuxBWX9czzkQz//XL1s5ia
	c6ipHbUdTjS8xt4e1zcSVy4+oKK0Fgg4ogbrvCfFvojFfKsew2nkwjuIDXnUW+F8qESV0bQSW0F
	BuzIOc6zpsS0o2l+mZyxqzIobQ6mRvWyEfPZrDTVET7f/S2BWXcI3w1HyF/gNEbTNFZXtqA0Dzw
	hMRW5eOE6ZnhsziPVJVG3ueE1VwRp132bO/qiuWfj/+5JVarqk82ODjyCso8FMpG3FJIvO
X-Received: by 2002:a17:906:7314:b0:b97:23c7:2b54 with SMTP id a640c23a62f3a-b972e61897bmr85765466b.49.1773216261981;
        Wed, 11 Mar 2026 01:04:21 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de0bd42sm37527166b.9.2026.03.11.01.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 09:04:20 +0100
Message-Id: <DGZSPC64B8K5.3HBPHWMWXR482@fairphone.com>
To: "Conor Dooley" <conor@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Marcel Holtmann"
 <marcel@holtmann.org>, "Johan Hedberg" <johan.hedberg@gmail.com>, "Luiz
 Augusto von Dentz" <luiz.dentz@gmail.com>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 Bluetooth
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
 <20230421-fp4-bluetooth-v2-4-3de840d5483e@fairphone.com>
 <20260310-maritime-silly-05e7b7e03aa6@spud>
In-Reply-To: <20260310-maritime-silly-05e7b7e03aa6@spud>

On Tue Mar 10, 2026 at 7:02 PM CET, Conor Dooley wrote:
> On Fri, May 12, 2023 at 03:58:26PM +0200, Luca Weiss wrote:
>
>> +&qup_uart1_cts {
>> +	/*
>> +	 * Configure a bias-bus-hold on CTS to lower power
>> +	 * usage when Bluetooth is turned off. Bus hold will
>> +	 * maintain a low power state regardless of whether
>> +	 * the Bluetooth module drives the pin in either
>> +	 * direction or leaves the pin fully unpowered.
>> +	 */
>> +	bias-bus-hold;
>> +};
>> +
>> +&qup_uart1_rts {
>> +	/* We'll drive RTS, so no pull */
>> +	drive-strength =3D <2>;
>> +	bias-disable;
>> +};
>> +
>> +&qup_uart1_rx {
>> +	/*
>> +	 * Configure a pull-up on RX. This is needed to avoid
>> +	 * garbage data when the TX pin of the Bluetooth module is
>> +	 * in tri-state (module powered off or not driving the
>> +	 * signal yet).
>> +	 */
>> +	bias-pull-up;
>> +};
>> +
>> +&qup_uart1_tx {
>> +	/* We'll drive TX, so no pull */
>> +	drive-strength =3D <2>;
>> +	bias-disable;
>> +};
>
> I recently made some changes to pincfg-node.yaml to detect if there's
> conflicting properties used, and these got detected. Should these not
> do what has been done on the msm8998-xiaomi-sagit, and delete the
> inherited bias-foo from the dtsi?
> &blsp1_i2c5_sleep {
> 	/delete-property/ bias-pull-up;
> 	bias-disable;
> };

Yes, you're completely right.

In the final dtb qup-uart1-{cts,rts,rx,tx}-default-state contain two
bias-* properties, this must be wrong.

Thanks for pointing this out, I'll prepare a patch soon!

Regards
Luca
