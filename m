Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B212765D3
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001383; cv=none; b=hHLnpVxFBoYYGJswdfLha0Fnfb+SWbfsiRMzc+eWKIdJTXF8fo5iRJ5r4qQe07IQx7RjLRn93aOqqtqC+9tjzDjTeBn/PU30S+AO+6/6Qb4rx2SX+vGFrweTsaLWO9sfcG8sruUTr75EXX1KFIiT4C2cEjvB2+0uJZhZ+u7IqwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001383; c=relaxed/simple;
	bh=B9IgCM2uyGtKV5fXjEWqJ5Dgw5HAjC5FZz0DgBdnzD4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Cv+QPx8bOJst2GlmC02A/W3M9BcZ2tk7xmCZ3YMJDkCk3gfdRaC810Fm+LIl8GlLKE+Rnz07AElwBwyHWl2NBo6WhR++i0zX8GlKOPBSAxQRmPBi8nm8p03VxaHTSsjSEUMDwGJX/CYyYyesCz0Q57/wE8y1AxZviITOYzMQQWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zBAOdkkT; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zBAOdkkT"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b50645ecfbbso149035066b.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760001380; x=1760606180; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiLjyBB1pWTO9LpE9huMDU78bzfpc1Or2eT7POxqk3M=;
        b=zBAOdkkT4SVzBQABB6LHEpJWERFp8jCTGybtrCqg+EInm03QPiTy88MkcgJUvWwZWk
         aorjorsfxam2grf3OJPu6w8T22eGqdKHCTuhghBAQawpDuwQSZc2IYY1KBpE69BFtvmR
         JcpkL26Fl34DIN9+zOJsQwCBxY0vFUvM7Dr9fJOTdRWI5M1U6NVJNDIJVItqvkbxe2bZ
         gnwC6gmG0KAfHo9a0DDOE2UFq92vURkIK85owZTk5pat27Nu5N45oxRQ7Haeo6dCn9Fv
         xsY+UlvjEPRtGbZSSZQgpiZvXjAixswuCQG7dD844/A4iFI2Pm0yacfAinUDWEcmDI8H
         /mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001380; x=1760606180;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WiLjyBB1pWTO9LpE9huMDU78bzfpc1Or2eT7POxqk3M=;
        b=p/SzVwYRdogbR69dt5MZsvJ3IQdJ7TlFv5pmd/iYRontdHYN4fgv0sz3fPq4deMCSy
         lqm/KhTOtgjEkpHO4l64qnsYOgPGV9R8ZHMCG0CMFFi9gKbnTIbcMvSzq/GYbuudqErU
         +0SkPeGzABqSOPg+Ux6NSiUPocy/8eLvujA0ZmOO/D4cCkEEYYNnEzekrzusmPtiXhga
         28RRoJXIKh5/tZhfkYkGYE0h0JaZRWZr/QHppH0JDYWmXCmsL/c2ZDTVPgIOwF4A02Kj
         KG9GLvLkA1/ldBfIfpyOL5HyIl/W/KVOnei/Kg79RqdKdtkNGpTCkVgx5MNBC+KPcHIr
         KanA==
X-Forwarded-Encrypted: i=1; AJvYcCVR84RmL9iS+Qub2jW8FAO/EUBCt4MXK8bJ99IZqFpXFjcB+GnCMVI7hbxXem0G9axokgqBmG6JwlDTUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNC8nnlhAmdCrh/1dFIlOIlYZkPwqF6hIFv67ZLLWx1VOxcWe
	mdlTyFxUM2YnG54ZiO69HBSqW9mTaM/SThetByTAptPprDO/LQ2801tiGLQt7He0OMA=
X-Gm-Gg: ASbGncuFiJMMYsbKnilk/uFB+/Lvtf7zGJexNA+211ODQ8n0iPP6cCDSUBeoFIZrM3b
	FZIf/8Trdi7jcrH+byf5JRL5ExK3T/cPYfUXCQ2jTglw+nzocgQ7MKHwzTHLZv6GKypFFN5v45d
	N3I9YWeagN2AkwsgeA/4Eov9ALkFphMDetaMDARs636X5BgpV/zdaRs9VbxEX8T02sq/yP5GyMg
	6dSWpWZm4O4+NNFqiwKsqI7UcdxvYSq4rHzC5we5lxDJChsntQjWXNgJpx6zy8MnBmZA5zSef4s
	zmPG29PuqqmukQQcCdUvvgrh8BGw9C7pjeCnPd3PKSNCoceeIqGQMsk9egDntpVK02LLRifNf5a
	RJdcWuHOWgVApsSxI+cEqDkDQ/YhAZg1OpdLLgnUVz89ck0AVOzBeAkp5pb+kfJu9YwzQztR89S
	lum/mYoDhK88Fcj7jN
X-Google-Smtp-Source: AGHT+IGOrTpOmf2AwVno8gUUnCHJDq2hsd+5co+xgTKJeslNoJI9pCqeytvgzR8hxE1J39wpda8Vgg==
X-Received: by 2002:a17:907:7256:b0:b04:3629:b00e with SMTP id a640c23a62f3a-b50aa9a24e4mr629336966b.29.1760001379752;
        Thu, 09 Oct 2025 02:16:19 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b503c779df2sm522692566b.34.2025.10.09.02.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 11:16:18 +0200
Message-Id: <DDDOF3F8K5WQ.FTJ0F6E6DLPG@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Marijn Suijten" <marijn.suijten@somainline.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 VTOF_LDO_2P8 regulator
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
 <ac1c0d1a-36a9-4542-b879-06c017f7f2c4@oss.qualcomm.com>
In-Reply-To: <ac1c0d1a-36a9-4542-b879-06c017f7f2c4@oss.qualcomm.com>

Hi Konrad,

On Wed Oct 1, 2025 at 10:30 AM CEST, Konrad Dybcio wrote:
> On 9/30/25 3:57 PM, Luca Weiss wrote:
>> Describe yet another regulator-fixed on this board, powering the ToF
>> sensor.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/a=
rm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb732=
9335704eee567761 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
>>  		pinctrl-names =3D "default";
>>  	};
>> =20
>> +	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "VTOF_LDO_2P8";
>> +		regulator-min-microvolt =3D <2800000>;
>> +		regulator-max-microvolt =3D <2800000>;
>> +		regulator-enable-ramp-delay =3D <233>;
>> +
>> +		gpio =3D <&tlmm 141 GPIO_ACTIVE_HIGH>;
>
> You may want to define the pincfg/mux config for this gpio too

While I wouldn't say it's not good to have it, there's plenty of GPIOs
that have no pinctrl for it. Downstream doesn't set anything for gpio141
either.

I honestly wouldn't even know what the 'default' for a GPIO is in the
first place, or could I query the runtime state from the kernel? Is
/sys/kernel/debug/pinctrl/f100000.pinctrl/pinconf-groups trustworthy to
solidify this in the dts?

141 (gpio141): input bias disabled, output drive strength (2 mA), output en=
abled, pin output (0 level)

Regards
Luca

>
> Konrad

