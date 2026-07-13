Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771F0356744
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925515; cv=none; b=ZnbYGSmSZLwnC1aoNSTueTtNgdkbfQlixRE5Fr7Nx7ArnJ+nORakLJ0hU4c3B3REKInw8vK+oT6fHO80PxcvMyiRUCeePQwYXhA+Ym5F/f2EfT/hyKZAFpvWSaaSa+6fcOw03i6E+JAf/JqHYP+kX9nv6b+0DYEB5dl6lgMdxKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925515; c=relaxed/simple;
	bh=3UZr+s7uzcW8h1DHN6h7imM0CeaJ4iWPF13rcXL8v6o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=kCVR4EzBxH4PWgHodgOcQhCro2rZSa2suzRa7fhgHtgqhQvqbjNfxL8E7eibKs0QwWgg+ZKh5UUeeoD2txnDcAzFBaCPdljN9Yg9JDDDnnBt8jNn18rjdiBEHDCzTmInEHdSPHBOrgHPKOfwcKihBh9pDjgk4u/6AZhoTZGcu2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fuhYrbj0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fuhYrbj0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15c257a488so368777966b.3
        for <phone-devel@vger.kernel.org>; Sun, 12 Jul 2026 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783925511; x=1784530311; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YzKzbPipk5HuR++dvISXo/Dbcil94rLYMkCRdCOQ1zY=;
        b=fuhYrbj0oakAvtO4aXV2tIokazuHogcH+ITiZ21to9rLb+7IUFQDRVVFjefh0+RKIl
         5ipMT82FDUneFmpyCaRK0+Mi6ZiynOJ8G01m3nphF1RMj1zUf4EJqc7BcRGPuMXB3nXA
         sHB9fXzbh8l09CueEimIyrnmrjIOb9+CkgQn4dMODaWbXWUaKlrNS70DXhWQfdv1a4fU
         ETk0s1noQuYcpPJFPNAJT8QI+78iRLi2r8+L9BFgOoN0VjenmsVEtgqT+5T48mTeFZWg
         q6jF8epVeWIeI/A4Yod33vAnGg2fDAQkoK63odf9KXlwNud9H5sWgdkauVEOkeqprA6a
         yibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925511; x=1784530311;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzKzbPipk5HuR++dvISXo/Dbcil94rLYMkCRdCOQ1zY=;
        b=f/9lIvnDLRKAQ6SKx3YX0Zaih1UAS0RyqSPAEI2eFQfX7eXYp2sumt92tef6KJG8Ub
         TnCpn5rX0Zl8Ano6qdTJirxdMgB/EmFjeZt4bYn5hdo2Q0ySClNv31wsNnkXO01X1w4R
         O4E5YDKBdEm9sVJBqQRKCFisIvh5Ovudhf9ATM//hkquTyIvj4HyK4d/mPtAnAmw4GvI
         wreTzuxi3/9OWxPVqaQ9KRnVXhPMytaKEwnT6dQ3Vatmtt/ik5/SwX2IVVdxnuZ453gl
         UiELLdou4NezRFd0+5R5yAlMiU/3yvA/Y8jQsJ7noptlc2WSqdTBRXCn0L77+0DufDJh
         Pa5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSRw4ukCdGBPduPX8Fnh3LLjnKwfNvQpmes7a8N3K8Jmlm2K1glNOf1rP9hD3o4Ywd0JC2Y3azHfJfYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxthakgIlnk1lRyvxm7RpjxapdSJZz892oet3XoS89nlwW3LEpy
	fqOQOfgrqcx4JWNHSKWJJxVb1PwjLbGPsA+SAofYstHEyGjYuALd9teTDofheYRlIAI=
X-Gm-Gg: AfdE7ckSQplSyjvlxsuBAWWLpuFP1FRtlxUbw+nyczTe35aQ/2p9rorKAnu7VFpaeSg
	H4TgGM+rKItp2RFMUvtyWjMyHs+SrohP5sdE9X1+NO5p57S/9CLjEkbrMVIHBEqj1xhDoi4C3uw
	X4Mtdar9P4Vs4OEjatwCnp2NF5g2f4TJ85vhyhRw7Aph3Ps4Cpwo8RrW0iOch4VUnO1KxDiqicB
	VU/A87LHrI1q2XAxXh3JU91siYUdqhc9ELalsZ3ewAXMapnwn0p1GVJHxN9SmZqDfsaP30iTesK
	VnfEOHCY3z1XId+8SAMnpv4+tZrjUw/XP5aElav7YVHGx4Eu2izzYhBbsK4hW0nP0Gj2ogeHg5T
	SsA0kN6jkEzDnDcNbwcAuMamFAqJknER86jk4lZR07NDIUIA0ufqqK1cXujqG3JDqTdl4og0FfH
	tlPFP7oCW9ffNKcl7/rCcU5xZ8z9aRV+cUoh3wgftNUdAWC4xldV5HLb9ybigDZXnUYtbf
X-Received: by 2002:a17:907:9b8c:b0:c12:1dd4:13ea with SMTP id a640c23a62f3a-c161e9db95dmr250567966b.30.1783925510861;
        Sun, 12 Jul 2026 23:51:50 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bc428775sm870313466b.6.2026.07.12.23.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 08:51:49 +0200
Message-Id: <DJX8TDFWEWHA.390Z9IP2VQKN7@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
 <alOtC4bjK8IWzEj2@baldur>
In-Reply-To: <alOtC4bjK8IWzEj2@baldur>

On Sun Jul 12, 2026 at 5:05 PM CEST, Bjorn Andersson wrote:
> On Fri, Jul 10, 2026 at 11:53:57AM +0200, Luca Weiss wrote:
>> Add the missing reset (BCR) for sdhc_2.
>
> Don't be afraid of tell the world why a particular change is needed...

I didn't see any issue without this on my device, but usually the SDCC2
BCR is referenced in the devicetree so that the driver can reset the
controller.

No other special reasons I didn't mention :)

Thanks for applying!

Regards
Luca

>
> Regards,
> Bjorn
>
>>=20
>> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/q=
com/milos.dtsi
>> index 8c9232988953..262fa8801256 100644
>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>> @@ -1724,6 +1724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> =20
>>  			iommus =3D <&apps_smmu 0x540 0>;
>> =20
>> +			resets =3D <&gcc GCC_SDCC2_BCR>;
>> +
>>  			bus-width =3D <4>;
>> =20
>>  			qcom,dll-config =3D <0x0007442c>;
>>=20
>> ---
>> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
>> change-id: 20260710-milos-sdhc2-reset-8e61165cc5b8
>>=20
>> Best regards,
>> -- =20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20

